<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" AutoEventWireup="false" CodeFile="OnLineScores.aspx.vb" Inherits="OnlineScores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Dim CompID As String = ""
        Dim LinkType As String = ""

        If Not IsNothing(Request.QueryString("ID")) Then
            CompID = Request.QueryString("ID")
            LinkType = Request.QueryString("T") ' link type = P (progressive scores) or F (final scores)
        End If
        ' get a global reference to the oledbconnection to SQL Server database
        If IsNothing(Application("cn")) Then Application("cn") = VBCode.getDatabaseConnection

        ' register file downloads as full postback. needed because of updatepanel being async postback
        ScriptManager.GetCurrent(Me.Page).RegisterPostBackControl(Me.btnExport_Flights)
        ScriptManager.GetCurrent(Me.Page).RegisterPostBackControl(Me.btnExport_Results)

        If Not IsPostBack Then

            lblCompID.Text = "0"
            Populate_CompList()
            OnLineScoresTabs.ActiveTabIndex = 0
            OnLineScoresTabs.Visible = False

            If Not IsNothing(Request.QueryString("ID")) Then
                If LinkType = "P" Then
                    OnLineScoresTabs.ActiveTabIndex = 0
                    CompList1.SelectedIndex = CompList1.Items.IndexOf(CompList1.Items.FindByValue(CompID))
                    CompList1_SelectedIndexChanged()
                    OnLineScoresTabs.Visible = True
                ElseIf LinkType = "F" Then
                    OnLineScoresTabs.ActiveTabIndex = 1
                    CompList1.SelectedIndex = CompList1.Items.IndexOf(CompList1.Items.FindByValue(CompID))
                    CompList1_SelectedIndexChanged()
                    RoundsList_Results.SelectedIndex = RoundsList_Results.Items.Count - 1
                    Refresh_Results()
                    OnLineScoresTabs.Visible = True
                End If
            End If


            AddHandler RoundsList_Flights.SelectedIndexChanged, AddressOf RoundsList_Flights_SelectedIndexChanged
            AddHandler RoundsList_Results.SelectedIndexChanged, AddressOf RoundsList_Results_SelectedIndexChanged
            AddHandler RoundsList_Teams.SelectedIndexChanged, AddressOf RoundsList_Teams_SelectedIndexChanged

            RoundsListFlightsSelectedIndex.Text = CStr(RoundsList_Flights.SelectedIndex)
            RoundsListResultsSelectedIndex.Text = CStr(RoundsList_Results.SelectedIndex)
            RoundsListTeamsSelectedIndex.Text = CStr(RoundsList_Teams.SelectedIndex)

        End If

        If IsPostBack Then

            AddHandler RoundsList_Flights.SelectedIndexChanged, AddressOf RoundsList_Flights_SelectedIndexChanged
            AddHandler RoundsList_Results.SelectedIndexChanged, AddressOf RoundsList_Results_SelectedIndexChanged
            AddHandler RoundsList_Teams.SelectedIndexChanged, AddressOf RoundsList_Teams_SelectedIndexChanged

        End If

    End Sub
</script>

