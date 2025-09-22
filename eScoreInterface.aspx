<%@ Page Language="VB" MasterPageFile="~/eScoring/Mobile.master" AutoEventWireup="false" CodeFile="eScoreInterface.aspx.vb" Inherits="eScoreInterface" %>

<script runat="server">

    Dim CompID As String = ""
    Dim CompName As String = ""
    Dim PilotNo As String = ""
    Dim PilotNoLength As Integer = 0
    Dim PN As String = ""

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        If Not IsPostBack Then
            'Session.Timeout = "240"
            Session("InterfaceCompID") = ""
            Session("InterfacePilotID") = ""
            Div1a.Visible = False
            Div2.Visible = False
            Div3.Visible = False
            Div4.Visible = False
        End If

        If IsPostBack Then
            CompID = Session("InterfaceCompID")
        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        CompID = txtCompID.Value
        Session("InterfaceCompID") = CompID
        ' see if we can get the comp name here
        Dim retval As String = getCompName(CompID)

        Select Case retval
            Case "ConnectionToDBFailed"
                lblError.Text = "Could not connect to database. Please try again."
                Div1a.Visible = True
                Exit Sub
            Case "CheckForCompNameFailed"
                lblError.Text = "No competition with that CompID. Please try again and remember that CompID is case sensitive."
                Div1a.Visible = True
                Exit Sub
            Case ""
                lblError.Text = "No competition with that CompID. Please try again and remember that CompID is case sensitive."
                Div1a.Visible = True
                Exit Sub
            Case Else
                CompName = retval
                lblCompName.Text = "Comp:  " & CompName
                Div1.Visible = False
                Div1a.Visible = False
                Div2.Visible = True
                Div3.Visible = True
                Div4.Visible = True

        End Select

    End Sub

    Protected Sub btnOpen_Click(sender As Object, e As EventArgs)

        Div1a.Visible = False

        If Session("InterfacePilotID") = "" Then
            lblError.Text = "Please enter a Pilot ID and try again."
            Div1a.Visible = True
            Div1a.Style.Add("top", "125px")
            MyFrame.Src = Nothing
            Exit Sub
        ElseIf Not IsNumeric(Session("InterfacePilotID")) Then
            lblError.Text = "Pilot ID must be an integer. Please enter a numeric Pilot ID and try again."
            Div1a.Visible = True
            Div1a.Style.Add("top", "125px")
            MyFrame.Src = Nothing
            Exit Sub
        End If

        Dim URLString As String
        URLString = "http://GliderScore.com/eScoring.aspx?ID=" & Session("InterfaceCompID") & "&P=" & Session("InterfacePilotID")

        txtPilotID.Value = ""
        Session("InterfacePilotID") = ""

        MyFrame.Src = URLString
        Div2.Visible = True
        Div3.Visible = True
        Div4.Visible = True

    End Sub

    Protected Sub btnClose_Click(sender As Object, e As EventArgs)

        MyFrame.Src = Nothing
        Div2.Visible = True
        Div3.Visible = True
        Div4.Visible = True

    End Sub

    Protected Sub PilotNoChanged(sender As Object, e As EventArgs) Handles txtPilotID.ServerChange

        Session("InterfacePilotID") = txtPilotID.Value.ToString

    End Sub

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">



    <div id="Div1" runat="server" style="position: absolute; top: 60px; left: 5px; height: 34px;">
        <asp:Label CssClass="pcntX" ID="lblCompID" runat="server" Text="Competition ID" style="width:160px; font-size:20px"></asp:Label>
        <asp:Label CssClass="pcntX" ID="lblPad1" runat="server" Style="width: 20px"></asp:Label>
        <input CssClass="pcntX" id="txtCompID" type="text" runat="server" style="width:180px; height:32px; font-size:20px">
        <asp:Label CssClass="pcntX" ID="Label1" runat="server" Style="width: 20px"></asp:Label>
        <asp:Button CssClass="pcntX" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" style="width:140px; height:32px; text-align:center; font-size:20px" />
    </div>

     <div id="Div1a" runat="server" style="position: absolute; top: 95px; left: 5px; height: 34px;">
        <asp:Label runat="server" ID="lblError" Style="width: 95%; font-size:20px;">"No competition found with that CompID. Please try again."</asp:Label>
    </div>

    <div id="Div2" runat="server" style="position: absolute; top: 60px; left: 5px; height: 34px;">
        <asp:Label CssClass="pcntX" ID="lblCompName" runat="server" Text="CompName" Style="width: 320px; height:32px; font-size:20px;"></asp:Label>
    </div>

    <div id="Div3" runat="server" style="position: absolute; top: 90px; left: 5px; height: 34px;">
        <asp:Label CssClass="pcntX" ID="lblPilotNumber" runat="server" Text="Pilot ID" style="width:100px; font-size :20px;"></asp:Label>
        <asp:Label ID="lblPad2" runat="server" Style="width: 20px"></asp:Label>
        <input id="txtPilotID" type="text" style="width: 60px; height:32px; font-size :20px" runat="server" onkeydown="PilotNoChanged" />
        <asp:Label ID="lblPad3" runat="server" Style="width: 30px"></asp:Label>
        <asp:Button CssClass="pcntX" ID="btnOpen" runat="server" Text="Score"  style="width:75px; font-size :20px;" OnClick="btnOpen_Click"/>
        <asp:Label ID="lblPad4" runat="server" Style="width: 30px"></asp:Label>
        <asp:Button CssClass="pcntX" ID="btnClose" runat="server" Text="Clear"  style="width:75px; font-size :20px;" OnClick="btnClose_Click"/>
    </div>

    <div id="Div4" runat="server" style="position: absolute; top: 125px; left: 0px">
        <iframe id="MyFrame" runat="server" style="height:auto; min-height:800px; width: 100%" ></iframe>
    </div>

</asp:Content>

