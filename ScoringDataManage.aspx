<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ScoringDataManage.aspx.vb" Inherits="ScoringDataManage" %>
<%@ Import Namespace="System.Globalization" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Dim Action As String = ""
        Dim CompID As String = ""
        Dim RoundNo As Integer = Nothing
        Dim GroupNo As Integer = Nothing
        Dim CompTypeString As String = ""
        Dim DateTimeString As String = ""
        Dim PilotNo As Integer = 0
        Dim Time As Double
        Dim Height As Integer
        Dim Landing As Double = 0
        Dim GT75m As String = ""
        Dim Penalty As Integer = 0

        Dim NbrFlts As Integer
        Dim Time1 As String = "0"
        Dim Time2 As String = "0"
        Dim Time3 As String = "0"
        Dim Time4 As String = "0"
        Dim Height1 As String = "0"
        Dim Height2 As String = "0"
        Dim Height3 As String = "0"
        Dim Height4 As String = "0"

        Dim BackupDateTime As Date = Nothing

        Action = Request.QueryString("ACTION")
        CompID = Request.QueryString("ID")
        RoundNo = Request.QueryString("RD")
        GroupNo = Request.QueryString("GR")
        CompTypeString = Request.QueryString("TK")
        PilotNo = Request.QueryString("P")
        Time = Request.QueryString("T")
        Height = Request.QueryString("H")
        Landing = Request.QueryString("LDG")
        GT75m = Request.QueryString("GT75m")
        Penalty = Request.QueryString("PLTY")

        NbrFlts = Request.QueryString("NbrFlts")
        Time1 = Request.QueryString("T1")
        Time2 = Request.QueryString("T2")
        Time3 = Request.QueryString("T3")
        Time4 = Request.QueryString("T4")
        Height1 = Request.QueryString("H1")
        Height2 = Request.QueryString("H2")
        Height3 = Request.QueryString("H3")
        Height4 = Request.QueryString("H4")

        'If Action = "ScoresBackup" Then
        '    DateTimeString = Request.QueryString("DT")
        '    Dim provider As CultureInfo = CultureInfo.InvariantCulture
        '    BackupDateTime = DateTime.ParseExact(Request.QueryString("DT"), "yyyyMMddHHmmss", provider)
        'End If

        Select Case Action
            Case "ScoresBackupCheckForData" : BackupScoresCheckForData(CompID)
            Case "ScoresBackupDelete" : BackupScoresDelete(CompID)
            Case "ScoresBackup"
                DateTimeString = Request.QueryString("DT")
                Dim provider As CultureInfo = CultureInfo.InvariantCulture
                BackupDateTime = DateTime.ParseExact(Request.QueryString("DT"), "yyyyMMddHHmmss", provider)
                BackupScores(CompID, BackupDateTime)

            Case "MakeScoresZero" : MakeScoresZero(CompID, RoundNo, GroupNo, CompTypeString)

            Case "getBackupDateTime" : getBackupDateTime(CompID)

            Case "ScoresRestoreCheckForData" : RestoreScoresCheckForData(CompID)
            Case "ScoresRestoreDelete" : RestoreScoresDelete(CompID)
            Case "ScoresRestore" : RestoreScores(CompID)

            Case "ScoreEntryOpen" : ScoreEntryOpen(CompID)
            Case "ScoreEntryClose" : ScoreEntryClose(CompID)

            Case "ValidateCompID" : ValidateCompID(CompID)

            Case "DeleteComp" : DeleteComp(CompID)

            Case "ImportScore" : ImportScore(CompID, RoundNo, GroupNo, PilotNo, Time, Height, Landing, GT75m, Penalty)
            Case "ImportScoreF5K" : ImportScoreF5K(CompID, RoundNo, GroupNo, PilotNo, NbrFlts, Time1, Time2, Time3, Time4, Height1, Height2, Height3, Height4)

            Case "DownloadGTSchedule" : DownloadGliderTimerSchedule(CompID)
            Case "PurgeGTScheduleFiles" : PurgeOldGliderTimerScheduleFiles()

                ' this runs a script to remove (delete) old comps with IsPrivate=0.
                ' adjust the date in the RemoveOldPrivateComps() script.
                ' copy the changed script to the server.
                ' copy the web request below in a browser and press Enter.
                'http://www.gliderscore.com/ScoringDataManage.aspx?ACTION=RemoveOldPrivateComps
            Case "RemoveOldPrivateComps" : RemoveOldPrivateComps()

        End Select

    End Sub
</script>