<%--CONTENT STARTS HERE--%>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate runat="server">
            <asp:TabContainer ID="TabContainer1" runat="server">
                <%--ON LINE SCORES TAB PANEL--%>
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="View Scores">
                    <ContentTemplate runat="server">
                        <div id="divHiddenFields" runat="server" visible="False">
                            <asp:Label ID="lblCompID" runat="server"></asp:Label>
                            <asp:Label ID="RoundsListFlightsSelectedIndex" runat="server"></asp:Label>
                            <asp:Label ID="RoundsListResultsSelectedIndex" runat="server"></asp:Label>
                            <asp:Label ID="RoundsListTeamsSelectedIndex" runat="server"></asp:Label> />
                        </div>

                        <%--DIV FILTERS--%>
                        <div id="divFilters" style="height: 25px;" clientidmode="Static" display="block">
                            <asp:Label ID="lblFilters" ClientIDMode="Static" runat="server" Style="color: black; font-size: 12px; width: 100px; height: 20px; border-radius: 3px; margin-left: 5px;">Comp Filter</asp:Label>
                            <asp:TextBox ID="CompName" ClientIDMode="Static" runat="server" AutoPostBack="true" Style="color: black; font-size: 12px; width: 150px; height: 20px; border-radius: 3px; margin-left: 5px;" inputmode="text" placeholder="Portion of comp name"></asp:TextBox>
                            <asp:Label ID="lblFromDate" ClientIDMode="Static" runat="server" Style="color: black; font-size: 12px; width: 50px; height: 20px; border-radius: 3px; margin-left: 5px;">From</asp:Label>
                            <asp:TextBox ID="FromDate" ClientIDMode="Static" runat="server" AutoPostBack="true" Style="color: black; font-size: 12px; width: 110px; height: 20px; border-radius: 3px; margin-left: 5px;" inputmode="date" placeholder="yyyy-mm-dd"></asp:TextBox>
                            <asp:Label ID="lblToDate" ClientIDMode="Static" runat="server" Style="color: black; font-size: 12px; width: 50px; height: 20px; border-radius: 3px; margin-left: 5px;">To</asp:Label>
                            <asp:TextBox ID="ToDate" ClientIDMode="Static" runat="server" AutoPostBack="true" Style="color: black; font-size: 12px; width: 110px; height: 20px; border-radius: 3px; margin-left: 5px;" inputmode="date" placeholder="yyyy-mm-dd"></asp:TextBox>
                            <asp:TextBox ID="Venue" ClientIDMode="Static" runat="server" AutoPostBack="true" Style="color: black; font-size: 12px; width: 150px; height: 20px; border-radius: 3px; margin-left: 5px;" inputmode="text" placeholder="Portion of comp venue"></asp:TextBox>
                            <asp:Button ID="btnClearFilter" ClientIDMode="Static" runat="server" Enabled="true" Visible="true"
                                Style="color: black; font-size: 12px; width: 100px; height: 20px; border-radius: 3px; margin-left: 5px;"
                                Text="Clear Filter"
                                AutoPostback="True"
                                OnClientClick="ClearFilter()" />
                        </div>

                        <%--DIV INVALID DATA--%>
                        <div id="divInvalidData" clientidmode="Static" runat="server" style="height: 25px;" display="none" visible="false">
                            <asp:Label ID="msgInvalidData" ClientIDMode="Static" runat="server" Style="color: red; font-size: 12px; width: 500px; height: 20px; border-radius: 3px; margin-left: 5px;"></asp:Label>
                            <asp:Button ID="btnInvalidData" ClientIDMode="Static" runat="server" Enabled="true"
                                Style="color: black; font-size: 12px; width: 100px; height: 20px; border-radius: 3px; margin-left: 5px;"
                                Text="OK"
                                AutoPostback="True"
                                OnClick="HideInvalidData" />
                        </div>

                        <div runat="server" style="height: 5px;"></div>

                        <%--DIV COMP LIST--%>
                        <div id="divCompList" runat="server" style="white-space: nowrap">

                            <asp:DropDownList ID="CompList1" runat="server"
                                Style="color: black; font-size: 15px; width: 550px; height: 25px; float: left; border-radius: 3px;"
                                AutoPostBack="True"
                                OnSelectedIndexChanged="CompList1_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Label ID="Label7" runat="server" Width="5px"></asp:Label>

                            <asp:Button ID="CompListButton1" runat="server" Enabled="true" Visible="true"
                                Style="color: black; font-size: 12px; width: 130px; height: 25px; border-radius: 3px;"
                                Text="Download Comp List"
                                AutoPostback="True"
                                OnClick="DownloadCompList" />

                            <asp:Button ID="btnToggleFilter" ClientIDMode="Static" runat="server" display="block"
                                Style="color: black; font-size: 12px; width: 100px; height: 20px; border-radius: 3px; position: relative; top: 0px;"
                                Text="Hide filter" OnClientClick="ToggleFilter();return false" />
                        </div>

                        <div runat="server" style="height: 5px;"></div>

                        <asp:TabContainer ID="OnLineScoresTabs" runat="server" CssClass="">
                            <%--                            ----FLIGHT SCORES------%>
                            <asp:TabPanel ID="FlightScores" runat="server" HeaderText="  Flight Scores  " TabIndex="0">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel_Flights" runat="server" UpdateMode ="Conditional" >
                                        <ContentTemplate>
                                            <div id="divHeaderRow_Flights" runat="server" style="width: 1000px; top: 0px; position: relative;">
                                                <asp:DropDownList ID="RoundsList_Flights" runat="server"
                                                    Style="color: black; font-size: 15px; width: 150px; height: 25px; float: left; border-radius: 3px;"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                                <asp:Label ID="Label2" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnUpdateRoundsList_Flights"
                                                    runat="server" Enabled="true" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Update Rounds List"
                                                    OnClick="UpdateRoundsList_Flights" />
                                                <asp:Label ID="Label1" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnRefresh_Flights"
                                                    runat="server" Enabled="true" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Refresh Flight Scores"
                                                    OnClick="Refresh_Flights"
                                                    CausesValidation-="false" />
                                                <asp:Label ID="Label8" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnExport_Flights"
                                                    runat="server" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Download all Flight Scores"
                                                    OnClick="DownloadFlightsTAB" />
                                            </div>

                                            <div id="divFlights" runat="server" style="white-space: nowrap; overflow: auto;">
                                                <%--Flight scores listing goes here--%>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RoundsList_Flights"/>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </asp:TabPanel>

                            <%--OVERALL RESULTS--%>
                            <asp:TabPanel runat="server" ID="OverallResults" HeaderText="  Individual Results  " TabIndex="1">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel_Rounds" runat="server" UpdateMode ="Conditional">
                                        <ContentTemplate>
                                            <div id="divHeaderRow_Results" runat="server" style="width: 1000px; top: 0px; position: relative;">
                                                <asp:DropDownList ID="RoundsList_Results" runat="server"
                                                    Style="color: black; font-size: 15px; width: 150px; height: 25px; float: left; border-radius: 3px;"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                                <asp:Label ID="Label4" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnUpdateRoundsList_Results"
                                                    runat="server" Visible="False"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Update Rounds List"
                                                    OnClick="UpdateRoundsList_Results" CausesValidation="False" />
                                                <asp:Label ID="Label5" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnRefresh_Results"
                                                    runat="server" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Refresh Results"
                                                    OnClick="Refresh_Results"
                                                    CausesValidation="False" />
                                                <asp:Label ID="Label3" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnExport_Results"
                                                    runat="server" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Download Results"
                                                    OnClick="DownloadResultsTAB" />
                                            </div>

                                            <div id="divResults" runat="server" style="white-space: nowrap; overflow: auto;">
                                                <%----Results listing goes here----%>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RoundsList_Results" />
                                        </Triggers>
                                </asp:UpdatePanel>
                                </ContentTemplate>
                            </asp:TabPanel>

                            <%--TEAM RESULTS--%>
