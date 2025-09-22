Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Net

Partial Class OnlineScores
    Inherits System.Web.UI.Page

    'Dim msg As String = ""
    Dim txt As String = ""
    Dim sql As String = ""
    Dim cmd As OleDbCommand
    Dim da As OleDbDataAdapter
    Dim dtCompData As New DataTable
    Dim dvCompData As DataView
    Dim dtF3KTaskByRound As New DataTable
    Dim dtF5KTaskByRound As New DataTable

    Dim wRank As Integer = 30
    Dim wName As Integer = 170 '150
    Dim wTeam As Integer = 40
    Dim wCtry As Integer = 30
    Dim wScore As Integer = 70
    Dim wPcnt As Integer = 70
    Dim wRawScore As Integer = 70
    Dim wCols As Integer = 70
    Dim wTaskHeader As Integer = 800

    Dim lblNew As Label = Nothing
    Dim pnlNew As Panel = Nothing

    Dim CtrlCounter As Integer = 0

    Protected Sub FilterChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CompName.TextChanged, FromDate.TextChanged, ToDate.TextChanged, Venue.TextChanged
        Populate_CompList()
    End Sub

    Protected Sub Populate_CompList()

        '******************************************************************************************************************

        ' establish oledbconnection variable for connecting to database
        Dim cn As OleDbConnection = Application("cn")

        ''**************************************************************************************
        '' check for public records in the CompData table that match the Filters
        'sql = "SELECT compdata.* from dbo.compdata WHERE IsPublic=1"
        sql = "SELECT CompDate, CompName, CompVenue, UseTeams, CompID from dbo.compdata WHERE IsPublic=1"

        If CompName.Text <> "" Then
            sql &= " and CompName LIKE '%" & CompName.Text & "%'"
        End If

        If Venue.Text <> "" Then
            sql &= " and CompVenue LIKE '%" & Venue.Text & "%'"
        End If

        ' check that date values are valid dates
        Dim FromDateIsValid As Boolean = False
        Dim ToDateIsValid As Boolean = False

        If FromDate.Text <> "" Then
            If IsDate(FromDate.Text) Then
                FromDateIsValid = True
            Else
                msgInvalidData.Text = "Invalid FROM DATE. Use format yyyy-mm-dd."
                divInvalidData.Visible = True
            End If
        End If

        If ToDate.Text <> "" Then
            If IsDate(ToDate.Text) Then
                ToDateIsValid = True
            Else
                msgInvalidData.Text = "Invalid TO DATE. Use format yyyy-mm-dd."
                divInvalidData.Visible = True
            End If
        End If

        If FromDateIsValid And ToDateIsValid Then
            sql &= " and CompDate BETWEEN '" & FromDate.Text & "' AND '" & ToDate.Text & "'"
        ElseIf FromDateIsValid Then
            sql &= " and CompDate >= '" & FromDate.Text & "'"
        ElseIf ToDateIsValid Then
            sql &= " and CompDate <= '" & ToDate.Text & "'"
        End If

        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        dtCompData.Clear()
        da.Fill(dtCompData)
        Try
            dtCompData.Columns.Add("IndexNbr", Type.GetType("System.Int32"))
            dtCompData.Columns.Add("FullCompName", Type.GetType("System.String"))
        Catch ex As Exception
        End Try

        Dim dr As DataRow
        For i As Integer = 0 To dtCompData.Rows.Count - 1
            dr = dtCompData.Rows(i)
            dr("FullCompName") = "   " & CDate(dr("CompDate")).ToString("yyyy MMM dd") & " - " & dr("CompName") & "     (" & dr("CompVenue") & ")"
            dr.EndEdit()
        Next

        Dim isFiltered As Boolean = False
        If CompName.Text <> "" Or Venue.Text <> "" Or FromDate.Text <> "" Or ToDate.Text <> "" Then isFiltered = True
        Dim FirstRecordText As String = ""
        If isFiltered = False Then
            FirstRecordText = "Select a competition"
        ElseIf isFiltered = True Then
            FirstRecordText = "Select from " & dtCompData.Rows.Count.ToString & " competitions"
        End If

        Dim drNew As DataRow = dtCompData.NewRow
        drNew("CompID") = "0"
        drNew("FullCompName") = FirstRecordText '"Select from all competitions"
        drNew("IndexNbr") = 0
        dtCompData.Rows.Add(drNew)

        dvCompData = New DataView(dtCompData)
        dvCompData.Sort = "CompDate DESC, CompName ASC, CompVenue ASC"

        Dim drv As DataRowView
        Dim x As Integer = 0
        For i As Integer = 0 To dvCompData.Count - 1
            drv = dvCompData.Item(i)
            If IsDBNull(drv("IndexNbr")) Then drv("IndexNbr") = x + 1
            drv.EndEdit()
            x += 1
        Next

        dvCompData.Sort = "IndexNbr"

        CompList1.Items.Clear()

        CompList1.DataSource = dvCompData
        CompList1.DataTextField = "FullCompName"
        CompList1.DataValueField = "CompID"
        CompList1.DataBind()

    End Sub

<<<<<<< HEAD
    Protected Sub CompList1_SelectedIndexChanged()
=======
    Protected Sub Setup_OpeningPage(ByVal CompID As String)

        If CompID = "" Then

            OnLineScoresTabs.Visible = False

            RoundsList_Results.Visible = False
            btnUpdateRoundsList_Results.Visible = False
            btnRefresh_Results.Visible = False

            RoundsList_Flights.Visible = False
            btnUpdateRoundsList_Flights.Visible = False
            btnRefresh_Flights.Visible = False

            'RoundsList_TeamResults.Visible = False
            'btnUpdateRoundsList_TeamResults.Visible = False
            'btnRefresh_TeamResults.Visible = False

        Else

            OnLineScoresTabs.Visible = True

            RoundsList_Results.Visible = True
            RoundsList_Flights.Visible = True
            'RoundsList_TeamResults.Visible = True

            btnUpdateRoundsList_Results.Visible = True
            btnRefresh_Results.Visible = True


            btnUpdateRoundsList_Flights.Visible = True
            btnRefresh_Flights.Visible = True


            'btnUpdateRoundsList_TeamResults.Visible = True
            'btnRefresh_TeamResults.Visible = True

        End If
    End Sub

    'Protected Sub CompList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    '    Update_On_CompList_SelectedIndexChanged()

    'End Sub

    Protected Sub CompList_SelectedIndexChanged()
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

        Dim cn As OleDbConnection = Application("cn")
        Try
            cn.Open()
        Catch ex As Exception
        End Try
        lblCompID.Text = CompList1.SelectedValue.ToString

        ' see whether this comp has teams
        Dim sql As String = "SELECT UseTeams FROM dbo.CompData WHERE CompID='" & lblCompID.Text & "'"
        Dim cmd As New OleDbCommand(sql, cn)
        Dim objUseTeams As Object = cmd.ExecuteScalar
        ' by default, Teams.visible is set to false
        If TypeOf objUseTeams Is Boolean Then
            If objUseTeams = True Then
                Teams.Visible = True
            Else
                Teams.Visible = False
            End If
        Else
            Teams.Visible = False
        End If

        If CompList1.SelectedIndex = 0 Then
            'OnLineScoresTabs.Visible = False
        Else
            OnLineScoresTabs.Visible = True

            RoundsList_Flights.Items.Clear()
            Update_RoundsList(lblCompID.Text, cn, "Flights")
<<<<<<< HEAD

            RoundsList_Results.Items.Clear()
            Update_RoundsList(lblCompID.Text, cn, "Results")

            RoundsList_Teams.Items.Clear()
            Update_RoundsList(lblCompID.Text, cn, "Teams")

