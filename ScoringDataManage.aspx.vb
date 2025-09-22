Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Net
Imports System.Runtime.InteropServices
Imports System.Security.Policy
Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports System.Windows.Forms.VisualStyles.VisualStyleElement.TaskbarClock

Partial Class ScoringDataManage
    Inherits System.Web.UI.Page

    Public Sub BackupScoresCheckForData(ByVal CompID As String)

        Dim msg As String
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
        ' check count of backup records
        Dim CountOfBackupRecords As Integer = getCountOfBackupRecords(CompID)
        If CountOfBackupRecords > 0 Then

            msg = "BackupDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Else
            msg = "NoBackupDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
        End If

    End Sub

    Public Function BackupScoresDelete(ByVal CompID As String) As String
        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        If cn.State = ConnectionState.Closed Then cn.Open()

        '******************************************************************************************************************

        sql = "DELETE FROM ScoringBackup WHERE ScoringBackup.CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Try
            cmd.ExecuteNonQuery()
            Return "ScoringBackupDeleteSuccess"
        Catch ex As Exception
            Return "ScoringBackupDeleteFailed"
        End Try

    End Function

    Public Sub BackupScores(ByVal CompID As String, ByVal BackupDateTime As Date)
        Dim sql As String
        Dim cmd As OleDbCommand
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

        '******************************************************************************************************************

        ' get the data to be backed up
        sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtScoringData As New DataTable
        da.Fill(dtScoringData)

        ' get a table to copy into
        sql = "SELECT ScoringBackup.* From ScoringBackup WHERE CompID='0'"
        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        Dim dtScoringBackup As New DataTable
        da.Fill(dtScoringBackup)

        Dim drScoringData, drNew As DataRow

        For i As Integer = 0 To dtScoringData.Rows.Count - 1
            drScoringData = dtScoringData.Rows(i)
            drNew = dtScoringBackup.NewRow
            drNew.ItemArray = drScoringData.ItemArray
            drNew("BackupDateTime") = BackupDateTime
            drNew.EndEdit()
            dtScoringBackup.Rows.Add(drNew)
        Next

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtScoringBackup)
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoringBackupOK"
            Response.Write(msg)
            Exit Sub
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoringBackupFailed"
            Response.Write(msg)
            Exit Sub
        End Try

    End Sub


    Public Sub MakeScoresZero(ByVal CompID As String, ByVal RoundNo As Integer, ByVal GroupNo As Integer, ByVal CompTypeString As String)

        Dim sql As String = ""
        Dim msg As String = ""
        Dim cmd As OleDbCommand

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

        ' break the CompTypeString down into an arraylist so we might have Dur;Dist;Spd
        Dim arrCompType As New ArrayList
        Dim str() As String = CompTypeString.Split(";"c)
        For i As Integer = 0 To str.Length - 1
            arrCompType.Add(str(i))
        Next

        Dim CompType As String = ""

        If GroupNo > 1 Then
            ' if the from GroupNo is > 1 then have to deal with the from RoundNo round separately
            ' and then the rest of the rounds that follow
            For i As Integer = 0 To arrCompType.Count - 1
                CompType = arrCompType(i).ToString
                sql = "UPDATE ScoringData SET Data1=0, Data2=0, Data3=0, Data4=0, Data5=0, Data6=0, Data7=0, Penalty=0, RawScore=0, NormalisedScore=0, Updated='False', LandingOver75m=0, Downloaded=0, ProgressiveTotalScore=0, ProgressiveRank=0, ProgressivePercent=0, ResultsToRoundNo=0, ProgressiveHiddenRank=0, ScoringLocked='False', ModelIDList='', ModelID='', Flight1='', Flight2='', Flight3='', Flight4='', F5JMotorReStarted=0 WHERE CompID='" & CompID & "' AND RoundNo=" & RoundNo.ToString & " AND GroupNo>=" & GroupNo.ToString & " AND CompType='" & CompType & "'"
                cmd = New OleDbCommand(sql, cn)
                cmd.ExecuteNonQuery()
            Next

            ' and now deal with the other rounds
            For i As Integer = 0 To arrCompType.Count - 1
                CompType = arrCompType(i).ToString
                sql = "UPDATE ScoringData SET Data1=0, Data2=0, Data3=0, Data4=0, Data5=0, Data6=0, Data7=0, Penalty=0, RawScore=0, NormalisedScore=0, Updated='False', LandingOver75m=0, Downloaded=0, ProgressiveTotalScore=0, ProgressiveRank=0, ProgressivePercent=0, ResultsToRoundNo=0, ProgressiveHiddenRank=0, ScoringLocked='False', ModelIDList='', ModelID='', Flight1='', Flight2='', Flight3='', Flight4='', F5JMotorReStarted=0 WHERE CompID='" & CompID & "' AND RoundNo>=" & (RoundNo + 1).ToString & " AND CompType='" & CompType & "'"
                cmd = New OleDbCommand(sql, cn)
                cmd.ExecuteNonQuery()
            Next

        Else ' FromGroup = 1 so it is for all flight groups
            For i As Integer = 0 To arrCompType.Count - 1
                CompType = arrCompType(i).ToString
                sql = "UPDATE ScoringData SET Data1=0, Data2=0, Data3=0, Data4=0, Data5=0, Data6=0, Data7=0, Penalty=0, RawScore=0, NormalisedScore=0, Updated='False', LandingOver75m=0, Downloaded=0, ProgressiveTotalScore=0, ProgressiveRank=0, ProgressivePercent=0, ResultsToRoundNo=0, ProgressiveHiddenRank=0, ScoringLocked='False', ModelIDList='', ModelID='', Flight1='', Flight2='', Flight3='', Flight4='', F5JMotorReStarted=0 WHERE CompID='" & CompID & "' AND RoundNo>='" & RoundNo.ToString & "'"

                cmd = New OleDbCommand(sql, cn)
                cmd.ExecuteNonQuery()

            Next
        End If

        msg = "MakeScoresZeroSuccess"
        Response.Write(msg)
        If cn.State = ConnectionState.Open Then cn.Close()

    End Sub

    Public Sub getBackupDateTime(ByVal CompID As String)

        Dim msg As String
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

        'check to see if there are any records in the backup table
        Dim sql As String = "Select Count(ScoringBackup.CompID) As CountOfCompID FROM ScoringBackup Group By ScoringBackup.CompID HAVING ScoringBackup.CompID='" & CompID & "'"
        Dim cmd As New OleDbCommand(sql, cn)
        Dim NbrRecs As Integer = cmd.ExecuteScalar
        If NbrRecs < 0.000001 Then
            Response.Write("NoBackupFound")
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

        'data exists so get the date and return that
        sql = "SELECT DISTINCT BackupDateTime From ScoringBackup WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Dim DT As Date = cmd.ExecuteScalar
        msg = DT.ToString("yyyyMMddHHmmss")
        Response.Write(msg)
        If cn.State = ConnectionState.Open Then cn.Close()
        Exit Sub

    End Sub

    Public Sub RestoreScoresCheckForData(ByVal CompID As String)

        Dim msg As String
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
        ' check count of backup records
        Dim CountOfBackupRecords As Integer = getCountOfBackupRecords(CompID)
        If CountOfBackupRecords > 0 Then
            msg = "BackupDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

        If CountOfBackupRecords < 0.000001 Then
            msg = "NoBackupDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

    End Sub

    Public Function RestoreScoresDelete(ByVal CompID As String) As String

        ' this is to delete records from the main datatable so that they can be replaced with the backup data.

        Dim sql As String
        Dim cmd As OleDbCommand

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        If cn.State = ConnectionState.Closed Then cn.Open()

        '******************************************************************************************************************

        sql = "DELETE FROM ScoringData WHERE ScoringData.CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Try
            cmd.ExecuteNonQuery()
            Return "ScoringDataDeleteSuccess"
        Catch ex As Exception
            Return "ScoringDataDeleteFailed"
        End Try

    End Function

    Public Sub RestoreScores(ByVal CompID As String)
        Dim sql As String
        Dim cmd As OleDbCommand
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

        '******************************************************************************************************************

        ' get the data to be restored
        sql = "SELECT ScoringBackup.* FROM ScoringBackup WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtScoringBackup As New DataTable
        da.Fill(dtScoringBackup)

        dtScoringBackup.Columns.Remove("BackupDateTime") ' removing column not present in destination table

        ' get a table to copy into
        sql = "SELECT ScoringData.* From ScoringData WHERE 1=2"
        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        Dim dtScoringData As New DataTable
        da.Fill(dtScoringData)

        Dim drScoringBackup, drNew As DataRow

        For i As Integer = 0 To dtScoringBackup.Rows.Count - 1
            drScoringBackup = dtScoringBackup.Rows(i)
            drNew = dtScoringData.NewRow
            drNew.ItemArray = drScoringBackup.ItemArray
            drNew.EndEdit()
            dtScoringData.Rows.Add(drNew)
        Next

        Dim cb As New OleDbCommandBuilder(da)
        da.UpdateCommand = cb.GetUpdateCommand
        da.InsertCommand = cb.GetInsertCommand

        Try
            da.Update(dtScoringData)
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoresRestoreOK"
            Response.Write(msg)
            Exit Sub
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoresRestoreFailed"
            Response.Write(msg)
            Exit Sub
        End Try

    End Sub


    Public Sub ScoreEntryClose(ByVal CompID As String)
        Dim sql As String
        Dim cmd As OleDbCommand
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

        '******************************************************************************************************************
        ' change ScoringLocked state to Open of all ScoringData records
        sql = "UPDATE dbo.ScoringData SET ScoringLocked = -1 WHERE CompID='" & CompID & "'"

        cmd = New OleDbCommand(sql, cn)
        Try
            cmd.ExecuteNonQuery()
            msg = "ScoreEntryCloseSuccess"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Catch ex As Exception
            msg = "ScoreEntryCloseFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try
    End Sub

    Public Sub ScoreEntryOpen(ByVal CompID As String)
        Dim sql As String
        Dim cmd As OleDbCommand
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

        '******************************************************************************************************************
        ' change ScoringLocked state to Open of all ScoringData records
        sql = "UPDATE dbo.ScoringData SET ScoringLocked = 0 WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Try
            cmd.ExecuteNonQuery()
            msg = "ScoreEntryOpenSuccess"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Catch ex As Exception
            msg = "ScoreEntryOpenFailed"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End Try

    End Sub
    Public Sub ScoresClear(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer, ByVal ReFlight As Integer, ByVal Overwrite As String)
        Dim sql As String
        Dim cmd As OleDbCommand
        Dim msg As String

        ' before Clear, make a backup of all data.
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
        ' if Overwrite = "False" then check if backup copy already exists and delete if necessary

        sql = "SELECT Count(RoundNo) AS CountOfRoundNo From ScoringData " &
              "Group By CompID HAVING CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        Dim CountOfRoundNo As Integer = CInt(cmd.ExecuteScalar)
        If CountOfRoundNo > 0.000001 Then
            If Overwrite = "False" Then
                msg = "BackupDataFound"
                Response.Write(msg)
                If cn.State = ConnectionState.Open Then cn.Close()
                Exit Sub
            Else
                sql = "DELETE ScoringBackup.* FROM ScoringBackup WHERE CompID='" & CompID & "'"
                cmd = New OleDbCommand(sql, cn)
                cmd.ExecuteNonQuery()
            End If
        End If


    End Sub

    Public Sub ScoresUndoClear(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer, ByVal ReFlight As Integer)

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
    End Sub


    Public Function getCountOfBackupRecords(ByVal CompID As String) As Integer
        Dim sql As String
        Dim cmd As OleDbCommand

        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString
        If cn.State = ConnectionState.Closed Then cn.Open()

        '******************************************************************************************************************
        ' if Overwrite = "False" then check if backup copy already exists and delete if necessary
        ' see if there are any backup records that would be overwritten
        sql = "SELECT Count(ScoringBackup.RoundNo) AS CountOfRoundNo From ScoringBackup GROUP BY ScoringBackup.CompID HAVING ScoringBackup.CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)

        Dim obj As Object = cmd.ExecuteScalar
        Dim CountOfRoundNo As Integer
        If IsNothing(obj) Then
            CountOfRoundNo = 0
        ElseIf IsDBNull(obj) Then
            CountOfRoundNo = 0
        Else
            CountOfRoundNo = CInt(obj)
        End If

        Return CountOfRoundNo

    End Function

    Public Sub ValidateCompID(ByVal CompID As String)
        Dim sql As String
        Dim cmd As OleDbCommand

        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString
        If cn.State = ConnectionState.Closed Then cn.Open()
        sql = "SELECT Count(CompData.CompID) as CountOfCompID From CompData WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)

        Dim retVal As Integer = CInt(cmd.ExecuteScalar)

        If retVal = 0 Then
            Response.Write("InvalidCompID")
        Else
            Response.Write("ValidCompID")
        End If
    End Sub

    Public Sub DeleteComp(ByVal CompID As String)
        Dim sql As String
        Dim cmd As OleDbCommand
        Dim RecordCount As Integer = 0

        ' connect to database
        Dim cn As New OleDbConnection
        Try
            cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            Response.Write("NoConnection")
            Exit Sub
        End Try


        '*********************************************************************************************************************************
        ' check that records exist for this competition
        sql = "SELECT Count(CompData.CompID) AS CountOfCompID FROM CompData Where CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount = CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(F3KData.CompID) AS CountOfCompID From F3KData Where CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(LandingData.CompID) AS CountOfCompID From LandingData Where CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(ScoringData.CompID) AS CountOfCompID From ScoringData Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(ScoringBackup.CompID) AS CountOfCompID From ScoringBackup Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(TargetTimeByRound.CompID) AS CountOfCompID From TargetTimeByRound Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(ScoringBackup.CompID) AS CountOfCompID From ScoringBackup Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(F5KData.CompID) AS CountOfCompID From F5KData Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        sql = "SELECT Count(F5KBonusData.CompID) AS CountOfCompID From F5KBonusData Where CompID ='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        RecordCount += CInt(cmd.ExecuteScalar)

        If RecordCount = 0 Then
            Response.Write("NoDataFound")
            Exit Sub
        End If

        '*********************************************************************************************************************************



        ' delete records for this competition
        Try

            VBCode.DeleteCompFromServer(CompID)

            Response.Write("CompDeleted")

        Catch ex As Exception

            Response.Write("CompDeletionFailed")

        End Try

    End Sub

    Public Sub ImportScore(ByVal CompID As String, ByVal RoundNo As Integer, ByVal GroupNo As Integer, ByVal PilotNo As Integer, ByVal Time As Double, ByVal Height As Integer, ByVal LandingDistance As Double, ByVal strGT75m As String, ByVal Penalty As Integer)

        ' this API is to import score data from the GliderKeeper device augmented with landing and penalty data

        Dim cn As OleDbConnection = VBCode.getDatabaseConnection

        Dim TimeDecimalPlaces As Integer = 0
        Dim TimingDecimalPlaces As Integer = VBCode.getTimingDecimalPlaces(CompID)
        Dim TimeAsString As String = Time.ToString()
        Dim indexOfDecimalPoint As Integer = TimeAsString.IndexOf(".")

        '-------------------------------------------------------------------------------------------------------------
        ' get comp type from CompData table
        Dim CompType As String = ""
        Dim sql As String = "SELECT CompData.CompType FROM CompData WHERE CompID='" & CompID & "'"
        Dim cmd As New System.Data.OleDb.OleDbCommand(sql, cn)
        Try
            CompType = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            Response.Write("Failed-CompNotFound")
            Exit Sub
        End Try

        '-------------------------------------------------------------------------------------------------------------
        ' check that score has not been updated previouslyupdate score for F5J comp where automatic timing (GliderKeeper) is being used.
        sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID='" & CompID & "' and RoundNo=" & RoundNo & " and GroupNo=" & GroupNo & " and PilotNo=" & PilotNo & " AND Updated='True'"
        cmd = New System.Data.OleDb.OleDbCommand(sql, cn)
        Dim da As New System.Data.OleDb.OleDbDataAdapter(cmd)
        Dim dt As New System.Data.DataTable
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Response.Write("Failed-ScoreAlreadyUpdated")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' get a boolean value where landing is greater than 75 metres
        Dim boolGT75m As Integer = 0
        If strGT75m = "Y" Then boolGT75m = 1

        If strGT75m = "Y" And (Time > 0 Or Height > 0 Or LandingDistance > 0) Then
            Response.Write("Failed-GT75m-TimeHeightLandingnotZero")
            Exit Sub
        End If

        If Penalty < 0 Then
            Response.Write("Failed-PenaltyMustBePositive")
            Exit Sub
        End If

        If Time > 0 And Height = 0 Then
            Response.Write("Failed-TimeEntered-HeightDataMissing")
            Exit Sub
        End If

        If Height > 0 And Time = 0 Then
            Response.Write("Failed-HeightEntered-TimeDataMissing")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' see if time entered exceeds the maximum allowable
        Dim TargetTime As Integer = VBCode.getTargetTimeForRound(CompID, RoundNo)
        If CompType = "F5J" Then TargetTime -= 1 ' max possible time is one second less than target time for F5J

        '-------------------------------------------------------------------------------------------------------------
        ' validate that seconds part of time submitted does not exceed 59
        Dim secs As Integer = 0
        If indexOfDecimalPoint = -1 Then ' no decimal point in TimeAsString

            Select Case TimeAsString.Length
                Case 1  ' no action as secs cannot exceed 59 in this case
                Case 2 : secs = CInt(TimeAsString)
                    If secs > 59 Then
                        Response.Write("Failed-TimeSecondsOver59")
                        Exit Sub
                    End If
                Case Else
                    secs = CInt(TimeAsString.Substring(TimeAsString.Length - 2, 2))
                    If secs > 59 Then
                        Response.Write("Failed-TimeSecondsOver59")
                        Exit Sub
                    End If
            End Select

        Else

            Dim TimeWithoutDecs As String = TimeAsString.Substring(0, indexOfDecimalPoint)

            Select Case TimeWithoutDecs.Length
                Case 1  ' no action as secs cannot exceed 59 in this case
                Case 2 : secs = CInt(TimeWithoutDecs)
                    If secs > 59 Then
                        Response.Write("Failed-TimeSecondsOver59")
                        Exit Sub
                    End If
                Case Else
                    secs = CInt(TimeWithoutDecs.Substring(TimeWithoutDecs.Length - 2, 2))
                    If secs > 59 Then
                        Response.Write("Failed-TimeSecondsOver59")
                        Exit Sub
                    End If
            End Select

        End If

        '-------------------------------------------------------------------------------------------------------------
        ' validate that time submitted does not exceed the specified number of decimal places

        If indexOfDecimalPoint = -1 Then ' No decimal point in number
            TimeDecimalPlaces = 0
        Else
            TimeDecimalPlaces = TimeAsString.Substring(indexOfDecimalPoint + 1).Length
        End If
        If TimeDecimalPlaces > TimingDecimalPlaces + 0.00000000001 Then
            Response.Write("Failed-TimeHasTooManyDecimals")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' convert Flight Time to seconds
        Dim TimeInSeconds As Double = VBCode.getTimeInSeconds(Time)
        If TimeInSeconds > TargetTime Then
            sql = "UPDATE ScoringData SET Data1=-1 WHERE CompID='" & CompID & "' And RoundNo=" & RoundNo & " And PilotNo=" & PilotNo
            cmd = New Data.OleDb.OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()
            Response.Write("Failed-TimeGreaterThanMaximum")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' if entered, validate landing is in landing table

        If CompType = "F5J" Then
            Dim Points As Integer = 0
            sql = "SELECT Distance, Points FROM LandingData WHERE CompID='" & CompID & "' and Distance=" & LandingDistance
            cmd = New Data.OleDb.OleDbCommand(sql, cn)
            Dim daLanding As New OleDb.OleDbDataAdapter(cmd)
            Dim dtLanding As New DataTable
            daLanding.Fill(dtLanding)

            If dtLanding.Rows.Count = 0 Then
                Response.Write("Failed-InvalidLandingData")
                Exit Sub
            End If
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' update score for F5J comp where automatic timing (GliderKeeper) is being used.
        sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID='" & CompID & "' and RoundNo=" & RoundNo & " and GroupNo=" & GroupNo & " and PilotNo=" & PilotNo & " AND Updated='False'"
        cmd = New System.Data.OleDb.OleDbCommand(sql, cn)
        da = New System.Data.OleDb.OleDbDataAdapter(cmd)
        dt = New System.Data.DataTable
        da.Fill(dt)

        If dt.Rows.Count = 0 Then
            Response.Write("Failed-MatchingRecordNotFound")
            Exit Sub
        End If

        sql = "UPDATE ScoringData SET Data2=" & Time & ", Data6=" & Height & ", Data7=" & LandingDistance & ", LandingOver75m=" & boolGT75m & ", Penalty=" & Penalty & ", Updated='True'" & " WHERE CompID='" & CompID & "' And RoundNo=" & RoundNo & " And GroupNo=" & GroupNo & " And PilotNo=" & PilotNo
        cmd = New Data.OleDb.OleDbCommand(sql, cn)
        cmd.ExecuteNonQuery()

        Response.Write("ScoreUpdated")

    End Sub

    Public Sub ImportScoreF5K(CompID As String, RoundNo As Integer, GroupNo As Integer, PilotNo As Integer,
                              NbrFlts As Integer,
                              Time1 As String, Time2 As String, Time3 As String, Time4 As String,
                              Height1 As String, Height2 As String, Height3 As String, Height4 As String)


        ' this API is to import score data from the GliderKeeper device for an F5K competition

        Dim cn As OleDbConnection = VBCode.getDatabaseConnection
        Dim sql As String
        Dim cmd As OleDbCommand

        Dim TimeDecimalPlaces As Integer = 0
        'Dim TimingDecimalPlaces As Integer = VBCode.getTimingDecimalPlaces(CompID)
        'Dim indexOfDecimalPoint As Integer = TimeAsString.IndexOf(".")

        '-------------------------------------------------------------------------------------------------------------
        ' get comp type from CompData table
        Dim CompType As String = "F5K2024"
        'Dim sql As String = "SELECT CompData.CompType FROM CompData WHERE CompID='" & CompID & "'"
        'Dim cmd As New System.Data.OleDb.OleDbCommand(sql, cn)
        'Try
        '    CompType = cmd.ExecuteScalar.ToString
        'Catch ex As Exception
        '    Response.Write("Failed-CompNotFound")
        '    Exit Sub
        'End Try

        '-------------------------------------------------------------------------------------------------------------
        ' check that score has not been updated previouslyupdate score for F5J comp where automatic timing (GliderKeeper) is being used.
        sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID='" & CompID & "' and RoundNo=" & RoundNo & " and GroupNo=" & GroupNo & " and PilotNo=" & PilotNo & " AND Updated='True'"
        cmd = New System.Data.OleDb.OleDbCommand(sql, cn)
        Dim da As New System.Data.OleDb.OleDbDataAdapter(cmd)
        Dim dt As New System.Data.DataTable
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Response.Write("Failed-ScoreAlreadyUpdated")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        ' Check that a non-zero time is matched with a non-zero height, and vice versa

        If (Time1 <> "0" And Height1 = "0") Or (Time2 <> "0" And Height2 = "0") Or (Time3 <> "0" And Height3 = "0") Or (Time4 <> "0" And Height4 = "0") Then
            Response.Write("Failed-TimeEntered-HeightDataMissing")
            Exit Sub
        End If

        If (Height1 <> "0" And Time1 = "0") Or (Height2 <> "0" And Time2 = "0") Or (Height3 <> "0" And Time3 = "0") Or (Height4 <> "0" And Time4 = "0") Then
            Response.Write("Failed-HeightEntered-TimeDataMissing")
            Exit Sub
        End If

        '-------------------------------------------------------------------------------------------------------------
        '' validate that seconds part of time submitted does not exceed 59
        'Dim secs As Integer = 0
        'If indexOfDecimalPoint = -1 Then ' no decimal point in TimeAsString

        '    Select Case TimeAsString.Length
        '        Case 1  ' no action as secs cannot exceed 59 in this case
        '        Case 2 : secs = CInt(TimeAsString)
        '            If secs > 59 Then
        '                Response.Write("Failed-TimeSecondsOver59")
        '                Exit Sub
        '            End If
        '        Case Else
        '            secs = CInt(TimeAsString.Substring(TimeAsString.Length - 2, 2))
        '            If secs > 59 Then
        '                Response.Write("Failed-TimeSecondsOver59")
        '                Exit Sub
        '            End If
        '    End Select

        'Else

        '    Dim TimeWithoutDecs As String = TimeAsString.Substring(0, indexOfDecimalPoint)

        '    Select Case TimeWithoutDecs.Length
        '        Case 1  ' no action as secs cannot exceed 59 in this case
        '        Case 2 : secs = CInt(TimeWithoutDecs)
        '            If secs > 59 Then
        '                Response.Write("Failed-TimeSecondsOver59")
        '                Exit Sub
        '            End If
        '        Case Else
        '            secs = CInt(TimeWithoutDecs.Substring(TimeWithoutDecs.Length - 2, 2))
        '            If secs > 59 Then
        '                Response.Write("Failed-TimeSecondsOver59")
        '                Exit Sub
        '            End If
        '    End Select

        'End If

        '-------------------------------------------------------------------------------------------------------------
        '' validate that time submitted does not exceed the specified number of decimal places

        'If indexOfDecimalPoint = -1 Then ' No decimal point in number
        '    TimeDecimalPlaces = 0
        'Else
        '    TimeDecimalPlaces = TimeAsString.Substring(indexOfDecimalPoint + 1).Length
        'End If
        'If TimeDecimalPlaces > TimingDecimalPlaces + 0.00000000001 Then
        '    Response.Write("Failed-TimeHasTooManyDecimals")
        '    Exit Sub
        'End If

        '-------------------------------------------------------------------------------------------------------------
        '' convert Flight Time to seconds
        'Dim TimeInSeconds As Double = VBCode.getTimeInSeconds(Time)
        'If TimeInSeconds > TargetTime Then
        '    sql = "UPDATE ScoringData SET Data1=-1 WHERE CompID='" & CompID & "' And RoundNo=" & RoundNo & " And PilotNo=" & PilotNo
        '    cmd = New Data.OleDb.OleDbCommand(sql, cn)
        '    cmd.ExecuteNonQuery()
        '    Response.Write("Failed-TimeGreaterThanMaximum")
        '    Exit Sub
        'End If

        '-------------------------------------------------------------------------------------------------------------
        '' if entered, validate landing is in landing table

        'If CompType = "F5J" Then
        '    Dim Points As Integer = 0
        '    sql = "SELECT Distance, Points FROM LandingData WHERE CompID='" & CompID & "' and Distance=" & LandingDistance
        '    cmd = New Data.OleDb.OleDbCommand(sql, cn)
        '    Dim daLanding As New OleDb.OleDbDataAdapter(cmd)
        '    Dim dtLanding As New DataTable
        '    daLanding.Fill(dtLanding)

        '    If dtLanding.Rows.Count = 0 Then
        '        Response.Write("Failed-InvalidLandingData")
        '        Exit Sub
        '    End If
        'End If

        '-------------------------------------------------------------------------------------------------------------
        ' update score for F5K comp where automatic timing (GliderKeeper) is being used.
        sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID='" & CompID & "' and RoundNo=" & RoundNo & " and GroupNo=" & GroupNo & " and PilotNo=" & PilotNo & " AND Updated='False'"
        cmd = New System.Data.OleDb.OleDbCommand(sql, cn)
        da = New System.Data.OleDb.OleDbDataAdapter(cmd)
        dt = New System.Data.DataTable
        da.Fill(dt)

        If dt.Rows.Count = 0 Then
            Response.Write("Failed-MatchingRecordNotFound")
            Exit Sub
        End If

        'sql = "UPDATE ScoringData SET Data2=" & Time & ", Data6=" & Height & ", Data7=" & LandingDistance & ", LandingOver75m=" & boolGT75m & ", Penalty=" & Penalty & ", Updated='True'" & " WHERE CompID='" & CompID & "' And RoundNo=" & RoundNo & " And GroupNo=" & GroupNo & " And PilotNo=" & PilotNo
        'cmd = New Data.OleDb.OleDbCommand(sql, cn)
        'cmd.ExecuteNonQuery()

        Dim Flt1 As String = "FltNbr=1&MinSec=" & Time1 & "&HgtVal=" & Height1 & "&NbrFlts=" & NbrFlts & "&"
        Dim Flt2 As String = "FltNbr=2&MinSec=" & Time2 & "&HgtVal=" & Height2 & "&"
        Dim Flt3 As String = "FltNbr=3&MinSec=" & Time3 & "&HgtVal=" & Height3 & "&"
        Dim Flt4 As String = "FltNbr=4&MinSec=" & Time4 & "&HgtVal=" & Height4 & "&"

        sql = "UPDATE ScoringData SET Flight1='" & Flt1 & "', Flight2='" & Flt2 & "', Flight3='" & Flt3 & "', Flight4='" & Flt4 & "' WHERE CompID='" & CompID & "' And RoundNo=" & RoundNo & " And GroupNo=" & GroupNo & " And PilotNo=" & PilotNo
        cmd = New Data.OleDb.OleDbCommand(sql, cn)
        cmd.ExecuteNonQuery()

        Response.Write("ScoreUpdated")

    End Sub







    Public Sub DownloadGliderTimerSchedule(ByVal CompID As String)

        ' downloads the file requested, if found.

        Dim schFile As String

        Dim rootPath As String = MapPath("~")
        schFile = rootPath & "/GliderTimerSchedule/" & CompID & "_Schedule.csv"
        schFile = MapPath("~/GliderTimerSchedule/" & CompID & "_Schedule.csv")

        If Not File.Exists(schFile) Then
            Response.Write("File " & schFile & " not found.")
            Exit Sub
        End If

        Dim fName As String = CompID & "_Schedule.csv"

        Response.ContentType = "application/text"
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & fName)
        Response.TransmitFile(Server.MapPath("~\GliderTimerSchedule\" & CompID & "_Schedule.csv"))
        Response.End()


    End Sub

    Public Sub PurgeOldGliderTimerScheduleFiles()
        ' remove files from folder that are over 30 days old

        Dim rootPath As String = MapPath("~")
        Dim di As New IO.DirectoryInfo(rootPath & "/GliderTimerSchedule/")
        Dim aryFi As IO.FileInfo() = di.GetFiles("*.csv")

        Dim fi As IO.FileInfo
        Dim dte As Date = Now()
        Dim Date30DaysAgo As Date = dte.AddDays(-30)

        For Each fi In aryFi
            If fi.LastAccessTime < Date30DaysAgo Then
                File.Delete(fi.FullName)
            End If
        Next

        Response.Write("OK")
        Exit Sub

    End Sub


    Public Sub RemoveOldPrivateComps()

        ' generate DateCreated for current date and then subtract 90 (days) from that number
        Dim DateCreated As Integer = 0
        Dim CutOffDate As Integer = 0
        Dim FirstDate As DateTime = New DateTime(2015, 12, 31)
        DateCreated = DateDiff(DateInterval.Day, FirstDate, Now())
        CutOffDate = DateCreated - 90

        Dim sql As String = "SELECT dbo.CompData.* FROM dbo.CompData WHERE DateCreated<'" & CutOffDate & "' AND IsPublic='0' ORDER BY CompDate"
        Dim cn As OleDbConnection = VBCode.getDatabaseConnection
        Dim cmd As New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtComps As New DataTable
        da.Fill(dtComps)

        Dim CompID As String
        For i As Integer = 0 To dtComps.Rows.Count - 1
            CompID = dtComps.Rows(i)("CompID")

            sql = "DELETE FROM dbo.CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.F5KBonusData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.F5KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.LandingData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.ScoringBackup WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.ScoringData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

            sql = "DELETE FROM dbo.TargetTimeByRound WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            cmd.ExecuteNonQuery()

        Next

















    End Sub



End Class
