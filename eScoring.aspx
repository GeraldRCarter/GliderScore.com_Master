<%@ Page Debug="false" Language="VB" MasterPageFile="~/eScoring/Mobile.master" EnableViewState="true" AutoEventWireup="false" CodeFile="eScoring.aspx.vb" Inherits="eScoring" %>

<script runat="server">

    Dim CompID As String = ""
    Dim CompName As String = ""
    Dim CompType As String = ""
    Dim RoundNo As String
    Dim GroupNo As String
    Dim ReFlightNo As String
    Dim OriginalRoundNo As String
    Dim LaneNo As String = ""
    Dim PilotNo As Integer = 0
    Dim PilotName As String = ""
    Dim PilotStartNo As String = ""
    Dim dtFlightGroups As New System.Data.DataTable
    Dim dtF3KData As New System.Data.DataTable
    Dim UseLanes As String = ""
    Dim CompTypeList As New ArrayList
    Dim vState As String = "Thml"
    Dim DistID As String = ""
    Dim SpdSeq As String = ""
    Dim isReFlight As String = ""

    Dim cn As System.Data.OleDb.OleDbConnection

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        'Session.Timeout = "240"

        If IsNothing(Application("cn")) Then
            Application("cn") = VBCode.getDatabaseConnection
        End If
        cn = Application("cn")

        lblID.Visible = False
        lblSpdSeq.Visible = False

        If Not IsPostBack Then
            '***********************************************************************************
            ' get CompID & PilotNo
            If IsNothing(Session("CompID")) Or Session("CompID") = "" Then
                ' meaning that Session("CompID") has never existed or, if it has, not for this competition
                ' so this is the very first loading of this page
                CompID = Request.QueryString("ID")
                PilotNo = Request.QueryString("P")
            Else
                ' meaning that this page has been loaded before and we are now returning to it
                CompID = Session("CompID") : Session("CompID") = ""
                PilotNo = Session("PilotNo") : Session("PilotNo") = ""
            End If

            lblCompID.Text = CompID
            lblPilotNo.Text = PilotNo
            CompType = VBCode.getCompTypeFromCompData(CompID) ' CompType will be 'Multi' for multi task comps (F3B, F3G and F3Q)

            '***********************************************************************************
            ' get the Pilot name and Start number. Set the lblName.text.
            PilotName = VBCode.getPilotName(CompID, PilotNo) ' get Pilot name 
            PilotStartNo = VBCode.getPilotStartNo(CompID, PilotNo) ' get Pilot Start Number
            If PilotStartNo = "0" Then
                lblName.Text = PilotName
            Else lblName.Text = PilotStartNo & "  " & PilotName
            End If
            lblName.Text = PilotName

            '***********************************************************************************
            ' get the CompName and set the lblName.text
            lblCompName.Text = VBCode.getCompNameFromCompData(CompID)
            '***********************************************************************************

            ' work out whether lblLane should or should not be visible
            If VBCode.getUseLanes(CompID) = "False" Then
                lblLane.Visible = False : UseLanes = "False"
            ElseIf CompType = "F3B" Or CompType = "F3G" Or CompType = "F3Q" Then ' applies comps with two or more tasks including F3B, F3G and F3Q
                UseLanes = "False"
                lblLane.Visible = False
            Else
                lblLane.Visible = True
                UseLanes = "True"
            End If

            '***********************************************************************************
            ' get a list of CompTypes in database
            CompTypeList = VBCode.getCompTypeList(CompID) ' gets a list of CompTypes for this competition

            '***********************************************************************************
            ' set visiblility of Task buttons depending on the number of CompTypes in the list
            TaskButtons.Visible = (CompTypeList.Count > 1)

            '***********************************************************************************
            ' get CompType where CompTypeList.Count = 1
            If CompTypeList.Count = 1 Then
                CompType = CompTypeList(0).ToString
            End If

            '***********************************************************************************
            ' get CompType value where CompTypeList.Count > 1
            If CompTypeList.Count > 1 Then

                ' make the radio buttons visible as required
                If CompTypeList.Contains("Thml") = False Then rbThermal.Visible = False
                If CompTypeList.Contains("ThmlF3G") = False Then rbThermalF3G.Visible = False
                If CompTypeList.Contains("ThmlF3Q") = False Then rbThermalF3Q.Visible = False
                If CompTypeList.Contains("Dist") = False Then rbDistance.Visible = False
                If CompTypeList.Contains("Spd") = False Then rbSpeed.Visible = False

                If IsNothing(Session("CompType")) Or Session("CompType") = "" Or CompType = "F3B" Or CompType = "F3G" Or CompType = "F3Q" Then
                    ' meaning that Session("CompType") has never existed or, if it has, not for this competition
                    ' we are a multi-task competition so we will choose the first task as the selected task

                    ' based on which radio buttons are visible, make the first one checked and set the CompType accordingly
                    Select Case True
                        Case rbThermal.Visible = True : rbThermal.Checked = True : CompType = "Thml"
                        Case rbThermalF3G.Visible = True : rbThermalF3G.Checked = True : CompType = "ThmlF3G"
                        Case rbThermalF3Q.Visible = True : rbThermalF3Q.Checked = True : CompType = "ThmlF3Q"
                        Case rbDistance.Visible = True : rbDistance.Checked = True : CompType = "Dist"
                        Case rbSpeed.Visible = True : rbSpeed.Checked = True : CompType = "Spd"
                    End Select
                    Session("CompType") = CompType

                Else

                    ' meaning that Session("CompType") exists and has a value other than ""
                    ' so this is not the first loading of this page
                    ' use Session("CompType") to establish a value for CompType
                    CompType = Session("CompType") : Session("CompType") = ""
                    Select Case CompType
                        Case "Thml" : rbThermal.Checked = True
                        Case "ThmlF3G" : rbThermalF3G.Checked = True
                        Case "ThmlF3Q" : rbThermalF3Q.Checked = True
                        Case "Dist" : rbDistance.Checked = True
                        Case "Spd" : rbSpeed.Checked = True
                    End Select

                End If

            End If

            lblCompType.Text = CompType

        End If

        '///////////////////////////////////////////////////////////////////////////////////////

        If IsPostBack Then
            '***********************************************************************************
            ' get CompID & PilotNo & CompType
            CompID = lblCompID.Text
            PilotNo = lblPilotNo.Text
            If TaskButtons.Visible Then
                If rbThermal.Checked Then CompType = "Thml"
                If rbThermalF3G.Checked Then CompType = "ThmlF3G"
                If rbThermalF3Q.Checked Then CompType = "ThmlF3Q"
                If rbDistance.Checked Then CompType = "Dist"
                If rbSpeed.Checked Then CompType = "Spd"
                lblCompType.Text = CompType
            Else
                CompTypeList = VBCode.getCompTypeList(CompID) ' gets a list of CompTypes for this competition
                If CompTypeList.Count = 1 Then
                    CompType = CompTypeList(0)
                Else
                    Select Case True
                        Case CompTypeList.Contains("Thml") : CompType = "Thml"
                        Case CompTypeList.Contains("ThmlF3G") : CompType = "ThmlF3G"
                        Case CompTypeList.Contains("ThmlF3Q") : CompType = "ThmlF3Q"
                    End Select
                End If
                lblCompType.Text = CompType
            End If

            '***********************************************************************************
            ' work out whether lblLane should or should not be visible
            Dim strUseLanes As String = VBCode.getUseLanes(CompID)
            If strUseLanes = "True" Then

                If CompType = "Spd" Then
                    lblLane.Visible = False : UseLanes = "False"
                Else
                    lblLane.Visible = True : UseLanes = "True"
                End If

            ElseIf strUseLanes = "False" Then

                lblLane.Visible = False : UseLanes = "False"

            End If

            '***********************************************************************************

        End If

        '///////////////////////////////////////////////////////////////////////////////////////

        '******************************************************************************************
        ' populate the webpage for the current CompType
        If CompType = "Dist" Then lblID.Visible = True
        If CompType = "Spd" Then lblSpdSeq.Visible = True : lblLane.Visible = False

        If CompType = "F3K" Then
            dtF3KData.Clear()
            dtF3KData = VBCode.getF3KData(CompID)
        End If

        dtFlightGroups.Clear()

        dtFlightGroups = VBCode.getFlightGroupsForTask(CompID, CompType, PilotNo)

        PopulateFlightGroups()

        If dtFlightGroups.Rows.Count = 0 Then
            'lblName.Text = "No online data found for this competition."
            lblName.Text = “No data found. Check that data has been uploaded and that the competition CompID on Scoring sheets and on the computer match.”
            lblRound.Visible = False
            lblGroup.Visible = False
            lblLane.Visible = False
        End If

    End Sub

    Protected Sub PopulateFlightGroups()

        Dim RowLeftOpen As Boolean = False
        Dim lblNew As Label = Nothing
        Dim btnNew As Button = Nothing
        Dim dr As System.Data.DataRow
        Dim ID As String = ""
        Dim SpdSeq As String = ""
        tblRows.Controls.Clear()

        For i As Integer = 0 To dtFlightGroups.Rows.Count - 1

            dr = dtFlightGroups.Rows(i)
            RoundNo = dr("RoundNo")
            GroupNo = dr("GroupNo")
            ReFlightNo = dr("ReFlightNo")
            OriginalRoundNo = dr("OriginalRoundNo")
            LaneNo = dr("SeqNo")
            If CompType = "Dist" Then ID = VBCode.getDistanceID(dr("SeqNo"))
            SpdSeq = dr("SeqNo")

            Dim dynDiv As New HtmlGenericControl("DIV")
            dynDiv.ID = "Div" & i
            tblRows.Controls.Add(dynDiv)

            ' add a blank label to space text away from the left edge of the screen
            lblNew = New Label
            With lblNew
                .CssClass = "pcnt08"
                .Text = ""
            End With
            dynDiv.Controls.Add(lblNew)

            ' add a label to hold the round number
            lblNew = New Label
            With lblNew
                .CssClass = "pcnt18Center"
                If RoundNo = OriginalRoundNo Then
                    .Text = RoundNo
                Else
                    .Text = RoundNo & "(" & OriginalRoundNo & ")"
                End If
            End With
            dynDiv.Controls.Add(lblNew)

            ' add a label to hold the group number and the reflight number if applicable
            isReFlight = getReFlightStatus(dtFlightGroups, i)
            lblNew = New Label
            With lblNew
                .CssClass = "pcnt18Center"
                If isReFlight = "False" Then
                    .Text = GroupNo
                ElseIf isReFlight = "True" Then
                    .Text = GroupNo & "." & ReFlightNo
                End If
            End With
            dynDiv.Controls.Add(lblNew)

            If UseLanes = "True" And CompType <> "Spd" Then
                lblNew = New Label
                With lblNew
                    .CssClass = "pcnt18Center"
                    .Text = LaneNo
                End With
                dynDiv.Controls.Add(lblNew)
            End If

            If CompType = "Dist" Then
                lblNew = New Label
                With lblNew
                    .CssClass = "pcnt18CenterIndented5px"
                    .Text = ID
                End With
                dynDiv.Controls.Add(lblNew)
            End If

            If CompType = "Spd" Then
                lblNew = New Label
                With lblNew
                    .CssClass = "pcnt18CenterIndented5px"
                    .Text = SpdSeq
                End With
                dynDiv.Controls.Add(lblNew)
            End If

            If CompType = "F3K" Or CompType = "F3K_D" Then
                lblNew = New Label
                With lblNew
                    .CssClass = "pcnt18-8px"
                    Dim key(1) As Object
                    key(0) = CompID
                    key(1) = RoundNo
                    Dim F3KTask As String = dtF3KData.Rows.Find(key)("F3KTaskAbbreviation")
                    .Text = F3KTask
                End With
                dynDiv.Controls.Add(lblNew)
            End If

            lblNew = New Label
            With lblNew
                .CssClass = "pcnt08"
                .Text = ""
            End With
            dynDiv.Controls.Add(lblNew)

            btnNew = New Button
            With btnNew
                .ID = "btn" & i.ToString
                .CssClass = "pcnt22Center"

                If dtFlightGroups.Rows(i)("Updated") = "True" Then
                    .Text = "View"
                ElseIf RowLeftOpen = False Then
                    RowLeftOpen = True
                    .Text = "Enter"
                    .BackColor = System.Drawing.Color.RoyalBlue
                    .ForeColor = System.Drawing.Color.Yellow
                Else
                    .Text = "Enter"
                    .Enabled = False
                End If
            End With
            dynDiv.Controls.Add(btnNew)
            AddHandler btnNew.Click, AddressOf btnCommand
        Next



    End Sub


    Protected Sub btnCommand(ByVal sender As Object, ByVal e As EventArgs)

        Dim btn As Button = CType(sender, Button)
        Dim btnName As String = btn.ID

        Dim idx As Integer = CInt(btnName.Substring(3))

        Dim dr As System.Data.DataRow = dtFlightGroups.Rows(idx)

        Dim isReFlight As String = False ' to indicate whether this flight group is part of a reflight series (incl ReFlightNo = 0)
        isReFlight = getReFlightStatus(dtFlightGroups, idx)

        RoundNo = dr("RoundNo")
        GroupNo = dr("GroupNo")
        ReFlightNo = dr("ReFlightNo")

        If CompType = "F3K" Then
            Dim F3KTaskForRound As String = VBCode.getF3KTaskForRound(CompID, RoundNo)
            If F3KTaskForRound = "D" Then CompType = "F3K_D"
        End If

        If CompType = "Dist" Then DistID = VBCode.getDistanceID(dr("SeqNo"))
        SpdSeq = dr("SeqNo")

        Session("CompID") = CompID
        Session("CompType") = CompType
        Session("PilotNo") = PilotNo
        Session("RoundNo") = RoundNo
        Session("GroupNo") = GroupNo
        Session("ReFlightNo") = ReFlightNo
        Session("LaneNo") = LaneNo
        Session("DistID") = DistID
        Session("SpdSeq") = SpdSeq
        Session("isReFlight") = isReFlight

        Response.BufferOutput = True
        Select Case CompType
            Case "ALESwithHeight" : Server.Transfer("~/eScoring/Score_ALESwithHeight.aspx")
            Case "Dist" : Server.Transfer("~/eScoring/Score_Dist.aspx")
            Case "Elec" : Server.Transfer("~/eScoring/Score_Elec.aspx")
            Case "F3J" : Server.Transfer("~/eScoring/Score_F3J.aspx")
            Case "F3K" : Server.Transfer("~/eScoring/Score_F3K.aspx")
            Case "F3K_D" : Server.Transfer("~/eScoring/Score_F3K_D.aspx")
            Case "F5B" : Server.Transfer("~/eScoring/Score_F5B.aspx")
            Case "F5J" : Server.Transfer("~/eScoring/Score_F5J.aspx")
            Case "F5K" : Server.Transfer("~/eScoring/Score_F5K.aspx")
            Case "F5K2024" : Server.Transfer("~/eScoring/Score_F5K2024.aspx")

            Case "Spd" : Server.Transfer("~/eScoring/Score_Spd.aspx")
            Case "Thml", "ALES", "F3L", "F3RES", "F5L" : Server.Transfer("~/eScoring/Score_Thml.aspx")
            Case "ThmlF3G" : Server.Transfer("~/eScoring/Score_ThmlF3G.aspx")
            Case "ThmlF3Q" : Server.Transfer("~/eScoring/Score_ThmlF3Q.aspx")
            Case "Test" : Server.Transfer("~/eScoring/Score_Test.aspx")
        End Select

    End Sub

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div id="HiddenFields" runat="server">
        <asp:Label ID="lblCompID" visible="false" runat ="server"></asp:Label>
        <asp:Label ID="lblCompType" visible="false" runat ="server"></asp:Label>
        <asp:Label ID="lblPilotNo" visible="false" runat="server"></asp:Label>
    </div>

    <div style="background-color:white" runat="server">
        <asp:Label CssClass="pcnt96-18px" ID="lblCompName" runat="server"></asp:Label>
        <asp:Label CssClass="pcnt96" ID="lblName" runat="server"></asp:Label>
    </div>
   
    <div id="TaskButtons" style="white-space: nowrap; height: auto;" runat="server">
        <asp:Label CssClass="pcnt04" ID="Label5" runat="server" Text=""></asp:Label>
        <asp:RadioButton CssClass="pcnt27Center" GroupName="rb" ID="rbThermal" AutoPostBack="true" runat="server" Text="Thermal" ViewStateMode="Enabled"></asp:RadioButton>
        <asp:Label CssClass="pcnt02" ID="Label6" runat="server" Text=""></asp:Label>
        <asp:RadioButton CssClass="pcnt27Center" GroupName="rb" ID="rbThermalF3G" AutoPostBack="true" runat="server" Text="Thermal" ViewStateMode="Enabled"></asp:RadioButton>
        <asp:Label CssClass="pcnt02" ID="Label2" runat="server" Text=""></asp:Label>
        <asp:RadioButton CssClass="pcnt27Center" GroupName="rb" ID="rbThermalF3Q" AutoPostBack="true" runat="server" Text="Thermal" ViewStateMode="Enabled"></asp:RadioButton>
        <asp:Label CssClass="pcnt02" ID="Label1" runat="server" Text=""></asp:Label>
        <asp:RadioButton CssClass="pcnt27Center" GroupName="rb" ID="rbDistance" AutoPostBack="true" runat="server" Text="Distance" ViewStateMode="Enabled"></asp:RadioButton>
        <asp:Label CssClass="pcnt02" ID="Label7" runat="server" Text=""></asp:Label>
        <asp:RadioButton CssClass="pcnt27Center" GroupName="rb" ID="rbSpeed" AutoPostBack="true" runat="server" Text="Speed" ViewStateMode="Enabled"></asp:RadioButton>
    </div>

    <div id="tblHeader" style="white-space: nowrap; height: 34px;" runat="server">
        <asp:Label CssClass="pcnt08" ID="lblBlank1" runat="server" Text=""></asp:Label>
        <asp:Label CssClass="pcnt18Center" ID="lblRound" runat="server" Text="Round"></asp:Label>
        <asp:Label CssClass="pcnt18Center" ID="lblGroup" runat="server" Text="Group"></asp:Label>
        <asp:Label CssClass="pcnt18Center" ID="lblLane" runat="server" Text="Lane"></asp:Label>
        <asp:Label CssClass="pcnt18Center" ID="lblID" runat="server" Text="ID"></asp:Label>
        <asp:Label CssClass="pcnt18Center" ID="lblSpdSeq" runat="server" Text="#"></asp:Label>
        <asp:Label CssClass="pcnt08" ID="lblBlank2" runat="server" Text=""></asp:Label>
    </div>

    <div id="tblRows" style="white-space: nowrap; height: auto;" runat="server">
    </div>

    <div>
        <asp:Label CssClass="pcnt96" Style="height: 15px" ID="lblEmpty" Text="" runat="server"></asp:Label>
    </div>
</asp:Content>