=======
            RoundsList_Flights.Enabled = True
            'Update_RoundsList(lblCompID.Text, cn, "Teams")
            'RoundsList_TeamResults.Enabled = True
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
        End If

        ShowHideControls()

        If RoundsList_Flights.SelectedValue = "No scores posted" Then ShowPilotList(lblCompID.Text, cn, OnLineScoresTabs.ActiveTab)

    End Sub


    Protected Sub btnOverallResults_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        showResults("byPilot")

    End Sub

    Protected Sub ShowHideControls()

        If CompList1.SelectedIndex <= 0 Then ' no comp selected

            lblCompID.Text = CompList1.SelectedValue
            divResults.Controls.Clear()
            divFlights.Controls.Clear()
            divTeams.Controls.Clear()
            OnLineScoresTabs.Visible = False

        ElseIf CompList1.SelectedIndex > 0 Then

            If RoundsList_Flights.SelectedIndex = 0 Then
                ' make all other controls not visible
                btnUpdateRoundsList_Flights.Visible = False
                btnRefresh_Flights.Visible = False
                divFlights.Controls.Clear()
                btnExport_Flights.Visible = False
            Else
                ' make all controls visible
                btnUpdateRoundsList_Flights.Visible = True
                btnRefresh_Flights.Visible = True
                btnExport_Flights.Visible = True
            End If

            If RoundsList_Results.SelectedIndex = 0 Then

                btnUpdateRoundsList_Results.Visible = False
                btnRefresh_Results.Visible = False
                divResults.Controls.Clear()
                divResults.Visible = False
                btnExport_Results.Visible = False
            Else
                ' make all controls visible
                btnUpdateRoundsList_Results.Visible = True
                btnRefresh_Results.Visible = True
                divResults.Visible = True
                btnExport_Results.Visible = True
            End If

            If RoundsList_Teams.SelectedIndex = 0 Then

                btnUpdateRoundsList_Teams.Visible = False
                btnRefresh_Teams.Visible = False
                divTeams.Controls.Clear()
                divTeams.Visible = False
            Else
                ' make all controls visible
                btnUpdateRoundsList_Teams.Visible = True
                btnRefresh_Teams.Visible = True
                divTeams.Visible = True
            End If

        End If

    End Sub


    Protected Sub showResults(ByVal rptType As String)

        If rptType = "byPilot" And RoundsList_Results.SelectedIndex <= 0 Then Exit Sub
        If rptType = "byTeam" And RoundsList_Teams.SelectedIndex <= 0 Then Exit Sub

        ' rptType can be byPilot or byTeam or byOther
        Dim sql As String
        Dim cmd As OleDbCommand
        Dim da As OleDbDataAdapter
        Dim dtTasks As New DataTable
        Dim arrTasks As New ArrayList
        Dim dr As DataRow
        Dim ToRound As Integer
        Dim NumberOfTasks As Integer
        Dim lblNew As Label
        Dim pnlNew As Panel
        Dim ObjHeight As Integer = 17
        Dim CompID As String = lblCompID.Text

        Dim byPilot As Boolean = False
        Dim byTeam As Boolean = False

        If rptType = "byPilot" Then divResults.Controls.Clear() : byPilot = True
        If rptType = "byTeam" Then divTeams.Controls.Clear() : byTeam = True

        '******************************************************************************************************************
        ' get connection to database object
        Dim cn As OleDbConnection = Application("cn")

        '****************************************************************************************************
        ' get the required data from the CompData table
        Dim dtCompData As DataTable = ShowScores.create_dtCompData(CompID, cn)

        ' Use dtCompData to set these variables
        dr = dtCompData.Rows(0)
        Dim DropScoreOption As Integer = CInt(dr("DropScoreOption"))
        Dim Drop1AtRound As Integer = CInt(dr("Drop1At"))
        Dim Drop2AtRound As Integer = CInt(dr("Drop2At"))
        Dim Drop3AtRound As Integer = CInt(dr("Drop3At"))
        Dim Drop4AtRound As Integer = CInt(dr("Drop4At"))
        Dim Drop5AtRound As Integer = CInt(dr("Drop5At"))
        Dim GroupScoreDecimals As Integer = CInt(dr("GroupScoreDecimals"))

        '******************************************************************************************************************
        ' set ToRound variable
        If byPilot Then ToRound = RoundsList_Results.SelectedValue.Substring(6) ' the part of the string after the text "Round "
        If byTeam Then ToRound = RoundsList_Teams.SelectedValue.Substring(6) ' the part of the string after the text "Round "

        ' get numberOfTasks and create an array of tasks if more than one task
        sql = "SELECT DISTINCT CompType FROM ScoringData WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        da.Fill(dtTasks)

        NumberOfTasks = dtTasks.Rows.Count

        For i As Integer = 0 To dtTasks.Rows.Count - 1
            dr = dtTasks.Rows(i)
            Select Case dr("CompType")
                Case "Dist" : arrTasks.Add("2")
                Case "Spd" : arrTasks.Add("3")
                Case "F5B" : arrTasks.Add("4")
                Case "F3K" : arrTasks.Add("5")
                Case "F5K" : arrTasks.Add("6")
                Case "F5K2024" : arrTasks.Add("6")
                Case Else : arrTasks.Add("1")
            End Select
        Next
        arrTasks.Sort()

        If arrTasks.Contains("5") Then ' if true, comp is an F3K comp
            sql = "select RoundNo, F3KTaskAbbreviation FROM F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            da = New OleDbDataAdapter(cmd)
            da.Fill(dtF3KTaskByRound)
            VBCode.CreatePrimaryIndexForTable(dtF3KTaskByRound, 1)
        End If

        If arrTasks.Contains("6") Then ' if true, comp is an F5K comp
            sql = "select RoundNo, F5KTaskAbbreviation, F5KRefHeight FROM F5KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            da = New OleDbDataAdapter(cmd)
            da.Fill(dtF5KTaskByRound)
            VBCode.CreatePrimaryIndexForTable(dtF5KTaskByRound, 1)
        End If

        '****************************************************************************************************
        ' get the data for progressive scores (Overall Results) taking into account any discard scores.
        Dim dvCompResults As DataView = ShowScores.RunRptOverallResults(CompID, cn, arrTasks, NumberOfTasks, DropScoreOption,
                                                                        Drop1AtRound, Drop2AtRound, Drop3AtRound, Drop4AtRound, Drop5AtRound,
                                                                        ToRound,
                                                                        GroupScoreDecimals,
                                                                        rptType)

        '****************************************************************************************************

        ' create standard headers
        If arrTasks.Contains("5") Then
            wCols = 76
        ElseIf GroupScoreDecimals = 3 Then
            wCols = 70
        Else
            wCols = 65
        End If

        ' add a blank panel to space the next line
        pnlNew = AddNewPanel(CtrlCounter, "10px")
        If byPilot Then divResults.Controls.Add(pnlNew)
        If byTeam Then divTeams.Controls.Add(pnlNew)

        pnlNew = AddNewPanel(CtrlCounter, "20px")
        If byPilot Then divResults.Controls.Add(pnlNew)
        If byTeam Then divTeams.Controls.Add(pnlNew)


        If rptType = "byPilot" Then lblNew = AddNewLabel("Individual Results To Round " & ToRound.ToString, "scores-TaskHeader", CtrlCounter, wRank, 20)
        If rptType = "byTeam" Then lblNew = AddNewLabel("Team Results To Round " & ToRound.ToString, "scores-TaskHeader", CtrlCounter, wRank, 20)
        pnlNew.Controls.Add(lblNew)

        ' add a blank panel to space the next line
        pnlNew = AddNewPanel(CtrlCounter, "15px")
        If byPilot Then divResults.Controls.Add(pnlNew)
        If byTeam Then divTeams.Controls.Add(pnlNew)


        ' add a panel to display the column headings including Round headings
        pnlNew = AddNewPanel(CtrlCounter, "30px")
        If byPilot Then divResults.Controls.Add(pnlNew)
        If byTeam Then divTeams.Controls.Add(pnlNew)


        ObjHeight = 15

        If byPilot Then
            lblNew = AddNewLabel("#", "scores-Rank", CtrlCounter, wRank, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Name", "scores-Name", CtrlCounter, wName, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Ctry", "scores-Country", CtrlCounter, wCtry, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Score", "scores-Score", CtrlCounter, wScore, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Pcnt", "scores-Pcnt", CtrlCounter, wPcnt, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Raw<br />Score", "scores-RawScore", CtrlCounter, wRawScore, ObjHeight)
            pnlNew.Controls.Add(lblNew)
        End If

        If byTeam Then
            lblNew = AddNewLabel("#", "scores-Rank", CtrlCounter, wRank, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Team", "scores-Rank", CtrlCounter, wTeam, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Team<br />Score", "scores-Score", CtrlCounter, wScore, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Pcnt", "scores-Pcnt", CtrlCounter, wPcnt, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Ctry", "scores-Country", CtrlCounter, wCtry, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Name", "scores-Name", CtrlCounter, wName, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Score", "scores-Score", CtrlCounter, wScore, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Raw<br />Score", "scores-RawScore", CtrlCounter, wRawScore, ObjHeight)
            pnlNew.Controls.Add(lblNew)
        End If

        ' create Round headers and Penalty header
        For i As Integer = 1 To ToRound
            If NumberOfTasks = 1 Then
                lblNew = AddNewLabel("Rnd" & i.ToString, "scores-Right", CtrlCounter, wCols * NumberOfTasks, ObjHeight)
            Else
                lblNew = AddNewLabel("Rnd" & i.ToString, "scores-Centered", CtrlCounter, wCols * NumberOfTasks, ObjHeight)
            End If
            pnlNew.Controls.Add(lblNew)
        Next

        If arrTasks.Contains("6") = False Then
            lblNew = AddNewLabel("Penalty", "scores-Right", CtrlCounter, wCols, ObjHeight)
            pnlNew.Controls.Add(lblNew)
        End If

        If ToRound >= 6 Then

            lblNew = AddNewLabel("#", "scores-Rank", CtrlCounter, wRank, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Name", "scores-Name", CtrlCounter, wName, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Ctry", "scores-Country", CtrlCounter, wCtry, ObjHeight)
            pnlNew.Controls.Add(lblNew)

        End If

        '****************************************************************************************************
        ' create task headers if more than one task

        If NumberOfTasks > 1 Or arrTasks.Contains("5") Or arrTasks.Contains("6") Then ' need a panel to hold task names or F3K/F5K task abbreviations

            ' create a Panel to display the various task headings if more than one task (F3B and F3K/F5K)
            pnlNew = AddNewPanel(CtrlCounter, "20px")
            If byPilot Then divResults.Controls.Add(pnlNew)
            If byTeam Then divTeams.Controls.Add(pnlNew)

            ObjHeight = 15

            ' add a blank label to the Panel 
            If byPilot Then lblNew = AddNewLabel("", "", CtrlCounter, wRank + wName + wCtry + wScore + wPcnt + wRawScore, ObjHeight)
            If byTeam Then lblNew = AddNewLabel("", "", CtrlCounter, wRank + wTeam + wScore + wPcnt + wCtry + wName, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            If NumberOfTasks > 1 Then

                Dim arrTaskNames As New ArrayList
                For i As Integer = 0 To arrTasks.Count - 1
                    Select Case arrTasks(i)
                        Case 1 : arrTaskNames.Add("Dur")
                        Case 2 : arrTaskNames.Add("Dis")
                        Case 3 : arrTaskNames.Add("Spd")
                    End Select
                Next

                For i As Integer = 1 To ToRound
                    For j As Integer = 0 To NumberOfTasks - 1
                        lblNew = AddNewLabel(arrTaskNames(j).ToString, "scores-Centered", CtrlCounter, wCols, ObjHeight)
                        pnlNew.Controls.Add(lblNew)
                    Next
                Next

            ElseIf arrTasks.Contains("5") Then

                Dim F3KTask As String

                For i As Integer = 1 To ToRound
                    F3KTask = dtF3KTaskByRound.Rows.Find(i)("F3KTaskAbbreviation").ToString
                    lblNew = AddNewLabel(F3KTask, "scores-F3KTask", CtrlCounter, wCols, ObjHeight)
                    pnlNew.Controls.Add(lblNew)
                Next

            ElseIf arrTasks.Contains("6") Then

                Dim F5KTask As String

                For i As Integer = 1 To ToRound
                    F5KTask = dtF5KTaskByRound.Rows.Find(i)("F5KTaskAbbreviation").ToString
                    lblNew = AddNewLabel(F5KTask, "scores-F5KTask", CtrlCounter, wCols, ObjHeight)
                    pnlNew.Controls.Add(lblNew)
                Next

            End If

        End If

        Dim strFormat As String = ""
        Select Case GroupScoreDecimals
            Case 0 : strFormat = "#0"
            Case 1 : strFormat = "#0.0"
            Case 2 : strFormat = "#0.00"
            Case 3 : strFormat = "#0.000"
        End Select



        '****************************************************************************************************************
        ' output data

        Dim lasttop As Integer = 120
        If (divResults.Visible) Or (divTeams.Visible) Then lasttop += 20

        Dim NbrForTeamScore As Integer
        If byTeam Then NbrForTeamScore = ShowScores.getNbrForTeamScore(cn, CompID)
        Dim TeamNbr As Integer = -1
        Dim isThisTeamsFirstRow As Boolean = True

        Dim top As String = ""
        Dim left As String = ""
        Dim intLeft As Integer = 0
        Dim intWidth As Integer = 0

        Dim LineCounter As Integer = 0

        Dim drv As DataRowView
        For i As Integer = 0 To dvCompResults.Count - 1

            drv = dvCompResults.Item(i)

            LineCounter += 1
            If byPilot Then
                If (LineCounter - 1) Mod 5 = 0 Then ' put in a blank row after every 5 rows for the byPilot report
                    pnlNew = AddNewPanel(CtrlCounter, "10px")
                    If byPilot Then divResults.Controls.Add(pnlNew)
                End If
            End If

            If byTeam Then ' put in a blank row after every team
                If TeamNbr <> drv("Team") Then
                    pnlNew = AddNewPanel(CtrlCounter, "5px")
                    divTeams.Controls.Add(pnlNew)
                    TeamNbr = drv("Team")
                    isThisTeamsFirstRow = True
                End If
            End If

            pnlNew = AddNewPanel(CtrlCounter, "17px")
            If byPilot Then divResults.Controls.Add(pnlNew)
            If byTeam Then divTeams.Controls.Add(pnlNew)


            ObjHeight = 17

            If byPilot Then
                lblNew = AddNewLabel(drv("Rank").ToString, "scores-Data-Center", CtrlCounter, wRank, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(drv("PilotName").ToString, "scores-Data-Left", CtrlCounter, wName, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                If drv("Country") = "" Then
                    txt = "-"
                Else
                    txt = drv("Country")
                End If
                lblNew = AddNewLabel(txt, "scores-Data-Center", CtrlCounter, wCtry, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(CDbl(drv("Score")).ToString(strFormat), "scores-Data-Right", CtrlCounter, wScore, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                Dim Pcnt As Double = VBCode.RoundNumber(CDbl(drv("Percent")), 2)
                lblNew = AddNewLabel(Pcnt.ToString("#0.00"), "scores-Data-Center", CtrlCounter, wPcnt, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(CDbl(drv("RawScore")).ToString(strFormat), "scores-Data-Right", CtrlCounter, wRawScore, ObjHeight)
                pnlNew.Controls.Add(lblNew)
            End If

            If byTeam Then
                If isThisTeamsFirstRow Then
                    isThisTeamsFirstRow = False ' for the next time around the loop
                    lblNew = AddNewLabel(drv("strTeamRank").ToString, "scores-Data-Center", CtrlCounter, wRank, ObjHeight)
                    pnlNew.Controls.Add(lblNew)

                    lblNew = AddNewLabel(drv("Team").ToString, "scores-Data-Center", CtrlCounter, wCtry, ObjHeight)
                    pnlNew.Controls.Add(lblNew)

                    lblNew = AddNewLabel(VBCode.RoundNumber(drv("TeamScore"), GroupScoreDecimals), "scores-Data-Right", CtrlCounter, wScore, ObjHeight)
                    pnlNew.Controls.Add(lblNew)

                    Dim Pcnt As Double = VBCode.RoundNumber(CDbl(drv("TeamPercent")), 2)
                    lblNew = AddNewLabel(Pcnt.ToString("#0.00"), "scores-Data-Center", CtrlCounter, wPcnt, ObjHeight)
                    pnlNew.Controls.Add(lblNew)

                Else
                    lblNew = AddNewLabel("", "scores-Rank", CtrlCounter, wRank + wCtry + wScore + wPcnt, ObjHeight)
                    pnlNew.Controls.Add(lblNew)

                End If

                If drv("Country") = "" Then
                    txt = "-"
                Else
                    txt = drv("Country")
                End If

                lblNew = AddNewLabel(txt, "scores-Data-Center", CtrlCounter, wCtry, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(drv("PilotName").ToString, "scores-Data-Left", CtrlCounter, wName, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(CDbl(drv("Score")).ToString(strFormat), "scores-Data-Right", CtrlCounter, wScore, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(CDbl(drv("RawScore")).ToString(strFormat), "scores-Data-Right", CtrlCounter, wRawScore, ObjHeight)
                pnlNew.Controls.Add(lblNew)

            End If

            Dim colName As String = ""
            Dim TaskNo As Integer = 0
            Dim PltScore As Double = 0

            For j = 1 To ToRound
                For k = 0 To NumberOfTasks - 1
                    TaskNo = arrTasks(k)
                    colName = (j * 10 + arrTasks(k)).ToString
                    PltScore = CDbl(drv(colName))

                    lblNew = AddNewLabel("", "scores-Data-Right", CtrlCounter, wCols, ObjHeight)

                    If PltScore < 0 Then
                        If PltScore = -0.0001 Then
                            PltScore = 0
                        Else
                            PltScore = PltScore * -1
                        End If

                        lblNew.Text = "*" & PltScore.ToString(strFormat)

                    ElseIf PltScore = 0.00001 Then 'F5JMotorReStarted zero not droppable
                        lblNew.Text = "(Mtr)" & 0.ToString(strFormat)
                    Else
                        lblNew.Text = PltScore.ToString(strFormat)
                    End If

                    pnlNew.Controls.Add(lblNew)
                Next
            Next

            If arrTasks.Contains("6") = False Then
                If CInt(drv("Penalty")) = 0 Then
                    txt = ""
                Else
                    txt = CDbl(drv("Penalty")).ToString("#0")
                End If
            End If

            lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            ' this additional label put in so that line formatting would be OK. Without it, a row with a penalty involved mis-aligns. Width is 1 so, not significant.
            lblNew = AddNewLabel("", "scores-Data-Right", CtrlCounter, 1, ObjHeight)
            pnlNew.Controls.Add(lblNew)

            If ToRound >= 6 Then
                lblNew = AddNewLabel(drv("Rank").ToString, "scores-Data-Center", CtrlCounter, wRank, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(drv("PilotName").ToString, "scores-Data-Left", CtrlCounter, wName, ObjHeight)
                pnlNew.Controls.Add(lblNew)

                If drv("Country") = "" Then
                    txt = "-"
                Else
                    txt = drv("Country")
                End If
                lblNew = AddNewLabel(txt, "scores-Data-Center", CtrlCounter, wCtry, ObjHeight)
                pnlNew.Controls.Add(lblNew)
            End If

        Next

        ' add blank line at the end for readability
        pnlNew = AddNewPanel(CtrlCounter, "20px")
        If byPilot Then divResults.Controls.Add(pnlNew)
        If byTeam Then divTeams.Controls.Add(pnlNew)

        If byPilot Then divResults.Visible = True
        If byTeam Then divTeams.Visible = True

    End Sub

    Protected Sub RoundsList_Flights_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        RemoveHandler RoundsList_Flights.SelectedIndexChanged, AddressOf RoundsList_Flights_SelectedIndexChanged

        btnUpdateRoundsList_Flights.Visible = (RoundsList_Flights.SelectedIndex > 0)
        btnRefresh_Flights.Visible = (RoundsList_Flights.SelectedIndex > 0)
        btnExport_Flights.Visible = (RoundsList_Flights.SelectedIndex > 0)

        If RoundsList_Flights.SelectedIndex = CInt(RoundsListFlightsSelectedIndex.Text) Then Exit Sub
        RoundsListFlightsSelectedIndex.Text = CStr(RoundsList_Flights.SelectedIndex)

        If RoundsList_Flights.SelectedIndex > 0 Then Refresh_Flights()

    End Sub

    Protected Sub RoundsList_Results_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        RemoveHandler RoundsList_Results.SelectedIndexChanged, AddressOf RoundsList_Results_SelectedIndexChanged

        btnUpdateRoundsList_Results.Visible = (RoundsList_Results.SelectedIndex > 0)
        btnRefresh_Results.Visible = (RoundsList_Results.SelectedIndex > 0)
        btnExport_Results.Visible = (RoundsList_Results.SelectedIndex > 0)

        If RoundsList_Results.SelectedIndex = CInt(RoundsListResultsSelectedIndex.Text) Then Exit Sub
        RoundsListResultsSelectedIndex.Text = CStr(RoundsList_Results.SelectedIndex)

        If RoundsList_Results.SelectedIndex > 0 Then Refresh_Results()
    End Sub

    Protected Sub RoundsList_Teams_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        RemoveHandler RoundsList_Teams.SelectedIndexChanged, AddressOf RoundsList_Teams_SelectedIndexChanged

        btnUpdateRoundsList_Teams.Visible = (RoundsList_Teams.SelectedIndex > 0)
        btnRefresh_Teams.Visible = (RoundsList_Teams.SelectedIndex > 0)

        If RoundsList_Teams.SelectedIndex = CStr(RoundsListTeamsSelectedIndex.Text) Then Exit Sub
        RoundsListTeamsSelectedIndex.Text = CStr(RoundsList_Teams.SelectedIndex)

        If RoundsList_Teams.SelectedIndex > 0 Then Refresh_Teams()

    End Sub


<<<<<<< HEAD
    Protected Sub Refresh_Flights()
=======
    'Protected Sub RoundsList_Results_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    '    On_RoundsList_Results_SelectedIndexChanged()

    'End Sub

    Protected Sub RoundsList_Results_SelectedIndexChanged()

        ShowHideControls()

        divResults.Controls.Clear()
        divResults.Visible = False

        If RoundsList_Results.SelectedIndex = 0 Then
            If CompList.SelectedIndex = 0 Then
                btnUpdateRoundsList_Results.Visible = False
                btnRefresh_Results.Visible = False
                btnExport_Results.Visible = False
            Else
                btnUpdateRoundsList_Results.Visible = False
                btnRefresh_Results.Visible = False
                btnExport_Results.Visible = False
            End If
            Exit Sub
        Else
            showResults()
        End If

    End Sub

    'Protected Sub RoundsList_TeamResults_SelectedIndexChanged()

    '    ShowHideControls()

    '    divResults.Controls.Clear()
    '    divResults.Visible = False

    '    If RoundsList_Results.SelectedIndex = 0 Then
    '        If CompList.SelectedIndex = 0 Then
    '            btnUpdateRoundsList_Results.Visible = False
    '            btnRefresh_Results.Visible = False
    '            btnExport_Results.Visible = False
    '        Else
    '            btnUpdateRoundsList_Results.Visible = False
    '            btnRefresh_Results.Visible = False
    '            btnExport_Results.Visible = False
    '        End If
    '        Exit Sub
    '    Else
    '        showResults()
    '    End If

    'End Sub


    Protected Sub btnRefreshOverallResults_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If RoundsList_Results.SelectedIndex = 0 Then
            Exit Sub
        Else

            divResults.Controls.Clear()
            divResults.Visible = False

            'Dim dtPostBackResults As DataTable = DirectCast(Session("dtPostBackResults"), DataTable)
            'dtPostBackResults.Clear()
            'Session("dtPostBackResults") = dtPostBackResults

            showResults()
        End If

    End Sub

    'Protected Sub btnRefreshTeamResults_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    '    If RoundsList_Results.SelectedIndex = 0 Then
    '        Exit Sub
    '    Else

    '        divResults.Controls.Clear()
    '        divResults.Visible = False

    '        'Dim dtPostBackResults As DataTable = DirectCast(Session("dtPostBackResults"), DataTable)
    '        'dtPostBackResults.Clear()
    '        'Session("dtPostBackResults") = dtPostBackResults

    '        showResults()
    '    End If

    'End Sub


    Protected Sub btnRefreshReport_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As OleDbConnection = Application("cn")
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

        If RoundsList_Flights.SelectedIndex = 0 Then
            divFlights.Controls.Clear()
            Exit Sub
        End If

        Dim cn As OleDbConnection = Application("cn")
        showFlightScores(cn)

    End Sub

    Protected Sub Refresh_Results()

        If RoundsList_Results.SelectedIndex = 0 Then
            divResults.Controls.Clear()
            Exit Sub
        End If

        showResults("byPilot")

    End Sub

    Protected Sub Refresh_Teams()

        If RoundsList_Teams.SelectedIndex = 0 Then
            divTeams.Controls.Clear()
            Exit Sub
        End If

        showResults("byTeam")

    End Sub


    Protected Sub UpdateRoundsList_Results(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As OleDbConnection = Application("cn")
<<<<<<< HEAD
        Dim idxSelected As Integer = RoundsList_Results.SelectedIndex
        RoundsList_Results.SelectedIndex = Nothing
        Update_RoundsList(lblCompID.Text, cn, "Results")
        RoundsList_Results.SelectedIndex = idxSelected
=======

        If sender.id = "btnUpdateRoundsList_Flights" Then
            RoundsList_Flights.SelectedIndex = Nothing
            Update_RoundsList(lblCompID.Text, cn, "Flights")
            RoundsList_Flights.SelectedIndex = 0
            For i As Integer = divFlights.Controls.Count - 1 To 0 Step -1
                divFlights.Controls.RemoveAt(i)
            Next
        ElseIf sender.id = "btnUpdateRoundsList_Results" Then
            RoundsList_Results.SelectedIndex = Nothing
            Update_RoundsList(lblCompID.Text, cn, "Results")
            RoundsList_Results.SelectedIndex = 0
            For i As Integer = divResults.Controls.Count - 1 To 0 Step -1
                divResults.Controls.RemoveAt(i)
            Next
            'ElseIf sender.id = "btnUpdateRoundsList_TeamResults" Then
            'RoundsList_TeamResults.SelectedIndex = Nothing
            'Update_RoundsList(lblCompID.Text, cn, "TeamResults")
            'RoundsList_TeamResults.SelectedIndex = 0
            'For i As Integer = divTeamResults.Controls.Count - 1 To 0 Step -1
            '    divTeamResults.Controls.RemoveAt(i)
            'Next
        End If
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

    End Sub



    Protected Sub UpdateRoundsList_Flights(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As OleDbConnection = Application("cn")
        Dim idxSelected As Integer = RoundsList_Flights.SelectedIndex
        RoundsList_Flights.SelectedIndex = Nothing
        Update_RoundsList(lblCompID.Text, cn, "Flights")
        RoundsList_Flights.SelectedIndex = idxSelected

    End Sub

    Protected Sub UpdateRoundsList_Teams(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As OleDbConnection = Application("cn")
        Dim idxSelected As Integer = RoundsList_Teams.SelectedIndex
        RoundsList_Teams.SelectedIndex = Nothing
        Update_RoundsList(lblCompID.Text, cn, "Teams")
        RoundsList_Teams.SelectedIndex = idxSelected

    End Sub




    Protected Sub showFlightScores(ByVal cn As OleDbConnection)    ' get the data for flight scores

        divFlights.Controls.Clear()

        Dim msg As String = ""
        Dim CompID As String = CompList1.SelectedValue.ToString
        Dim RoundNo As String = RoundsList_Flights.SelectedValue.Substring(6) ' the part of the string after the text "Round "

        '********************************************************************************************************************
        ' FLIGHT SCORES SECTION
        '********************************************************************************************************************

        Dim dtTaskList As DataTable = ShowScores.create_dtTaskList(CompID, RoundNo, cn)

        Dim dr As DataRow
        Dim NoOfTasks As Integer = 0

        Dim dtCompData As DataTable = ShowScores.create_dtCompData(CompID, cn)        ' Use dtCompData to set these variables

        Dim CompType As String = dtCompData.Rows(0)("CompType").ToString
        Dim CompHasLandings As Boolean = CBool(dtCompData.Rows(0)("CompHasLandings"))
        Dim TimingDecimals As Integer = CInt(dtCompData.Rows(0)("TimingDecimalPlaces"))
        Dim GroupScoreOption As Integer = CInt(dtCompData.Rows(0)("GroupScoreOption"))
        Dim GroupScoreDecimals As Integer = CInt(dtCompData.Rows(0)("GroupScoreDecimals"))
        Dim SpeedDecimals As Integer = CInt(dtCompData.Rows(0)("SpeedDecimals"))
        Dim durPointsPerSecond As Double = CDbl(dtCompData.Rows(0)("durPointsPerSecond"))
        Dim F5JRefHeight As Integer = CInt(dtCompData.Rows(0)("F5JRefHeight"))
        Dim F5JPenaltyUpTo As Double = CDbl(dtCompData.Rows(0)("F5JPenaltyUpTo"))
        Dim F5JPenaltyOver As Double = CDbl(dtCompData.Rows(0)("F5JPenaltyOver"))
        Dim F5BPointsPerLap As Integer = CInt(dtCompData.Rows(0)("F5BPointsPerLap"))
        Dim durNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("durNoOfTimekeepers"))
        Dim spdNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("spdNoOfTimekeepers"))
        Dim f5bNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("f5bNoOfTimekeepers"))

        Dim FltDednIdx As Integer
        If IsDBNull(dtCompData.Rows(0)("FltDednIdx")) Then
            FltDednIdx = 0
        Else
            FltDednIdx = CInt(dtCompData.Rows(0)("FltDednIdx"))
        End If

        Dim F5JMotorReStartOption As Integer
        If IsDBNull(dtCompData.Rows(0)("F5JMotorReStartOption")) Then
            F5JMotorReStartOption = 0
        Else
            F5JMotorReStartOption = CInt(dtCompData.Rows(0)("F5JMotorReStartOption"))
        End If

        Dim dtScores As DataTable = ShowScores.create_dtFlightScores(cn, CompID, -1, -1, RoundNo, -1, -1, dtCompData)

        ' get data for F3K
        Dim dtF3KData As DataTable = Nothing
        If CompType = "F3K" Then
            dtF3KData = ShowScores.create_dtF3KData(CompID, cn)
            ShowScores.UpdateF3KRawScoresForRound(CompID, cn, dtScores, RoundNo)
        End If

        If CompType = "F5K" Or CompType = "F5K2024" Then
            ' get a list of flight groups to be reported
            Dim dtFlightGroupsF5K As DataTable = F5KCode.Create_dtFlightGroupsF5K(CompID, RoundNo, RoundNo, cn)

            Dim drF5KData As DataRow = F5KCode.getF5KTaskDetailsForRound(CompID, RoundNo)
            Dim F5KTaskDescription As String = drF5KData("F5KTaskDescription")
            Dim F5KRefHeight As String = drF5KData("F5KRefHeight")
            Dim F5KTask As String = drF5KData("F5KTask")
            Dim F5KMaxScores As Integer = drF5KData("F5KMaxScores")

            Dim dvScores As New System.Data.DataView(dtScores)
            dvScores.Sort = "RoundNo, GroupNo, ReFlightNo, RawScore DESC"

            Dim drv As System.Data.DataRowView

            Dim tbl As Table
            Dim tr As TableRow
            Dim td As TableCell
            Dim th As TableHeaderCell
            Dim txt As String = ""

            Dim GroupScoreFormat As String = ""
            Select Case GroupScoreDecimals
                Case 0 : GroupScoreFormat = "#0"
                Case 1 : GroupScoreFormat = "#0.0"
                Case 2 : GroupScoreFormat = "#0.00"
                Case 3 : GroupScoreFormat = "#0.000"
            End Select

            Dim TimeScoreFormat As String = ""
            Select Case TimingDecimals
                Case 0 : TimeScoreFormat = "#0"
                Case 1 : TimeScoreFormat = "#0.0"
                Case 2 : TimeScoreFormat = "#0.00"
                Case 3 : TimeScoreFormat = "#0.000"
            End Select

            Dim RawScoreFormat As String = ""
            Select Case TimingDecimals
                Case 0 : RawScoreFormat = "#0.0" ' always show at least one decimal
                Case 1 : RawScoreFormat = "#0.0"
                Case 2 : RawScoreFormat = "#0.00"
                Case 3 : RawScoreFormat = "#0.000"
            End Select

            tbl = New Table
            tbl.CssClass = "tbl-layout"
            tbl.Attributes.Add("runat", "server")

            Dim Rnd As Integer = 0
            Dim Grp As Integer = 0
            Dim Rft As Integer = 0

            Dim NbrCols As Integer
            If CompType = "F5K" Then NbrCols = 13
            If CompType = "F5K2024" Then NbrCols = 17

            For i As Integer = 0 To dvScores.Count - 1
                drv = dvScores.Item(i)

                If i = 0 Then

                    Rnd = drv("RoundNo")
                    Grp = drv("GroupNo")
                    Rft = drv("ReFlightNo")

                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 5 : tbl.Controls.Add(tr) ' row for spacing

                    txt = "Round " & Rnd
                    tr = New TableRow : tr.Attributes.Add("runat", "server")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.Text = txt : td.CssClass = "tdRoundNo" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                    ' round number and task header
                    'F5KTaskForRound = F5KCode.getF5KTaskDetailsForRound(CompID, drv("RoundNo"))
                    'txt = "Round " & Rnd & "&nbsp&nbsp&nbsp" & F5KTaskDescription & " (Ref height " & F5KRefHeight & " metres)"
                    txt = "&nbsp&nbsp&nbsp" & F5KTaskDescription & " (Ref height " & F5KRefHeight & " metres)"

                    tr = New TableRow : tr.Attributes.Add("runat", "server")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.Text = txt : td.CssClass = "tdRoundNo" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 5 : tbl.Controls.Add(tr) ' row for spacing

                    ' this adds a line across all columns
                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 1
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.CssClass = "tdwithbottomborderblack" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                    If CompType = "F5K" Then
                        tr = New TableRow : tr.Attributes.Add("runat", "server")
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Name" : th.CssClass = "thName" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Ctry" : th.CssClass = "thCtry" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Flight" : th.CssClass = "thFltNbr" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Time" : th.CssClass = "thTime" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Height" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Height Points" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Nbr Of Flights Penalty" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Land Out Penalty" : th.CssClass = "thLOut" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Flight Penalty" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Flight Points" : th.CssClass = "thPoints" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Total Points" : th.CssClass = "thTotPts" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Score" : th.CssClass = "thScore" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Zero Round" : th.CssClass = "thZeroRnd" : tr.Controls.Add(th)
                        tbl.Controls.Add(tr)
                    ElseIf CompType = "F5K2024" Then
                        tr = New TableRow : tr.Attributes.Add("runat", "server")
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Name" : th.CssClass = "thName" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Ctry" : th.CssClass = "thCtry" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Flight" : th.CssClass = "thFltNbr" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Time" : th.CssClass = "thTime" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Height" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Time Points" : th.CssClass = "thTime" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Height Points" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Nbr of Flights Penalty" : th.CssClass = "thHeight" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Out of Pilot Area" : th.CssClass = "thLOut" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Overfly Window" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Out of Field" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Motor Restart" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Hit Person" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Flight Points" : th.CssClass = "thPoints" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Total Points" : th.CssClass = "thTotPts" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Score" : th.CssClass = "thScore" : tr.Controls.Add(th)
                        th = New TableHeaderCell : th.Attributes.Add("runat", "server") : th.Text = "Safety Penalty" : th.CssClass = "thFPlty" : tr.Controls.Add(th)
                        tbl.Controls.Add(tr)
                    End If

                    ' this adds a line across all columns
                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 1
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.CssClass = "tdwithbottomborderblack" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 5 : tbl.Controls.Add(tr) ' row for spacing

                    tr = New TableRow : tr.Attributes.Add("runat", "server")
                    txt = "Group " & Grp & " ReFlight " & Rft
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.Text = txt : td.CssClass = "tdRoundNo" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                End If

                ' check for group change
                If Rnd <> drv("RoundNo") Or Grp <> drv("GroupNo") Or Rft <> drv("ReFlightNo") Then

                    ' this adds a line across all columns
                    tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 1
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.CssClass = "tdwithbottomborderblack" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)

                    Rnd = drv("RoundNo") : Grp = drv("GroupNo") : Rft = drv("ReFlightNo")

                    tr = New TableRow : tr.Attributes.Add("runat", "server")
                    txt = "Group " & Grp & " ReFlight " & Rft
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.Text = txt : td.CssClass = "tdRoundNo" : tr.Controls.Add(td)
                    tbl.Controls.Add(tr)


                End If

                '====================================================================================================================================================================
                ' this is the first row for the pilot including the first flight

                Dim UpdatedF5KString As Boolean = False
                If drv("Flight1").ToString.Contains("FNO") Then UpdatedF5KString = True

                tr = New TableRow : tr.Attributes.Add("runat", "server")

                td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdName" : td.Text = drv("PilotName") : tr.Controls.Add(td)
                td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdCtry" : td.Text = drv("Country") : tr.Controls.Add(td)

                If F5KTask = "B" Then
                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "NOF")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "NbrFlts")
                Else
                    txt = "1"
                End If
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFltNbr" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "FTM")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "FltTim")
                txt = VBCode.formatTimesToMinSec(txt, TimingDecimals)
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "HVA")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "HgtVal")
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "TPT")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "TimPts")
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "HPT")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "HgtPts")
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "NFP")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "NbrFltsPlty")
                If txt = "0" Then txt = ""
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "LOP")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "LdgOutPlty")
                If txt = "0" Then txt = ""
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdLOut" : td.Text = txt : tr.Controls.Add(td)

                If CompType = "F5K" Then

                    txt = F5KCode.getParamValue(drv("Flight1"), "FltPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                ElseIf CompType = "F5K2024" Then

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "LLP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "LateLdgPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "OOF")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "OutOfFld")
                    If txt = "True" Then txt = "Yes" Else txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "MOS")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "MotorReStart")
                    If txt = "True" Then txt = "Yes" Else txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "HPN")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "HitPerson")
                    If txt = "True" Then txt = "Yes" Else txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                End If

                If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "FPT")
                If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "FltPts")
                td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdPoints" : td.Text = txt : tr.Controls.Add(td)

                txt = CDbl(drv("RawScore")).ToString(RawScoreFormat)
                td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdTotPts" : td.RowSpan = F5KMaxScores : td.Text = txt : tr.Controls.Add(td)

                txt = CDbl(drv("NormalisedScore")).ToString(GroupScoreFormat)
                td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdScore" : td.Text = txt : tr.Controls.Add(td)

                If CompType = "F5K" Then
                    txt = F5KCode.getParamValue(drv("Flight1"), "ZeroRnd") : If txt = "False" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdZeroRnd" : td.Text = txt : tr.Controls.Add(td)
                ElseIf CompType = "F5K2024" Then
                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight1"), "SFP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight1"), "SftyPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdSPlty" : td.Text = txt : tr.Controls.Add(td)
                End If

                tbl.Controls.Add(tr)

                '============================================================================================================
                ' this is the second scoring row for the pilot, if any

                If F5KMaxScores >= 2 Then
                    tr = New TableRow : tr.Attributes.Add("runat", "server")

                    td = New TableCell : td.CssClass = "tdFltNbr" : td.Text = "2" : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "FTM")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "FltTim")
                    txt = VBCode.formatTimesToMinSec(txt, TimingDecimals)
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "HVA")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "HgtVal")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "TPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "TimPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "HPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "HgtPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "NFP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "NbrFltsPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "LOP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "LdgOutPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdLOut" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then

                        txt = F5KCode.getParamValue(drv("Flight2"), "FltPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    ElseIf CompType = "F5K2024" Then

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "LLP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "LateLdgPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "OOF")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "OutOfFld")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "MOS")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "MotorReStart")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "HPN")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "HitPerson")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    End If

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "FPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "FltPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdPoints" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then
                        txt = F5KCode.getParamValue(drv("Flight2"), "ZeroRnd") : If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdZeroRnd" : td.Text = txt : tr.Controls.Add(td)
                    ElseIf CompType = "F5K2024" Then
                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight2"), "SFP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight2"), "SftyPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdSPlty" : td.Text = txt : tr.Controls.Add(td)
                    End If

                    tbl.Controls.Add(tr)

                End If

                '============================================================================================================
                ' this is the third scoring row for the pilot, if any

                If F5KMaxScores >= 3 Then
                    tr = New TableRow : tr.Attributes.Add("runat", "server")

                    td = New TableCell : td.CssClass = "tdFltNbr" : td.Text = "3" : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "FTM")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "FltTim")
                    txt = VBCode.formatTimesToMinSec(txt, TimingDecimals)
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "HVA")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "HgtVal")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "TPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "TimPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "HPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "HgtPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "NFP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "NbrFltsPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "LOP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "LdgOutPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdLOut" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then

                        txt = F5KCode.getParamValue(drv("Flight3"), "FltPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    ElseIf CompType = "F5K2024" Then

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "LLP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "LateLdgPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "OOF")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "OutOfFld")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "MOS")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "MotorReStart")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "HPN")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "HitPerson")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    End If

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "FPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "FltPts")
                    td = New TableCell : td.CssClass = "tdPoints" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then
                        txt = F5KCode.getParamValue(drv("Flight3"), "ZeroRnd") : If txt = "False" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdZeroRnd" : td.Text = txt : tr.Controls.Add(td)
                    ElseIf CompType = "F5K2024" Then
                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight3"), "SFP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight3"), "SftyPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdSPlty" : td.Text = txt : tr.Controls.Add(td)
                    End If

                    tbl.Controls.Add(tr)

                End If

                '============================================================================================================
                ' this is the fourth scoring row for the pilot, if any

                If F5KMaxScores >= 4 Then
                    tr = New TableRow : tr.Attributes.Add("runat", "server")

                    td = New TableCell : td.CssClass = "tdFltNbr" : td.Text = "4" : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "FTM")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "FltTim")
                    txt = VBCode.formatTimesToMinSec(txt, TimingDecimals)
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "HVA")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "HgtVal")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "TPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "TimPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdTime" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "HPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "HgtPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "NFP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "NbrFltsPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdHeight" : td.Text = txt : tr.Controls.Add(td)

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "LOP")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "LdgOutPlty")
                    If txt = "0" Then txt = ""
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdLOut" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then

                        txt = F5KCode.getParamValue(drv("Flight4"), "FltPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    ElseIf CompType = "F5K2024" Then

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "LLP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "LateLdgPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "OOF")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "OutOfFld")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "MOS")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "MotorReStart")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "HPN")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "HitPerson")
                        If txt = "True" Then txt = "Yes" Else txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdFPlty" : td.Text = txt : tr.Controls.Add(td)

                    End If

                    If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "FPT")
                    If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "FltPts")
                    td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdPoints" : td.Text = txt : tr.Controls.Add(td)

                    If CompType = "F5K" Then
                        txt = F5KCode.getParamValue(drv("Flight4"), "ZeroRnd") : If txt = "False" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.RowSpan = F5KMaxScores : td.CssClass = "tdZeroRnd" : td.Text = txt : tr.Controls.Add(td)
                    ElseIf CompType = "F5K2024" Then
                        If UpdatedF5KString = True Then txt = F5KCode.getParamValue(drv("Flight4"), "SFP")
                        If UpdatedF5KString = False Then txt = F5KCode.getParamValue(drv("Flight4"), "SftyPlty")
                        If txt = "0" Then txt = ""
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.CssClass = "tdSPlty" : td.Text = txt : tr.Controls.Add(td)
                    End If

                    tbl.Controls.Add(tr)

                    If F5KMaxScores = 4 Then
                        tr = New TableRow : tr.Attributes.Add("runat", "server") : tr.Height = 1
                        td = New TableCell : td.Attributes.Add("runat", "server") : td.ColumnSpan = NbrCols : td.CssClass = "tdwithbottomborderblack" : td.Text = "" : tr.Controls.Add(td)
                        tbl.Controls.Add(tr)
                    End If
                End If

                divFlights.Controls.Add(tbl)

            Next

            Exit Sub

        End If

        '********************************************************************************************************************
        ' create table to control output
        Dim dtTaskAndGroupList As New DataTable
        NoOfTasks = dtTaskList.Rows.Count
        dtTaskAndGroupList = ShowScores.create_dtTaskAndGroupList(CompID, RoundNo, cn)

        '********************************************************************************************************************
        ' see if we need to show Scr4Rnd column
        Dim ShowScr4Rnd As Boolean = False
        For i As Integer = 0 To dtScores.Rows.Count - 1
            dr = dtScores.Rows(i)
            If dr("RoundNo") <> dr("OriginalRoundNo") Then
                ShowScr4Rnd = True
                Exit For
            End If
        Next

        '********************************************************************************************************************
        ' Start putting the data together here
        Dim TaskName As String = ""
        Dim TaskNo As Integer = 0

        CtrlCounter = 0

        ' add a blank panel to space the next line
        pnlNew = AddNewPanel(CtrlCounter, "10px")
        divFlights.Controls.Add(pnlNew)

        ' add a label that is the width of the Name column and showing the current round number
        pnlNew = AddNewPanel(CtrlCounter, "20px")
        txt = "Flight Scores for " & RoundsList_Flights.SelectedItem.Value.ToString
        lblNew = AddNewLabel(txt, "scores-TaskHeader", CtrlCounter, wName, 20)
        pnlNew.Controls.Add(lblNew)
        divFlights.Controls.Add(pnlNew)

        ' add a blank panel to space the next line
        pnlNew = AddNewPanel(CtrlCounter, "10px")
        divFlights.Controls.Add(pnlNew)

        For i = 0 To dtTaskList.Rows.Count - 1

            '***************************************************************************************
            ' get TaskNo
            TaskNo = CInt(dtTaskList.Rows(i)("TaskNo"))
            '***************************************************************************************
            ' output task name here, if necessary
            If NoOfTasks > 1 Or CompType = "F3K" Then

                ' add a blank panel to space the next line
                pnlNew = AddNewPanel(CtrlCounter, "10px")
                divFlights.Controls.Add(pnlNew)

                ' add a panel to hold the task description
                pnlNew = AddNewPanel(CtrlCounter, "15px")
                divFlights.Controls.Add(pnlNew)

                If NoOfTasks > 1 Then
                    Select Case CInt(dtTaskList.Rows(i)("TaskNo"))
                        Case 1 : TaskName = "DURATION"
                        Case 2 : TaskName = "DISTANCE"
                        Case 3 : TaskName = "SPEED"
                    End Select
                End If
                If CompType = "F3K" Then ' this is F3K
                    wCols = 55
                    Dim key(1) As Object
                    key(0) = CompID
                    key(1) = RoundNo
                    TaskName = dtF3KData.Rows.Find(key)("F3KTaskDescription")
                End If

                lblNew = AddNewLabel(TaskName, "scores-TaskHeader", CtrlCounter, wTaskHeader, 15)
                pnlNew.Controls.Add(lblNew)


            End If

            '***************************************************************************************
            ' output flight score column headings here according to the task

            pnlNew = AddNewPanel(CtrlCounter, "10px")
            divFlights.Controls.Add(pnlNew)

            '' add a panel to hold the flight score column headings according to the task
            'pnlNew = AddNewPanel(CtrlCounter, "20px")
            'divFlights.Controls.Add(pnlNew)

            '' add a label that is the width of the Name column and showing the current round number
            'txt = RoundsList_Flights.SelectedItem.Value
            'lblNew = AddNewLabel(txt, "scores-TaskHeader", CtrlCounter, wName, 20)
            'pnlNew.Controls.Add(lblNew)
            'divFlights.Controls.Add(pnlNew)

            pnlNew = AddNewPanel(CtrlCounter, "20px")
            lblNew = AddNewLabel("", "scores-TaskHeader", CtrlCounter, wName, 20)
            pnlNew.Controls.Add(lblNew)

            lblNew = AddNewLabel("Ctry", "scores-Country", CtrlCounter, wCtry, 20)
            pnlNew.Controls.Add(lblNew)

            If TaskNo = 2 Or TaskNo = 4 Then
                lblNew = AddNewLabel("Laps", "scores-FlightScoreHeader", CtrlCounter, wCols - 30, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            If TaskNo = 4 Then
                lblNew = AddNewLabel("Laps<br />Penalty", "scores-FlightScoreHeader", CtrlCounter, wCols - 5, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 1 **
            If TaskNo <> 2 And TaskNo <> 5 Then
                lblNew = AddNewLabel("Time", "scores-FlightScoreHeader", CtrlCounter, wCols - 10, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' **2 **
            If TaskNo = 5 Then
                For F3KFlight As Integer = 1 To 7
                    lblNew = AddNewLabel("Time" & F3KFlight.ToString, "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                    pnlNew.Controls.Add(lblNew)
                Next
            End If

            ' ** 3 **
            If (TaskNo = 1 And GroupScoreOption = 2 And FltDednIdx = 0) Then ' this is ALES without thelaunch height taken into account
                lblNew = AddNewLabel("Time<br />Score", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 4 **
            If (TaskNo = 1 And GroupScoreOption = 2 And FltDednIdx = 3) Then ' this is ALES with the launch height taken into account
                lblNew = AddNewLabel("Height", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel("Height<br />Penalty", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel("Normalised<br />Time - HtPlty", "scores-FlightScoreHeader", CtrlCounter, wCols + 30, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 5 **
            If (TaskNo = 1 Or TaskNo = 4) And CompHasLandings Then
                lblNew = AddNewLabel("Landing<br />Score", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 6 **
            If TaskNo = 1 And (CompType = "F5J" Or CompType = "F3G") Then
                lblNew = AddNewLabel("Height", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel("Height<br />Penalty", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            If CompType = "F5J" Then
                lblNew = AddNewLabel(">75m", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)

                If F5JMotorReStartOption > 0 Then
                    lblNew = AddNewLabel("Motor<br />ReStart", "scores-FlightScoreHeader", CtrlCounter, wCols + 15, 20)
                    pnlNew.Controls.Add(lblNew)
                End If
            End If

            ' ** 7 **
            If CompType = "Elec" Then
                lblNew = AddNewLabel("Motor<br />Run", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 8 **
            If CompType = "F3J" Then
                lblNew = AddNewLabel("Late<br />Landing", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel(">75m", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 9 **
            If CompType = "F5B" Then
                lblNew = AddNewLabel("Motor<br />Penalty", "scores-FlightScoreHeader", CtrlCounter, wCols + 5, 20)
                pnlNew.Controls.Add(lblNew)

                lblNew = AddNewLabel("WattMin<br />Penalty", "scores-FlightScoreHeader", CtrlCounter, wCols + 20, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 10 **
            If Not (TaskNo = 1 And GroupScoreOption = 2 And (FltDednIdx = 0 Or FltDednIdx = 3)) Then ' do not output this heading for ALES (with no height factor in scoring)
                lblNew = AddNewLabel("Points", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            ' ** 11 **
            lblNew = AddNewLabel("Flight<br />Score", "scores-FlightScoreHeader", CtrlCounter, wCols, 20)
            pnlNew.Controls.Add(lblNew)

            ' ** 12 **
            lblNew = AddNewLabel("Penalty", "scores-Right", CtrlCounter, 70, 20)
            pnlNew.Controls.Add(lblNew)

            ' ** 13 **
            If ShowScr4Rnd = True Then
                lblNew = AddNewLabel("Scr4Rnd", "scores-Right", CtrlCounter, 70, 20)
                pnlNew.Controls.Add(lblNew)
            End If

            '***************************************************************************************
            ' output group number here, once only for each group

            Dim dvTaskAndGroupList As New DataView(dtTaskAndGroupList)
            dvTaskAndGroupList.RowFilter = "TaskNo=" & dtTaskList.Rows(i)("TaskNo").ToString

            For j = 0 To dvTaskAndGroupList.Count - 1
                Dim GroupNo As Integer = dvTaskAndGroupList.Item(j)("GroupNo")
                Dim ReFlightNo As Integer = dvTaskAndGroupList.Item(j)("ReFlightNo")

                pnlNew = AddNewPanel(CtrlCounter, "10px")
                divFlights.Controls.Add(pnlNew)

                pnlNew = AddNewPanel(CtrlCounter, "20px")
                divFlights.Controls.Add(pnlNew)

                lblNew = AddNewLabel("Group " & GroupNo & "   ReFlight " & ReFlightNo, "scores-TaskHeader", CtrlCounter, wTaskHeader, 20)
                pnlNew.Controls.Add(lblNew)

                pnlNew = AddNewPanel(CtrlCounter, "5px")
                divFlights.Controls.Add(pnlNew)


                '***************************************************************************************
                ' output flight scores for each group here
                Dim dvScoringdata As New DataView(dtScores)
                Dim drv As DataRowView
                dvScoringdata.RowFilter = "TaskNo=" & TaskNo & " And RoundNo=" & RoundNo & " And GroupNo=" & GroupNo & " And ReFlightNo=" & ReFlightNo
                If TaskNo = 3 Then
                    For x As Integer = 0 To dvScoringdata.Count - 1
                        If CDbl(dvScoringdata.Item(x)("RawScore")) < 0.00001 Then
                            dvScoringdata.Item(x)("SpeedSort") = 1000000
                        Else
                            dvScoringdata.Item(x)("SpeedSort") = CDbl(dvScoringdata.Item(x)("RawScore"))
                        End If
                    Next
                    dvScoringdata.Sort = "SpeedSort ASC"
                Else
                    dvScoringdata.Sort = "RawScore DESC"
                End If

                Dim strFormat As String = ""
                Select Case GroupScoreDecimals
                    Case 0 : strFormat = "#0"
                    Case 1 : strFormat = "#0.0"
                    Case 2 : strFormat = "#0.00"
                    Case 3 : strFormat = "#0.000"
                End Select

                Dim TimingFormat As String = "#0"
                If TaskNo = 3 Then TimingDecimals = SpeedDecimals
                Select Case TimingDecimals
                    Case 0 : TimingFormat = "#0"
                    Case 1 : TimingFormat = "#0.0"
                    Case 2 : TimingFormat = "#0.00"
                    Case 3 : TimingFormat = "#0.000"
                End Select

                Dim RawScoreFormat As String = ""
                Select Case TimingDecimals
                    Case 0 : RawScoreFormat = "#0.0" ' always show at lease one decimal
                    Case 1 : RawScoreFormat = "#0.0"
                    Case 2 : RawScoreFormat = "#0.00"
                    Case 3 : RawScoreFormat = "#0.000"
                End Select


                For k As Integer = 0 To dvScoringdata.Count - 1

                    drv = dvScoringdata.Item(k)

                    Dim lblHeight As Integer = 17

                    pnlNew = AddNewPanel(CtrlCounter, "17px")
                    divFlights.Controls.Add(pnlNew)

                    lblNew = AddNewLabel(drv("PilotName"), "scores-Data-Left", CtrlCounter, wName, lblHeight)
                    pnlNew.Controls.Add(lblNew)

                    If drv("Country") = "" Then
                        txt = "-"
                    Else
                        txt = drv("Country")
                    End If
                    lblNew = AddNewLabel(txt, "scores-Data-Center", CtrlCounter, wCtry, lblHeight)
                    pnlNew.Controls.Add(lblNew)

                    If TaskNo = 2 Or TaskNo = 4 Then ' laps
                        lblNew = AddNewLabel(CInt(drv("Data1")).ToString("#0"), "scores-Data-Right", CtrlCounter, wCols - 30, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    If TaskNo = 4 Then ' LapsPenalty
                        lblNew = AddNewLabel(CInt(drv("Data3")).ToString("#0"), "scores-Data-Right", CtrlCounter, wCols - 5, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 1 **
                    If TaskNo <> 2 And TaskNo <> 5 Then ' time
                        Dim DecPlaces As Integer = TimingDecimals ' for tasks 1 and 4
                        If TaskNo = 3 Then DecPlaces = SpeedDecimals
                        txt = VBCode.formatTimesToMinSec(CDbl(drv("Data2")), DecPlaces)
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols - 10, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If
                    ' ** 2 **
                    If TaskNo = 5 Then
                        For F3KFlight As Integer = 1 To 5 ' F3K times
                            txt = VBCode.formatTimesToMinSec(CDbl(drv("Data" & F3KFlight)), TimingDecimals)
                            lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                            pnlNew.Controls.Add(lblNew)
                        Next

                        txt = VBCode.formatTimesToMinSec(CDbl(drv("Data7")), TimingDecimals)
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)

                        txt = VBCode.formatTimesToMinSec(CDbl(drv("Data6")), TimingDecimals)
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' **3 **
                    If (TaskNo = 1 And GroupScoreOption = 2 And FltDednIdx = 0) Then ' this is ALES with no launch height taken into account
                        txt = (CDbl(drv("NormalisedScore")) - CDbl(drv("LandingPoints"))).ToString("0.0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols + 10, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 4 **
                    If (TaskNo = 1 And GroupScoreOption = 2 And FltDednIdx = 3) Then ' this is ALES with the launch height taken into account
                        txt = CInt(drv("Data6")).ToString("#0") ' launch height
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, 20)
                        pnlNew.Controls.Add(lblNew)

                        txt = CDbl(VBCode.CalcHeightPenalty(drv("Data6"), F5JRefHeight, F5JPenaltyUpTo, F5JPenaltyOver)).ToString("#0.0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, 20)
                        pnlNew.Controls.Add(lblNew)

                        txt = (CDbl(drv("NormalisedScore")) - CDbl(drv("LandingPoints"))).ToString("0.0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols + 30, 20)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 5 **
                    If (TaskNo = 1 Or TaskNo = 4) And CompHasLandings Then ' landing points
                        txt = CInt(drv("LandingPoints")).ToString("#0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 6 **
                    If TaskNo = 1 And (CompType = "F5J" Or CompType = "F3G") Then ' height, height penalty, lndg>75m, F5JMotorReStarted(?)
                        txt = CDbl(drv("Data6")).ToString("#0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)

                        txt = CDbl(VBCode.CalcHeightPenalty(drv("Data6"), F5JRefHeight, F5JPenaltyUpTo, F5JPenaltyOver)).ToString("#0.0")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    If CompType = "F5J" Then
                        txt = IIf(CBool(drv("LandingOver75m")) = True, "Yes", "-")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)

                        If F5JMotorReStartOption > 0 Then
                            If IsDBNull(drv("F5JMotorReStarted")) Then drv("F5JMotorReStarted") = False
                            txt = IIf(CBool(drv("F5JMotorReStarted")) = True, "Yes", "-")
                            lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols + 15, lblHeight)
                            pnlNew.Controls.Add(lblNew)
                        End If
                    End If

                    ' ** 7 **
                    If CompType = "Elec" Then ' motor run deduction
                        lblNew = AddNewLabel(CDbl(drv("Data6")).ToString(TimingFormat), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 8 **
                    If CompType = "F3J" Then
                        ' late landing
                        txt = IIf(CInt(drv("Data6")) > 0, CDbl(drv("Data6")).ToString("#0"), "-")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                        ' landing over 75m
                        txt = IIf(CBool(drv("LandingOver75m")) = True, "Yes", "-")
                        lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 9 **
                    If CompType = "F5B" Then
                        lblNew = AddNewLabel(CDbl(drv("F5BMotorRunPenalty")).ToString("#0"), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        pnlNew.Controls.Add(lblNew)

                        lblNew = AddNewLabel(CDbl(drv("F5BWattMinPenalty")).ToString("#0"), "scores-Data-Right", CtrlCounter, wCols + 20, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 10 **
                    If Not (TaskNo = 1 And GroupScoreOption = 2 And (FltDednIdx = 0 Or FltDednIdx = 3)) Then ' do not output this heading for ALES (with no height factor in scoring)
                        If CompType = "F3K" Then
                            lblNew = AddNewLabel(CDbl(drv("RawScore")).ToString(RawScoreFormat), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        ElseIf TaskNo = 3 Then                         ' Speed
                            lblNew = AddNewLabel(CDbl(drv("RawScore")).ToString(RawScoreFormat), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                        Else
                            If Not (TaskNo = 1 And GroupScoreOption = 2 And FltDednIdx = 0) Then ' this is ALES with no launch height taken into account
                                lblNew = AddNewLabel(CDbl(drv("RawScore")).ToString(RawScoreFormat), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                            End If
                        End If
                        pnlNew.Controls.Add(lblNew)
                    End If

                    ' ** 11 **
                    lblNew = AddNewLabel(CDbl(drv("NormalisedScore")).ToString(strFormat), "scores-Data-Right", CtrlCounter, wCols, lblHeight)
                    pnlNew.Controls.Add(lblNew)

                    ' ** 12 **
                    If CInt(drv("Penalty")) = 0 Then
                        txt = ""
                    Else txt = CInt(drv("Penalty")).ToString("#0")
                    End If
                    lblNew = AddNewLabel(txt, "scores-Data-Right", CtrlCounter, 70, lblHeight)
                    pnlNew.Controls.Add(lblNew)

                    ' ** 13 **
                    If ShowScr4Rnd = True Then
                        If drv("RoundNo") <> drv("OriginalRoundNo") Then
                            txt = CInt(drv("OriginalRoundNo")).ToString("#0")
                        Else
                            txt = ""
                        End If
                        lblNew = AddNewLabel(txt, "scores-Data-Center", CtrlCounter, 70, lblHeight)
                        pnlNew.Controls.Add(lblNew)
                    End If

                Next

            Next

        Next

        ' add a blank line right at the end for readability
        pnlNew = AddNewPanel(CtrlCounter, "20px")
        divFlights.Controls.Add(pnlNew)

    End Sub



    Protected Sub Update_RoundsList(ByVal CompID As String, ByVal cn As OleDbConnection, ByVal Caller As String)

        ' populate RoundsList dropdown box with all rounds having scores
        Dim sql As String = ""
<<<<<<< HEAD
        Select Case True
            Case Caller = "Results", Caller = "Teams", Caller = "Other"
=======
        Select Case Caller
            Case "Results" ', "Teams"
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                sql = "Select DISTINCT RoundNo FROM ScoringData WHERE NormalisedScore>0 And CompID ='" & CompID & "'"
            Case Caller = "Flights"
                sql = "Select DISTINCT RoundNo FROM ScoringData WHERE NormalisedScore>0  And Updated='True' And CompID ='" & CompID & "'"
        End Select

        Dim cmd As New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtRounds As New DataTable
        da.Fill(dtRounds)

        Dim dvRounds As New DataView(dtRounds)
        dvRounds.Sort = "RoundNo ASC"

        Select Case Caller
            Case "Results"
                'RoundsList_Results.Items.Clear()
                If dtRounds.Rows.Count = 0 Then
                    RoundsList_Results.Items.Add("No results posted")
                    Exit Sub
                Else
                    RoundsList_Results.Items.Add("Select a Round")
                End If
                For i As Integer = 0 To dvRounds.Count - 1
                    RoundsList_Results.Items.Add("Round " & dvRounds.Item(i)("RoundNo").ToString)
                Next

            Case "Flights"
                'RoundsList_Flights.Items.Clear()
                If dtRounds.Rows.Count = 0 Then
                    RoundsList_Flights.Items.Add("No scores posted")
                    Exit Sub
                Else
                    RoundsList_Flights.Items.Add("Select a Round")
                End If
                For i As Integer = 0 To dtRounds.Rows.Count - 1
                    RoundsList_Flights.Items.Add("Round " & dvRounds.Item(i)("RoundNo").ToString)
                Next

<<<<<<< HEAD
            Case "Teams"
                'RoundsList_Teams.Items.Clear()
                If dtRounds.Rows.Count = 0 Then
                    RoundsList_Teams.Items.Add("No results posted")
                    Exit Sub
                Else
                    RoundsList_Teams.Items.Add("Select a Round")
                End If
                For i As Integer = 0 To dvRounds.Count - 1
                    RoundsList_Teams.Items.Add("Round " & dvRounds.Item(i)("RoundNo").ToString)
                Next
=======
                'Case "Teams"
                '    RoundsList_TeamResults.Items.Clear()
                '    If dtRounds.Rows.Count = 0 Then
                '        RoundsList_Results.Items.Add("No results posted")
                '        Exit Sub
                '    Else
                '        RoundsList_TeamResults.Items.Add("Select a Round")
                '    End If
                '    For i As Integer = 0 To dvRounds.Count - 1
                '        RoundsList_TeamResults.Items.Add("Round " & dvRounds.Item(i)("RoundNo").ToString)
                '    Next
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

        End Select

    End Sub



    Public Shared Function AddNewPanel(ByRef CtrlCounter As Integer, ByVal height As String) As Panel

        Dim pnlNew As New Panel

        pnlNew.ID = "Ctrl" & CtrlCounter.ToString : CtrlCounter += 1
        pnlNew.Style.Item("height") = height
        pnlNew.Style.Item("left") = 0
        pnlNew.Attributes.Add("runat", "server")
        Return pnlNew

    End Function

    Public Shared Function AddNewLabel(ByVal text As String,
                                       ByVal strCssClass As String,
                                       ByRef CtrlCounter As Integer,
                                       ByVal intWidth As Integer,
                                       ByVal intHeight As Integer) As Label
        Dim lblNew As New Label
        lblNew.ID = "Ctrl" & CtrlCounter.ToString : CtrlCounter += 1
        lblNew.Attributes.Add("runat", "server")
        lblNew.CssClass = strCssClass
        lblNew.Text = text
        lblNew.Width = intWidth
        lblNew.Style.Item("height") = intHeight.ToString & "px"
        Return lblNew
    End Function


    Public Shared Sub UpdateLabelStyle(ByRef lbl As Label, ByVal left As String, ByVal top As String)
        lbl.Style.Add("position", "absolute")
        lbl.Style.Add("left", left)
        lbl.Style.Add("top", top)
    End Sub


    Public Shared Function getLeftAsInteger(ByVal lbl As Label) As Integer
        Dim txt As String = lbl.Style.Item("left")
        If txt.Contains("px") Then
            txt = txt.Substring(0, txt.Length - 2)
        End If
        Return CInt(txt)
    End Function

    Public Shared Function getwidthAsInteger(ByVal lbl As Label) As Integer
        Dim txt As String = lbl.Width.Value
        If txt.Contains("px") Then
            txt = txt.Substring(0, txt.Length - 2)
        End If
        Return CInt(txt)
    End Function

    Protected Sub DownloadResultsTAB()

        Dim sql As String
        Dim cmd As OleDbCommand
        Dim da As OleDbDataAdapter
        Dim dtTasks As New DataTable
        Dim arrTasks As New ArrayList
        Dim dr As DataRow
        Dim ToRound As Integer = 0
        Dim NumberOfTasks As Integer = 0
        Dim CompID As String = lblCompID.Text

        '******************************************************************************************************************
        ' get connection to database object
        Dim cn As OleDbConnection = Application("cn")

        '****************************************************************************************************
        ' get the data from the CompData table
        Dim dtCompData As DataTable = ShowScores.create_dtCompData(CompID, cn)

        ' Use dtCompData to set these variables
        dr = dtCompData.Rows(0)
        Dim DropScoreOption As Integer = CInt(dr("DropScoreOption"))
        Dim Drop1AtRound As Integer = CInt(dr("Drop1At"))
        Dim Drop2AtRound As Integer = CInt(dr("Drop2At"))
        Dim Drop3AtRound As Integer = CInt(dr("Drop3At"))
        Dim Drop4AtRound As Integer = CInt(dr("Drop4At"))
        Dim Drop5AtRound As Integer = CInt(dr("Drop5At"))
        Dim GroupScoreDecimals As Integer = CInt(dr("GroupScoreDecimals"))
        Dim CompType As String = dr("CompType").ToString
        ToRound = RoundsList_Results.SelectedValue.Substring(6) ' the part of the string after the text "Round "

        'Build the TAB (tab separated value) file data as a tab separated string.
        Dim TAB As String = String.Empty

        TAB &= "Name: " + dr("CompName").ToString + vbCrLf
        TAB &= "Venue: " & dr("CompVenue").ToString + vbCrLf
        TAB &= "Date: " & CDate(dr("CompDate")).ToString("MMM dd, yyyy") + vbCrLf + vbCrLf
        TAB &= "Individual Results to Round " & ToRound.ToString & vbCrLf

        ' get NumberOfTasks and create an array of tasks if more than one task
        sql = "SELECT DISTINCT CompType FROM ScoringData WHERE CompID='" & CompID & "'"
        cmd = New OleDbCommand(sql, cn)
        da = New OleDbDataAdapter(cmd)
        da.Fill(dtTasks)

        NumberOfTasks = dtTasks.Rows.Count

        For i As Integer = 0 To dtTasks.Rows.Count - 1
            dr = dtTasks.Rows(i)
            Select Case dr("CompType")
                Case "Dist" : arrTasks.Add("2")
                Case "Spd" : arrTasks.Add("3")
                Case "F5B" : arrTasks.Add("4")
                Case "F3K" : arrTasks.Add("5")
                Case "F5K" : arrTasks.Add("6")
                Case Else : arrTasks.Add("1")
            End Select
        Next
        arrTasks.Sort()

        If arrTasks.Contains("5") Then ' if true, comp is an F3K comp
            sql = "select RoundNo, F3KTaskAbbreviation FROM F3KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            da = New OleDbDataAdapter(cmd)
            da.Fill(dtF3KTaskByRound)
            VBCode.CreatePrimaryIndexForTable(dtF3KTaskByRound, 1)
        End If

        If arrTasks.Contains("6") Then ' if true, comp is an F5K comp
            sql = "select RoundNo, F5KTaskAbbreviation, F5KRefHeight FROM F5KData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            da = New OleDbDataAdapter(cmd)
            da.Fill(dtF5KTaskByRound)
            VBCode.CreatePrimaryIndexForTable(dtF5KTaskByRound, 1)
        End If

        '****************************************************************************************************
        ' get the data for progressive scores (Overall Results) taking into account any discard scores.
        Dim dvCompResults As DataView = ShowScores.RunRptOverallResults(CompID, cn, arrTasks, NumberOfTasks, DropScoreOption,
                                                                        Drop1AtRound, Drop2AtRound, Drop3AtRound, Drop4AtRound, Drop5AtRound,
                                                                        ToRound,
                                                                        GroupScoreDecimals, "byPilot")
        '****************************************************************************************************
        ' create standard headers

        TAB &= "#" & vbTab
        TAB &= "Name" & vbTab
        TAB &= "FAI_ID" & vbTab
        TAB &= "Ctry" & vbTab
        TAB &= "Score" & vbTab
        TAB &= "Pcnt" & vbTab
        TAB &= "RawScore" & vbTab

        ' create Round headers and Penalty header
        For i As Integer = 1 To ToRound
            For j = 1 To NumberOfTasks
                TAB &= "Rnd" & i.ToString & vbTab
            Next
        Next
        If arrTasks.Contains("6") = False Then
            TAB &= "Penalty" & vbCrLf
        Else
            TAB &= vbCrLf
        End If

        '****************************************************************************************************
        ' create task headers if more than one task
        If NumberOfTasks > 1 Or arrTasks.Contains("5") Or arrTasks.Contains("6") Then ' need a panel to hold task names or F3K/F5K task abbreviations

            ' space out to start of round headers
            TAB &= vbTab & vbTab & vbTab & vbTab & vbTab & vbTab

            If NumberOfTasks > 1 Then

                Dim arrTaskNames As New ArrayList
                For i As Integer = 0 To arrTasks.Count - 1
                    Select Case arrTasks(i)
                        Case 1 : arrTaskNames.Add("Dur")
                        Case 2 : arrTaskNames.Add("Dis")
                        Case 3 : arrTaskNames.Add("Spd")
                    End Select
                Next

                For i As Integer = 1 To ToRound
                    For j As Integer = 0 To NumberOfTasks - 1

                        If i = ToRound And j = (NumberOfTasks - 1) Then
                            TAB &= arrTaskNames(j).ToString & vbCrLf
                        Else
                            TAB &= arrTaskNames(j).ToString & vbTab
                        End If
                    Next
                Next

            ElseIf arrTasks.Contains("5") Then

                Dim F3KTask As String

                For i As Integer = 1 To ToRound
                    F3KTask = dtF3KTaskByRound.Rows.Find(i)("F3KTaskAbbreviation").ToString
                    If i = ToRound Then
                        TAB &= F3KTask & vbCrLf
                    Else
                        TAB &= F3KTask & vbTab
                    End If
                Next

            ElseIf arrTasks.Contains("6") Then

                Dim F5KTask As String

                For i As Integer = 1 To ToRound
                    F5KTask = dtF5KTaskByRound.Rows.Find(i)("F5KTaskAbbreviation").ToString
                    If i = ToRound Then
                        TAB &= F5KTask & vbCrLf
                    Else
                        TAB &= F5KTask & vbTab
                    End If
                Next

            End If

        End If
        '****************************************************************************************************

        Dim strFormat As String = ""
        Select Case GroupScoreDecimals
            Case 0 : strFormat = "#0"
            Case 1 : strFormat = "#0.0"
            Case 2 : strFormat = "#0.00"
            Case 3 : strFormat = "#0.000"
        End Select

        '****************************************************************************************************************
        ' output data

        Dim drv As DataRowView

        For i As Integer = 0 To dvCompResults.Count - 1

            drv = dvCompResults.Item(i)

            TAB &= drv("Rank") & vbTab
            TAB &= drv("PilotName") & vbTab

            Select Case True
                Case IsDBNull(drv("FAI_ID")) : TAB &= "-" & vbTab
                Case drv("FAI_ID") = "" : TAB &= "-" & vbTab
                Case Else : TAB &= drv("FAI_ID") & vbTab
            End Select

            Select Case True
                Case IsDBNull(drv("Country")) : TAB &= "-" & vbTab
                Case drv("Country") = "" : TAB &= "-" & vbTab
                Case Else : TAB &= drv("Country") & vbTab
            End Select

            TAB &= CDbl(drv("Score")).ToString(strFormat) & vbTab
            TAB &= CDbl(drv("Percent")).ToString("#0.00") & vbTab
            TAB &= CDbl(drv("RawScore")).ToString(strFormat) & vbTab

            Dim colName As String
            Dim TaskNo As Integer
            Dim PltScore As Double

            For j = 1 To ToRound

                For k = 0 To NumberOfTasks - 1
                    TaskNo = arrTasks(k)
                    colName = (j * 10 + arrTasks(k)).ToString
                    PltScore = CDbl(drv(colName))

                    If PltScore < 0 Then
                        If PltScore = -0.0001 Then
                            PltScore = 0
                        Else
                            PltScore = PltScore * -1
                        End If

                        txt = "*" & PltScore.ToString(strFormat)

                    ElseIf PltScore = 0.00001 Then
                        txt = "MtrReStart 0"

                    Else
                        txt = PltScore.ToString(strFormat)
                    End If
                    TAB &= txt & vbTab

                Next

            Next

            If arrTasks.Contains("6") = False Then
                If CInt(drv("Penalty")) = 0 Then
                    txt = ""
                Else
                    txt = CDbl(drv("Penalty")).ToString("#0")
                End If
                TAB &= txt & vbCrLf
            Else
                TAB &= vbCrLf
            End If

        Next

        '***************************************************************************************
        'Download the TAB file.
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=Results.tab")
        Response.Charset = ""
        Response.ContentType = "application/text"
        Response.Output.Write(TAB)
        Response.Flush()
        Response.End()

    End Sub

<<<<<<< HEAD
=======
    'Protected Sub DownloadTeamResultsTAB()

    'End Sub

    Protected Sub RoundsList_Flights_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As OleDbConnection = Application("cn")

        ShowHideControls()

        divFlights.Controls.Clear()
        divFlights.Visible = False

        If RoundsList_Flights.SelectedIndex = 0 Then
            RoundsList_Flights.Style("Left") = "115px"
            Exit Sub
        Else
            RoundsList_Flights.Style("Left") = "0px"
            showFlightScores(cn)
        End If


    End Sub
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

    Protected Sub DownloadFlightsTAB()

        ' connect to database
        Dim cn As OleDbConnection = Application("cn")
        Dim CompID As String = CompList1.SelectedValue.ToString
        Dim RndNbrCounter As Integer = 0
        Dim MaxRoundNo As String = getMaxRoundNo(CompID, cn).ToString

        '********************************************************************************************************************
        ' FLIGHT SCORES SECTION
        ''********************************************************************************************************************
        ' Create dtCompData and set the variables
        Dim dtCompData As DataTable = ShowScores.create_dtCompData(CompID, cn)
        Dim CompType As String = dtCompData.Rows(0)("CompType").ToString
        Dim CompHasLandings As Boolean = CBool(dtCompData.Rows(0)("CompHasLandings"))
        Dim DurationDecimals As Integer = CInt(dtCompData.Rows(0)("TimingDecimalPlaces"))
        Dim GroupScoreDecimals As Integer = CInt(dtCompData.Rows(0)("GroupScoreDecimals"))
        Dim SpeedDecimals As Integer = CInt(dtCompData.Rows(0)("SpeedDecimals"))
        Dim durPointsPerSecond As Double = CDbl(dtCompData.Rows(0)("durPointsPerSecond"))
        Dim F5JRefHeight As Integer = CInt(dtCompData.Rows(0)("F5JRefHeight"))
        Dim F5JPenaltyUpTo As Double = CDbl(dtCompData.Rows(0)("F5JPenaltyUpTo"))
        Dim F5JPenaltyOver As Double = CDbl(dtCompData.Rows(0)("F5JPenaltyOver"))
        Dim F5BPointsPerLap As Integer = CInt(dtCompData.Rows(0)("F5BPointsPerLap"))
        Dim durNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("durNoOfTimekeepers"))
        Dim spdNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("spdNoOfTimekeepers"))
        Dim f5bNoOfTimekeepers As Integer = CInt(dtCompData.Rows(0)("f5bNoOfTimekeepers"))

        ''********************************************************************************************************************
        ' get ScoringData
        Dim dtScores As DataTable = ShowScores.create_dtFlightScores(cn, CompID, MaxRoundNo, -1, -1, -1, -1, dtCompData)

        ' get data for F3K
        Dim dtF3KData As DataTable = Nothing
        Dim dtF5KData As DataTable = Nothing

        Dim dtarrTasks As New DataTable
        Dim NoOfTasks As Integer
        Dim arrTaskNos As New ArrayList
        Dim dtLandingData As New DataTable
        Dim dtTargetTimeByRound As New DataTable
        Dim dtTaskAndGroupList As New DataTable

        Dim F5JMotorReStartOption As Integer = VBCode.getF5JMotorRestartOption(CompID)

        Select Case CompType
            Case "F3K"
                dtF3KData = ShowScores.create_dtF3KData(CompID, cn)
                ShowScores.UpdateF3KRawScoresForRound(CompID, cn, dtScores, -1)
            Case "F5K"
                dtF5KData = ShowScores.create_dtF5KData(CompID, cn)
                dtScores = ShowScores.UpdateF5KScoresForDownload(dtScores)
            Case Else
                dtarrTasks = ShowScores.create_dtTaskList(CompID, -1, cn)
                NoOfTasks = dtarrTasks.Rows.Count
                dtTaskAndGroupList = ShowScores.create_dtTaskAndGroupList(CompID, -1, cn)

                ShowScores.populate_ArrTaskNos(dtarrTasks, arrTaskNos)
                If (arrTaskNos.Contains(1) Or arrTaskNos.Contains(4)) And CompHasLandings = True Then
                    dtLandingData = ShowScores.create_dtLandingData(CompID, cn)
                End If
                dtTargetTimeByRound = ShowScores.create_dtTargetTimeByRound(CompID, cn)

                ShowScores.update_dtScores_WithFlightPoints(CompID, CompType, dtCompData, dtScores, dtTargetTimeByRound, dtLandingData,
                                                                 durNoOfTimekeepers, spdNoOfTimekeepers, f5bNoOfTimekeepers, F5BPointsPerLap,
                                                                 durPointsPerSecond, GroupScoreDecimals, CompHasLandings,
                                                                 F5JRefHeight, F5JPenaltyUpTo, F5JPenaltyOver, DurationDecimals, SpeedDecimals)
        End Select

        '********************************************************************************************************************
        ' get table to control output of data
        Dim dtLoopControl As DataTable = ShowScores.create_dtLoopControl(CompID, cn, 1, MaxRoundNo) ' used to reset the row filter for each flight group

        '********************************************************************************************************************
        ' set variable used to see if we need to show Scr4Rnd column
        Dim ShowScr4Rnd As Boolean = False

        '********************************************************************************************************************
        ' Start putting the data together here
        Dim TaskName As String = ""
        Dim TaskNo As Integer = 0
        If CompType = "F5K" Then TaskNo = 6

        Dim TAB As String = String.Empty
        Dim key(1) As Object
        key(0) = CompID

        Dim dvScoringData As New DataView(dtScores)
        If TaskNo <> 6 Then dvScoringData.Sort = "RoundNo, TaskNo, GroupNo, ReFlightNo, RawScore DESC"
        If TaskNo = 6 Then dvScoringData.Sort = "RoundNo, TaskNo, GroupNo, ReFlightNo, Score DESC"
        Dim drv As DataRowView
        Dim CurrRound As Integer = 0
        Dim CurrGroup As Integer = 0
        Dim CurrReFlight As Integer = 0
        Dim CurrTaskNo As Integer = 0
        Dim CurrTask As String = ""
        Dim RoundChanged As Boolean = False

        Dim strFormat As String = ""
        Select Case GroupScoreDecimals
            Case 0 : strFormat = "#0"
            Case 1 : strFormat = "#0.0"
            Case 2 : strFormat = "#0.00"
            Case 3 : strFormat = "#0.000"
        End Select

        Dim TimingDecimals As Integer

        Dim TimingFormat As String = "#0"
        'If TaskNo = 3 Then TimingDecimals = SpeedDecimals
        If TaskNo = 3 Then
            Select Case SpeedDecimals
                Case 0 : TimingFormat = "#0"
                Case 1 : TimingFormat = "#0.0"
                Case 2 : TimingFormat = "#0.00"
                Case 3 : TimingFormat = "#0.000"
            End Select
        Else
            Select Case DurationDecimals
                Case 0 : TimingFormat = "#0"
                Case 1 : TimingFormat = "#0.0"
                Case 2 : TimingFormat = "#0.00"
                Case 3 : TimingFormat = "#0.000"
            End Select
        End If

        Dim RawScoreFormat As String = ""
        If TaskNo = 3 Then
            Select Case SpeedDecimals
                Case 0 : RawScoreFormat = "#0.0" ' always show at least one decimal for raw score
                Case 1 : RawScoreFormat = "#0.0"
                Case 2 : RawScoreFormat = "#0.00"
                Case 3 : RawScoreFormat = "#0.000"
            End Select
        Else
            Select Case DurationDecimals
                Case 0 : RawScoreFormat = "#0.0" ' always show at least one decimal for raw score
                Case 1 : RawScoreFormat = "#0.0"
                Case 2 : RawScoreFormat = "#0.00"
                Case 3 : RawScoreFormat = "#0.000"
            End Select
        End If

        '************************************************************************************************
        ' output the data *******************************************************************************
        TAB += "Name: " + dtCompData.Rows(0)("CompName").ToString + vbCrLf
        TAB += "Venue: " & dtCompData.Rows(0)("CompVenue").ToString + vbCrLf
        TAB += "Date: " & CDate(dtCompData.Rows(0)("CompDate")).ToString("MMM dd, yyyy") + vbCrLf
        Dim dr As DataRow

        For i As Integer = 0 To dtLoopControl.Rows.Count - 1

            dr = dtLoopControl.Rows(i)

            dvScoringData.RowFilter = "RoundNo=" & dr("RoundNo") & " and TaskNo=" & dr("TaskNo") & " and GroupNo=" & dr("GroupNo") & " and ReFlightNo=" & dr("ReFlightNo")
            TaskNo = CInt(dr("TaskNo"))

            ' see if we show the heading Scr4Rnd
            Dim dvScr4Rnd As New DataView(dtScores)
            dvScr4Rnd.RowFilter = "RoundNo=" & dr("RoundNo")
            ShowScr4Rnd = False
            For k As Integer = 0 To dvScr4Rnd.Count - 1
                drv = dvScr4Rnd.Item(k)
                If drv("RoundNo") <> drv("OriginalRoundNo") Then
                    ShowScr4Rnd = True
                    Exit For
                End If
            Next

            If CurrRound <> CInt(dr("RoundNo")) Then
                RoundChanged = True
                CurrRound = CInt(dr("RoundNo"))
                CurrTaskNo = CInt(dr("TaskNo"))
                CurrReFlight = CInt(dr("ReFlightNo"))
                ' write the round no and TaskName (if appropriate) after leaving a blank row
                TAB += vbCrLf
                txt = "ROUND " + dr("RoundNo").ToString

                If NoOfTasks > 1 Then
                    ' append task name to round number on same row
                    Select Case TaskNo
                        Case 1 : TaskName = "DURATION"
                        Case 2 : TaskName = "DISTANCE"
                        Case 3 : TaskName = "SPEED"
                    End Select
                    txt += "    " & TaskName
                End If
                TAB += txt + vbCrLf

                ' if F3K, write the F3K task
                If CompType = "F3K" Then
                    key(1) = dr("RoundNo")
                    TaskName = dtF3KData.Rows.Find(key)("F3KTaskDescription")
                    If CurrTask <> TaskName Then
                        CurrTask = TaskName
                        TAB += TaskName & vbCrLf
                    End If
                    TAB = DownloadFlights_HeaderRow(CompID, TAB, TaskNo, CompHasLandings, CompType, ShowScr4Rnd)
                End If

                ' if F5K, write the F5K task
                If CompType = "F5K" Then
                    key(1) = dr("RoundNo")
                    TaskName = dtF5KData.Rows.Find(key)("F5KTaskDescription")
                    If CurrTask <> TaskName Then
                        CurrTask = TaskName
                        TAB += TaskName & vbCrLf
                    End If
                    TAB = DownloadFlights_HeaderRow(CompID, TAB, TaskNo, CompHasLandings, CompType, True)
                End If

                ' if it is not F3K and not F5K put column headers here
                If CompType <> "F3K" And CompType <> "F5K" Then
                    TAB = DownloadFlights_HeaderRow(CompID, TAB, TaskNo, CompHasLandings, CompType, ShowScr4Rnd)
                End If

                ' if the round has not changed but the task has changed then output the round no and new task name
            ElseIf (CurrRound = dr("RoundNo")) And (NoOfTasks > 1) And CurrTaskNo <> CInt(dr("TaskNo")) Then
                CurrTaskNo = dr("TaskNo")
                TAB += vbCrLf
                txt = "ROUND " + dr("RoundNo").ToString
                ' append task name to round number on same row
                Select Case TaskNo
                    Case 1 : TaskName = "DURATION"
                    Case 2 : TaskName = "DISTANCE"
                    Case 3 : TaskName = "SPEED"
                End Select
                txt += "    " & TaskName
                TAB += txt + vbCrLf
                TAB = DownloadFlights_HeaderRow(CompID, TAB, TaskNo, CompHasLandings, CompType, ShowScr4Rnd)
            End If

            ' special sort order if this is speed so that zero scores sort to the bottom
            If TaskNo = 3 Then
                For Each drv In dvScoringData
                    If drv("RawScore") < 0.00001 Then
                        drv("SpeedSort") = 1000000
                    Else
                        drv("SpeedSort") = drv("RawScore")
                    End If
                Next
                dvScoringData.Sort = "SpeedSort ASC"
            ElseIf TaskNo = 6 Then 'F5K
                dvScoringData.Sort = "Score DESC"
            Else
                dvScoringData.Sort = "RawScore DESC"
            End If

            '************************************************************************
            ' output data starting here
            '************************************************************************
            For j As Integer = 0 To dvScoringData.Count - 1

                drv = dvScoringData.Item(j)

                TAB += drv("RoundNo") & vbTab & drv("GroupNo") & vbTab & drv("ReFlightNo") & vbTab

                ' Pilot Name
                TAB += "    " + drv("PilotName").ToString & vbTab
                ' Country
                TAB += drv("Country").ToString & vbTab
                ' Laps if Distance or F5B
                If TaskNo = 2 Or TaskNo = 4 Then TAB += CInt(drv("Data1")).ToString("#0") & vbTab ' Laps
                ' Time if Duration, Speed or F5B
                If TaskNo = 1 Or TaskNo = 3 Or TaskNo = 4 Then
                    Dim DecPlaces As Integer = TimingDecimals ' for tasks 1 and 4
                    If TaskNo = 3 Then DecPlaces = SpeedDecimals
                    TAB += VBCode.formatTimesToMinSec(CDbl(drv("Data2")), DecPlaces) & vbTab ' time
                End If

                ' times if F3K
                If TaskNo = 5 Then
                    For F3KFlight As Integer = 1 To 5 ' F3K times
                        TAB += VBCode.formatTimesToMinSec(CDbl(drv("Data" & F3KFlight)), TimingDecimals) & vbTab
                    Next
                    TAB += VBCode.formatTimesToMinSec(CDbl(drv("Data7")), TimingDecimals) & vbTab
                    TAB += VBCode.formatTimesToMinSec(CDbl(drv("Data6")), TimingDecimals) & vbTab
                End If

                ' Landing points if Duration or F5B
                If (TaskNo = 1 Or TaskNo = 4) And CompHasLandings Then ' landing points
                    TAB += CInt(drv("LandingPoints")).ToString("#0") & vbTab
                End If

                ' Height penalty if F5J
                If CompType = "F5J" Then ' height, height penalty, landingover75m
                    TAB += CDbl(drv("Data6")).ToString("#0") & vbTab
                    TAB += CDbl(VBCode.CalcHeightPenalty(drv("Data6"), F5JRefHeight, F5JPenaltyUpTo, F5JPenaltyOver)).ToString("#0.0") & vbTab
                    txt = IIf(CBool(drv("Landingover75m")) = True, "Yes", "-")
                    TAB += txt & vbTab
                    If F5JMotorReStartOption > 0 Then
                        If IsDBNull(drv("F5JMotorReStarted")) Then drv("F5JMotorReStarted") = False
                        txt = IIf(CBool(drv("F5JMotorReStarted")) = True, "Yes", "-")
                        TAB += txt & vbTab
                    End If
                End If

                ' Motor run if Elec
                If CompType = "Elec" Then ' motor run deduction
                    TAB += CDbl(drv("Data6")).ToString(TimingFormat) + vbTab
                End If

                ' Late landing and landing over 75m of F3J
                If CompType = "F3J" Then
                    ' late landing
                    If CInt(drv("Data6")) = 0 Then
                        txt = ""
                    Else
                        txt = CDbl(drv("Data6")).ToString("#0")
                    End If
                    TAB += txt + vbTab
                    ' landing over 75m
                    If CBool(drv("LandingOver75m")) = False Then
                        txt = ""
                    Else
                        txt = "Yes"
                    End If
                    TAB += txt + vbTab
                End If

                ' WattMin penalty if F5B
                If CompType = "F5B" Then
                    TAB += CDbl(drv("f5bMotorRunPenalty")).ToString("#0") + vbTab
                    TAB += CDbl(drv("F5BWattMinPenalty")).ToString("#0.0") + vbTab
                End If

                ' RawScore depending on ...
                Select Case True
                    Case CompType = "F3K"
                        TAB += CDbl(drv("RawScore")).ToString(RawScoreFormat) + vbTab
                    Case TaskNo = 3
                        Dim SpdRawScoreFormat As String = ""
                        Select Case SpeedDecimals
                            Case 0 : SpdRawScoreFormat = "#0"
                            Case 1 : SpdRawScoreFormat = "#0.0"
                            Case 2 : SpdRawScoreFormat = "#0.00"
                            Case 3 : SpdRawScoreFormat = "#0.000"
                        End Select
                        TAB += CDbl(drv("RawScore")).ToString(SpdRawScoreFormat) + vbTab
                    Case TaskNo <> 6
                        TAB += CDbl(drv("RawScore")).ToString(strFormat) + vbTab
                End Select


                If TaskNo <> 6 Then
                    ' Normalised score
                    TAB += CDbl(drv("NormalisedScore")).ToString(strFormat) & vbTab

                    ' Penalty
                    If CInt(drv("Penalty")) = 0 Then
                        txt = ""
                    Else txt = CInt(drv("Penalty")).ToString("#0")
                    End If
                    TAB += txt & vbTab

                    If ShowScr4Rnd Then
                        If drv("RoundNo") <> drv("OriginalRoundNo") Then
                            txt = CInt(drv("OriginalRoundNo")).ToString("#0")
                        Else
                            txt = ""
                        End If
                        TAB += txt & vbCrLf
                    Else
                        TAB += vbCrLf
                    End If

                    '' Output the Round, Group and ReFlight numbers
                    'TAB += vbTab & CInt(drv("RoundNo")) & vbTab & CInt(drv("GroupNo")) & vbTab & CInt(drv("ReFlightNo")) & vbCrLf
                End If

                dvScoringData = dvScoringData

                If TaskNo = 6 Then
                    TAB += drv("FlightNo") & vbTab
                    TAB += drv("Time") & vbTab
                    TAB += drv("Height") & vbTab
                    TAB += drv("HeightPoints") & vbTab

                    If drv("NoOfFlightsPlty") = "" Then
                        TAB += "" & vbTab
                    Else
                        TAB += drv("NoOfFlightsPlty") & vbTab
                    End If

                    'If drv("NoOfFlightsPlty") < 0 Then TAB += drv("NoOfFlightsPlty") & vbTab Else TAB += "" & vbTab

                    TAB += drv("LandOutPlty") & vbTab
                    TAB += drv("GeneralPlty") & vbTab
                    TAB += drv("FlightPoints") & vbTab
                    TAB += drv("TotalPoints") & vbTab
                    TAB += drv("Score") & vbTab
                    If drv("ZeroRnd") = "False" Then
                        TAB += "" & vbTab
                    Else
                        TAB += drv("ZeroRnd") & vbTab
                    End If

                    TAB += drv("OriginalRoundNo") & vbCrLf
                End If

            Next
        Next

        '***************************************************************************************
        'Download the TAB file.
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=FlightScores.tab")
        Response.Charset = ""
        Response.ContentType = "application/text"
        Response.Output.Write(TAB)
        Response.Flush()
        Response.End()

    End Sub




    Protected Sub DownloadCompList()

        ' Note that for this to work the appropriate 'Trigger' had to be set up in the web page.
        '<Triggers>
        '    <asp:PostBackTrigger ControlID = "TabContainer1$TabPanel1$OnLineScoresTabs$OverallResults$btnExport_Results" />
        '    <asp:PostBackTrigger ControlID="TabContainer1$TabPanel1$OnLineScoresTabs$FlightScores$btnExport_Flights"/>
        '    <asp:PostBackTrigger ControlID = "TabContainer1$TabPanel1$CompList" />
        '    <asp:PostBackTrigger ControlID="TabContainer1$TabPanel1$CompListButton1"/>
        '</Triggers>

        ' connect to database
        Dim cn As OleDbConnection = Application("cn")

        '********************************************************************************************************************
        ' Create dtCompData
        'Dim sql As String = "Select CompDate, CompName, CompVenue FROM CompData WHERE IsPublic='True'"
        'Dim cmd As New OleDbCommand(sql, cn)
        'Dim da As New OleDbDataAdapter(cmd)
        'Dim dtCompData As New DataTable
        'da.Fill(dtCompData)

        'Dim dvCompData As New DataView(dtCompData)
        'dvCompData.Sort = "CompDate DESC"

        ''==========================================================================================
        '' create the text file
        'Dim CompList As String = ""

        'Dim rootPath As String = MapPath("~")
        'CompList = rootPath & "/ScoreDownload/" & "CompetitionList.tab"
        'CompList = MapPath("~/ScoreDownload/" & "CompetitionList.tab")

        'If File.Exists(CompList) Then File.Delete(CompList)


        'Dim fName As String = "CompetitionList.tab"
        'Dim sw As New StreamWriter(CompList)

        'Dim txt As String = ""

        '' write out the column headings
        'txt &= "CompDate" & vbTab
        'txt &= "CompName" & vbTab
        'txt &= "CompVenue" & vbCrLf
        'sw.Write(txt)

        'Dim drv As DataRowView
        '    For i As Integer = 0 To dvCompData.Count - 1
        '        txt = ""
        '        drv = dvCompData.Item(i)
        '    txt &= CDate(drv("CompDate")).ToShortDateString & vbTab
        '    txt &= drv("CompName") & vbTab
        '    txt &= drv("CompVenue")
        '    sw.WriteLine(txt)
        'Next
        'sw.Close()

        'Response.ContentType = "application/text"
        'Response.AppendHeader("Content-Disposition", "attachment; filename=CompetitionList.tab")
        'Response.TransmitFile(Server.MapPath("~\ScoreDownload\CompetitionList.tab"))
        'Response.End()

        '****************************************************************************************************
        ' DELETE TO END OF SUB AS THIS IS NOT PART OF THE SYSTEM. SPECIAL USE ONCE ONLY.
        '********************************************************************************************************************
        ' Create dtScoring
        sql = "Select CompID, PilotNo, PilotName, Country FROM ScoringData"
        Dim cmd As New OleDbCommand(sql, cn)
        Dim da As New OleDbDataAdapter(cmd)
        Dim dtCompData As New DataTable
        da.Fill(dtCompData)

        Dim dvCompData As New DataView(dtCompData)

        '==========================================================================================
        ' create the text file
        Dim CompList As String = ""

        Dim rootPath As String = MapPath("~")
        CompList = rootPath & "/ScoreDownload/" & "CompetitionList.tab"
        CompList = MapPath("~/ScoreDownload/" & "CompetitionList.tab")

        If File.Exists(CompList) Then File.Delete(CompList)


        Dim fName As String = "CompetitionList.tab"
        Dim sw As New StreamWriter(CompList)

        Dim txt As String = ""

        ' write out the column headings
        txt &= "CompID" & vbTab
        txt &= "PilotNo" & vbTab
        txt &= "PilotName" & vbTab
        txt &= "Country" & vbCrLf
        sw.Write(txt)

        Dim drv As DataRowView
        For i As Integer = 0 To dvCompData.Count - 1
            txt = ""
            drv = dvCompData.Item(i)
            txt &= drv("CompID") & vbTab
            txt &= drv("PilotNo") & vbTab
            txt &= drv("PilotName") & vbTab
            txt &= drv("Country")
            sw.WriteLine(txt)
        Next
        sw.Close()

        Response.ContentType = "application/text"
        Response.AppendHeader("Content-Disposition", "attachment; filename=CompetitionList.tab")
        Response.TransmitFile(Server.MapPath("~\ScoreDownload\CompetitionList.tab"))
        Response.End()


    End Sub

    Protected Sub ShowPilotList(ByVal CompID As String, ByVal cn As OleDbConnection, ByVal ActiveTab As AjaxControlToolkit.TabPanel)

        Dim sql As String = "SELECT DISTINCT ScoringData.PilotName FROM ScoringData WHERE CompID = ? ORDER By ScoringData.PilotName"
        Dim cmd As New OleDbCommand(sql, cn)
        cmd.Parameters.AddWithValue("CompID", CompID)
        Dim dtNames As New DataTable
        Dim da As New OleDbDataAdapter(cmd)
        da.Fill(dtNames)

        Dim Name As String
        Dim pnlNew As Panel

        ' add a blank panel to space the next line
        Dim lblNew As Label

        pnlNew = AddNewPanel(CtrlCounter, "10px")
        ActiveTab.Controls.Add(pnlNew)

        pnlNew = AddNewPanel(CtrlCounter, "20px")
        lblNew = AddNewLabel("Pilot List", "scores-PilotListHeader", CtrlCounter, 10000, 20)
        pnlNew.Controls.Add(lblNew)
        ActiveTab.Controls.Add(pnlNew)

        pnlNew = AddNewPanel(CtrlCounter, "10px")
        ActiveTab.Controls.Add(pnlNew)

        For Each dr As DataRow In dtNames.Rows
            Name = dr("PilotName")
            pnlNew = AddNewPanel(CtrlCounter, "20px")
            lblNew = AddNewLabel(Name, "scores-PilotListDetail", CtrlCounter, 10000, 20)
            pnlNew.Controls.Add(lblNew)
            ActiveTab.Controls.Add(pnlNew)
        Next

    End Sub


    Protected Function getMaxRoundNo(ByVal CompID As String, ByVal cn As OleDbConnection) As Integer

        Dim MaxOfRoundNo As Integer = 0
        If cn.State = ConnectionState.Closed Then cn.Open()

        '******************************************************************************************************************


        Dim sql As String = "Select MAX(RoundNo) AS MaxOfRoundNo FROM ScoringData WHERE (Data1>0 Or Data2>0 Or Data3>0 Or Data4>0 Or Data5>0 Or Data6>0 Or Data7>0) And CompID ='" & CompID & "'"
        Dim cmd As New OleDbCommand(sql, cn)

        MaxOfRoundNo = CInt(cmd.ExecuteScalar)

        Return MaxOfRoundNo

    End Function

    Protected Function DownloadFlights_HeaderRow(ByVal CompID As String, ByVal TAB As String, ByVal TaskNo As Integer,
                                                      ByVal CompHasLandings As Boolean,
                                                      ByVal CompType As String, ByVal showScr4Rnd As Boolean) As String

        Dim F5JMotorReStartOption As Integer = VBCode.getF5JMotorRestartOption(CompID)

        ' output the header row
        TAB += "Round" & vbTab
        TAB += "Group" & vbTab
        TAB += "ReFlight" & vbTab
        TAB += "Name" & vbTab ' to put a header over the name column
        TAB += "Ctry" & vbTab

        If TaskNo = 2 Then TAB += "Laps" & vbTab
        If TaskNo = 4 Then TAB += "Laps" & vbTab
        If TaskNo = 1 Or TaskNo = 3 Or TaskNo = 4 Then TAB += "Time" & vbTab

        If TaskNo = 5 Then
            For F3KFlight As Integer = 1 To 7
                TAB += "Time" & F3KFlight.ToString & vbTab
            Next
        End If

        If (TaskNo = 1 Or TaskNo = 4) And CompHasLandings = True Then TAB += "LndgPts" & vbTab

        If CompType = "F5J" Then
            TAB += "Height" & vbTab
            TAB += "HtPlty" & vbTab
            TAB += ">75m" & vbTab
            If F5JMotorReStartOption > 0 Then
                TAB += "MtrReStart" & vbTab
            End If
        End If

        If CompType = "Elec" Then TAB += "MotorRun" & vbTab

        If CompType = "F3J" Then
            TAB += "LateLndg" & vbTab
            TAB += ">75m" & vbTab
        End If

        If CompType = "F5B" Then
            TAB += "MotorPlty" & vbTab
            TAB += "WattMinPlty" & vbTab
        End If

        If TaskNo <> 6 Then

            TAB += "Points" & vbTab
            TAB += "Score" & vbTab
            TAB += "Penalty" & vbTab

            If showScr4Rnd = True Then
                TAB += "Scr4Rnd" & vbTab
            Else
                TAB += vbTab
            End If
            TAB += vbCrLf

        ElseIf TaskNo = 6 Then

            TAB += "FlightNo" & vbTab
            TAB += "Time" & vbTab
            TAB += "Height" & vbTab
            TAB += "HeightPoints" & vbTab
            TAB += "NoOfFlightsPlty" & vbTab
            TAB += "LandOutPlty" & vbTab
            TAB += "FlightPenalties" & vbTab
            TAB += "FlightPoints" & vbTab
            TAB += "TotalPoints" & vbTab
            TAB += "Score" & vbTab
            TAB += "ZeroRound" & vbTab
            If showScr4Rnd = True Then
                TAB += "Scr4Rnd" & vbTab
            Else
                TAB += vbTab
            End If
            TAB += vbCrLf
        End If

        Return TAB

    End Function

    Protected Sub HideInvalidData()
        If msgInvalidData.Text.Contains("FROM DATE") Then FromDate.Text = ""
        If msgInvalidData.Text.Contains("TO DATE") Then ToDate.Text = ""
        'divInvalidData.Visible = False
    End Sub

End Class