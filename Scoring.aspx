<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        Dim CtrScoringAll As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)

        If varID = "eScoring" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("eScoringHome")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("eScoringContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl("eScoring")
            ctr2.ActiveTab = tab2
            Exit Sub
        End If

        If varID = "eScoringForOrganisers" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("eScoringHome")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("eScoringContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl("eScoringForOrganisers")
            ctr2.ActiveTab = tab2
            Exit Sub
        End If


        If varID = "eScoringForOrganisersAutoDnUp" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("eScoringHome")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("eScoringContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl("eScoringForOrganisers")
            ctr2.ActiveTab = tab2
            Dim ctr3 As AjaxControlToolkit.TabContainer = tab2.FindControl("ctreScoringForOrganisers")
            Dim tab3 As AjaxControlToolkit.TabPanel = ctr3.FindControl("AutoDownloadUpload")
            ctr3.ActiveTab = tab3
            Exit Sub
        End If

        If varID = "eScoringForPilots" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("eScoringHome")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("eScoringContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl("eScoringForPilots")
            ctr2.ActiveTab = tab2
            Exit Sub
        End If

        If varID = "eScoringOtherOptions" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("eScoringHome")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("eScoringContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl("pnlEScoringOtherOptions")
            ctr2.ActiveTab = tab2
            Exit Sub
        End If

        Select Case varID
            Case "ScoreCheckF3B", "ScoreCheckF3G", "ScoreCheckF3F", "ScoreCheckF3J", "ScoreCheckF3K", "ScoreCheckF3Q", "ScoreCheckF3L", "ScoreCheckF5B", "ScoreCheckF5J", "ScoreCheckF5K", "ScoreCheckF5L", "ScoreCheckThermal", "ScoreCheckElectric", "ScoreCheckALES"
                Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(ScoringAll, AjaxControlToolkit.TabContainer)
                Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("ScoreCheck")
                Ctr1.ActiveTab = Tab1
                Exit Sub
        End Select

        If varID = "ScoringInterface" Then
            Dim PnlScoringInterface As AjaxControlToolkit.TabPanel = CtrScoringAll.FindControl("PanelScoringInterface")
            CtrScoringAll.ActiveTab = PnlScoringInterface
            Exit Sub
        End If

        If varID = "BestFlights" Then
            Dim PnlBestFlights As AjaxControlToolkit.TabPanel = CtrScoringAll.FindControl("BestFlights")
            CtrScoringAll.ActiveTab = PnlBestFlights
            Exit Sub
        End If

        Dim CtrScoringManual As AjaxControlToolkit.TabContainer = CType(ScoringManual, AjaxControlToolkit.TabContainer)

        If varID = "" Then
            Dim PnlScoringHome As AjaxControlToolkit.TabPanel = CtrScoringManual.FindControl("ScoringHome")
            CtrScoringManual.ActiveTab = PnlScoringHome
            Exit Sub
        End If

        If varID = "BuildGroup" Then
            Dim CtrPilotManagement As AjaxControlToolkit.TabContainer = CType(PilotManagementContainer, AjaxControlToolkit.TabContainer)
            Dim PnlPilotManagement As AjaxControlToolkit.TabPanel = CtrPilotManagement.FindControl("PilotManagement")
            CtrScoringManual.ActiveTab = PnlPilotManagement
            Dim PnlBuildGroup As AjaxControlToolkit.TabPanel = CtrPilotManagement.FindControl("BuildGroup")
            CtrPilotManagement.ActiveTab = PnlBuildGroup
            Exit Sub
        End If

        Dim Pnl1 As AjaxControlToolkit.TabPanel = CtrScoringManual.FindControl("ScoringScreens")
        CtrScoringManual.ActiveTab = Pnl1

        Dim container2 As AjaxControlToolkit.TabContainer = CType(ScoringByType, AjaxControlToolkit.TabContainer)
        Dim Pnl2 As AjaxControlToolkit.TabPanel

        container2.FindControl("ScoringHome").Visible = False
        container2.FindControl("ScoreByPilot").Visible = False
        container2.FindControl("PilotManagement").Visible = False
        container2.FindControl("ScoringSheets").Visible = False
        container2.FindControl("ScoringCards").Visible = False
        container2.FindControl("PilotsScoreRecord").Visible = False
        container2.FindControl("MatrixBadge").Visible = False

        container2.FindControl("ScoringF3B").Visible = (varID = "F3B")
        container2.FindControl("ScoringF3G").Visible = (varID = "F3G")
        container2.FindControl("ScoringF3F").Visible = (varID = "F3F")
        container2.FindControl("ScoringF3J").Visible = (varID = "F3J")
        container2.FindControl("ScoringF3K").Visible = (varID = "F3K")
        container2.FindControl("ScoringF3Q").Visible = (varID = "F3Q")
        container2.FindControl("ScoringF3L").Visible = (varID = "F3L")
        container2.FindControl("ScoringF5B").Visible = (varID = "F5B")
        container2.FindControl("ScoringF5J").Visible = (varID = "F5J")
        container2.FindControl("ScoringF5K").Visible = (varID = "F5K")
        container2.FindControl("ScoringF5L").Visible = (varID = "F5L")
        container2.FindControl("ScoringElectric").Visible = (varID = "Electric")
        container2.FindControl("ScoringThermal").Visible = (varID = "Thermal")
        container2.FindControl("ScoringALES").Visible = (varID = "ALES")

        Select Case varID
            Case "F3B"
                Pnl2 = container2.FindControl("ScoringF3B")
                container2.ActiveTab = Pnl2
            Case "F3G"
                Pnl2 = container2.FindControl("ScoringF3G")
                container2.ActiveTab = Pnl2
            Case "F3F"
                Pnl2 = container2.FindControl("ScoringF3F")
                container2.ActiveTab = Pnl2
            Case "F3J"
                Pnl2 = container2.FindControl("ScoringF3J")
                container2.ActiveTab = Pnl2
            Case "F3K"
                Pnl2 = container2.FindControl("ScoringF3K")
                container2.ActiveTab = Pnl2
            Case "F3Q"
                Pnl2 = container2.FindControl("ScoringF3Q")
                container2.ActiveTab = Pnl2
            Case "F3L"
                Pnl2 = container2.FindControl("ScoringF3L")
                container2.ActiveTab = Pnl2
            Case "F5B"
                Pnl2 = container2.FindControl("ScoringF5B")
                container2.ActiveTab = Pnl2
            Case "F5J"
                Pnl2 = container2.FindControl("ScoringF5J")
                container2.ActiveTab = Pnl2
            Case "F5K"
                Pnl2 = container2.FindControl("ScoringF5K")
                container2.ActiveTab = Pnl2
            Case "F5L"
                Pnl2 = container2.FindControl("ScoringF5L")
                container2.ActiveTab = Pnl2
            Case "Thermal"
                Pnl2 = container2.FindControl("ScoringThermal")
                container2.ActiveTab = Pnl2
            Case "Electric"
                Pnl2 = container2.FindControl("ScoringElectric")
                container2.ActiveTab = Pnl2
            Case "ALES"
                Pnl2 = container2.FindControl("ScoringALES")
                container2.ActiveTab = Pnl2

        End Select


    End Sub
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="ScoringAll" runat="server">
        <asp:TabPanel runat="server" ID="Scoring_All_TabPanel" HeaderText="Scoring">
            <ContentTemplate>
                <asp:TabContainer ID="ScoringManual" runat="server" ActiveTabIndex="10">
                    <asp:TabPanel runat="server" ID="ScoringHome" HeaderText="General" TabIndex="10">
                        <ContentTemplate>
                            <asp:Image ID="Image3" runat="server" Align="Right" Width="650px" padding-top="5px" Style="margin-right: 16px;"
                                ImageUrl="~/ImgScore/ScoreF3J.jpg" />
                            <h5>Scoring<br />
                                <a href="Scoring.aspx?eScoring">eScoring</a><br />
                                <a href="Scoring.aspx?ScoringInterface">Scoring Interface</a>
                            </h5>

                            <p><b>Manual</b> scoring is dealt with under this tab.</p>
                            <p><b>eScoring</b> is under the <a href="Scoring.aspx?eScoring">eScoring</a> tab.</p>
                            <p><b>Scoring Interface</b> details are under the <a href="Scoring.aspx?ScoringInterface">Scoring Interface</a> tab.</p>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <p>
                                Entering time scores couldn't be easier.<br />
                                Type 630 to enter 6 mins 30 secs (formats to 6:30).<br />
                                Type 630.3 for 6 mins 30.3 secs  (formats to 6:30.3).<br />
                                If you use a comma for decimals: Type 630,3 for 6 mins 30,3 secs (formats to 6:30,3).
                            </p>
                            <p>
                                See the Scoring Screens tab to see examples for each task.
                            </p>
                            <p>
                                <b>Best Flight Points</b><br />
                                This is a completely up to date list of the best flight points across the whole competition.<br />
                                When clicked, the list also shows all the scoring elements (time, landing, height, ...).<br />
                                For F3K, the list is for the task currently being scored.
                            </p>
                            <p>
                                <b>Re-Flights</b> group of buttons
                            </p>
                            <ul>
                                <li>Move Pilot to Another Group<br />
                                    . Pilots can be moved to any group in any round<br />
                                    . Groups with frequency or team clash issues are highlighted</li>
                                <li>Re-Fly This Group<br />
                                    . Creates a new group having the same pilots</li>
                                <li>Create a New Group<br />
                                    . Allows a new group to be built with any pilots</li>
                            </ul>
                            <p>
                                Clicking on the 'Speaker' icon opens the <a href="audio.aspx">Audio Player</a> screen.<br />
                                Clicking on the 'Clock' icon opens the <a href="Audio.aspx">Digital Timer</a> screen.<br />
                                Clicking on the 'Down/Up' icon opens the eScoring 'Auto Download/Upload' screen.<br />
                                Clicking on the 'Up arrow' icon opens the eScoring 'Upload to Server' screen.<br />
                                Clicking on the 'Down arrow' icon opens the eScoring 'Download to PC' screen.
                            </p>
                            <p>
                                Pilots with more than one score for any one round are automatically awarded their
                    best score<br />
                                Re-flights taken in a round different to the original round automatically appear
                    in the original round in the final results
                            </p>
                            <p>
                                <b>Bottom of the screen</b>
                            </p>
                            <ul>
                                <li>Delete Round and Delete Group buttons.&nbsp; Use with care</li>
                                <li>Navigation buttons - change groups with a mouse click or use these keyboard shortcuts -
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; Ctrl+Right (next group)<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; Ctrl+Left (previous group)<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; Ctrl+Home (first group)<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; Ctrl+End (last group)<br />
                                </li>
                                <li>Lock Data check box - prevents changes to data entered after entries have been checked</li>
                                <li>Score Check button - brings up a screen to show scores that are outside of specified limits.</li>
                                <li>Running Results button - preview or print a range of reports.<br />
                                    Get all the Competition Results reports without leaving the Scoring screen<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; up to the currently displayed round,<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; for the currently displayed round, or<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp; for the currently displayed group</li>
                            </ul>

                            <p>
                                <b>The latest FAI rules (including provisional rules) can be found
                                    <asp:HyperLink ID="HyperLink1"
                                        NavigateUrl="http://www.fai.org/ciam-documents"
                                        Text="here"
                                        Target="_blank"
                                        runat="server" />
                                    under 'Sporting Code'.</b>
                            </p>
                            <div>
                                <p><b>Watch the Score Entry video.</b></p>
                                <iframe width="853" height="480" src="http://www.youtube.com/embed/ZIC9JCX1y2M?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="ScoreByPilot" HeaderText="ScoreByPilot" TabIndex="20">
                        <ContentTemplate>
                            <asp:Image ID="Image17" runat="server" Style="margin-right: 16px; margin-bottom: 4px;" Width="70%" align="Right" ImageUrl="~/ImgScore/ScoreContextMenu.jpg" />
                            <asp:Image ID="Image18" runat="server" Style="margin-right: 16px;" Width="70%" align="Right" ImageUrl="~/ImgScore/Score_ByPilot.jpg" />
                            <h5>Enter/View Scores for selected Pilot</h5>
                            <p>
                                Scores can be entered (or viewed) for an individual pilot.<br />
                                Simply <b>right click</b> on the row having the pilot and select<br />
                                "Goto Scores for selected Pilot" from the context menu.<br />
                                <br />
                                This is particularly useful
                    <ul>
                        <li>to quickly review all scores entered for a particular pilot, and</li>
                        <li>to enter scores where pilots hand in their scores at the end of the day.</li>
                    </ul>
                            </p>
                            <p>
                                With F3K you are able to change the task for the round related to the current row.
                    This will change all scores for the round according to the new task even though
                    they cannot all be seen at this time.<br />
                                <br />
                                With multi-task competitions (F3B) you are able to select a pilot and then view
                    and change the scores for that pilot. You can also change the selected task while
                    still in individual pilot mode.<br />
                                <br />
                                To go back to scores by Group, <b>right click</b> on the row having the group that
                    you want to go back to and select<br />
                                "Goto Scores for selected Group" from the context menu.

                            </p>
                            <div>
                                <p><b>Watch the Score by Pilot video.</b></p>
                                <iframe width="853" height="480" src="http://www.youtube.com/embed/G0NRfC8_l5Q?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="PilotManagement" HeaderText="PilotManagement" TabIndex="30">
                        <ContentTemplate>
                            <asp:TabContainer runat="server" ID="PilotManagementContainer">
                                <asp:TabPanel runat="server" ID="MovePilot" HeaderText="Move Pilot" TabIndex="31">
                                    <ContentTemplate>
                                        <asp:Image ID="Image12" runat="server" Style="margin-right: 20px;" Align="Right" ImageUrl="~/ImgScore/ScoreMovePilot.jpg" />
                                        <h5>Move Pilot to Another Group</h5>
                                        <p>
                                            A pilot can be moved to any group provided that the move will not create a frequency
                                and/or team clash.<br />
                                            <p>
                                                This screen gives information about each group.
                                            </p>
                                            <p>
                                                To assist with this selection, the screen highlights
                                            </p>
                                            <ul>
                                                <li>Whether scores have been entered</li>
                                                <li>The number of pilots currently in each group</li>
                                                <li>Which groups have frequency clashes with the pilot</li>
                                                <li>Which groups have team clashes (if applicable) with the pilot</li>
                                            </ul>
                                            <p>
                                                To make more groups available, options are provided to allow team clashes and to
                                    ignore or change the pilot's frequency.
                                            </p>

                                            <div>
                                                <p><b>Watch the Move Pilot video.</b></p>
                                                <iframe width="853" height="480" src="http://www.youtube.com/embed/P6-Gwiy9RMc?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                            </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="ReFlyGroup" HeaderText="Re-Fly Group" TabIndex="32">
                                    <ContentTemplate>
                                        <asp:Image ID="Image13" runat="server" Style="margin-right: 20px;" Align="Right" Width="70%" ImageUrl="~/ImgScore/ScoreReFlyGroup.jpg" />
                                        <h5>Re-Fly this Group</h5>
                                        <p>
                                            An entire group can be re-flown.<br />
                                            <p>
                                                Make sure that the pilots entitled only to the re-flight score are given a zero
                                    score in the original group. The program cannot check for this.
                                            </p>
                                            <p>
                                                A new group with a re-flight number one greater (than the original re-flight number)
                                    will be created.
                                            </p>
                                            <p>
                                                Pilots will be credited with their best score out of all of their flights for the
                                    round.
                                            </p>

                                            <div>
                                                <p><b>Watch the Re-Fly Group video.</b></p>
                                                <iframe width="853" height="480" src="http://www.youtube.com/embed/EyIrS_rsXME?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                            </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="BuildGroup" HeaderText="Create New Group" TabIndex="33">
                                    <ContentTemplate>
                                        <div>
                                            <asp:Image ID="Image14" runat="server" Style="margin-right: 20px;" Align="Right" Width="70%" ImageUrl="~/ImgScore/ScoreBuildGroup.jpg" />
                                            <h5>Create a New Group</h5>
                                            <p>
                                                A completely new group can be built.
                                            </p>
                                            <p>
                                                This would normally be made up of pilots who are entitled to a re-flight, but can
                                include other pilots as well.
                                            </p>
                                            <p>
                                                Pilots can be specifically chosen or they can be randomly chosen for you by the
                                program by clicking the 'Randomly Select a Pilot' button.
                                            </p>
                                            <p>
                                                The new group will have a group number one higher than the highest group number
                                for the round.
                                            </p>
                                            <p>
                                                Pilots will be credited with their best score out of all of their flights for the
                                round.  For more details see below.
                                            </p>
                                        </div>
                                        <div>
                                            <hr />
                                            <asp:Image ID="Image24" runat="server" Style="margin-right: 20px;" Align="Right" ImageUrl="~/ImgScore/ScoreBuildGroupAddPilot.jpg" />
                                            <h5>Adding a Pilot</h5>
                                            <p>
                                                <b>Specify a Frequency for each Pilot</b><br />
                                                Frequency clashes are now allowed so each pilot must be on a separate frequency (except 2.4)
                                            </p>

                                            <p>
                                                <b>Specify Round to Receive the Re-Flight Score</b><br />
                                                Pilots can be re-flown in any round up to the current round.  Re-flight
                                scores are applied to the round specified for each pilot.
                                The round specified must be the round in which their re-flight incident occurred.
                                            </p>

                                            <p>
                                                <b>Option to Ignore a Re-Flight Score</b><br />
                                                GliderScore can optionally ignore a re-flight score for any pilot added
                                to the re-flight group to make up the numbers.<br />
                                                In this case, when adding the pilot to the group, enter 0 (zero) as the Round number.
                                This indicates that the score is to be ignored in the results.<br />
                                                Scores that are ignored appear with a line through them in the Flight Scores report.<br />
                                                If an actual round number is entered then the pilot will be given the best score out
                                of all flights having that round number.
                                            </p>
                                        </div>
                                        <div>
                                            <p><b>Watch the Create New Group video.</b></p>
                                            <iframe width="853" height="480" src="http://www.youtube.com/embed/XLr2uh1MdQM?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel15" HeaderText="Split Group" TabIndex="34">
                                    <ContentTemplate>
                                        <asp:Image ID="Image15" runat="server" Style="margin-right: 20px;" Align="Right" Width="70%" ImageUrl="~/ImgScore/ScoreSplitGroup.jpg" />
                                        <h5>Split Group - Speed and F5B only</h5>
                                        <p>
                                            The buttons for splitting groups are towards the bottom left of the screen and are
                                only available for Speed and F5B.
                                        </p>
                                        <p>
                                            Splitting groups is for cases where a round cannot be completed in consistent conditions
                                and to continue would be unfair to the remaining pilots.
                                        </p>
                                        <p>
                                            Groups are always split into two, but these groups can be split again if desired.
                                        </p>
                                        <p>
                                            Each group is scored separately.
                                        </p>
                                        <div>
                                            <p><b>Watch the Split Group video.</b></p>
                                            <iframe width="853" height="480" src="http://www.youtube.com/embed/rfIusUe6eQs?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel16" HeaderText="Retire Pilot" TabIndex="35">
                                    <ContentTemplate>
                                        <asp:Image ID="Image16" runat="server" Style="margin-right: 20px;" Align="Right" ImageUrl="~/ImgScore/ScoreRetirePilot.jpg" />
                                        <h5>Retire Pilot/s</h5>
                                        <p>
                                            If a number of pilots retire from the competition, the result can be that some groups
                                are left with very few pilots.<br />
                                            <br />
                                            The answer is to take the following steps.
                                        </p>
                                        <ul>
                                            <li>Go to the Pilot Entry screen and mark these pilots as Retired. Save these changes.</li>
                                            <li>From the Competition setup screen, adjust the Groups/Round (if necessary)
                                    <li>From the Competition setup screen, re-draw the remaining rounds</li>
                                        </ul>
                                        <p>
                                            By following this procedure
                                        </p>
                                        <ul>
                                            <li>Retired pilots are excluded from the re-draw</li>
                                            <li>The re-drawn rounds are optimised for the remaining pilots in the same way as the
                                    original draw, so fairness is maintained</li>
                                            <li>Each re-drawn group will each have (about) the same number of pilots</li>
                                        </ul>
                                        <p>Pilots who have retired can later be un-retired, and put back into the draw.</p>
                                        <div>
                                            <p><b>Watch the Retire Pilot video.</b></p>
                                            <iframe width="853" height="480" src="http://www.youtube.com/embed/3N9whIbx3-U?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <%--SCORING SCREENS--%>
                    <asp:TabPanel runat="server" ID="ScoringScreens" HeaderText="ScoringScreens" TabIndex="40">
                        <ContentTemplate>
                            <asp:TabContainer ID="ScoringByType" runat="server">
                                <asp:TabPanel runat="server" ID="ScoringF3B" HeaderText="F3B" TabIndex="41">
                                    <ContentTemplate>
                                        <asp:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="0">
                                            <asp:TabPanel runat="server" ID="ScoringDurF3B" HeaderText="Task A Duration" TabIndex="0">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image2" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreDurF3B.jpg" />
                                                    <h5>Scoring - F3B<br />
                                                        Duration (Task A)</h5>
                                                    <p>
                                                        Duration target time can be changed for any round if desired.
                                                    </p>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Time achieved</li>
                                                        <li>Landing bonus</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, these are the screens that you will see.<br />
                                                            Left image - choose the task and then the round for viewing or entering scores.<br />
                                                            Right image - the score entry screen for the thermal duration task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image44" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3Bescoring1.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="ScoringDisF3B" HeaderText="Task B Distance" TabIndex="1">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image4" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreDis.jpg" />
                                                    <h5>Scoring - F3B<br />
                                                        Distance (Task B)</h5>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Number of laps completed</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, this is the score entry screen for the distance task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image45" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3BescoringDistance.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="ScoringSpeedF3B" HeaderText="Task C Speed" TabIndex="2">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image5" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreSpd.jpg" />
                                                    <h5>Scoring - F3B<br />
                                                        Speed (Task C)</h5>
                                                    <ul>
                                                        <li>Pilots on the same frequency (except 2.4GHz) and/or team are separated in the draw
                                                order so that they are not called to fly consecutively</li>
                                                        <li>The draw order can be manually changed in the Scoring screen (after the draw is made).</li>
                                                        <li>Lowest/shortest/quickest time wins</li>
                                                        <li>Extra buttons (bottom of screen) to enable the group to be split.&nbsp; All pilots
                                                selected can be put into a new group for separate scoring</li>
                                                    </ul>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Timekeepers time</li>
                                                        <li>Second timekeepers time (if two timekeepers selected)</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, this is the score entry screen for the speed task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image46" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3BescoringSpeed.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF3G" HeaderText="F3G" TabIndex="41">
                                    <ContentTemplate>
                                        <asp:TabContainer ID="TabContainer4" runat="server" ActiveTabIndex="0">
                                            <asp:TabPanel runat="server" ID="TabPanel10" HeaderText="Task A Duration" TabIndex="0">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image85" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreDurF3G.jpg" />
                                                    <h5>Scoring - F3G<br />
                                                        Duration (Task A)</h5>
                                                    <p>
                                                        Duration target time can be changed for any round if desired.
                                                    </p>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Time achieved</li>
                                                        <li>Landing bonus</li>
                                                        <li>Height</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, these are the screens that you will see.<br />
                                                            Left image - choose the task and then the round for viewing or entering scores.<br />
                                                            Right image - the score entry screen for the thermal duration task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image86" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3Gescoring1.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="TabPanel11" HeaderText="Task B Distance" TabIndex="1">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image87" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreDis.jpg" />
                                                    <h5>Scoring - F3G<br />
                                                        Distance (Task B)</h5>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Number of laps completed</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, this is the score entry screen for the distance task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image88" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3BescoringDistance.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="TabPanel12" HeaderText="Task C Speed" TabIndex="2">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image89" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreSpd.jpg" />
                                                    <h5>Scoring - F3G<br />
                                                        Speed (Task C)</h5>
                                                    <ul>
                                                        <li>Pilots on the same frequency (except 2.4GHz) and/or team are separated in the draw
                                                order so that they are not called to fly consecutively</li>
                                                        <li>The draw order can be manually changed in the Scoring screen (after the draw is made).</li>
                                                        <li>Lowest/shortest/quickest time wins</li>
                                                        <li>Extra buttons (bottom of screen) to enable the group to be split.&nbsp; All pilots
                                                selected can be put into a new group for separate scoring</li>
                                                    </ul>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Timekeepers time</li>
                                                        <li>Second timekeepers time (if two timekeepers selected)</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, this is the score entry screen for the speed task.
                                                        </p>
                                                    </div>
                                                    <asp:Image ID="Image90" runat="server" imagewidth="300px" ImageAlign="Left" ImageUrl="~/ImgScore/F3BescoringSpeed.jpg" />
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </ContentTemplate>
                                </asp:TabPanel>



                                <asp:TabPanel runat="server" ID="ScoringF3F" HeaderText="F3F" TabIndex="42">
                                    <ContentTemplate>
                                        <asp:Image ID="Image1" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF3F.jpg" />
                                        <h5>Scoring - F3F<br />
                                            Slope Soaring Glider</h5>
                                        <ul>
                                            <li>Pilots on the same frequency (except 2.4GHz) and/or team are separated in the draw
                                    order so that they are not called to fly consecutively</li>
                                            <li>Lowest/shortest/quickest time wins</li>
                                            <li>Extra buttons (bottom of screen) to enable the group to be split.&nbsp; All pilots
                                    selected can be put into a new group for separate scoring</li>
                                        </ul>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Timekeepers time</li>
                                            <li>Second timekeepers time (if two timekeepers selected)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, this is the score entry screen for the F3F class.
                                            </p>
                                            <asp:Image ID="Image47" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3FeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF3J" HeaderText="F3J" TabIndex="43">
                                    <ContentTemplate>
                                        <asp:Image ID="Image10" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF3J.jpg" />
                                        <h5>Scoring - F3J<br />
                                            Thermal Duration Glider</h5>
                                        <p>
                                            Duration target time can be changed for any round if desired.
                                        </p>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Time achieved</li>
                                            <li>Landing bonus</li>
                                            <li>Late landing penalty (deducted from the flight score)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, this is the score entry screen for the F3J class.
                                            </p>
                                            <asp:Image ID="Image48" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3JeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF3K" HeaderText="F3K" TabIndex="44">
                                    <ContentTemplate>
                                        <div>
                                            <asp:Image ID="Image6" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF3K.jpg" />
                                            <h5>Scoring - F3K<br />
                                                Hand Launch Glider</h5>
                                            <ul>
                                                <li>Task for each round selected using buttons (if not already selected)</li>
                                                <li>If the task is changed, all scores for the Round are instantly re-calculated according
                                    to the rules of the newly selected task</li>
                                                <li>The person entering times doesn&#39;t have to know anything about how the score
                                    is calculated</li>
                                                <li>The task description shows on the Flight Score reports</li>
                                            </ul>
                                            <p>
                                                Data entry columns provided
                                            </p>
                                            <ul>
                                                <li>Up to seven flight times</li>
                                                <li>Penalty (deducted from final score)</li>
                                            </ul>
                                        </div>
                                        <div>
                                            <asp:Image ID="Image22" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF3K1.jpg" />
                                            <p>
                                                <b>Double-Click Score Entry</b><br />
                                                <br />

                                                Double-Click scoring for Task D (flight of 30 secs, then increasing by 15 secs).<br />
                                                <br />

                                                <b>Task D Example</b><br />
                                                A pilot achieves all 7 flight times. A double-click in
                            the Time7 column for that pilot enters all scores instantly.<br />
                                                Double-click on any other column and the scores to that point will be entered and
                            later scores adjusted to zero.<br />
                                                <br />
                                                Scores can be keyed in manually if desired.                           
                                            </p>
                                        </div>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for the F3K class.
                                            </p>
                                            <asp:Image ID="Image49" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3KeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF3L" HeaderText="F3L" TabIndex="45">
                                    <ContentTemplate>
                                        <asp:Image ID="Image71" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF3L.jpg" />
                                        <h5>Scoring - F3L<br />
                                            Radio Controlled Rudder/Elevator/Spoiler (RES) Gliders</h5>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Time (or times) for the duration segment.<br />
                                                For eScoring, use only one timekeeper.
                                            </li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For the F3L Class, the eScoring screen looks like this.
                                            </p>
                                            <asp:Image ID="Image72" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3LeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF3Q" HeaderText="F3Q" TabIndex="41">
                                    <ContentTemplate>
                                        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                                            <asp:TabPanel runat="server" ID="TabPanel2" HeaderText="F3Q Duration" TabIndex="0">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image27" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 32px;" Align="Right" ImageUrl="~/ImgScore/ScoreDurF3Q.jpg" />
                                                    <h5>Scoring - F3Q<br />
                                                        Duration</h5>
                                                    <p>
                                                        Duration target time can be changed for any round if desired.
                                                    </p>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Time achieved</li>
                                                        <li>Landing bonus</li>
                                                        <li>Penalty F3Q (deducted from normalised score)</li>
                                                        <li>Safety Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, these are score entry screens for the F3Q Duration task.
                                                        </p>
                                                        <asp:Image ID="Image50" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3QeScoringThml.jpg" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>

                                            <asp:TabPanel runat="server" ID="TabPanel4" HeaderText="F3Q Speed" TabIndex="2">
                                                <ContentTemplate>
                                                    <asp:Image ID="Image30" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 32px;" Align="Right" ImageUrl="~/ImgScore/ScoreSpdF3Q.jpg" />
                                                    <h5>Scoring - F3Q<br />
                                                        Speed</h5>
                                                    <ul>
                                                        <li>Pilots on the same frequency (except 2.4GHz) and/or team are separated in the draw
                                                order so that they are not called to fly consecutively</li>
                                                        <li>The draw order can be manually changed in the Scoring screen (after the draw is made).</li>
                                                        <li>Lowest/shortest/quickest time wins</li>
                                                        <li>Extra buttons (bottom of screen) to enable the group to be split.&nbsp; All pilots
                                                selected can be put into a new group for separate scoring</li>
                                                    </ul>
                                                    <p>
                                                        Data entry columns provided
                                                    </p>
                                                    <ul>
                                                        <li>Timekeepers time</li>
                                                        <li>Second timekeepers time (if two timekeepers selected)</li>
                                                        <li>Penalty (deducted from final score)</li>
                                                    </ul>
                                                    <br />
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            For eScoring, these are score entry screens for the F3Q Speed task.
                                                        </p>
                                                        <asp:Image ID="Image51" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3QeScoringSpd.jpg" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF5B" HeaderText="F5B" TabIndex="45">
                                    <ContentTemplate>
                                        <asp:Image ID="Image7" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5b.jpg" />
                                        <h5>Scoring - F5B<br />
                                            Electric Powered Motor Glider</h5>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Laps completed</li>
                                            <li>Laps penalty</li>
                                            <li>Time for the duration segment</li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Motor Run for the duration segment</li>
                                            <li>Watt-min used for the entire flight</li>
                                            <li>Safety Penalty (deducted from final score)</li>
                                        </ul>
                                        <p>
                                            The pilot on the first row has
                                        </p>
                                        <ul>
                                            <li>25 laps (10 points per lap) = 250 points</li>
                                            <li>Laps penalty = -30 points</li>
                                            <li>Time of 9:58 = 598 points</li>
                                            <li>30 metre landing = 10 points</li>
                                            <li>Motor run of 3 seconds = -9 points</li>
                                            <li>Excess watt-min used of 50 watt-min = -16 points</li>
                                        </ul>
                                        <p>This gives the total of 803 points.</p>

                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for the F5B class.
                                            </p>
                                            <asp:Image ID="Image52" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F5BeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF5J" HeaderText="F5J" TabIndex="46">
                                    <ContentTemplate>
                                        <asp:Image ID="Image21" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5J.jpg" />
                                        <h5>Scoring - F5J<br />
                                            Thermal Duration Gliders with Electric Motor and Altimeter/Motor Run Timer</h5>
                                        <p>
                                            Duration target time can be changed for any round if desired.
                                        </p>
                                        <p><b>The official rules about Motor Restart will change from 1 January 2023.</b><br />
                                        - Motor Restart is <b>not allowed</b> in Category 1 events (World and European championships).<br />
                                        - Motor Restart is <b>allowed</b> at other events however the resulting zero score cannot be dropped.<br />
                                        GliderScore provides a third option.<br />
                                        - Motor Restart is <b>allowed</b> and the resulting zero can be dropped.
                        </p>

                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Time (or times) for the duration element</li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Height, as the basis for calculating the height penalty</li>
                                            <li>Safety penalty (deducted from final score)</li>
                                            <li>Landing over 75m column to indicate and out-landing.</li>
                                            <li>An additional checkbox column is provided when Motor Restart is allowed.</li>
                                        </ul>
                                        <p>
                                            Under F5J rules it is not practically possible to achieve the full target flight time.<br />
                                            However, overflying the target flight time means loss of all landing bonus points.<br />
                                            <br />
                                            From Version 6.52 GliderScore will not allow entry of a flight time that is equal to or greater than the target time.<br />
                                            If a pilot overflies the target time, the scorer must make sure that no landing points are awarded.<br />
                                            If a time or landing is entered for a pilot, the progam ensures that a height is also entered.<br />
                                        </p>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for the F5J class.<br />
                                                An additional checkbox is provided if Motor Restart is allowed.
                                            </p>
                                            <asp:Image ID="Image53" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F5JeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>


                                <asp:TabPanel runat="server" ID="ScoringF5K" HeaderText="F5K" TabIndex="46">
                                    <ContentTemplate>
                                        <div>

                                            <h5>Scoring - F5K and F5K2024<br />
                                                Thermal Duration Gliders for Multiple Task Competition with Electric Motor and Altimeter/Motor Run Timer (AMRT)</h5>
                                        </div>
                                        <div>
                                            <asp:Image ID="Image75" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5K.jpg" />

                                            <p>
                                                F5K is different to all other classes when it comes to score data entry.<br />
                                                This is the summary screen that shows one row for each pilot..<br />
                                                The columns for Flight 1, Flight 2, etc show the points for each flight.<br />
                                                Then you have the total points and the (normalised) score.<br />
                                                You cannot make any changes to the scoring data in this screen.
                                                <br />
                                                To make changes, go to the F5K Data Entry form (see below).<br />
                                                <br />
                                                You can change the F5K Task for the round.<br />
                                                You can change the Nominal launch height. This change will apply to the current round and all later rounds.<br />
                                                <br />
                                                Flight data is entered on the F5K DataEntry screen (see below).<br />
                                            </p>
                                            <hr />
                                        </div>
                                        <div>
                                            <asp:Image ID="Image77" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5K1.jpg" />

                                            <p>
                                                <b>Open the F5K DataEntry screen by clicking (or pressing Enter) on any pilot row.</b><br />
                                                <br />

                                                <b>This is the F5K data entry screen.</b><br />
                                                See below for the F5K2024 data entry screen.<br />
                                                From the main scoring screen (see above), access the F5K data entry screen by clicking on the pilot's row or<br />
                                                by selecting the pilot row (using the arrow keys) and hitting the Enter key.<br />
                                                <br />
                                                <p>
                                                    Once in the F5KDataEntry form, navigate to any pilot's score data by using the Next and Previous buttons or<br />
                                                    use [Ctrl]+[Right] and [Ctrl]+[Left] to move through the pilot records.<br />
                                                    Use [Ctrl]+[S] to Save and [Ctrl]+[C] to Cancel.
                                                </p>
                                            </p>
                                        </div>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>ModelID - column provided if the 'UseModels?' option is selected.</li>
                                            <li>Flight Time (enter as mmss with no punctuation).</li>
                                            <li>Height in whole metres as shown on the AMRT device.</li>
                                            <li>Out of Pilot Area checkbox - to indicate that a landing was outside of the pilot area.</li>
                                            <li>Nbr of Flights Penalty - column shown if it applies to the Task. This penalty is entered automatically.</li>
                                            <li>Flight Penalty - enter any Flight Penalties as defined in the rules.</li>
                                            <li>Zero Round - tick the box if an infringement results in a zero round score as defined in the rules.</li>
                                        </ul>
                                        <p>
                                            Under F5K rules it is not practically possible to achieve the full target flight time for all Tasks.<br />
                                            For most tasks the maximum allowable total time is 9 minutes 59 seconds.<br />
                                            For Task C the maximum allowable flight time is 4 minutes.<br />
                                            GliderScore will alert the user if score data is entered that exceeds the maximum time limits.                                            
                                        </p>
                                            <asp:Image ID="Image84" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5K2024.jpg" />
                                        <p><b>This is the F5K2024 data entry screen</b> and most of it is self explanatory.<br />
                                            To change values in the 'Out of Pilot Area' and 'Overfly Window' columns you must click in these columns.
                                            Clicking will toggle between a zero value and the applicable penalty value.
                                        </p>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are typical score entry screens for the F5K class.
                                            </p>
                                            <asp:Image ID="Image76" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F5KeScoring0.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="ScoringF5L" HeaderText="F5L" TabIndex="45">
                                    <ContentTemplate>
                                        <asp:Image ID="Image80" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreF5L.jpg" />
                                        <h5>Scoring - F5L<br />
                                            Radio ControllerThermal Gliders RES with Electric Motor and AMRT</h5>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Time (or times) for the duration segment.<br />
                                                For eScoring, use only one timekeeper.
                                            </li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For the F5L Class, the eScoring screen looks like this.
                                            </p>
                                            <asp:Image ID="Image83" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/F3LeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>


                                <asp:TabPanel runat="server" ID="ScoringThermal" HeaderText="Thermal" TabIndex="47">
                                    <ContentTemplate>
                                        <asp:Image ID="Image8" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreThermal.jpg" />
                                        <h5>Scoring - Thermal Glider</h5>
                                        <p>
                                            Duration target time can be changed for any round if desired.
                                        </p>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Time (or times) for the duration segment</li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <p>
                                            Unlike F3J, there is no column for a Late Landing penalty.
                                        </p>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for a Thermal Duration competition.
                                            </p>
                                            <asp:Image ID="Image54" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/ThermaleScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="ScoringElectric" HeaderText="Electric" TabIndex="48">
                                    <ContentTemplate>
                                        <asp:Image ID="Image11" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreElectric.jpg" />
                                        <h5>Scoring - Electric Glider</h5>
                                        <p>
                                            Duration target time can be changed for any round if desired.
                                        </p>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Flight time (or times)</li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Motor run (deducted from the flight score)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <p>
                                            Unlike F5B, there is no column for Laps.
                                        </p>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for an Electric Thermal Duration competition.
                                            </p>
                                            <asp:Image ID="Image55" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/ElectriceScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="ScoringALES" HeaderText="ALES" TabIndex="48">
                                    <ContentTemplate>
                                        <asp:Image ID="Image23" runat="server" Width="70%" Style="margin-left: 4px; margin-right: 28px;" Align="Right" ImageUrl="~/ImgScore/ScoreALES.jpg" />
                                        <h5>Scoring - Altitude Limited Electric Soaring</h5>
                                        <p>
                                            Duration target time can be changed for any round if desired.
                                        </p>
                                        <p>
                                            Data entry columns provided
                                        </p>
                                        <ul>
                                            <li>Flight time (or times)</li>
                                            <li>Landing achievement (either distance or points, according to how the landing bonus
                                    table has been set up)</li>
                                            <li>Penalty (deducted from final score)</li>
                                        </ul>
                                        <p>
                                            In this example, GroupScore based on Time has been selected.
                                        </p>
                                        <br />
                                        <div>
                                            <hr />
                                            <p>
                                                For eScoring, these are score entry screens for an Electric Thermal Duration competition.
                                            </p>
                                            <asp:Image ID="Image56" runat="server" imagewidth="300px" float="right" ImageUrl="~/ImgScore/ALESeScoring.jpg" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="ScoringSheets" HeaderText="ScoreSheets" TabIndex="50">
                        <ContentTemplate>
                            <asp:Image ID="Image9" runat="server" ImageAlign="Right" Style="margin-right: 16px;" ImageUrl="~/ImgRpts/RptScoringSheets.jpg" />
                            <h5>Scoring - Score Sheets (by Task)</h5>
                            <p>
                                From the <b>Reports Menu</b> you can produce score sheets <b>similar</b> to this one.<br />
                                <br />
                                Score sheets are specific to each task and have exactly the columns needed
                    to record the flight details as required for entry into the Scoring screen.
                            </p>
                            <p>
                                Pilots are listed in exactly the same order as they appear on the Scoring screen.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="ScoringCards" HeaderText="ScoreCards" TabIndex="50">
                        <ContentTemplate>
                            <asp:Image ID="Image19" runat="server" ImageAlign="Right" Style="margin-right: 16px;" ImageUrl="~/ImgDraw/DrawDurScoreCards.jpg" />
                            <h5>Scoring - Score Cards</h5>
                            <p>
                                From the <b>Reports Menu</b> you can print score cards similar to these.<br />
                                Both blank and pre-filled score cards can be printed for all duration tasks.
                            </p>
                            <ul>
                                <li>F3J</li>
                                <li>Open Thermal</li>
                                <li>Electric Thermal</li>
                                <li>F3B Duration Task A</li>
                                <li>F3K HLG/DLG</li>
                                <li>F3Q Aero Tow Glider</li>
                                <li>F5B</li>
                                <li>F5J</li>
                                <li>F5K</li>
                                <li>F5K2024</li>
                            </ul>
                            <p>
                                See the Draw Rounds → Score Cards tab for more details.
                            </p>
                            <p>
                                It is also possible to have QR Encoded Score Cards.</br>
                                Click <a href="DrawRounds.aspx?QRCodedScoreCards">here</a> to see QRCoded Score Cards.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="PilotsScoreRecord" HeaderText="ScoreRecord" TabIndex="50">
                        <ContentTemplate>
                            <asp:Image ID="Image20" runat="server" ImageAlign="Right" Style="margin-left: 4px; margin-right: 16px;" ImageUrl="~/ImgDraw/DrawPilotsScoreRecord.jpg" />
                            <h5>Scoring - Score Record</h5>
                            <p>
                                From the <b>Reports Menu → Score Record</b> you can print Score Record cards
                    similar to these.<br />
                                <br />
                                The Record cards can be printed for all duration tasks.
                            </p>
                            <ul>
                                <li>F3J</li>
                                <li>Open Thermal</li>
                                <li>Electric Thermal</li>
                                <li>F3B Duration Task A</li>
                                <li>F3K HLG/DLG</li>
                                <li>F3Q Aero Tow Glider</li>
                                <li>F5B</li>
                                <li>F5J</li>
                                <li>F5K</li>
                                <li>F5K2024</li>
                            </ul>
                            <p>
                                The Record cards are in a standard format that allows pilots to keep a record of
                    their flight scores. They can be used to check against the scores that are entered.<br />
                                <br />
                                The Record cards are 'pre-filled' and will show round and group numbers if the draw
                    has been completed.<br />
                                <br />
                                If the Score Record is printed after scores have been entered, the Score Record
                                will show the scores for each flight together with the normalised score.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="MatrixBadge" HeaderText="MatrixBadge" TabIndex="50">
                        <ContentTemplate>
                            <asp:Image ID="Image25" runat="server" ImageAlign="Right" Style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" ImageUrl="~/ImgDraw/DrawMatrixBadgePrint.jpg" />
                            <asp:Image ID="Image26" runat="server" ImageAlign="Right" Style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" ImageUrl="~/ImgDraw/DrawMatrixBadgePrintout.jpg" />

                            <h5>Scoring - Matrix Badge</h5>
                            <p>
                                From the <b>Reports Menu → Matrix Badges</b></br>
                    Print a separate badge for each pilot.</br>
                    Each badge has a table showing, for each round of the draw, the pilot's flight group.</br>
                    The badges are sized so that they easily slip into a holder similar to a name badge holder.</br>
                    The badges print 10 on each A4 page. Up to 24 rounds can be printed per badge.
                            </p>

                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="QRCodeList" HeaderText="QRCodeList" TabIndex="50">
                        <ContentTemplate>
                            <asp:Image ID="Image73" runat="server" ImageAlign="Right" Style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" ImageUrl="~/ImgDraw/QRCodeList.jpg" />
                            <h5>Reports - QR Code List</h5>
                            <p>
                                From the <b>Reports Menu</b> you can print a QR Code List similar to this one.<br />
                                <br />
                                Scanning the QR Code with a smartphone establishes connection to the eScoring system.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>



            </ContentTemplate>
        </asp:TabPanel>

        <%--        eScoring--%>
        <asp:TabPanel runat="server" ID="eScoringHome" HeaderText="eScoring">
            <ContentTemplate>
                <asp:TabContainer runat="server" ID="eScoringContainer">
                    <%--                    eScoring Home--%>
                    <asp:TabPanel runat="server" ID="eScoring" HeaderText="eScoring">
                        <ContentTemplate>
                            <div>
                                <h5>eScoring</h5>
                                <p><i>Always use the latest version of GliderScore for eScoring.</i></p>
                            </div>
                            <div>
                                <p>
                                    GliderScore provides for remote score input by smartphone.<br />
                                    <br />
                                    Here is how it works
                                </p>
                            </div>
                            <div>
                                <asp:Image ID="Image31" runat="server" ImageAlign="Left"
                                    Imagewidth="400px" padding-top="5px" margin="10px" left="20px"
                                    ImageUrl="~/ImgEScoring/Sketch.png" />
                            </div>
                            <div>
                                <p><b>Here is a short video contributed by Mike Vos that explains eScoring very well.</b></p>
                                <%--                                <iframe width="853" height="480" src="http://www.youtube.com/embed/v=IFHQGQzy36I?rel=0" frameborder="0"></iframe>--%>
                                <%--                                <iframe width="853" height="480" src="https://www.youtube.com/embed/IFHQGQzy36I" frameborder="0" allowfullscreen></iframe>--%>
                                <iframe width="853" height="480" src="https://www.youtube.com/embed/IFHQGQzy36I?rel=0" frameborder="0" allowfullscreen="true"></iframe>
                            </div>
                            <div>
                                <br />
                                <ul>
                                    <li>The competition is created on the PC.</li>
                                    <li>Data is sent from the PC to the GliderScore server.</li>
                                    <li>Pilots access their data  from the server and enter scores.</li>
                                    <li>When a pilot taps 'Submit', their score is sent to the server.</li>
                                    <li>The scorekeeper downloads scores from the server to the PC.</li>
                                    <li>Score calculations happen automatically.</li>
                                    <li>When all scores are in for a round, the scorekeeper re-uploads the data.</li>
                                    <li>This puts up-to-date results onto the server.</li>
                                    <li>The pilots can now see their current ranking and scores.</li>
                                </ul>
                                <br />
                                <p><b>There is no direct connection between the PC and the phones.</b></p>
                                <ul>
                                    <li>The PC sends to the GliderScore server and receives from the GliderScore server.</li>
                                    <li>The phones send to the GliderScore server and receive from the GliderScore server.</li>
                                </ul>

                            </div>
                            <div>
                                <p><b>Why use this system?</b></p>
                                <ul>
                                    <li>Reduced chance of errors from poor writing.</li>
                                    <li>The QRCode has to be scanned only once.</li>
                                    <li>Pilots/officials can enter scores at the landing spots.<br />
                                        Memory lapse errors are eliminated.</li>
                                    <li>No more time wasting trips along the flight line to submit scores.</li>
                                    <li>Fewer delays from gathering scores. Entry is quick and easy.</li>
                                    <li>Built in checks to ensure validity.</li>
                                    <li>Can continue with manual scoring if all else fails.</li>
                                    <li>Pilots can review their scores on their phones.</li>
                                </ul>
                                <p>
                                    <b>Available for all glider competitions.</b><br />
                                    F3B&nbsp&nbsp F3F&nbsp&nbsp F3K&nbsp&nbsp F3J&nbsp&nbsp F3Q&nbsp&nbsp F5B&nbsp&nbsp F5J&nbsp&nbsp Thermal&nbsp&nbsp Electric
                                </p>
                                <p>
                                    <b>As organiser, you will take these steps. More details in following tabs.</b>
                                </p>
                                <ul>
                                    <li>Make sure that the flying field has good mobile/cell phone coverage.<br />
                                        If coverage is poor for some ISPs, you might have to establish a wifi hotspot.
                                    </li>
                                    <li>Create the competition and the draw as usual.<br />
                                        Make sure that all the scoring parameters are set correctly.<br />
                                        These parameters will be uploaded.
                                    </li>
                                    <li>Make sure that the QRCode Setup is correct for eScoring.<br />
                                        You only have to do this once.
                                    </li>
                                    <li>Print the Score Record cards.<br />
                                        These provide a QRCode that, when scanned, connects pilot to the server.
                                    </li>
                                    <li>Upload the data to the server.</li>
                                    <li>Download scores once the competition gets under way.</li>
                                    <li>Check for missing scores.</li>
                                    <li>Publish results.</li>
                                </ul>
                                <p><b>Go to the <a href="Scoring.aspx?eScoringForOrganisers">For Organisers</a> tab for more detailed information.</b></p>
                                <br />
                                <p><b>As a pilot, you will</b></p>
                                <ul>
                                    <li>Bring a smartphone to the competition.<br />
                                        The phone must have a QRCode scanning app installed.<br />

                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>Android phones</b><br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - QR Droid is very good.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>iPhones</b><br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - You can use the built in feature of the iPhone camera.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>Chrome for IOS</b> sounds good.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp It has a built in QR scanner and tabs that should make<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp handling multiple pilots on the one phone very easy.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>Opera Mini for IOS</b> sounds good.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp It also has a built in QR scanner (button is in the address bar).<br />


                                        <%--    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>QR Droid</b> is a good one for Android phones.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>iPhones</b> come with a built in scanner. This could be used.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>Chrome for IOS</b> sounds good for iPhones.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp It has a built in QR scanner and tabs that should make<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp handling multiple pilots on the one phone very easy.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp - <b>Opera Mini for IOS</b> also sounds good for iPhones.<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp It also has a built in QR scanner (button is in the<br />
                                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp address bar).<br />--%>


                                        <li>Scan the QRCode that is on your Score Record.<br />
                                            This logs you in to the server and loads your master scoring page in your web browser.<br />
                                            This web page takes you to an individual scoring page for each flight.<br />
                                        </li>
                                        <li>After each flight<br />
                                            Write your score details on your Score Record.<br />
                                            Enter your scores on the phone and press 'Submit'.</li>
                                    </li>
                                </ul>
                                <p><b>Go to the <a href="Scoring.aspx?eScoringForPilots">For Pilots</a> tab for more detailed information.</b></p>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>










                    <%--                    eScoring For Organisers--%>
                    <asp:TabPanel runat="server" ID="eScoringForOrganisers" HeaderText="For Organisers">
                        <ContentTemplate>
                            <asp:TabContainer ID="ctrEScoringForOrganisers" runat="server">
                                <asp:TabPanel runat="server" ID="tabEScoringForOrganisers" HeaderText="For Organisers">
                                    <ContentTemplate>
                                        <h5>eScoring for Organisers</h5>
                                        <div>
                                            <p>
                                                Here is everything that you need to know as an organiser.<br />
                                                <br />
                                                <div>
                                                    <asp:Image ID="Image79" runat="server"
                                                        Style="float: right; width: 600px; padding-right: 25px; padding-bottom :5px"
                                                        ImageUrl="~/ImgEScoring/eScoringOptions.jpg" />

                                                    <p>The top half of this menu is for normal use.<br />
                                                        <br />
                                                        There are two ways of collecting and publishing score data.<br />
                                                        <br />
                                                        The automatic method and the manual Download and Upload methods.<br />
                                                        <br />
                                                        Click on the tabs to learn more about these methods.<br />
                                                        <br />
                                                        'View Missing Scores' creates a report showing pilots who need to submit scores.<br />
                                                        <br />
                                                        Score Records can be viewed or printed from this screen.<br />
                                                        <br />
                                                        To learn about the other items click on the 'Other Options' tab.<br />

                                                    </p>

                                                </div>

                                                <p>
                                                    <br />
                                                    I will not go over the steps for setting up a competition, but<br />
                                                    it is particularly important to have all your scoring parameters set<br />
                                                    before taking the next steps. The scoring parameters are uploaded!<br />
                                                    <br />
                                                    <b>To create a backup system.</b><br />
                                                    The easiest way to do this is to make a copy of the entire C:\GliderScore6 folder on a USB stick.<br />
                                                    If the main computer fails, use the USB stick to copy the entire C:\GliderScore6 folder to another PC.<br />
                                                    Then open the competition and download all scores from the server.<br />
                                                    <br />
                                                    You cannot create a backup system by exporting the competition and importing to another PC.<br />
                                                    On import, the competition gets a new Competition ID and will not work with the data on the server.<br />
                                                    <br />

                                                    Hint: If a pilot gets confused by the system, have him re-scan his QRCode<br />
                                                    and start again. This will totally refresh his data from the server.<br />
                                                    <br />
                                                    <b>These are the steps before uploading.</b><br />
                                                    <br />
                                                    Of course the draw needs to have been completed in its final form.<br />
                                                    <br />
                                                </p>
                                            <ul>
                                                <li>Set the target time.</li>
                                                <li>Set the timing decimal places.</li>
                                                <li>Set the group score decimal places.</li>
                                                <li>Set the landing table to be used.</li>
                                                <li>Set the Flight Score Deduction:<br />
                                                    &nbsp&nbsp&nbsp&nbsp&nbsp None; Late Landing; Motor Run; Height Penalty</li>
                                                <li>Configure the QRCode for eScoring (see section below)</li>
                                                <li>Go to the Reports Menu and print the Score Records (see section below)</li>
                                            </ul>
                                            <p>
                                                This data is all uploaded and is needed by the system.<br />
                                                <br />
                                            </p>
                                            <p><b>Click on the 'Auto Download/Upload' tab to learn about automating the eScoring system.</b><br />
                                            <b>Click on the 'Manual Download/Upload' tab to learn how to do it all manually.</b></p>
                                        </div>
                                        <div>
                                            <hr />
                                            <p>
                                                <b>Configure the QRCode for eScoring</b>
                                            </p>
                                            <asp:Image ID="Image33" runat="server"
                                                Style="float: right; width: 600px; padding-right: 25px"
                                                ImageUrl="~/ImgEScoring/QRCodeSetup.jpg" />
                                            <p>
                                                Access this QRCode Setup screen from the Main Menu.<br />
                                                <br />
                                                Click on the green 'Reset for eScoring' button.<br />
                                                Click on the 'Save' button.<br />
                                                <br />
                                                This step is now complete.<br />
                                                It never has to be done again.
                                            </p>
                                        </div>
                                        <div>
                                            <hr />
                                            <p>
                                                <b>Go to the Reports Menu and print the Score Records</b>
                                            </p>
                                            <asp:Image ID="Image29" runat="server"
                                                Style="float: right; width: 400px; padding-right: 25px"
                                                ImageUrl="~/ImgEScoring/ReportsMenuScoreRecordsButton.jpg" />
                                            <p>
                                                Click on the 'Score Records' button.<br />
                                            </p>
                                            <p>You can also print the 'Score Records' from the eScoring page.</p>
                                        </div>
                                        <div>
                                            <hr />
                                            <p>
                                                <b>Now you will see this screen</b>
                                            </p>
                                            <asp:Image ID="Image34" runat="server"
                                                Style="float: right; width: 400px; padding-right: 25px"
                                                ImageUrl="~/ImgEScoring/ScoreRecordsPrintSelections.jpg" />
                                            <p>
                                                Select to print QRCodes.<br />
                                                <br />
                                                You can also check on the QRCode Setup here.
                                            </p>
                                        </div>
                                        <div>
                                            <hr />
                                            <p>
                                                <b>The Score Records will look like this</b>
                                            </p>
                                            <asp:Image ID="Image35" runat="server"
                                                Style="float: right; width: 400px; padding-right: 25px"
                                                ImageUrl="~/ImgEScoring/ScoreRecordPrintExample.jpg" />
                                            <p>
                                                The columns that print depend on your competition setup.<br />
                                                <br />
                                                The URL encoded in the QRCode is written out in full.<br />
                                                You can type this into a browser window and it will all work.
                                            </p>
                                            <p>
                                                The Score Records will print four to a page for up to 10 rounds drawn.<br />
                                                The print will be two to a page if more than 10 rounds are drawn.
                                            </p>
                                            <p>
                                                The Score Records are now ready to be handed out to pilots.
                                            </p>
                                        </div>
                                        <div>
                                            <p><b>Click on the 'Manual Upload' tab after you have finished reading this page.</b></p>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                                                <%--                                AUTO DOWNLOAD/UPLOAD--%>
                                <asp:TabPanel runat="server" ID="AutoDownloadUpload" HeaderText="Auto Download/Upload">
                                    <ContentTemplate>
                                        <h5>Automatic Download/Upload</h5>
                                        <p>
                                            This feature automates the manual eScoring downloads and uploads by running both at a pre-set time interval.<br /><br />
                                            It frees up a huge amount of time for the CD when combined with eScoring and the Digital Timer.<br />
                                            The CD's scoring duty is reduced to following up any pilots who have not submitted their scores.<br />
                                            The CD can do this during any spare time. The rest of the time is available for managing the competition.
                                            <br />
                                        </p>
                                        <p><b>How does it work?</b></p>
                                        <ul>
                                            <li>Set the 'Competition Status' to Private or Public.</li>
                                            <li>Choose  a time interval from the 'Repeat cycle every' drop down box.</li>
                                            <li>Click on Start to begin the process. The Start button becomes the Cancel button.<br />
                                                The download/upload process will begin immediately.
                                            </li>
                                            <li>The 'Pilots with Missing Scores' table is updated after every download.<br />
                                                Hint: Put a tick against retired pilots so that you do not ask them  for scores.</li>
                                            <li>The last flight group with scores submitted is shown below the words 'Pilots with Missing Scores'.</li>
                                            <li>No work can be done within GliderScore while Automatic Download/Upload screen remains open.<br />
                                                Close the screen, do whatever needs to be done and then re-start the process.</li>
                                        </ul>
                                        <p><b>What about Re-flights?</b></p>
                                            <ul>
                                                <li style="list-style: none">If a pilot is granted a re-flight he must be moved from his original flight group to his re-flight group.</li>
                                                <li>Close the Automatic Download/Upload screen.</li>
                                                <li>In the Scoring screen, move the pilot to his re-flight group ('Move Pilot to Another Group' button).</li>
                                            </ul>
                                            <ul>
                                                <li style="list-style: none">There are two methods that can be used to update the re-flight scoring data.</li>
                                                <li>The pilot submits his score card to the CD. The re-flight details are manually entered on the computer.<br />
                                                <li>If the change to flight groups is uploaded in time, the pilot can submit scores using the eScoring (phone) method.<br /></li>
                                            </ul>
                                                                                      
                                        
                                        <p>
                                            <b>What will stop the process?</b><br />
                                            The process will stop if a score is downloaded and there is no corresponding entry in the Scores table.<br />
                                            This can happen if a pilot is moved to another group and the online database is not updated (by running an upload).<br />
                                            If this happens a special screen displays with all of the scoring data. This must be handled manually.
                                        </p>
                                        <p>Shown below is the Automatic Download/Upload screen.</p>
                                        <p>See further below for the two ways to open this screen.</p>

                                        <div>
                                            <asp:Image ID="Image82" runat="server"
                                                Style="float: left; width: 95%; padding-right: 25px; padding-top: 5px; padding-bottom: 5px"
                                                ImageUrl="~/ImgOnLineScores/AutoDownloadUploadV6.66.jpg" />
                                        </div>

                                        <div style="position:relative; top:30px;">
                                        <p>
                                            
                                            The Automatic Download/Upload screen can be accessed from the eScoring menu (left) or from the Scoring screen (right).<br />
                                              </p>
                                        <asp:Image ID="Image78" runat="server"
                                            Style="float: left; width: 400px; padding-right: 25px; padding-top: 5px; padding-bottom: 5px"
                                            ImageUrl="~/ImgOnLineScores/eScoringMenuV6.66.jpg" />

                                        <asp:Image ID="Image81" runat="server"
                                            Style="float: left; width: 400px; padding-right: 25px; padding-top: 5px; padding-bottom: 5px"
                                            ImageUrl="~/ImgOnLineScores/ScoringScreenV6.66.jpg" />

                                            </div>
                                        &nbsp&nbsp&nbsp&nbsp&nbsp
                                        <hr />
                                      
                                        




                                    </ContentTemplate>
                                </asp:TabPanel>




                                <asp:TabPanel runat="server" ID="TabPanel9" HeaderText="Manual Download/Upload">
                                    <ContentTemplate>
                                        <asp:TabContainer ID="TabContainer2" runat="server">
                                            <%--                                MANUAL UPLOAD--%>
                                            <asp:TabPanel runat="server" ID="TabPanel6" HeaderText="Manual Upload">
                                                <ContentTemplate>
                                                    <h5>Upload Data</h5>
                                                    <div>
                                                        <ul>
                                                            <li>You can upload data as many times as it takes to get the right data on to the server.</li>
                                                            <li>You can re-upload after downloading scores.<br />
                                                                The data from scores entered will also be re-uploaded.</li>
                                                            <li>You might want to re-upload if scores have been changed on the PC after downloading.<br />
                                                                This will make the scores on the server identical to the official scores on the PC.</li>
                                                            <li>You cannot re-upload data if there are scores on the server that have not been downloaded.<br />
                                                                That would risk loss of data. These un-downloaded scores must be downloaded first.</li>
                                                            <li>Each competition has a unique CompID code. This keeps every competition separate on the server.</li>
                                                            <li>Each competition can be Private or Public. If Public, the results and scores will be viewable on the<br />
                                                                GliderScore website.
                                                            </li>
                                                            <li>The QRCode encodes the website URL, the CompID and the (GliderScore internal) pilot number.<br />
                                                                With this data, the system is able to find everything it needs on the server.</li>
                                                        </ul>
                                                    </div>
                                                    <div>
                                                        <p>
                                                            <b>Upload from the eScoring menu</b><br />
                                                            (see also Upload from the Scoring screen, below)
                                                        </p>
                                                        <asp:Image ID="eScoringMenu" runat="server"
                                                            Style="float: right; width: 400px; padding-right: 25px"
                                                            ImageUrl="~/ImgEScoring/eScoringMenu.jpg" />
                                                        <p>
                                                            Click on the 'Upload to Server' button.<br />
                                                            You will be able to select a range of rounds to upload.<br />
                                                            Normally this will be for all rounds.<br />
                                                            <br />
                                                            If you want your results and scores viewable on the GliderScore<br />
                                                            website, make the Competition Status = Public when uploading.<br />
                                                            You can change the Competition Status by uploading with a different Status.<br />
                                                            <br />
                                                            The upload is much more that just the draw.<br />
                                                            A lot of other information about your competition is<br />
                                                            also uploaded for validation purposes.<br />
                                                            This includes the landing table.<br />
                                                            <br />
                                                            It is highly recommended to use a landing table with no more than 50 line entries.
                                                        </p>
                                                    </div>
                                                    <br />

                                                    <div>
                                                        <p><b>Upload from the Scoring screen</b></p>
                                                        <asp:Image ID="Image57" runat="server"
                                                            Style="float: right; width: 400px; padding-right: 25px"
                                                            ImageUrl="~/ImgEScoring/UploadToServer.jpg" />
                                                        <p>
                                                            Click the Upload icon in the Scoring screen to upload data.<br />
                                                            <br />
                                                            Very useful when posting progressive results at the end of each round.<br />
                                                            <br />
                                                            You can perform most functions without ever leaving the Scoring screen.<br />
                                                            <br />
                                                            If the Competition Status was set to 'Public', all uploads will also be Public<br />
                                                            until changed in the eScoring screen.
                                                        </p>
                                                    </div>
                                                    <p><b>Click on the 'Download to PC' tab after you have read this page.</b></p>

                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <%--                             MANUAL DOWNLOAD--%>
                                            <asp:TabPanel runat="server" ID="TabPanel7" HeaderText="Manual Download">
                                                <ContentTemplate>
                                                    <h5>Download to PC</h5>
                                                    <div>
                                                        <p>
                                                            Download data as frequently as you like.<br />
                                                            <br />
                                                            All scores within the range of rounds selected will be downloaded<br />
                                                            even if the data has been downloaded before.<br />
                                                            <br />
                                                            The data downloaded will not overwrite any scores on the PC.<br />
                                                            Manually entered and amended scores are protected from change.<br />
                                                            All scores can be manually changed on the PC in case of error.<br />
                                                            <br />
                                                            It is much quicker if you only download one or two rounds at a time.<br />
                                                            <br />
                                                            <b>You can download from two places in the system.</b><br />
                                                            - The eScoring Menu, and<br />
                                                            - The Scoring screen.<br />
                                                            We will look at both further down the page.<br />
                                                            <br />
                                                            <b>At the end of a download</b><br />
                                                            - Scores are automatically re-calculated.<br />
                                                            - A screen showing pilots with missing scores will appear.<br />
                                                            &nbsp&nbsp&nbsp&nbsp You should pay special attention to this screen.<br />
                                                            - If pilots have been moved from their original groups on the PC,<br />
                                                            &nbsp&nbsp&nbsp&nbsp they may enter data on their phone and it will not match the<br />
                                                            &nbsp&nbsp&nbsp&nbsp expected record on the PC. There is a special screen for that.
                                                        </p>
                                                        <p><b>Click on the 'Upload Scores' tab for more vital information.</b></p>
                                                    </div>
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            <b>Downloading using the eScoring menu</b>
                                                        </p>
                                                        <asp:Image ID="Image36" runat="server"
                                                            Style="float: right; width: 400px; padding-right: 25px;"
                                                            ImageUrl="~/ImgEScoring/eScoringMenuDownload.jpg" />
                                                        <p>
                                                            Click on the 'Download to PC' button.<br />
                                                            You will be able to select a range of rounds to download.<br />
                                                            <br />
                                                            The download process will start.
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <hr />
                                                        <p>
                                                            <b>Downloading using the Scoring Screen</b>
                                                        </p>
                                                        <asp:Image ID="Image37" runat="server"
                                                            Style="float: right; width: 600px; padding-right: 25px;"
                                                            ImageUrl="~/ImgEScoring/eScoringDownloadFromScoringScreen.jpg" />
                                                        <p>
                                                            Click on the 'Download' icon.<br />
                                                            You will be able to select a range<br />
                                                            of rounds to download.<br />
                                                            <br />
                                                            The download process will start.<br />
                                                            <br />
                                                            <b>About the Scoring screen.</b><br />
                                                            There is a new column called 'Updated'.<br />
                                                            It will have a value of 'True' if a score,
                                                <br />
                                                            even a zero score, has updated the
                                                <br />
                                                            system. Otherwise, a value of 'False'.<br />
                                                            <br />
                                                            <b>If no score has been entered,
                                                    <br />
                                                                clicking in the Updated column
                                                    <br />
                                                                will toggle the value from 'False'
                                                    <br />
                                                                to 'True' and back again.</b><br />
                                                            <br />
                                                            You won't see this column unless the
                                                <br />
                                                            'Show/Hide Columns → Updated' checkbox is ticked.
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <p><b>Click on the 'Upload Scores' tab for more vital information.</b></p>
                                                    </div>

                                                </ContentTemplate>
                                            </asp:TabPanel>

                                            <%--                                MANUAL UPLOAD SCORES--%>
                                            <asp:TabPanel runat="server" ID="TabPanel1" HeaderText="Manual Upload Scores">
                                                <ContentTemplate>
                                                    <h5>Upload Scores to Server</h5>
                                                    <div>
                                                        <p>
                                                            Remember that scores are automatically calculated after download.<br />
                                                            <br />
                                                            <b>At the end of scoring for a round</b><br />
                                                            When you have <b>ALL</b> the scores for a round it is time to upload them to the server.<br />
                                                            That way they are available to all pilots.<br />
                                                            <br />
                                                            The upload to server procedure is exactly the same as before.<br />
                                                            The only difference is that the data now contains official score information.<br />
                                                            It is best to upload regularly.<br />
                                                            <br />
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <p>
                                                            After the upload of scores, the pilots will be able to see results like this.<br />
                                                            Notice that the blue text at the top shows 'Scores updated'.<br />
                                                            Before the upload, this would have been 'Score recorded'.
                                                        </p>
                                                        <asp:Image ID="Image42" runat="server"
                                                            Style="float: right; width: 300px; padding-right: 25px;"
                                                            ImageUrl="~/ImgScore/PhoneWithResults.jpg" />
                                                    </div>
                                                    <div>
                                                        <p><b>Click on the 'For Pilots' tab after you have read this page.</b></p>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </ContentTemplate>
                                </asp:TabPanel>



                                <asp:TabPanel runat="server" ID="TabPanel3" HeaderText="Score Input Methods">
                                    <ContentTemplate>
                                        <h5>Score Input Methods</h5>
                                        <div>
                                            <p>
                                                As the organiser, you can always input scores on the PC. The system will never overwrite these scores.<br />
                                                Pilots always input their scores using the same screen, but there are three ways to access that screen.
                                                <ul>
                                                    <li>Use a smartphone or tablet and scan the QR Code on the Score Record</li>
                                                    <li>Use a shared computer running <b>eScoringInterfaceExe.exe</b></li>
                                                    <li>Use any device by going to <b>

                                                        <asp:HyperLink ID="HyperLink2"
                                                            NavigateUrl="http://www.gliderscore.com/escoreinterface.aspx"
                                                            Text="gliderscore.com/escoreinterface.aspx"
                                                            Target="_blank"
                                                            runat="server" />
                                                    </b>
                                                        <br />



                                                        This is very suitable where a number of pilots share one device.
                                                    </li>
                                                </ul>
                                            </p>
                                        </div>

                                        <div>
                                            <hr />
                                            <%--                                            USING A SMARTPHONE--%>
                                            <p>
                                                <b>Using a Smartphone</b><br />
                                                Scanning the QR Code on the Score Card is well described in other places.<br />
                                                This is the usual method for pilots to access their scoring screen<br />
                                                and does not involve the organisers to provide any resources other than the Score Cards.
                                            </p>
                                        </div>

                                        <div>
                                            <hr />
                                            <%--                                            ENTERING SCORES WITH A SHARED COMPUTER--%>
                                            <p><b>Entering scores with a shared computer</b></p>
                                            <p>
                                                You can set up a separate computer (connected to the internet) for pilots who do not have smartphones.<br />
                                                Pilots will be able to enter their scores by using a small program called eScoringInterface.exe.<br />
                                                This program can run on any internet-connected PC. It does not need GliderScore on the PC.<br />
                                                It can be in any folder.<br />
                                                <br />
                                                eScoringInterface.exe is available for download by clicking this button.
                                    <input type="button" name="Button" style="color: blue; font-size: 12px; position: relative; top: 0px; width: 300px; margin-top: 0px;"
                                        value="Download eScoringInterface.exe"
                                        onclick="window.open('zipfile/eScoringInterfaceExe.exe', 'download'); return false;" />
                                                <br />
                                            </p>

                                            <p>
                                                Running eScoringInterface.exe brings up this screen.
                                         <asp:Image ID="Image63" runat="server" Style="float: right; margin-right: 50px;" ImageUrl="~/ImgEScoring/eScoringInterface1.jpg" />
                                            </p>
                                            <p>
                                                Key in a name for your competition and the CompID.<br />
                                                The CompID can be found on the Score Record cards.<br />
                                            </p>
                                        </div>
                                        <div>
                                            <p>
                                                Click on 'Open User Form' to see this screen.
                                         <asp:Image ID="Image64" runat="server" Style="float: right; margin-right: 50px;" ImageUrl="~/ImgEScoring/eScoringInterface2.jpg" />
                                            </p>
                                            <p>
                                                The pilot enters his pilot number (from the QR Code<br />
                                                string on his Score Record card) and clicks
                                                    <br />
                                                on 'Connect'.<br />
                                                <br />
                                                His scoring screen opens and from this point
                                                    <br />
                                                he can interact with it in exactly the same way as<br />
                                                he would if using a smartphone.<br />
                                                <br />
                                                When finished he clicks on 'Clear' to clear
                                                    <br />
                                                the screen, ready for the next person.<br />
                                                <br />
                                                Closing this form closes the program.
                                            </p>
                                        </div>

                                        <div>
                                            <hr />
                                            <%--                                            LOG ON TO GLIDERSCORE.COM/ESCOREINTERFACE.ASPX--%>
                                            <p>
                                                <b>Log on to 

                                                   <asp:HyperLink ID="HyperLink3"
                                                       NavigateUrl="http://www.gliderscore.com/escoreinterface.aspx"
                                                       Text="gliderscore.com/escoreinterface/aspx"
                                                       Target="_blank"
                                                       runat="server" />
                                                    <br />This method can be used for any internet connected device, including a PC.
                                            </p>
                                            <p>
                                                Logging on brings up this screen. Enter the CompID from any Score Record and press Submit
                                         <asp:Image ID="Image65" runat="server" Style="float: right; margin-right: 50px;" ImageUrl="~/ImgEScoring/eScoreInterface0.jpg" alt="" />
                                            </p>
                                        </div>
                                        <div>
                                            <p>
                                                You will then have this screen where you can enter any Pilot ID.<br />
                                                The Pilot ID is the number at the end of the QR Code string on the Score Record.<br />
                                                Press on 'Score' to get the pilot's scoring screen.
                                                      <asp:Image ID="Image66" runat="server" Style="float: right; margin-right: 50px;" ImageUrl="~/ImgEScoring/eScoreInterface1.jpg" alt="" />
                                            </p>
                                        </div>
                                        <div>
                                            <p>
                                                From here the pilot can select the round for scoring<br />
                                                and go ahead and enter scores.<br />
                                                Enter another Pilot ID to see their scoring screen.
                                            <asp:Image ID="Image67" runat="server" Style="float: right; margin-right: 50px;" ImageUrl="~/ImgEScoring/eScoreInterface2.jpg" alt="" />

                                            </p>

                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel5" HeaderText="QRCodeList" TabIndex="50">
                                    <ContentTemplate>
                                        <asp:Image ID="Image74" runat="server" ImageAlign="Right" Style="float: right; width: 60%; margin-right: 50px;" ImageUrl="~/ImgDraw/QRCodeList.jpg" alt="" />
                                        <h5>Reports - QR Code List</h5>
                                        <p>
                                            From the <b>Reports Menu</b> you can print a QR Code List similar to this one.<br />
                                            <br />
                                            Scanning the QR Code with a smartphone establishes connection to the eScoring system.
                                        </p>
                                        <br />
                                    </ContentTemplate>
                                </asp:TabPanel>

                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:TabPanel>




                    <%--                    eScoring for Pilots--%>
                    <asp:TabPanel runat="server" ID="eScoringForPilots" HeaderText="For Pilots">
                        <ContentTemplate>
                            <h5>eScoring for Pilots</h5>
                            <p>In this section</p>
                            <ul>
                                <li>Scanning the QRCode</li>
                                <li>Entering scores with smartphone</li>
                                <li>Entering scores with a shared computer</li>
                                <li>Entering scores using any shared device</li>
                                <li>Scoring example for F3K</li>
                                <li>Scoring example for F3B</li>
                                <li>View Results on smartphone</li>
                            </ul>
                            <div>
                                <p>
                                    Pilots need a smartphone with a QRCode scanning app installed.<br />
                                    Those without a smartphone can use a 'communal' computer (see below).<br />
                                    <br />
                                    I have found QRDroid to be excellent on Android.<br />
                                    For iPhone/iPad, the built in scanner should work. Otherwise Quick Scan is worth trying.
                                    <br />
                                    <br />
                                    There is no other software required provided the phone has a web browser installed.<br />
                                    <br />
                                    Pilots also need their Score Record with their QRCode.
                                </p>
                            </div>
                            <div>
                                <hr />
                                <p><b>Scanning the QRCode</b></p>
                                <p>
                                    When the pilot scans the QRCode, it takes him to a web page like this.
                                <asp:Image ID="Image32" runat="server"
                                    Style="float: right; width: 300px; padding-right: 25px;"
                                    ImageUrl="~/ImgEScoring/Screenshot1.jpg" />
                                </p>
                                <p>
                                    The pilot can see exactly when he is drawn to fly.<br />
                                    <br />
                                    - For F3K and F5K the task is shown against each round.<br />
                                    - For F3B Distance, the ID is shown.<br />
                                    - For F3B, F3F and F3Q Speed, the flying order is shown.<br />
                                    - Where Lanes are used, the Lane is shown.<br />
                                    <br />
                                    Only one flight group is open for score entry.<br />
                                    A score must be entered for the open flight group before<br />
                                    the next one will become available.<br />
                                    <br />
                                    Pressing the 'Enter' button takes the pilot to the score entry screen.                                    
                                </p>
                            </div>
                            <div>
                                <hr />
                                <p><b>Entering scores with smartphone</b></p>
                                <p>
                                    There are separate screens designed for each competition type.<br />
                                    <br />
                                    With F3J there will be a 'Late Landing' box.
                                    <br />
                                    With F5J there will be a 'Height Penalty' box.<br />
                                    F3K, F5B and others all have their own special screens.
                                </p>
                                <p>
                                    When the pilot scans the QRCode, it takes him to a web page like this one (on the left).<br />
                                    This page is for F3J.<br />
                                    <asp:Image ID="Image38" runat="server"
                                        Style="float: right; width: 627px; padding-right: 25px;"
                                        ImageUrl="~/ImgEScoring/Screenshot2.jpg" />
                                </p>
                                <p>

                                    <br />
                                    There are dropdown boxes for minutes, seconds, landing and late landing.<br />
                                    <br />
                                    What is not so obvious is that these<br />
                                    dropdown boxes scroll both ways.<br />
                                    <br />
                                    So, if you want a high value, pull down.<br />
                                    As the image on the right shows, the initial<br />
                                    value of zero is actually in the middle of a<br />
                                    double list of possible values.<br />
                                    <br />
                                    <b>You can enter a zero score with this form.</b><br />
                                    Press Submit and you will be asked to
                                    <br />
                                    confirm by pressing Submit again.<br />
                                    This will record the zero score.<br />
                                    <br />
                                </p>
                                <ul>
                                    <li>Tap the '< Back' button to go to<br />
                                        the previous score entry page.</li>
                                    <li>Tap the 'Back to list' button to go to
                                        <br />
                                        the list of Rounds/Groups.</li>
                                    <li>Tap the 'Next >' button to go to
                                        <br />
                                        the next score entry page.</li>
                                </ul>
                                <p>The Back and Next button are enabled or disabled depending on circumstances.</p>

                                <br />
                            </div>
                            <div>
                                <hr />
                                <p><b>Entering scores with a shared computer</b></p>
                                <p>
                                    You can set up a separate computer (connected to the internet) for pilots who do not have smartphones.<br />
                                    Pilots will be able to enter their scores by using a small program called eScoringInterface.exe.<br />
                                    This program can run on any internet-connected PC. It does not need GliderScore on the PC.<br />
                                    It can be in any folder.<br />
                                    <br />
                                    eScoringInterface.exe is available for download by clicking this button.
                                    <input type="button" name="Button" style="color: blue; font-size: 12px; position: relative; top: 0px; width: 300px; margin-top: 0px;"
                                        value="Download eScoringInterface.exe"
                                        onclick="window.open('zipfile/eScoringInterfaceExe.exe', 'download'); return false;" />
                                    <br />
                                </p>

                                <p>
                                    Running eScoringInterface.exe brings up this screen.
                                         <asp:Image ID="Image62" runat="server"
                                             Style="float: right; padding-right: 25px;"
                                             ImageUrl="~/ImgEScoring/eScoringInterface1.jpg" />
                                </p>
                                <p>
                                    Key in a name for your competition and the CompID.<br />
                                    The CompID can be found on the Score Record cards.<br />
                                </p>
                                <div>
                                    <p>
                                        Click on 'Open User Form' to see this screen.
                                         <asp:Image ID="Image61" runat="server"
                                             Style="float: right; padding-right: 25px;"
                                             ImageUrl="~/ImgEScoring/eScoringInterface2.jpg" />
                                    </p>
                                    <p>
                                        The pilot enters his pilot number (from the QR Code<br />
                                        string on his Score Record card) and clicks
                                        <br />
                                        on 'Connect'.<br />
                                        <br />
                                        His scoring screen opens and from this point
                                        <br />
                                        he can interact with it in exactly the same way as<br />
                                        he would if using a smartphone.<br />
                                        <br />
                                        When finished he clicks on 'Clear' to clear
                                        <br />
                                        the screen, ready for the next person.<br />
                                        <br />
                                        Closing this form closes the program.
                                    </p>
                                </div>


                                <br />


                            </div>
                            <div>
                                <hr />
                                <p>
                                    <b>Entering Scores with any Internet Connected Device</b><br />
                                    <br />
                                    This method can be used for any internet connected device, including a PC.<br />
                                    It is suitable when several pilots share the same device.
                                </p>
                                <p>
                                    Log on to <b>gliderscore.com/escoreinterface.aspx</b><br />
                                    Logging on brings up this screen. Enter the CompID from any Score Record and press Submit
                                         <asp:Image ID="Image68" runat="server"
                                             Style="float: right; padding-right: 25px;"
                                             ImageUrl="~/ImgEScoring/eScoreInterface0.jpg" />
                                </p>
                            </div>
                            <div>
                                <p>
                                    You will then have this screen where you can enter any Pilot ID.<br />
                                    The Pilot ID is the number at the end of the QR Code string on the Score Record.<br />
                                    Press on 'Score' to get the pilot's scoring screen.
                                                      <asp:Image ID="Image69" runat="server"
                                                          Style="float: right; padding-right: 25px;"
                                                          ImageUrl="~/ImgEScoring/eScoreInterface1.jpg" />
                                </p>
                            </div>
                            <div>
                                <p>
                                    From here the pilot can select the round for scoring<br />
                                    and go ahead and enter scores.<br />
                                    Enter another Pilot ID to see their scoring screen.
                                </p>
                                <asp:Image ID="Image70" runat="server"
                                    Style="float: right; padding-right: 25px;"
                                    ImageUrl="~/ImgEScoring/eScoreInterface2.jpg" />

                            </div>

                            <div>
                                <hr />
                                <p>
                                    <b>After entering scores for a round, the scoring screen for the next round becomes available.</b><br />
                                    <br />
                                    You can View scores for previous rounds or Enter scores for the next round.<br />
                                    <br />
                                    <asp:Image ID="Image39" runat="server"
                                        Style="float: right; width: 300px; padding-right: 25px;"
                                        ImageUrl="~/ImgEScoring/Screenshot4.jpg" />
                                </p>
                            </div>
                            <div>
                                <hr />
                                <p>
                                    <b>Scoring example for F3K</b><br />
                                    <br />
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp The right hand image is the score entry form for Task D.<br />
                                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp One tap fills in all the scores up to the button tapped.
                                </p>
                                <asp:Image ID="Image40" runat="server"
                                    Style="float: right; width: 800px; padding-right: 25px;"
                                    ImageUrl="~/ImgEScoring/ScreenshotsF3K.jpg" />
                            </div>
                            <div>
                                <hr />
                                <p><b>Scoring example for F3B (F3Q is very similar)</b></p>
                                <asp:Image ID="Image41" runat="server"
                                    Style="float: right; width: 560px; padding-right: 25px;"
                                    ImageUrl="~/ImgEScoring/ScreenshotsF3B.jpg" />
                            </div>
                            <hr />
                            <div>
                                <h5>View Results on Phone</h5>
                                <div>
                                    <p>
                                        Details of the pilot's flight group are always available.<br />
                                        Initially all flight group pilot scores are zero. As scores are submitted, a refresh of this screen will show the submitted scores.<br />
                                        The system also shows the Points total at this stage.<br />
                                    </p>
                                    <p>
                                        Normally, at the end of scoring for a round the CD will upload results to the server.<br />
                                        That way they are available to all pilots.<br />
                                        This updates the flight group data with the normalized scores and the progressive position of every pilot.
                                        <br />
                                    </p>
                                </div>
                                <div>
                                    <asp:Image ID="Image43" runat="server"
                                        Style="float: right; width: 300px; padding-right: 25px;"
                                        ImageUrl="~/ImgScore/PhoneWithResults1.jpg" />
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--                    eScoring - Other options--%>
                    <asp:TabPanel runat="server" ID="pnlEScoringOtherOptions" HeaderText="Other Options">
                        <ContentTemplate>
                            <h5>eScoring - Other Options</h5>
                            <p>In this section</p>
                            <ul>
                                <li>Reset scores to zero</li>
                                <li>Remove competition from server.</li>
                                <li>Open / Close (online scoring)</li>
                                <li>Backup / Restore (online scores)</li>
                                <li>Create a link.</li>
                                <li>Pilot List with eScoring URL (QR Code String)</li>
                            </ul>
                            <hr />
                            <p>
                                <asp:Image ID="Image58" runat="server"
                                    Style="float: right; width: 500px; padding-right: 25px;"
                                    ImageUrl="~/ImgEScoring/eScoringOtherOptions.jpg" />
                            </p>
                             <p><b>Reset Scores to Zero</b></p>
                            <p>
                                Resets score values to zero from and including a selected<br />
                                round and group.<br />
                                This can be for the whole competition.<br />
                                <br />
                                The reset happens optionally with -<br />
                                - the on-line database<br />
                                - the local database<br />
                                - both databases<br />
                                <br />
                                Using this process, you can allow all pilots to practice<br />
                                on-line score entry before a competition. Then, before
                                    <br />
                                the competition begins, make all scores zero in readiness<br />
                                for entering the real scores.<br />
                                <br />
                                The process can also be used, particularly at competitions<br />
                                that run for more than one day, to clear scores from a
                                    <br />
                                particular round and group to the end of the competition.<br />
                                This may be needed if pilots enter scores overnight by mistake.
                            </p>

                            <p><b>Remove Competition from server.</b></p>
                            <p>Use this to remove all traces of the competition from the server.</p>
                          

                            <p>
                                <b>Open / Close (online scoring)</b><br />
                                Allows control of exactly when pilots can and cannot enter scores.
                            </p>
                            <ul>
                                <li>Close online scoring at the end of the day's flying.</li>
                                <li>Open online scoring at the start of the next day's flying.</li>
                            </ul>
                            <p>
                                <b>Open</b><br />
                                When clicked, allows score entry by mobile 'phone to proceed as normal.<br />
                                Internet connection required.<br />
                                <br />
                                <b>Close</b><br />
                                When clicked, prevents score entry by mobile 'phone.<br />
                                Internet connection required.<br />
                            </p>
                         
                            <p><b>Backup / Restore (online scores)</b></p>
                            <p>
                                <b>Backup</b><br />
                                Create a backup copy of ALL score data for the competition.<br />
                                If there is a pre-existing backup, you<br />
                                will be asked to confirm before overwriting it.<br />
                                <br />
                                <b>Restore</b><br />
                                Backup data can be restored to the main data table at any time.<br />
                                All data in the main data table will be replaced with the backup data.
        
                            </p>

                            <p><b>Create Link</b></p>
                            <p>
                                Use this to generate a link that you can share via email or the web.<br />
                                The link, when clicked, will open up your competition on-line without having to find it using the drop down list.<br />
                                Links can be generated to go to the on-line Flight scores or the on-line Results.
                            </p>
                            <hr />

                            <p><b>Pilot List with eScoring URL (QR Code String)</b></p>
                            <p>
                                A full list of pilots in the competition and their eScoring URLs is available from the Reports Menu.<br />
                                Reports → Pilot Reports → Pilot Master File.<br />
                                With this report you can select to print or download the eScoring URL (QR Code String) as shown below.   
                                    <div>
                                        <p>
                                            Report Selections
                                        <asp:Image ID="Image59" runat="server"
                                            Style="float: right; width: 500px; padding-right: 25px;"
                                            ImageUrl="~/ImgEScoring/PilotMasterFileSelections.jpg" />
                                        </p>
                                    </div>
                                <br />
                                <div>
                                    <p>
                                        Report Output
                                        <asp:Image ID="Image60" runat="server"
                                            Style="float: right; width: 500px; padding-right: 25px;"
                                            ImageUrl="~/ImgEScoring/PilotMasterFile.jpg" />
                                    </p>
                                </div>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="pnlAbout" HeaderText="About">
                        <ContentTemplate>
                            <h5>About eScoring</h5>
                            <p>
                                This module in GliderScore came about after it was suggested to me by Jim Monaco.<br />
                                Jim provided support and invaluable advice to get me going and without his help<br />
                                getting the project started would have been much more difficult.
                            </p>
                            <p>
                                At the time I was in contact with Chris Bajorek and he enthusiastically agreed to be<br />
                                a tester. He has been fantastic with suggestions along the way and has stuck with it<br />
                                even though at times it wasn't looking so good. The amount of time and effort that he<br />
                                has put into it has been enormous.
                            </p>
                            <p>
                                Chris spread the word to Lee Wolfe who also came aboard as a tester. He has perhaps<br />
                                been the bravest of us all. He put the system into use in actual competitions long<br />
                                before I thought it was ready. But this proved to be invaluable thanks to the great<br />
                                feedback and suggestions from the pilots. The form of many of the user interface elements<br />
                                are due to their suggestions.<br />
                            </p>
                            <p>
                                A person who will be surprised to be mentioned here is Marcus Stent. He made one comment<br />
                                that sparked a change in direction. He commented "Is there anything to prevent scores<br />
                                being entered in the wrong round?". At the time the method of entry was to scan a QRCode<br />
                                from a score card, so my answer was no, there was nothing to prevent that. This led to the<br />
                                page that lists the flight groups in order and only allows the next flight group without<br />
                                scores to be opened for scoring. Thanks Marcus.
                            </p>
                            <p>
                                Fairly late on the scene was Fabien Gagné. He joined our little testing group and immediately<br />
                                put the system into use in actual competition. I should say that this was in Canada and his<br />
                                winter competition started and finished in sub-zero conditions. His input has also been very<br />
                                valuable.
                            </p>
                            <p>
                                The person who is to be thanked the most however is my wife, Helen.<br />
                                She has been extremely understanding and supportive of me while I worked away for long hours<br />
                                on something that I was very determined to finish. She kept the house going while I did<br />
                                nothing other than sit at the computer and beaver away at the project.<br />
                                So thank you my darling.
                            </p>
                            <p>
                                Also worth mentioning are all the people who have posted answers to questions or created<br />
                                lesson materials on all aspects of programming.<br />
                                At the start of this process I knew very little, actually nothing, about creating an interactive<br />
                                web application. I now know a lot more, but still very little really.<br />
                                Without these people who willingly share their knowledge this would never have been finished.
                            </p>
                            <p>
                                And finally Microsoft.<br />
                                Microsoft provides, for no charge, the amazing program Visual Studio 2015 that was used to create<br />
                                this eScoring system (and GliderScore and Digital Timer). For server side management they also<br />
                                provide SQL Server Management Studio, again, for no charge. This is another fantastic program<br />
                                that makes interacting with the on-line database for development purposes easy. It provides all the<br />
                                tools that I need.<br />
                                Thank you Microsoft. Without your generosity this would not have happened.<br />
                            </p>
                            <p>
                                Gerry Carter<br />
                                March 31, 2017
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>



        <asp:TabPanel runat="server" ID="PanelScoringInterface" HeaderText="Scoring Interface">
            <ContentTemplate>
                <h5>Scoring Interface</h5>
                <p>
                    GliderScore provides assistance to those wanting to create electronic score collection software.<br />
                    <ul>
                        <li><b>The ability to download the Scoring data to a file.</b><br />
                            This file can then be uploaded into the score collection database.<br />

                        </li>
                        <li><b>The ability to print score cards with QRCodes.</b><br />
                            The QRCodes provide a way to identify where to put the scores being collected.<br />

                        </li>
                        <li><b>The ability to upload scores from a delimited file.</b><br />
                            The scores collected can be imported into GliderScore from a .csv file created from the score collection database.<br />
                            All scoring calculations are done as a part of the same process.<br />

                        </li>
                    </ul>
                </p>

                <div>
                    <h5>CreateFile / ImportFile functions</h5>
                    <p>
                        <b>Click</b> on the 'eScoring' button to open this screen.<br />
                        The second tab is 'Electronic Scoring Interface'.
                    </p>
                    <asp:Image ID="Image28" runat="server" ImageAlign="Left"
                        Imagewidth="400px" padding-top="5px" margin="10px" left="20px"
                        ImageUrl="~/ImgScore/ElectronicScoring.jpg" />
                    </br>
                </div>
                <hr />

                <%--               <div style="position: relative; top: 30px">--%>
                <div>
                    <h5>Download Scoring data to a .csv file</h5>
                    <p>
                        Choose the location and file name for the downloaded data.</br><br />
                        There are 15 fields in the data file. 6 key fields, 8 data fields and 1 Name field.</br>
                    </p>
                    <asp:Table runat="server" Style="border: 1px solid black; border-collapse: collapse">
                        <asp:TableHeaderRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableHeaderCell Width="100" Style="border: 1px solid black">Key Fields</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="100" Style="border: 1px solid black">Data Fields</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="100" Style="border: 1px solid black">Name Field</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">CompNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data1</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">PilotName</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">TaskNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data2</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">RoundNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data3</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">GroupNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data4</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">ReFlightNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data5</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">PilotNo</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data6</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Data7</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Penalty</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <p>
                        The key fields contain the data needed to identify the scoring row.</br>
                    The data fields are used to save the collected scoring data.</br>
                    The pilot name field contains the pilot name to make the file human friendly.</br>
                    </p>


                    <p>
                        <br />
                        The following table shows where the scoring data has to go.<br />

                        For F3K, record as many times as required for the task. All other times should be zero (0).<br />
                    </p>

                    <asp:Table runat="server" Style="border: 1px solid black; border-collapse: collapse; position: center">
                        <asp:TableHeaderRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableHeaderCell Width="200" Style="border: 1px solid black">Description</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data1</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data2</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data3</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data4</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data5</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data6</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Data7</asp:TableHeaderCell>
                            <asp:TableHeaderCell Width="80" Style="border: 1px solid black">Penalty</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">Duration</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">F3J - Duration with Late Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Late landing penalty</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">Duration with Motor Run</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Motor run</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">F5J Duration with Height Penalty</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Height</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">Distance (Lap count)</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Laps flown</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">Speed (Time elapsed)</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">F5B</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Laps flown</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2*</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Motor run</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">Landing</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Style="border: 1px solid black; border-collapse: collapse">
                            <asp:TableCell Style="border: 1px solid black">F3K</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime2</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime3</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime4</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime5</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime6</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">FlightTime7</asp:TableCell>
                            <asp:TableCell Style="border: 1px solid black">0 or Penalty</asp:TableCell>
                        </asp:TableRow>

                    </asp:Table>

                    <p>
                        *FlightTime2 only applies where there are two timekeepers and both times are to be recorded.<br />
                        Otherwise make this field zero (0).<br />
                    </p>
                    <p>
                        Flight times are formatted as mmss.sss.<br />
                        <br />
                        Landing values must be values from the (Distance column) of the Landing table being used for the competition.<br />
                        It is recommended that a Landing table where both Distance and Points are the same be used.<br />
                        In this case, mark the landing tape with the landing score, and collect that value.
                    </p>
                    <h5>Import Scoring Data from a properly formatted .csv file</h5>
                    <p>
                        Select the .csv file that you updated by browsing to it's location.<br />
                        <br />
                        A number of data validation checks are then carried out.<br />
                        The import will be cancelled if any of these fail, and an error report will be produced.<br />
                        <br />
                        Once the import is completed a full re-calculation of all scores is carried out.<br />
                        <br />
                        Remember that any existing data will be overwritten by the imported data.
                    <br />
                        <br />
                        <br />
                        <br />
                    </p>
                </div>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="ScoreCheck" HeaderText="Score Check" TabIndex="2">
            <ContentTemplate>

                <img id="Img1" src="~/ImgScoreCheck/ScoreCheck.jpg" runat="server" style="width: 60%; float: right; margin-right: 4px;" alt="" /><br />

                <h5>Score Check</h5>
                <p>
                    The <b>Score Check</b> button appears on both the Competition Setup screen and on the Scoring screen.<br />
                    Clicking this button brings up the screen shown at right.<br />
                    (This screen is not appropriate for F5K and instead it is named 'Score Details'. See below for more.)
                    <br />

                    The Score Check screen allows you to quickly find scores
                </p>
                <ul>
                    <li>that may have been missed, or</li>
                    <li>that may have data entry errors.</li>
                </ul>

                <p>Items of interest are coloured -</p>
                <ul>
                    <li>Red - equal to or below lower limit.</li>
                    <li>Blue - equal to or greater than upper limit.</li>
                    <li>Grey - value is within limits.</li>
                </ul>

                <p>Depending on the type of competition, you might want to check for</p>
                <ul>
                    <li>Group scores that are very low (or zero).</li>
                    <li>Duration times that are very low or unusually high.</li>
                    <li>Landing scores that are very low.</li>
                    <li>Laps flown (F3B Distance) that are very low or very high.</li>
                    <li>Speed times (F3B or F3F) that are very low or very high.</li>
                    <li>Motor Run times that are very low or very high.</li>
                    <li>Start heights (F5J) that are very low or very high.</li>
                </ul>
                <p>
                    The items that can be set depend on the type of competition that is being checked.<br />
                    Un-check any item that is of no interest.<br />
                    <br />

                    By un-checking 'All Pilots', it is possible to quickly cycle through each pilot in turn by clicking on the up and down arrows.<br />
                    Individual rounds can be isolated in a similar way.<br />

                </p>
                <h5>Score Details F5K</h5>
                <p>For F5K, the button is renamed to 'Score Details' on both the Competition Setup screen and on the Scoring screen.</p>
                <p>
                    <img id="Img4" src="~/ImgScoreCheck/ScoreDetailsF5k.jpg" runat="server" style="width: 60%; float: right; margin-right: 4px;" alt="" /><br />
                    Clicking on this button -<br />
                    - In the Scoring screen, all score details for the current flight group are shown.<br />
                    - In the Competition Setup screen, all score details for the competition are shown.<br />
                    This makes it easy to check any pilot's data for errors or omissions.<br />
                    It is exactly the same as the 'Flight Scores' report.<br />
                    The 'Flight Scores' report has options to group and/or focus on particular pilots.
                </p>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="BestFlights" HeaderText="Best Flights" TabIndex="2">
            <ContentTemplate>


                <h5>Best Flights</h5>
                <p>
                    Best Flight Points, or<br />
                    Best Laps, or<br />
                    Best Speed.
                </p>
                <p>
                    <img id="Img2" src="~/ImgScore/ScoreBestFlights.jpg" runat="server" style="width: 70%; float: right; margin-right: 4px;" alt="" /><br />
                    The Best Flights list is available on the Scoring screen. 
                    Click on the drop down box to expand the list. 
                    Click anywhere to close the list.
                    <br />
                    <br />

                    The list shows points scored in order from best to worst. 
                    It also shows the flight score elements that went into the points scores.<br />
                    <br />

                    By default the best 50 points scores are listed but the complete list can be shown by clicking on the last entry.<br />
                    <br />

                    The list is instantly updated whenever a score is entered or changed.
                </p>
                <p>For multi-task competitions (F3B, F3Q) the list covers the task being scored.</p>
                <div>
                    <p>
                        <img id="Img3" src="~/ImgScore/ScoreBestFlightsF3K.jpg" runat="server" style="width: 70%; float: right; margin-right: 4px;" alt="" /><br />

                        For F3K and F5K<br />
                        The list is for the F3K (or F5K) task being scored, but covers that task for the whole competition.
                    </p>
                </div>
            </ContentTemplate>
        </asp:TabPanel>

    </asp:TabContainer>
</asp:Content>
