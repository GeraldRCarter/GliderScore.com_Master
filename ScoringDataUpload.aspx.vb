Imports System.Data
Imports System.Data.OleDb
Imports Microsoft.VisualBasic.FileIO
Imports System.IO
Imports System.IO.Compression


Partial Class ScoringDataUpload
    Inherits System.Web.UI.Page

    Public Sub CheckRoundNoSequence(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)
        ' checking that results uploads do not result in (say) rounds 1 - 6 followed by round 8, missing round 7
        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try

        '******************************************************************************************************************
        ' find out if any data exists for this competition. 
        ' if there is no data then this test for round sequencing is irrelevant
        '******************************************************************************************************************

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()

            sql = "SELECT Count(1) AS Expr1 FROM CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            Dim RowCount As Integer = CInt(cmd.ExecuteScalar)

            If RowCount = 0 Then
                msg = "OKContinue"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End If

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
        End Try

        '******************************************************************************************************************
        ' find out the max_Round_number with normalised score of 1000
        ' uploaded data must have from_round number less than or equal to max_Round_number + 1
        ' this ensures no gaps in Rounds in uploaded results data
        '******************************************************************************************************************
        Dim MaxOfRoundNo As Integer
        Try
            If cn.State = ConnectionState.Closed Then cn.Open()

            sql = "SELECT Max(RoundNo) AS MaxOfRoundNo FROM ScoringData WHERE CompID='" & CompID & "' AND ScoringData.NormalisedScore>0"
            cmd = New OleDbCommand(sql, cn)
            If IsDBNull(cmd.ExecuteScalar) Then
                MaxOfRoundNo = 0
            Else
                MaxOfRoundNo = cmd.ExecuteScalar
            End If

            If FromRound <= MaxOfRoundNo + 1 Then
                msg = "OKContinue"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            Else
                msg = MaxOfRoundNo.ToString
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End If

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
        End Try

    End Sub





    Public Sub CheckForData(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)
        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand
        Dim ScoringDataCount As Integer
        Dim NotDownloadedCount As Integer

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try


        '******************************************************************************************************************
        ' remove any database records over two months old
        'Dim DateCreatedTwoMonthsAgo As Integer = getDateCreatedTwoMonthsAgo()
        'Dim DateCreatedSixMonthsAgo As Integer = getDateCreatedSixMonthsAgo()

        'sql = "DELETE FROM ScoringData WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        'sql = "DELETE FROM ScoringBackup WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        'sql = "DELETE FROM CompData WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        'sql = "DELETE FROM TargetTimeByRound WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        'sql = "DELETE FROM F3KData WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        'sql = "DELETE FROM LandingData WHERE DateCreated<" & DateCreatedSixMonthsAgo
        'cmd = New OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        '******************************************************************************************************************
        ' find out the max_Round_number with normalised score of 1000
        ' uploaded data must have from_round number less than or equal to max_Round_number + 1
        ' this ensures no gaps in Rounds in uploaded results data
        '**************************************************************************************
        Dim MaxRoundNumber As Integer
        Try
            sql = "SELECT Max(ScoringData.RoundNo) AS MaxOfRoundNo FROM ScoringData GROUP BY ScoringData.CompID, ScoringData.NormalisedScore HAVING ScoringData.CompID='" & CompID & "' AND ScoringData.NormalisedScore=1000"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            MaxRoundNumber = CInt(cmd.ExecuteScalar)
            If cn.State = ConnectionState.Open Then cn.Close()
            If FromRound > MaxRoundNumber + 1 Then
                msg = ""
            End If

        Catch ex As Exception

        End Try



        '******************************************************************************************************************
        ' see if there are any ScoreData records in the database for the comp and range of rounds to be uploaded
        ' program will exit to ask if OK to delete (if there are any found)
        '**************************************************************************************
        ' check for records in the ScoringData table

        Try
            sql = "SELECT Count(CompID) AS CountOfCompID FROM ScoringData WHERE CompID='" & CompID & "' And RoundNo>=" & FromRound & " And RoundNo<=" & ToRound & " And Updated='True' And Downloaded=0"

            cmd = New OleDbCommand(sql, cn)

            'cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            'cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = FromRound
            'cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = ToRound
            If cn.State = ConnectionState.Closed Then cn.Open()
            NotDownloadedCount = CInt(cmd.ExecuteScalar)
            If cn.State = ConnectionState.Open Then cn.Close()

            sql = "SELECT Count(CompID) AS CountOfCompID FROM ScoringData WHERE CompID='" & CompID & "' And RoundNo>=" & FromRound & " And RoundNo<=" & ToRound
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            ScoringDataCount = CInt(cmd.ExecuteScalar)
            If cn.State = ConnectionState.Open Then cn.Close()


        Catch ex As Exception
            msg = "CheckForExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        If NotDownloadedCount > 0 Then
            msg = "NeedsDownloading"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

        If ScoringDataCount > 0 Then
            msg = "ExistingDataFound" ' means data that has been updated but not yet downloaded
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Else
            msg = "NoDataFound" ' means that no data found that needs protecting
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

    End Sub

    Public Sub RemoveData(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)
        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if there is existing data and it is to be overwritten then we prepare by deleting the existing data here.
        ' we remove the ScoringData and we ALWAYS remove the LandingData and the CompData and the F3KData (in the Update script) and replace with new records

        Try
            sql = "DELETE FROM ScoringData WHERE CompID='" & CompID & "' And RoundNo>=" & FromRound & " And RoundNo<=" & ToRound
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM LandingData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        msg = "RemovingExistingDataSucceeded"
        If cn.State = ConnectionState.Open Then cn.Close()
        Response.Write(msg)

    End Sub

    Protected Sub UploadScoringData(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "Scoring_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the files
        '**********************************************************************************************************

        Dim rootPath As String = MapPath("~")
        Dim ScoreFile As String = rootPath & "\ScoreUpload\" & CompID & "_ScoringData.csv"

        sql = "SELECT ScoringData.* FROM ScoringData"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtScoring As New DataTable

        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtScoring)
        da.FillSchema(dtScoring, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(ScoreFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String = Nothing

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtScoring.NewRow
                drNew("CompID") = CurrentRow(0)
                drNew("CompType") = CurrentRow(1)
                drNew("RoundNo") = CurrentRow(2).ToString.Replace(",", ".")
                drNew("GroupNo") = CurrentRow(3).ToString.Replace(",", ".")
                drNew("ReFlightNo") = CurrentRow(4).ToString.Replace(",", ".")
                drNew("PilotNo") = CurrentRow(5).ToString.Replace(",", ".")
                drNew("SeqNo") = CurrentRow(6).ToString.Replace(",", ".")

                drNew("Data1") = CurrentRow(7).ToString.Replace(",", ".")
                drNew("Data2") = CurrentRow(8).ToString.Replace(",", ".")
                drNew("Data3") = CurrentRow(9).ToString.Replace(",", ".")
                drNew("Data4") = CurrentRow(10).ToString.Replace(",", ".")
                drNew("Data5") = CurrentRow(11).ToString.Replace(",", ".")
                drNew("Data6") = CurrentRow(12).ToString.Replace(",", ".")
                drNew("Data7") = CurrentRow(13).ToString.Replace(",", ".")
                drNew("Penalty") = CurrentRow(14).ToString.Replace(",", ".")

                drNew("PilotName") = CurrentRow(15)

                drNew("PilotStartNo") = CurrentRow(16).ToString.Replace(",", ".")

                drNew("DateCreated") = CurrentRow(17)

                ' because we are uploading scores, both of these next two flags will be set to true
                drNew("Updated") = CurrentRow(18)
                drNew("Downloaded") = CurrentRow(18)

                drNew("OriginalRoundNo") = CurrentRow(19).ToString.Replace(",", ".")

                drNew("LandingOver75m") = CurrentRow(20)
                drNew("ProgressiveTotalScore") = CurrentRow(21).ToString.Replace(",", ".")
                drNew("ProgressiveRank") = CurrentRow(22).ToString.Replace(",", ".")

                drNew("ProgressivePercent") = CurrentRow(23).ToString.Replace(",", ".")
                drNew("ResultsToRoundNo") = CurrentRow(24).ToString.Replace(",", ".")
                drNew("ProgressiveHiddenRank") = CurrentRow(25).ToString.Replace(",", ".")

                ' new fields added for GS 6.53
                Try
                    drNew("RawScore") = CurrentRow(26).ToString.Replace(",", ".")
                    drNew("NormalisedScore") = CurrentRow(27).ToString.Replace(",", ".")
                    drNew("TaskNo") = CurrentRow(28).ToString.Replace(",", ".")
                    drNew("Country") = CurrentRow(29)
                Catch ex As Exception
                End Try

                ' new field added for GS 6.54
                Try
                    drNew("HelperName") = CurrentRow(30)
                Catch ex As Exception
                End Try

                ' new fields added GS 6.59
                Try
                    drNew("ModelIDList") = CurrentRow(31)
                    drNew("ModelID") = CurrentRow(32)
                Catch ex As Exception
                End Try

                ' new fields aded GS 6.63 due to F5K
                Try
                    drNew("Flight1") = CurrentRow(33)
                    drNew("Flight2") = CurrentRow(34)
                    drNew("Flight3") = CurrentRow(35)
                    drNew("Flight4") = CurrentRow(36)
                Catch ex As Exception
                End Try

                dtScoring.Rows.Add(drNew)

            Catch ex As Exception
                msg = "Scoring_UnableToReadUploadedData" & " " & ex.ToString
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtScoring)
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "Scoring_DBUpdatedOK"
            Response.Write(msg)
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "Scoring_UnableToUpdateDatabase"
            Response.Write(msg & " " & ex.ToString)
            Exit Sub
        End Try

    End Sub

    Protected Sub UploadCompData(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "CompData_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the file
        '**********************************************************************************************************
        ' remove any CompData so that it can be replaced with the most up to date data
        Try
            sql = "DELETE FROM CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)

            'cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "CompData_UnableToRemoveOldData"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Dim rootPath As String = MapPath("~")
        Dim CompDataFile As String = rootPath & "\ScoreUpload\" & CompID & "_CompData.csv"

        sql = "SELECT CompData.* FROM CompData"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtCompData As New DataTable
        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtCompData)
        da.FillSchema(dtCompData, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(CompDataFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtCompData.NewRow

                drNew("CompID") = CurrentRow(0)
                drNew("CompType") = CurrentRow(1)
                drNew("TimingDecimalPlaces") = CurrentRow(2).ToString.Replace(",", ".")
                drNew("DateCreated") = CurrentRow(3)
                drNew("UseLanes") = CurrentRow(4)
                drNew("GroupScoreOption") = CurrentRow(5)
                drNew("GroupScoreDecimals") = CurrentRow(6).ToString.Replace(",", ".")
                drNew("RoundOrTruncate") = CurrentRow(7)
                drNew("Drop1At") = CurrentRow(8).ToString.Replace(",", ".")
                drNew("Drop2At") = CurrentRow(9).ToString.Replace(",", ".")
                drNew("Drop3At") = CurrentRow(10).ToString.Replace(",", ".")
                drNew("Drop4At") = CurrentRow(11).ToString.Replace(",", ".")
                drNew("Drop5At") = CurrentRow(12).ToString.Replace(",", ".")
                drNew("F5JRefHeight") = CurrentRow(13).ToString.Replace(",", ".")
                drNew("F5JPenaltyUpTo") = CurrentRow(14).ToString.Replace(",", ".")
                drNew("F5JPenaltyOver") = CurrentRow(15).ToString.Replace(",", ".")
                drNew("F5BPointsPerLap") = CurrentRow(16).ToString.Replace(",", ".")
                drNew("F5BWattMinPenaltyPoints") = CurrentRow(17).ToString.Replace(",", ".")
                drNew("F5BWattMinPerQuantity") = CurrentRow(18).ToString.Replace(",", ".")
                drNew("F5BWattMinRoundingIdx") = CurrentRow(19).ToString.Replace(",", ".")
                drNew("SpeedDecimals") = CurrentRow(20).ToString.Replace(",", ".")

                If CurrentRow(21) = "True" Then drNew("CompHasLandings") = True
                If CurrentRow(21) = "False" Then drNew("CompHasLandings") = False

                drNew("CompName") = CurrentRow(22)
                drNew("CompVenue") = CurrentRow(23)

                Dim strDate As Date = CurrentRow(24)
                drNew("CompDate") = strDate

                ' new fields added in version 6.53
                Try
                    If CurrentRow(25) = "True" Then
                        drNew("IsPublic") = True
                    Else
                        drNew("IsPublic") = False
                    End If
                    drNew("DropScoreOption") = CurrentRow(26).ToString.Replace(",", ".")
                    drNew("durPointsPerSecond") = CurrentRow(27).ToString.Replace(",", ".")
                    drNew("durNoOfTimekeepers") = CurrentRow(28).ToString.Replace(",", ".")
                    drNew("spdNoOfTimeKeepers") = CurrentRow(29).ToString.Replace(",", ".")
                    drNew("f5bNoOfTimekeepers") = CurrentRow(30).ToString.Replace(",", ".")
                Catch ex As Exception
                    drNew("IsPublic") = False
                    drNew("DropScoreOption") = 0
                    drNew("durPointsPerSecond") = 1
                    drNew("durNoOfTimekeepers") = 1
                    drNew("spdNoOfTimeKeepers") = 1
                    drNew("f5bNoOfTimekeepers") = 1
                End Try

                ' new field added in version 6.54
                Try
                    drNew("AssignHelpers") = CurrentRow(31)
                Catch ex As Exception
                    drNew("AssignHelpers") = False
                End Try

                ' new fields added in version 6.55
                Try
                    drNew("F5BWattMinBaseQuantity") = CurrentRow(32)
                    drNew("F5BMotorRunPenaltyPerSecond") = CurrentRow(33)
                Catch ex As Exception
                    drNew("F5BWattMinBaseQuantity") = 1750
                    drNew("F5BMotorRunPenaltyPerSecond") = 3
                End Try

                ' new field added in version 6.59
                Try
                    drNew("UseModels") = CurrentRow(34)
                Catch ex As Exception
                    drNew("UseModels") = False
                End Try

                ' new field added in version 6.64
                Try
                    drNew("FltDednIdx") = CurrentRow(35)
                Catch ex As Exception
                    drNew("FltDednIdx") = -1 ' indicates that it is not possible to calc normalised scores on the server because this element is missing.
                End Try

                dtCompData.Rows.Add(drNew)

            Catch ex As Exception
                msg = "CompData_UnableToReadUploadedData"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtCompData)
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "CompData_DBUpdatedOK"
            Response.Write(msg)
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "CompData_UnableToUpdateDatabase"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
    End Sub

    Protected Sub UploadTargetTimeByRound(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "TargetTime_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the file
        '**********************************************************************************************************
        ' remove any TargetTimeByRound data so that it can be replaced with the most up to date data
        'Try
        '    sql = "DELETE FROM TargetTimeByRound WHERE CompID='" & CompID & "'"
        '    cmd = New OleDbCommand(sql, cn)
        '    If cn.State = ConnectionState.Closed Then cn.Open()
        '    cmd.ExecuteNonQuery()
        '    If cn.State = ConnectionState.Open Then cn.Close()
        'Catch ex As Exception
        '    msg = "TargetTime_UnableToRemoveOldData"
        '    Response.Write(msg)
        '    If cn.State = ConnectionState.Open Then cn.Close()
        '    Exit Sub
        'End Try
        ' unlike other tables, we do not delete all TargetTimeByRound data for a comp when uploading.
        ' this is because it is possible to upload (say) 10 rounds and then delete (say) 4 rounds on the PC.
        ' so the full 10 rounds are on the server and only 6 rounds on the PC.
        ' an upload of TargetTimeByRound would only have 6 rounds of data, but the server needs 10 rounds.
        ' so the new approach is to add new records in the first upload, and update them thereafter.

        Dim rootPath As String = MapPath("~")
        Dim TargetTimeByRoundFile As String = rootPath & "\ScoreUpload\" & CompID & "_TargetTimeByRound.csv"

        sql = "SELECT TargetTimeByRound.* FROM TargetTimeByRound"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtTargetTimeByRound As New DataTable

        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtTargetTimeByRound)
        da.FillSchema(dtTargetTimeByRound, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(TargetTimeByRoundFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        Dim DateCreated As Integer = 0
        Dim key(1) As Object
        Dim dr As DataRow
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtTargetTimeByRound.NewRow

                drNew("CompID") = CurrentRow(0)
                drNew("RoundNo") = CurrentRow(1).ToString.Replace(",", ".")
                drNew("TargetTime") = CurrentRow(2).ToString.Replace(",", ".")
                drNew("DateCreated") = CurrentRow(3)
                DateCreated = CInt(drNew("DateCreated"))
                ' see if a row exists already
                key(0) = drNew("CompID")
                key(1) = drNew("RoundNo")
                dr = dtTargetTimeByRound.Rows.Find(key)

                If IsNothing(dr) Then
                    ' add a new row
                    dtTargetTimeByRound.Rows.Add(drNew)
                Else
                    ' update the existing row
                    dr("TargetTime") = CInt(drNew("TargetTime"))
                    dr("DateCreated") = CInt(DateCreated)
                    dr.EndEdit()
                End If

            Catch ex As Exception
                msg = "TargetTime_UnableToReadUploadedData"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()

                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        For Each dr In dtTargetTimeByRound.Rows
            If CInt(dr("DateCreated")) <> DateCreated Then
                dr("DateCreated") = DateCreated
            End If
        Next

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtTargetTimeByRound)
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "TargetTime_DBUpdatedOK"
            Response.Write(msg)
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "TargetTime_UnableToUpdateDatabase"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

    End Sub

    Protected Sub UploadF3KData(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "F3KData_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the files
        '**********************************************************************************************************
        ' remove any F3KData so that it can be replaced with the most up to date data
        Try
            sql = "DELETE FROM F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            'cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "F3KData_UnableToRemoveOldData"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Dim rootPath As String = MapPath("~")
        Dim F3KFile As String = rootPath & "\ScoreUpload\" & CompID & "_F3KData.csv"

        sql = "SELECT F3KData.* FROM F3KData"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtF3KData As New DataTable
        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtF3KData)
        da.FillSchema(dtF3KData, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(F3KFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtF3KData.NewRow

                drNew("CompID") = CurrentRow(0).ToString
                drNew("RoundNo") = CInt(CurrentRow(1)).ToString.Replace(",", ".")
                drNew("F3KTask") = CurrentRow(2).ToString
                drNew("F3KTaskAbbreviation") = CurrentRow(3).ToString
                drNew("F3KTaskDescription") = CurrentRow(4).ToString
                drNew("F3KTaskMaxScores") = CInt(CurrentRow(5)).ToString.Replace(",", ".")
                drNew("F3KTaskMaxFlights") = CInt(CurrentRow(6)).ToString.Replace(",", ".")
                drNew("DateCreated") = CInt(CurrentRow(7))
                dtF3KData.Rows.Add(drNew)
            Catch ex As Exception
                msg = "F3KData_UnableToReadUploadedData"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtF3KData)
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "F3KData_UnableToUpdateDatabase"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try

    End Sub

    Protected Sub UploadLandingData(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the files
        '**********************************************************************************************************
        ' remove any LandingData so that it can be replaced with the most up to date data
        Try
            sql = "DELETE FROM LandingData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)

            'cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "DatabaseUpdateFailed1"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try

        Dim rootPath As String = MapPath("~")
        Dim LandingFile As String = rootPath & "\ScoreUpload\" & CompID & "_LandingData.csv"

        '*******************************************************************************************************
        ' import latest landing data into database
        If IO.File.Exists(LandingFile) Then

            sql = "SELECT LandingData.* FROM LandingData"
            cmd = New OleDbCommand(sql, cn)
            Dim da As New OleDbDataAdapter(cmd)
            Dim dtLanding As New DataTable
            Dim CurrentRow() As String
            Dim drNew As DataRow

            If cn.State = ConnectionState.Closed Then cn.Open()
            da.Fill(dtLanding)
            da.FillSchema(dtLanding, SchemaType.Source)
            If cn.State = ConnectionState.Open Then cn.Close()

            Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(LandingFile)
            myReader.TextFieldType = FileIO.FieldType.Delimited
            myReader.SetDelimiters("|")

            If cn.State = ConnectionState.Closed Then cn.Open()
            While Not myReader.EndOfData
                Try
                    CurrentRow = myReader.ReadFields
                    drNew = dtLanding.NewRow
                    drNew.ItemArray = CurrentRow
                    drNew("Distance") = drNew("Distance").ToString.Replace(",", ".")
                    drNew("Points") = drNew("Points").ToString.Replace(",", ".")
                    dtLanding.Rows.Add(drNew)
                Catch ex As Exception
                    msg = "DatabaseUploadFailed4"
                    Response.Write(msg)
                    If cn.State = ConnectionState.Open Then cn.Close()

                    Exit Sub
                End Try
            End While
            myReader.Close()

            Dim cb = New OleDbCommandBuilder(da)
            da.UpdateCommand = cb.GetUpdateCommand
            da.InsertCommand = cb.GetInsertCommand

            Try
                da.Update(dtLanding)
                If cn.State = ConnectionState.Open Then cn.Close()
            Catch ex As Exception
                msg = "DatabaseUploadFailed5"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()

                Exit Sub
            End Try

        End If

        If cn.State = ConnectionState.Open Then cn.Close()
        Response.Write("UploadSuccessful")

    End Sub

    Protected Sub UploadF5KData(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "F5KData_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the files
        '**********************************************************************************************************
        ' remove any F5KData so that it can be replaced with the most up to date data
        Try
            sql = "DELETE FROM F5KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            'cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "F5KData_UnableToRemoveOldData"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Dim rootPath As String = MapPath("~")
        Dim F5KFile As String = rootPath & "\ScoreUpload\" & CompID & "_F5KData.csv"

        sql = "SELECT F5KData.* FROM F5KData"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtF5KData As New DataTable
        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtF5KData)
        da.FillSchema(dtF5KData, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(F5KFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtF5KData.NewRow

                drNew("CompID") = CurrentRow(0).ToString
                drNew("RoundNo") = CInt(CurrentRow(1)).ToString.Replace(",", ".")
                drNew("F5KTask") = CurrentRow(2).ToString
                drNew("F5KRefHeight") = CInt(CurrentRow(3)).ToString.Replace(",", ".")
                drNew("F5KTaskAbbreviation") = CurrentRow(4).ToString
                drNew("F5KTaskDescription") = CurrentRow(5).ToString
                drNew("F5KMaxScores") = CInt(CurrentRow(6)).ToString.Replace(",", ".")
                drNew("F5KMaxFlights") = CInt(CurrentRow(7)).ToString.Replace(",", ".")
                drNew("F5KMaxFlightTime") = CInt(CurrentRow(8)).ToString.Replace(",", ".")
                drNew("F5KMaxTotalTime") = CInt(CurrentRow(9)).ToString.Replace(",", ".")
                drNew("DateCreated") = CInt(CurrentRow(10))
                If CurrentRow.Length = 11 Then
                    drNew("f5kMinTimeForHeightBonus") = 0
                Else
                    drNew("f5kMinTimeForHeightBonus") = CInt(CurrentRow(11))
                End If
                dtF5KData.Rows.Add(drNew)
            Catch ex As Exception
                msg = "F5KData_UnableToReadUploadedData"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtF5KData)
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "F5KData_UnableToUpdateDatabase"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try

    End Sub

    Protected Sub UploadF5KBonusData(ByVal CompID As String)

        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "F5KBonusData_ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if we get to here then we upload the files
        '**********************************************************************************************************
        ' remove any F5KData so that it can be replaced with the most up to date data
        Try
            sql = "DELETE FROM F5KBonusData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "F5KBonusData_UnableToRemoveOldData"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Dim rootPath As String = MapPath("~")
        Dim F5KBonusFile As String = rootPath & "\ScoreUpload\" & CompID & "_F5KBonusData.csv"

        sql = "SELECT F5KBonusData.* FROM F5KBonusData"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtF5KBonusData As New DataTable
        If cn.State = ConnectionState.Closed Then cn.Open()
        da.Fill(dtF5KBonusData)
        da.FillSchema(dtF5KBonusData, SchemaType.Source)

        Dim myReader As New Microsoft.VisualBasic.FileIO.TextFieldParser(F5KBonusFile)
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")
        Dim CurrentRow() As String

        Dim drNew As DataRow

        If cn.State = ConnectionState.Closed Then cn.Open()
        While Not myReader.EndOfData
            Try
                CurrentRow = myReader.ReadFields
                drNew = dtF5KBonusData.NewRow
                drNew("CompID") = CurrentRow(0).ToString
                drNew("Metres") = CurrentRow(1).ToString.Replace(",", ".")
                drNew("BonusPointsPerMetre") = CurrentRow(2).ToString.Replace(",", ".")
                drNew("DateCreated") = CInt(CurrentRow(3))
                dtF5KBonusData.Rows.Add(drNew)
            Catch ex As Exception
                msg = "F5KBonusData_UnableToReadUploadedData"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            End Try
        End While
        myReader.Close()
        myReader.Dispose()

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtF5KBonusData)
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "F5KBonusData_UnableToUpdateDatabase"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try

    End Sub

    Private Function getDateCreatedTwoMonthsAgo() As Integer
        Dim DateCreatedTwoMonthsAgo As Integer = 0
        Dim FirstDate As DateTime = New DateTime(2015, 12, 31)
        DateCreatedTwoMonthsAgo = DateDiff(DateInterval.Day, FirstDate, Now()) - 61
        Return DateCreatedTwoMonthsAgo
    End Function

    Private Function getDateCreatedSixMonthsAgo() As Integer
        Dim DateCreatedSixMonthsAgo As Integer = 0
        Dim FirstDate As DateTime = New DateTime(2015, 12, 31)
        DateCreatedSixMonthsAgo = DateDiff(DateInterval.Day, FirstDate, Now()) - 185
        Return DateCreatedSixMonthsAgo
    End Function


    Public Sub RemoveAllDataForComp(ByVal CompID As String)
        Dim msg As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' test opening connection to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()

            Exit Sub
        End Try
        If cn.State = ConnectionState.Open Then cn.Close()

        '******************************************************************************************************************
        ' if there is existing data and it is to be overwritten then we prepare by deleting the existing data here.
        ' we remove all data relating to the CompID and replace with uploaded data

        Try
            sql = "DELETE FROM CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM F5KBonusData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM F5KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM LandingData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM ScoringData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM ScoringBackup WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Try
            sql = "DELETE FROM TargetTimeByRound WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            cmd.ExecuteNonQuery()
            If cn.State = ConnectionState.Open Then cn.Close()
        Catch ex As Exception
            msg = "RemovingExistingDataFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        msg = "RemovingExistingDataSucceeded"
        If cn.State = ConnectionState.Open Then cn.Close()
        Response.Write(msg)

    End Sub


    Public Sub InsertDataFromZipFile(ByVal CompID As String)

        Dim msg As String

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        ''******************************************************************************************************************
        ' remove any .csv files related to this CompID before extracting new copies
        Dim rootPath As String = MapPath("~")
        Dim zipPath As String = rootPath & "\ScoreUpload\" & CompID & "_UploadData.zip"
        Dim extractPath As String = rootPath & "\ScoreUpload\"

        Dim txtFileList() As String = Directory.GetFiles(extractPath, CompID & "*.csv")
        For Each f As String In txtFileList
            File.Delete(f)
        Next

        '******************************************************************************************************************
        ' extract all .csv files from zip file
        Try
            Using archive As ZipArchive = ZipFile.OpenRead(zipPath)
                For Each entry As ZipArchiveEntry In archive.Entries
                    entry.ExtractToFile(Path.Combine(extractPath, entry.FullName), True)
                Next
            End Using
        Catch ex As Exception
            msg = "ExtractingUploadFilesFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

        Dim TableName As String = "Not assigned"
        Try
            ' update the online database tables
            TableName = "CompData"
            If File.Exists(extractPath & CompID & "_CompData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "CompData", 1, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating CompData)")
                    Exit Sub
                End If
            End If

            TableName = "F3KData"
            If File.Exists(extractPath & CompID & "_F3KData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "F3KData", 2, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating F3KData)")
                    Exit Sub
                End If
            End If

            TableName = "F5KBonusData"
            If File.Exists(extractPath & CompID & "_F5KBonusData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "F5KBonusData", 2, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating F5KBonusData)")
                    Exit Sub
                End If
            End If

            TableName = "F5KData"
            If File.Exists(extractPath & CompID & "_F5KData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "F5KData", 2, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating F5KData)")
                    Exit Sub
                End If
            End If

            TableName = "LandingData"
            If File.Exists(extractPath & CompID & "_LandingData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "LandingData", 2, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating LandingData)")
                    Exit Sub
                End If
            End If

            TableName = "ScoringData"
            If File.Exists(extractPath & CompID & "_ScoringData.csv") Then
                msg = InsertDataFromZipFiles(CompID, "ScoringData", 6, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating ScoringData)")
                    Exit Sub
                End If
            End If

            TableName = "TargetTimeByRound"
            If File.Exists(extractPath & CompID & "_TargetTimeByRound.csv") Then
                msg = InsertDataFromZipFiles(CompID, "TargetTimeByRound", 2, cn, extractPath)
                If msg <> "RecordsUpdatedOK" Then
                    Response.Write(msg & " (error updating TargetTimeByRound)")
                    Exit Sub
                End If
            End If

        Catch ex As Exception
            Response.Write(TableName & " : " & ex.ToString)
        End Try
        Response.Write("OKContinue")

    End Sub


    Public Function InsertDataFromZipFiles(ByVal CompID As String, ByVal TableName As String, ByVal NbrOfKeyFields As Integer, ByVal cn As OleDbConnection, ByVal extractPath As String) As String

        Dim sql As String
        Dim cmd As OleDbCommand
        Dim da As OleDbDataAdapter
        Dim dtOnlineData As DataTable

        If cn.State = ConnectionState.Closed Then cn.Open()

        sql = "SELECT dbo." & TableName & ".* FROM dbo." & TableName & " WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        dtOnlineData = New DataTable
        da.Fill(dtOnlineData)
        da.FillSchema(dtOnlineData, SchemaType.Source)
        VBCode.CreatePrimaryIndexForTable(dtOnlineData, NbrOfKeyFields)

        Dim cb As New OleDbCommandBuilder(da)
        da.InsertCommand = cb.GetInsertCommand()
        da.UpdateCommand = cb.GetUpdateCommand()
        da.DeleteCommand = cb.GetDeleteCommand()

        Dim myReader As TextFieldParser
        myReader = New TextFieldParser(extractPath & CompID & "_" & TableName & ".csv")
        myReader.TextFieldType = FileIO.FieldType.Delimited
        myReader.SetDelimiters("|")

        Dim CurrLine() As String = Nothing
        Dim drNew As DataRow
        '******************************************************************************************************************
        ' if the online table is empty for this CompID, insert all new rows and exit this function
        '******************************************************************************************************************

        Try
            If dtOnlineData.Rows.Count < 0.00001 Then ' true when there is no online data for this table and for this CompID
                While Not myReader.EndOfData
                    CurrLine = myReader.ReadFields
                    drNew = dtOnlineData.NewRow

                    ' fix any uploaded commas in numeric fields
                    For i As Integer = 0 To (CurrLine.Length - 1)
                        If IsNumeric(CurrLine(i)) Then
                            CurrLine(i) = CurrLine(i).ToString.Replace(",", ".")
                        End If
                    Next

                    If dtOnlineData.Columns.Count = CurrLine.Length Then

                        drNew.ItemArray = CurrLine
                        dtOnlineData.Rows.Add(drNew)

                    ElseIf dtOnlineData.Columns.Count > CurrLine.Length Then ' happens when field added to online table but not updated for that in the version of GliderScore being used

                        For i As Integer = 0 To CurrLine.Length - 1
                            drNew(i) = CurrLine(i)
                        Next
                        dtOnlineData.Rows.Add(drNew)

                    ElseIf dtOnlineData.Columns.Count < CurrLine.Length Then
                        ' this will be true if the uploaded data still has the Spare fields data from GS6.68 in it (10 fields from Spare0-Spare9)
                        ' having spare fields in the online database seemed like a good idea, but wasn't. So, they are gone.

                        ' create a new array to hold just the data without the Spare fields data
                        Dim CurrLineTrimmed(CurrLine.Length - 10 - 1) As String
                        For i As Integer = 0 To (CurrLine.Length - 10 - 1)
                            CurrLineTrimmed(i) = CurrLine(i)
                        Next

                        ' only update the fields that exist in the uploaded data
                        For i As Integer = 0 To (CurrLineTrimmed.Length - 1)
                            drNew(i) = CurrLineTrimmed(i)
                        Next
                        dtOnlineData.Rows.Add(drNew)

                    End If

                End While

                myReader.Close()
                da.Update(dtOnlineData)

                If cn.State = ConnectionState.Open Then cn.Close()
                Return "RecordsUpdatedOK"
                Exit Function
            End If
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            Return TableName & " data upload error 1 : " & ex.ToString
            Exit Function
        End Try

        '******************************************************************************************************************
        ' procedure if we are updating/inserting/removing records
        '******************************************************************************************************************

        Dim dtUploadedData As DataTable

        Try

            If dtOnlineData.Rows.Count > 0.00001 Then ' true if there is online data for this table and for this CompID
                Try
                    '******************************************************************************************************************
                    ' read the uploaded data into a clone (called dtUploadedData) of the datatable (dtOnLineData)

                    dtUploadedData = dtOnlineData.Clone

                    While Not myReader.EndOfData
                        CurrLine = myReader.ReadFields
                        drNew = dtUploadedData.NewRow

                        ' fix any uploaded commas in numeric fields
                        For i As Integer = 0 To CurrLine.Length - 1
                            If IsNumeric(CurrLine(i)) Then
                                CurrLine(i) = CurrLine(i).ToString.Replace(",", ".")
                            End If
                        Next

                        If dtOnlineData.Columns.Count = CurrLine.Length Then ' this will be true from GS6.69 onwards

                            drNew.ItemArray = CurrLine
                            dtUploadedData.Rows.Add(drNew)

                        ElseIf dtOnlineData.Columns.Count > CurrLine.Length Then ' happens when field added to online table but not updated for that in the version of GliderScore being used

                            For i As Integer = 0 To CurrLine.Length - 1
                                drNew(i) = CurrLine(i)
                            Next
                            dtUploadedData.Rows.Add(drNew)

                        ElseIf dtOnlineData.Columns.Count < CurrLine.Length Then
                            ' this will be true if the data being uploaded still has the ten Spare fields of data from GS6.68 in it (10 fields from Spare0-Spare9)
                            ' having spare fields in the online database seemed like a good idea, but wasn't. So, they are gone.

                            ' create a new array to hold just the data without the Spare fields data
                            Dim CurrLineTrimmed(CurrLine.Length - 10 - 1) As String
                            For i As Integer = 0 To (CurrLine.Length - 10 - 1)
                                CurrLineTrimmed(i) = CurrLine(i)
                            Next

                            Try
                                For i As Integer = 0 To CurrLineTrimmed.Length - 1
                                    drNew(i) = CurrLineTrimmed(i)
                                Next
                                dtUploadedData.Rows.Add(drNew)
                            Catch ex As Exception
                                myReader.Close()
                                If cn.State = ConnectionState.Open Then cn.Close()
                                Return "Could not update ItemArray"
                                Exit Function
                            End Try

                        End If

                    End While
                    myReader.Close()
                Catch ex As Exception
                    If cn.State = ConnectionState.Open Then cn.Close()
                    Return TableName & " upload error 2 : " & ex.ToString
                    Exit Function
                End Try

                '******************************************************************************************************************
                ' add a column to dtOnline data to identify any unmatched records.
                ' unmatched means that they are in the online database but (no longer) present in the PC database.
                ' If any are found, delete them from the online database

                dtOnlineData.Columns.Add("Delete", Type.GetType("System.String"))

                Dim drOnLineData As DataRow
                Dim drUploadedData As DataRow
                Dim key(NbrOfKeyFields - 1) As Object

                For i As Integer = 0 To dtOnlineData.Rows.Count - 1
                    drOnLineData = dtOnlineData.Rows(i)
                    For j = 0 To NbrOfKeyFields - 1
                        key(j) = drOnLineData(j)
                    Next
                    drUploadedData = dtUploadedData.Rows.Find(key)
                    If IsNothing(drUploadedData) Then
                        drOnLineData("Delete") = "Y"
                    End If
                Next
                Dim drToDelete() As DataRow = dtOnlineData.Select("Delete='Y'")
                If drToDelete.Length > 0 Then
                    Dim drKill As DataRow
                    For Each dr As DataRow In drToDelete
                        For j = 0 To NbrOfKeyFields - 1
                            key(j) = dr(j)
                        Next
                        drKill = dtOnlineData.Rows.Find(key)
                        drKill.Delete()
                    Next
                End If
                dtOnlineData.Columns.Remove("Delete")

                '******************************************************************************************************************
                ' update records if needed.
                ' do not update scoring records that have just been submitted and have not yet been downloaded
                ' Always update table scoredata with the uploaded pilot name, country and team.

                Try

                    For i As Integer = 0 To dtUploadedData.Rows.Count - 1

                        ' get a datarow
                        Try
                            drUploadedData = dtUploadedData.Rows(i)
                        Catch ex As Exception
                            If cn.State = ConnectionState.Open Then cn.Close()
                            Return TableName & " upload error J1 : " & ex.ToString
                            Exit Function
                        End Try

                        ' get the keyfields from the datarow and read into a key object
                        Try
                            For j = 0 To NbrOfKeyFields - 1
                                key(j) = drUploadedData(j)
                            Next
                        Catch ex As Exception
                            If cn.State = ConnectionState.Open Then cn.Close()
                            Return TableName & " upload error J2 : " & ex.ToString
                            Exit Function
                        End Try

                        ' get the corresponding datarow in the online database
                        ' it is possible that there will not be a corresponding record found
                        Try
                            drOnLineData = dtOnlineData.Rows.Find(key)
                        Catch ex As Exception
                            If cn.State = ConnectionState.Open Then cn.Close()
                            Return TableName & " upload error J3 : " & ex.ToString
                            Exit Function
                        End Try

                        '************************************************************************************************
                        ' if drOnLineData does not have a matching record, add the uploaded record to the online database
                        ' and go to the next record. The online data will always have at least the number of columns as the uploaded data.
                        If IsNothing(drOnLineData) Then
                            Try
                                drNew = dtOnlineData.NewRow
                                For j = 0 To drUploadedData.ItemArray.Length - 1
                                    drNew.Item(j) = drUploadedData.Item(j)
                                Next
                                'drNew.ItemArray = drUploadedData.ItemArray
                                dtOnlineData.Rows.Add(drNew)
                                Continue For
                            Catch ex As Exception
                                If cn.State = ConnectionState.Open Then cn.Close()
                                Return TableName & " upload error 2c : " & ex.ToString
                                Exit Function
                            End Try
                        End If

                        '*************************************************************************************
                        ' if we get to here then we have to consider updating the 'ScoringData' online record,
                        ' but do not update the online record if the record that has been uploaded
                        ' has not been modified (Updated=False), just move on to the next record
                        ' but ALWAYS update the pilot name, country and teamn because these may have been changed on the PC
                        Try
                            If TableName = "ScoringData" Then
                                If drUploadedData("Updated") = "False" Then
                                    ' so far as the Results that are on the PC are concerned, there has not been data submitted.
                                    ' the PC will show a zero score.
                                    ' only the ProgressiveRank fields in the online scores should be updated.
                                    drOnLineData("PilotName") = drUploadedData(14) ' field 14 is PilotName
                                    drOnLineData("Country") = drUploadedData(31)
                                    drOnLineData("ProgressiveRank") = drUploadedData(23) ' field 23 is ProgressiveRank
                                    drOnLineData("ProgressiveHiddenRank") = drUploadedData(26) ' field 26 is ProgressiveHiddenRank

                                    If drOnLineData.ItemArray.Length - 1 >= 41 Then drOnLineData("Team") = drUploadedData(41)
                                    If drOnLineData.ItemArray.Length - 1 >= 42 Then drOnLineData("OmitFromTeamScore") = drUploadedData(42)

                                    drOnLineData.EndEdit()
                                    Continue For
                                End If
                            End If
                        Catch ex As Exception
                            If cn.State = ConnectionState.Open Then cn.Close()
                            Return TableName & " upload error J4 : " & ex.ToString
                            Exit Function
                        End Try

                        '*************************************************************************************
                        ' update the OnlineData with the UploadedData
                        If Not IsNothing(drOnLineData) Then

                            ' check that the array lengths match
                            ' this will only fail if the code for creating the upload data is not in sync with the column count of the online table
                            Try
                                If drOnLineData.ItemArray.Length <> drUploadedData.ItemArray.Length Then
                                    If cn.State = ConnectionState.Open Then cn.Close()
                                    Return TableName & " upload error J5 : " & "Array lengths do not match " & drOnLineData.ItemArray.Length & " vs " & CurrLine.Length
                                    Exit Function
                                End If
                            Catch ex As Exception
                            End Try

                            ' update each array element in turn EXCEPT the DateCreated field
                            Try

                                For j As Integer = NbrOfKeyFields To drOnLineData.ItemArray.Length - 1
                                    If dtOnlineData.Columns(j).ColumnName = "DateCreated" Then
                                        Continue For
                                    Else
                                        drOnLineData(j) = drUploadedData(j)
                                    End If
                                Next

                            Catch ex As Exception
                                If cn.State = ConnectionState.Open Then cn.Close()
                                Return TableName & " upload error 2b : " & ex.ToString
                                Exit Function
                            End Try

                        End If

                    Next
                Catch ex As Exception
                    If cn.State = ConnectionState.Open Then cn.Close()
                    Return TableName & " upload error 2d : " & ex.ToString
                    Exit Function
                End Try

                Try
                    If cn.State = ConnectionState.Closed Then cn.Open()

                    da.Update(dtOnlineData) ' update the underlying database

                    If cn.State = ConnectionState.Open Then cn.Close()

                Catch ex As Exception
                    If cn.State = ConnectionState.Open Then cn.Close()
                    Return TableName & " upload error 5 : " & ex.ToString
                End Try

                If cn.State = ConnectionState.Open Then cn.Close()
                Return "RecordsUpdatedOK"

            End If

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            Return TableName & " upload error 4 : " & ex.ToString
            Exit Function

        End Try

        If cn.State = ConnectionState.Open Then cn.Close()
        Return "RecordsUpdatedOK"

    End Function


    Public Function DeleteAllTransferFiles(ByVal CompID As String) As Boolean

        ' remove any .csv files related to this CompID
        Try

            Dim rootPath As String = MapPath("~")
            Dim zipPath As String = rootPath & "\ScoreUpload\" & CompID & "_UploadData.zip"
            Dim extractPath As String = rootPath & "\ScoreUpload\"

            Dim txtFileList() As String = Directory.GetFiles(extractPath, CompID & "*.csv")
            For Each f As String In txtFileList
                File.Delete(f)
            Next

            ' remove the zip file too
            File.Delete(zipPath)

            Response.Write("OKContinue")
        Catch ex As Exception
            Response.Write("DeleteFilesOnServerFailed")
        End Try

        Return True

    End Function




End Class
