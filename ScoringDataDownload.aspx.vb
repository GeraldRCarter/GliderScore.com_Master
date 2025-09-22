Imports System.Activities.Statements
Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.IO.Compression
Imports System.Net

Partial Class ScoringDataDownload
    Inherits System.Web.UI.Page
    Protected Sub CheckScoresExist(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)

        Dim msg As String = ""
        Dim sql As String = ""
        Dim cmd As OleDbCommand
        Dim ScoringDataTotal As Integer

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        '**************************************************************************************
        ' delete old Private competitions (if any)
        ' generate DateCreated
        Dim FirstDate As DateTime = New DateTime(2015, 12, 31)
        Dim DateCreated As Integer = DateDiff(DateInterval.Day, FirstDate, Now())
        Dim CutOffDate As Integer = DateCreated - 90
        sql = "SELECT CompData.CompID FROM CompData Where DateCreated <=? AND IsPublic=0"
        cmd = New OleDbCommand(sql, cn)
        cmd.Parameters.AddWithValue("DateCreated", CutOffDate)
        Dim dtComps As New DataTable
        Dim da As New OleDbDataAdapter(cmd)
        da.Fill(dtComps)
        If dtComps.Rows.Count > 0 Then
            For i As Integer = 0 To dtComps.Rows.Count - 1
                CompID = dtComps.Rows(i)("CompID")
                VBCode.DeleteCompFromServer(CompID)
            Next
        End If


        '**************************************************************************************
        ' delete comps where no scores have ever been entered and that are more than 30 days old
        CutOffDate = DateCreated - 30
        sql = "Select ScoringData.CompID, Sum(ScoringData.NormalisedScore) As SumOfNormalisedScore " &
              "From ScoringData " &
              "WHERE ScoringData.DateCreated < ? " &
              "Group By ScoringData.CompID " &
              "Order By SumOfNormalisedScore"
        cmd = New OleDbCommand(sql, cn)
        cmd.Parameters.AddWithValue("DateCreated", CutOffDate)
        dtComps = New DataTable
        da = New OleDbDataAdapter(cmd)
        da.Fill(dtComps)
        If dtComps.Rows.Count > 0 Then
            For i As Integer = 0 To dtComps.Rows.Count - 1
                If dtComps.Rows(i)("SumOfNormalisedScore") = 0 Then
                    CompID = dtComps.Rows(i)("CompID")
                    VBCode.DeleteCompFromServer(CompID)
                Else
                    Exit For
                End If
            Next
        End If

        '**************************************************************************************
        ' check for records in the ScoringData table
        Try
            sql = "SELECT Count(ScoringData.RoundNo) As CountOfRoundNo FROM ScoringData WHERE CompID=? And RoundNo>=? And RoundNo<=? And Updated='True'"
            cmd = New OleDbCommand(sql, cn)
            cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = FromRound
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = ToRound
            If cn.State = ConnectionState.Closed Then cn.Open()
            ScoringDataTotal = CInt(cmd.ExecuteScalar)
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "CheckForScoringDataFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        If ScoringDataTotal > 0 Then
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoringDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Else
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "NoScoringDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

    End Sub


    Protected Sub CheckNewScoresExist(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)

        Dim msg As String = ""
        Dim sql As String = ""
        Dim cmd As OleDbCommand
        Dim ScoringDataTotal As Integer

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        ''**************************************************************************************
        '' check for records in the ScoringData table
        Try
            sql = "SELECT Count(ScoringData.RoundNo) as CountOfRoundNo FROM ScoringData WHERE CompID=? And RoundNo>=? And RoundNo<=? And Updated='True' And Downloaded='0'"
            cmd = New OleDbCommand(sql, cn)
            cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = FromRound
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = ToRound
            If cn.State = ConnectionState.Closed Then cn.Open()
            ScoringDataTotal = CInt(cmd.ExecuteScalar)
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "CheckForScoringDataFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        If ScoringDataTotal > 0 Then
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ScoringDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        Else
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "NoScoringDataFound"
            Response.Write(msg)
            If cn.State = ConnectionState.Open Then cn.Close()
            Exit Sub
        End If

    End Sub


    Protected Sub DownloadScoringData(ByVal CompID As String, ByVal FromRound As Integer, ByVal ToRound As Integer)
        Dim msg As String = ""
        Dim sql As String = ""
        Dim cmd As OleDbCommand
        Dim da As OleDbDataAdapter
        Dim dtScoringData As New DataTable
        Dim dr As DataRow

        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        '******************************************************************************************************************
        ' extract data from database
        Try
            sql = "SELECT ScoringData.* FROM ScoringData WHERE CompID=? And RoundNo>=? And RoundNo<=? And Updated='True'"
            cmd = New OleDbCommand(sql, cn)
            cmd.Parameters.Add("CompID", OleDbType.VarChar, 50).Value = CompID
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = FromRound
            cmd.Parameters.Add("RoundNo", OleDbType.TinyInt).Value = ToRound

            If cn.State = ConnectionState.Closed Then cn.Open()

            da = New OleDbDataAdapter(cmd)
            dtScoringData.Clear()

            da.Fill(dtScoringData)

            '******************************************************************************************************************
            ' create the text file
            Dim ScoreFile As String = ""

            Dim rootPath As String = MapPath("~")
            ScoreFile = rootPath & "/ScoreDownload/" & CompID & "_DownloadData.csv"
            ScoreFile = MapPath("~/ScoreDownload/" & CompID & "_DownloadData.csv")
            Dim scount As String = dtScoringData.Rows.Count.ToString

            If dtScoringData.Rows.Count = 0 Then
                If cn.State = ConnectionState.Open Then cn.Close()
                msg = "NoScoringInformationFound"
                Response.Write(msg)
                Exit Sub
            End If

            Dim fName As String = CompID & "Download.csv"
            Dim sw As New StreamWriter(ScoreFile)
            Dim txt As String = ""
            For Each dr In dtScoringData.Rows
                txt = ""
                txt = txt & dr("CompID").ToString & "|"
                txt = txt & dr("CompType").ToString & "|"
                txt = txt & dr("RoundNo").ToString & "|"
                txt = txt & dr("GroupNo").ToString & "|"
                txt = txt & dr("ReFlightNo").ToString & "|"
                txt = txt & dr("PilotNo").ToString & "|"
                txt = txt & getData(dr, "Data1") & "|"
                txt = txt & getData(dr, "Data2") & "|"
                txt = txt & getData(dr, "Data3") & "|"
                txt = txt & getData(dr, "Data4") & "|"
                txt = txt & getData(dr, "Data5") & "|"
                txt = txt & getData(dr, "Data6") & "|"
                txt = txt & getData(dr, "Data7") & "|"
                txt = txt & dr("LandingOver75m") & "|"
                txt = txt & dr("Penalty").ToString & "|"
                txt = txt & dr("PilotName") & "|"
                txt = txt & dr("ModelID") & "|"
                txt = txt & dr("Flight1") & "|"
                txt = txt & dr("Flight2") & "|"
                txt = txt & dr("Flight3") & "|"
                txt = txt & dr("Flight4") & "|"
                txt = txt & dr("F5JMotorReStarted")

                sw.WriteLine(txt)
            Next
            sw.Close()

            Dim cb As New OleDbCommandBuilder(da)
            da.UpdateCommand = cb.GetUpdateCommand
            da.InsertCommand = cb.GetInsertCommand

            ' update the Downloaded flag
            For Each dr In dtScoringData.Rows
                dr("Downloaded") = True
            Next
            da.Update(dtScoringData)

            If cn.State = ConnectionState.Open Then cn.Close()
            Response.Write("DownloadFileCreationSuccess")
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            Response.Write("DownloadFileCreationFailed")
        End Try

        If cn.State = ConnectionState.Open Then cn.Close()

    End Sub

    Protected Sub DeleteDownloadFile(ByVal CompID As String)
        Dim rootPath As String = MapPath("~")
        Dim ScoreFiles As String = rootPath & "/ScoreDownload/" & CompID & "_DownloadData.*"

        Try
            File.Delete(rootPath & "/ScoreDownload/" & CompID & "_DownloadData.csv")
            File.Delete(rootPath & "/ScoreDownload/" & CompID & "_DownloadData.zip")
            'Dim DirInfo As New DirectoryInfo(rootPath & "/ScoreDownload/" & CompID & "*.*")
            'For Each f As String In Directory.EnumerateFiles(ScoreFiles, CompID & "*.*")
            '    File.Delete(f)
            'Next
            Response.Write("DownloadFileDeleteSuccess")
        Catch ex As Exception
            Response.Write("DownloadFileDeleteFailed")
        End Try

    End Sub


    Private Function getData(ByVal dr As DataRow, ByVal colName As String) As String
        ' takes care of nulls and nothings!
        Select Case True
            Case IsDBNull(dr(colName))
                Return "0"
            Case IsNothing(dr(colName))
                Return "0"
            Case Else
                Return dr(colName).ToString
        End Select

    End Function

    Protected Sub CreateScoringDataAsZipArchive(ByVal CompID As String)
        Dim msg As String
        Dim dtScoringData As New DataTable
        Dim DownLoadfolder As String = ""
        '******************************************************************************************************************
        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            msg = "ConnectionToDBFailed"
            Response.Write(msg)
            Exit Sub
        End Try

        '******************************************************************************************************************
        Dim ScoreFile As String = ""

        Dim rootPath As String = MapPath("~")
        ScoreFile = rootPath & "/ScoreDownload/" & CompID & "_DownloadData.csv"
        ScoreFile = MapPath("~/ScoreDownload/" & CompID & "_DownloadData.csv")

        '======================================================================================
        ' create archive file for PC to download

        Response.Clear()

        Try
            Dim di As IO.DirectoryInfo
            Dim aryFi As IO.FileInfo()
            Dim fi As IO.FileInfo
            DownLoadfolder = rootPath & "/ScoreDownload/"

            Dim arc_FileName As String = DownLoadfolder & CompID & "_DownloadData.zip"
            If File.Exists(arc_FileName) Then File.Delete(arc_FileName)

            Dim arch As ZipArchive = ZipFile.Open(arc_FileName, ZipArchiveMode.Create)

            di = New IO.DirectoryInfo(DownLoadfolder)
            aryFi = di.GetFiles(CompID & "*.csv")
            For Each fi In aryFi
                arch.CreateEntryFromFile(fi.FullName, fi.Name, CompressionLevel.Optimal)
            Next

            ' deleting the download files happens later in the process.
            arch.Dispose()
            If cn.State = ConnectionState.Open Then cn.Close()
            Response.Write("DownloadFileCreationSuccess")

        Catch ex As Exception
            If cn.State = ConnectionState.Open Then cn.Close()
            Response.Write("DownloadFileCreationFailed")

        End Try

        If cn.State = ConnectionState.Open Then cn.Close()

    End Sub

End Class