<<<<<<< HEAD
                            <asp:TabPanel runat="server" ID="Teams" HeaderText="  Team Results  " TabIndex="2">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel_Teams" runat="server" UpdateMode ="Conditional" >
                                        <ContentTemplate>

                                            <div id="divHeaderRow_Teams" runat="server" style="width: 1000px; top: 0px; position: relative;">

                                                <asp:DropDownList ID="RoundsList_Teams" runat="server"
                                                    Style="color: black; font-size: 15px; width: 150px; height: 25px; float: left; border-radius: 3px;"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>

                                                <asp:Label ID="Label6" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnUpdateRoundsList_Teams"
                                                    runat="server" Visible="False"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Update Rounds List"
                                                    OnClick="UpdateRoundsList_Teams"
                                                    CausesValidation="False" />
                                                <asp:Label ID="Label9" runat="server" Width="5px"></asp:Label>
                                                <asp:Button ID="btnRefresh_Teams"
                                                    runat="server" Visible="false"
                                                    Style="color: black; font-size: 12px; width: 150px; height: 25px; border-radius: 3px;"
                                                    Text="Refresh Team Results"
                                                    OnClick="Refresh_Teams"
                                                    CausesValidation="False" />
                                            </div>

                                            <div id="divTeams" runat="server" style="white-space: nowrap; overflow: auto;">
                                                <%----Teams listing goes here----%>
                                            </div>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="RoundsList_Teams" />
                                        </Triggers>
                                </asp:UpdatePanel>

                                </ContentTemplate>
                            </asp:TabPanel>
=======
<%--<%--                            <asp:TabPanel runat="server" ID="TeamResults" HeaderText="Team Results">
                                <ContentTemplate>
                                    <div id="divHeaderRow_Teams" runat="server" style="width: 1000px; top: 0px; position: relative;">
                                        <p>this is a para</p>

                                        <asp:DropDownList ID="RoundsList_TeamResults" runat="server" Enabled="true" Visible="true"
                                            Style="color: black; font-size: 15px; width: 150px; height: 25px; float: left; border-radius: 3px;"
                                            AutoPostBack="True"
                                            OnSelectedIndexChanged="RoundsList_TeamResults_SelectedIndexChanged">
                                        </asp:DropDownList>

                                    </div>

                                    <div id="divTeamResults" runat="server" style="white-space: nowrap; width: auto;">
                                        <%----Results listing goes here----%>
                                    </div>

                                </ContentTemplate>
                            </asp:TabPanel>--%>--%>

>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                        </asp:TabContainer>
                    </ContentTemplate>
                </asp:TabPanel>

                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="How to Publish Scores" TabIndex="1">
                    <ContentTemplate>
                        <h5>How to Publish Scores OnLine</h5>
                        <p>
                            The GliderScore program can very easily publish results on this website.<br />
                            It is simply a matter of uploading your competition data with the 'Competition Status' set to 'Public'.<br />
                            Details are given below.<br />
                        </p>
                        <p>
                            <b>Publish when:</b><br />
                            &nbsp&nbsp&nbsp - a competition is complete - the Overall Results screen will show the competition results.<br />
                            &nbsp&nbsp&nbsp - a round is complete - the Overall Results screen will show the correct rankings up to that round.<br />
                            <br />
                            <b>Viewing Rounds in Progress</b><br />
                            If using eScoring, viewers are able to see scores as they are uploaded for the round in progress by pressing the 'Refresh Report' button.<br />
                            The system calculates the points score for rounds in progress so that a provisional ranking can be shown.<br />
                            <br />
                            <b>No need to use eScoring to Publish results</b><br />
                            It is not necessary to use eScoring to be able to publish results.<br />
                            Any competition can be published at any time.<br />
                            <br />
                            <b>Data is not Automatically Removed</b><br />
                            As of April 2019 the online database is 2.2% full. It will be many years before there's any need to purge old data.<br />
                        </p>
                        <p>
                            <b>Scores can be published from either of two places in the GliderScore program.</b>
                        </p>
                        <div style="height: 20px;"></div>
                        <div>
                            <asp:Image ID="Image7" runat="server" AlternateText="" margin="10px"
                                ImageAlign="Right" ImageUrl="~/ImgOnLineScores/eScoringMenu.jpg" ToolTip='' />
                            <p>
                                <b>From the eScoring menu</b><br />
                                Go to this menu, select 'Competition Status' to be 'Public'.<br />
                                Click on the 'Upload to Server' button.<br />
                                Your competition is now viewable by anybody.<br />
                                <br />
                                To make your competition 'Private', do exactly the same but with the 'Competition Status' set to 'Private'.
                            </p>
                        </div>
                        <div style="height: 20px;"></div>
                        <div>
<<<<<<< HEAD
                            <asp:Image ID="Image1" runat="server" AlternateText="" margin="10px"
=======
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                                ImageAlign="Right" ImageUrl="~/ImgOnLineScores/ScoringScreen.jpg" ToolTip='' />
                            <p>
                                <b>From the Scoring screen</b><br />
                                Click on the 'Upload' button.<br />
                                You will then see the 'Upload toServer' screen (shown below).
                            </p>
                        </div>
                        <div style="height: 20px;"></div>
                        <div>
                            <asp:Image ID="Image2" runat="server" AlternateText="" margin="10px"
                                ImageAlign="Right" ImageUrl="~/ImgOnLineScores/UploadToServer.jpg" ToolTip='' />
                            <p>
                                Select the range of rounds to upload, select 'Public' and click on 'Upload to Server'<br />
                                Your competition is now viewable by anybody.<br />
                                <br />
                                You can change the status of your competition here if needed.
                            </p>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </ContentTemplate>
    </asp:UpdatePanel>

<script type="text/javascript">

    function ClearFilter() {
        document.getElementById("CompName").value = "";
        document.getElementById("FromDate").value = "";
        document.getElementById("ToDate").value = "";
        document.getElementById("Venue").value = "";
        Populate_CompList()
    }

    function ToggleFilter() {
        if (document.getElementById("divFilters").style.display === "none") {
            document.getElementById("divFilters").style.display = "block";
            document.getElementById("btnToggleFilter").value = "Hide filter";
        }
<<<<<<< HEAD
        else {
            document.getElementById("divFilters").style.display = "none";
            document.getElementById("btnToggleFilter").value = "Show filter";
        }
    }
=======
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

</script>

</asp:Content>
