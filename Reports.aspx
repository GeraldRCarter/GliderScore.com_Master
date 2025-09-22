<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        If varID = "Overall" Then
            Dim container1 As AjaxControlToolkit.TabContainer = CType(Reports, AjaxControlToolkit.TabContainer)
            Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("CompetitionReports")
            container1.ActiveTab = Pnl1
            Dim container2 As AjaxControlToolkit.TabContainer = CType(Results, AjaxControlToolkit.TabContainer)
            Dim Pnl2 As AjaxControlToolkit.TabPanel = container2.FindControl("OverallResults")
            container2.ActiveTab = Pnl2
        End If

        If varID = "OverallAndDetails" Then
            Dim container1 As AjaxControlToolkit.TabContainer = CType(Reports, AjaxControlToolkit.TabContainer)
            Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("CompetitionReports")
            container1.ActiveTab = Pnl1
            'Dim container2 As AjaxControlToolkit.TabContainer = CType(Results, AjaxControlToolkit.TabContainer)
            'Dim Pnl2 As AjaxControlToolkit.TabPanel = container2.FindControl("OverallResults")
            'container2.ActiveTab = Pnl2
        End If

        If varID = "HeightPenalty" Then
            Dim container1 As AjaxControlToolkit.TabContainer = CType(Reports, AjaxControlToolkit.TabContainer)
            Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("CompetitionReports")
            container1.ActiveTab = Pnl1
            Dim container2 As AjaxControlToolkit.TabContainer = CType(Results, AjaxControlToolkit.TabContainer)
            Dim Pnl2 As AjaxControlToolkit.TabPanel = container2.FindControl("HeightPenalty")
            container2.ActiveTab = Pnl2
        End If
        If varID = "CustomReports" Then
            Dim container1 As AjaxControlToolkit.TabContainer = CType(Reports, AjaxControlToolkit.TabContainer)
            Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("CustomReports")
            container1.ActiveTab = Pnl1
        End If
        If varID = "EmailReports" Then
            Dim container1 As AjaxControlToolkit.TabContainer = CType(Reports, AjaxControlToolkit.TabContainer)
            Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("EmailReports")
            container1.ActiveTab = Pnl1
        End If
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="Reports" runat="server" ActiveTabIndex="0">
        <asp:TabPanel runat="server" ID="TabHome" HeaderText="Reports" TabIndex="0">
            <ContentTemplate>
                <h5>Reports<asp:Image ID="ImgRptMenu" runat="server" ImageAlign="Right" Style="float: right; width: 60%; margin-right: 4px; margin-left: 4px;" ImageUrl="~/ImgRpts/RptMenuNew.jpg"></asp:Image>

                </h5>
                <p>
                    All reports (except the Competition Series report) are available from this menu.<br />
                    Go to Main Menu → Comp Series → Report to see the Competition Series report.
                </p>
                <p>
                    <b>Preview, Print or Download</b><br />
                    Reports can be previewed, printed or downloaded.<br />
                    They can also be created as .pdf documents using a third party program.
                    I use
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="http://www.bullzip.com"
                        Text="Bullzip PDF" Target="_blank" runat="server" />. The free version is very good. Simply select to Print, then select Bullzip PDF from the list of printers.<br />
                    <br />
                    <b>Publish OnLine</b><br />
                    Publish OnLine with a few clicks. This process uploads all of your competition data to the GliderScore server. The data can be viewed by going to this website and clicking the OnLine Scores link. You could do it now.
                    This is the same process as uploading data using the eScoring Menu. The upload must be declared to be 'Public' for the data to be seen.<br />
                    <br />

                    <b>Draw Reports</b>, those listed on the left hand side, are described under 'Draw Rounds' starting with the 'Check Draw' tab.
                    Click <a href="DrawRounds.aspx?DrawRoundsCheckDraw">here</a> to see the various draw reports.<br />
                    <br />

                    <b>Competition Reports</b> are described under various tabs within this 'Reports' page.<br />
                    <br />

                    <b>Custom Reports</b> are described under the Custom Reports tab within this 'Reports' page.<br />
                    <br />


                    <b>Upload reports to a website</b><br />
                    'Print' the reports to PDF files and
                    upload these files.  Search the internet for PDF writers if you do not have one.
                    Free PDF writers are available.<br />
                    <br />

                    <b>Emailing the draw reports</b><br />
                    The downloaded reports are in CSV format and can be read by programs such as MS Excel.
                    This is a good format to use if emailing the draw reports because pilots can choose 
                    how they want them formatted for printing.<br />
                    <br />
                    Alternatively, use the <a href="Reports.aspx?EmailReports">Email Reports</a> facility.
                    This can be used to download and email all available reports
                    at any stage of the competition.
                </p>

                <p>
                    <b>Scoring Screen - Running Results</b><br />



                    Use the 'Running Results' button on the Scoring Screen to bring up a menu of 
                    the 'Competition Results' reports.<br />
                    You can preview or print the reports and will return to the Scoring screen when finished.
                    
                </p>
                <br />
                <hr />
                <asp:ImageMap ID="ImageMap2" runat="server" Style="margin-right: 4px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/ReportPreferences.jpg">
                </asp:ImageMap>
                <p><b>Report Preferences Screens</b></p>
                <p>
                    Each report allows selection of various preferences as illustrated here.  Available preferences will depend on
                the parameters of the particular competition and the type of report.
                </p>

            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="CompetitionReports" HeaderText="Competition Reports" TabIndex="1">
            <ContentTemplate>
                <asp:TabContainer ID="Results" runat="server" ActiveTabIndex="0">
                    <%--OVERALL RESULTS--%>
                    <asp:TabPanel runat="server" ID="OverallResults" HeaderText="Overall Results" TabIndex="0">
                        <ContentTemplate>
                            <div>
                                <%--<asp:Image ID="Image2" Style="width: 60%; height: 60%" runat="server" ImageAlign="Right"
                                        ImageUrl="~/ImgRpts/RptOverallResultsOptions.jpg" />--%>
                                <asp:Image ID="Image2" Style="width: 60%; margin-right: 12px; margin-left: 4px;" runat="server" ImageAlign="Right"
                                    ImageUrl="~/ImgRpts/RptOverallResultsOptions.jpg" />
                                <h5>Reports - Overall Results Options</h5>
                                <p><b>Report Scope</b></p>
                                <p>
                                    This report can be run for 'All' or any combination of 'Country', 'Club' or 'Class'.
                                      The default setting is 'All'.<br />
                                    <br />
                                    If the report is restricted by making a selection, the scores can be reported in one of two ways.<br />
                                    - Restricted Scope Scoring selected - scores are re-calculated as if the only pilots who flew were the pilots within the selection.<br />
                                    - Restricted Scope Scoring NOT selected - uses the same scores as for the 'All' version of the report.<br />
                                    <br />
                                    Restricted Scope Scoring is useful for competitions<br />
                                    where, for example, only the pilots from a particular<br />
                                    Country qualify for a single competition National
                                      Championship, and where it is important to remove the<br />
                                    effect of the flights of pilots from other countries<br />
                                    from the results.<br />
                                    <br />
                                    Click on the drop down box that shows the number of pilots selected. You will then see the pilot names.   
                                </p>
                                <p><b>Show/Hide</b></p>
                                <p>
                                    Use the Show/Hide options to choose what is shown on your report.<br />
                                    See more on the 'Flight Details' option below.
                                </p>
                                <p><b>Select Rounds for Report</b></p>
                                <p>
                                    The report can also be run for any range of rounds.<br />
                                    Why would you want to do this? Because longer competitions can be reported as though<br />
                                    they were separate competitions, with each qualifying for LSF competition points.<br />
                                    So a 14 round competition can be reported for rounds 1 to 7, rounds 8 to 14 and rounds 1 to 14.<br />
                                    If the number of rounds chosen meets the 'drop score' setting, a score will be dropped from the rounds chosen.<br />
                                    Any penalties recorded in the range of rounds chosen will also be taken into account.

                                </p>
                                <br />
                            </div>
                            <hr />
                            <div>
                                <%--<asp:Image ID="Image4" Style="width: 80%; height: 80%" runat="server" ImageAlign="Right"
                                        ImageUrl="~/ImgRpts/RptOverallResults.jpg" />--%>
                                <asp:Image ID="Image4" Style="width: 80%; margin-right: 12px; margin-left: 4px;" runat="server" ImageAlign="Right"
                                    ImageUrl="~/ImgRpts/RptOverallResults.jpg" />
                                <h5>Reports - Overall Results</h5>
                                <p>Show/Hide Flight Details is not ticked. </p>
                                <p>
                                    Shows overall results for the competition (including drop scores and penalties).<br />
                                    Pilots are ranked from first to last.
                                </p>
                                <br />
                            </div>
                            <hr />
                            <div>
                                <asp:Image ID="Image21" Style="width: 80%; margin-right: 12px; margin-left: 4px;" runat="server" ImageAlign="Right"
                                    ImageUrl="~/ImgRpts/RptOverallResultsWithDetails.jpg" />
                                <h5>Reports - Overall Results With Flight Details</h5>
                                <p>Show/Hide Flight Details is ticked. </p>
                                <p>
                                    Shows overall results with flight details for the competition (including drop scores and penalties).<br />
                                    Pilots are ranked from first to last.
                                </p>
                                <p>
                                    The flight details reported depend on the competition.<br />
                                    <br />
                                    For this thermal duration competition the details are flight time and landing points.<br />
                                    <br />
                                    For F5J details are flight time, height in metres, landing points, 'Yes' if over 75 metres.<br />
                                    <br />
                                    Other competition types are treated according to their scoring elements.

                                </p>
                                <br />
                            </div>
                            <hr />
                            <div>
                                <hr width="100%" />
                                <asp:Image ID="Image1" runat="server" Style="margin-right: 12px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/RptOverallResultsWithPenalty.jpg" />
                                <p>
                                    This example shows how penalties are noted both for the round and also in total.<br />
                                    <br />
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--POSITION REPORT--%>
                    <asp:TabPanel runat="server" ID="PositionReport" HeaderText="Position Report" TabIndex="1">
                        <ContentTemplate>
                            <asp:Image ID="Image20" Style="width: 70%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptPositionReport.jpg" />

                            <h5>Reports - Position Report</h5>
                            <p>
                                Shows the position (ranking) of each pilot as at the end of each round.
                                <br />
                                The report is in order of the final ranking.
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--TEAM RESULTS--%>
                    <asp:TabPanel runat="server" ID="TabPanel5" HeaderText="Team Results" TabIndex="1">
                        <ContentTemplate>
                            <asp:Image ID="Image5" Style="width: 80%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptTeamResults.jpg" />

                            <h5>Reports - Team Results</h5>
                            <p>
                                Shows results by Team according to the number of team members to be counted for
                            the Team score.
                            </p>
                            <p>
                                This particular example report is too wide to show all columns given the number
                            of Rounds and the two drop scores.&nbsp; The Penalty column would be printed on
                            the next page.
                            </p>
                            <p>
                                Teams are ranked from first to last.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel6" HeaderText="Flight Scores" TabIndex="2">
                        <ContentTemplate>
                            <asp:Image ID="Image6" runat="server" style="margin-right :12px; margin-left :4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/RptFlightScores.jpg" />

                            <h5>Reports - Flight Scores</h5>
                            <p>
                                Shows actual scores details for each flight group.<br />

                                Pilots are ranked from first to last within each group.
                            </p>
                            <p>The report can be run for</p>
                            <ul>
                                <li>the entire competition</li>
                                <li>a range of groups</li>
                                <li>a single group</li>
                                <li>a selected pilot or pilots</li>
                            </ul>
                            <p>and sorted by</p>
                            <ul>
                                <li>Flight Group</li>
                                <li>Pilot Names</li>
                            </ul>
                            <p>
                                Print the report for each round or for each group as the competition progresses.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="TabPanel7" HeaderText="Landings" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image10" style="width:80%; height:80%" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptLandings.jpg" />--%>
                            <asp:Image ID="Image10" Style="width: 80%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptLandings.jpg" />
                            <h5>Reports - Landing Results</h5>
                            <p>
                                Shows landing points for each pilot.<br />

                                All scores are counted.<br />

                                Pilots are ranked from first to last.
                            </p>
                            <p>The report can be run for</p>
                            <ul>
                                <li>the entire competition</li>
                                <li>a range of groups</li>
                            </ul>
                            <p>
                                The report can be printed progressively as the competition progresses.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="HeightPenalty" HeaderText="Height Penalty" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image10" style="width:80%; height:80%" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptLandings.jpg" />--%>
                            <asp:Image ID="Image3" Style="width: 60%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptHeightPenalty.jpg" />
                            <h5>Reports - Height Penalty</h5>
                            <p>
                                The report can be run to show -<br />
                                 - height penalties, or<br />
                                 - launch heights.
                                <br /><br />
                                Key statistics shown are based on non-zero scores
                            </p>
                            <ul>
                                <li>The average flight time per penalty point, and</li>
                                <li>The average height penalty, or</li>
                                <li>The average flight time per metre of launch height, and</li>
                                <li>The average launch height.</li>
                            </ul>

                            <p>Pilots are ranked from first to last.</p>
                            <p>The report can be run for</p>
                            <ul>
                                <li>the entire competition</li>
                                <li>a range of rounds</li>
                            </ul>
                            <p>
                                The report can be printed progressively as the competition progresses.
                            </p>
                            <br />


                            <asp:Image ID="Image22" Style="width: 60%; margin-right: 12px; margin-left: 4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptF5KHeightPoints.jpg" />
                            <h5>Reports - F5K Height Points</h5>
                            <p>
                                The report shows the height points for each pilot for each round ranked from first to last.<br />
                            </p>








                        </ContentTemplate>
                    </asp:TabPanel>


                    <asp:TabPanel runat="server" ID="TabPanel8" HeaderText="Round by Round" TabIndex="4">
                        <ContentTemplate>
                            <asp:Image ID="Image7" runat="server" style="margin-right :12px; margin-left :4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/RptRoundScores.jpg" />
                            <h5>Reports - Round by Round Scores</h5>
                            <p>
                                Shows actual scores details for each Round.<br />


                                Pilots are ranked from first to last within each round.
                            </p>
                            <p>The report can be run for</p>
                            <ul>
                                <li>all rounds</li>
                                <li>a range of rounds</li>
                                <li>a single round</li>
                            </ul>
                            <p>
                                The report can be printed round by round as the competition progresses.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" ID="TabPanel2" HeaderText="Flight Scores Ranked" TabIndex="0">
            <ContentTemplate>
                <asp:Image ID="Image8" runat="server" style="margin-right :4px; margin-left :4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/RptFlightsRanked.jpg" />

                <h5>Reports - Flight Scores Ranked (by Task)</h5>
                <p>
                    Shows score details, ranked, for the entire competition.
                </p>
                <p>Easily identifies</p>
                <ul>
                    <li>Duration - perfect flights</li>
                    <li>Distance - most laps</li>
                    <li>Speed/F3F - fastest time</li>
                    <li>F5B - best flight</li>
                </ul>
                <p>The report can only be run for entire competition.</p>
                <br />
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" ID="TabPanel3" HeaderText="Task Results" TabIndex="0">
            <ContentTemplate>
                <asp:Image ID="Image9" runat="server" style="margin-right :4px; margin-left :4px;" ImageAlign="Right" ImageUrl="~/ImgRpts/RptTaskResults.jpg" />

                <h5>Reports - Task Results (by Task)</h5>
                <p>
                    Produces an 'Overall Results' style of report for a specific task.
                </p>
                <p>
                    The report is intended for the F3B multi-task style of competition so that the rankings
                within each task can be produced.
                </p>
                <br />
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="CustomReports" HeaderText="Custom Reports" TabIndex="1">
            <ContentTemplate>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
                    <%--CUSTOM REPORTS--%>
                    <asp:TabPanel runat="server" ID="TabPanel4" HeaderText="Custom Reports" TabIndex="0">
                        <ContentTemplate>
                            <div>

                                <asp:Image ID="Image11" Style="width: 60%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right"
                                    ImageUrl="~/ImgRptsCustom/ReportsMenu.jpg" />
                                <h5>Custom Reports</h5>
                                <p>
                                    These reports can be customised for each competition.</br></br>
                                       <b>Page Headings</b></br>
                                        - Specify one or two logos, one to print on the left, the other on the right.</br>
                                       - Specify six lines of text for the page heading.</br>
                                        <b>Report Footer</b></br>
                                       - Specify one or two lines of text for the report footer.</br /></br />
                                        Click on the tabs to learn more about Custom Reports.

                                </p>

                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <%--DESIGN--%>
                    <asp:TabPanel runat="server" ID="TabPanel9" HeaderText="Design" TabIndex="1">
                        <ContentTemplate>
                            <asp:Image ID="Image14" Style="width: 60%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRptsCustom/Design.jpg" />

                            <h5>Custom Reports - Design</h5>
                            <p>
                                <b>This is where you specify:</b></br>
                                - the logos to print at the top of each page (optional)</br>
                                - up to six lines of text to print at the top of each page</br>
                                - up to two lines of text to print at the end of the reports</br>
                                - where the competition is in two parts, preliminary rounds and a fly-off, specify the two 'linked' competitions
                                for the 'FlyOff and Prelim Results' report.</br></br>

                                <b>Note about the sixth line of text:</b></br>
                                When generating the reports, the system adds the following text to the text on the sixth row (if any)</br></br>
                                 - Overall Results - adds '<b> - Overall Results</b>'</br>
                                - Team Results - adds '<b> - Team Results</b>'</br>
                                - Team Results Summary - adds '<b> - Team Results</b>'</br>
                                - FlyOff and Prelim Results - adds '<b> - Final Results</b>
                            '
                        </ContentTemplate>
                    </asp:TabPanel>
                    <%--OVERALL RESULTS--%>
                    <asp:TabPanel runat="server" ID="TabPanel10" HeaderText="Overall Results" TabIndex="2">
                        <ContentTemplate>
                            <asp:Image ID="Image15" Style="width: 70%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRptsCustom/OverallResults.jpg" />

                            <h5>Custom Reports - Overall Results</h5>
                            <p>
                                Shows scores by round for each pilot.<br />
                                <br />

                                If selected in the Competition setup screen:</br>
                                 - Country will print</br>
                                 - Registration will print</br>
                                These choices can also made or overridden in the report selections screen.
                                </br></br>

                                When running the report, there are also options to include:</br>
                                - Pilot Start Numbers</br>
                                - Pilot Class</br>
                                - Team</br>
                                - Percent</br>
                                - Raw Score

                            </br><br />
                                <b>Note: The report shown was created from fabricated data. It is for demonstration purposes only.</b>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <%--TEAM RESULTS--%>
                    <asp:TabPanel runat="server" ID="TabPanel11" HeaderText="Team Results" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image10" style="width:80%; height:80%" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptLandings.jpg" />--%>
                            <asp:Image ID="Image16" Style="width: 70%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRptsCustom/TeamResults.jpg" />
                            <h5>Custom Reports - Team Results</h5>
                            <p>
                                Shows scores by round for each team and pilot.<br />
                                <br />

                                If, for each team, all members have the same Country Code,</br>
                                    you will be asked if this is an International competition.</br>
                                    - If Yes, then the team designation will Country Code
                                    - If No, then the team designation will be Team Number

                                If selected in the Competition setup screen:</br>
                                 - Country will print</br>
                                 - Registration will print</br>
                                    These choices can also made or overridden in the report selections screen.
                                </br></br>


                                When running the report, there are also options to include:</br>
                                - Pilot Start Numbers</br>
                                - Pilot Class</br>
                                - Percent</br>
                                - Raw Score
                                    </br><br />
                                <b>Note: The report shown was created from fabricated data. It is for demonstration purposes only.</b>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--TEAM RESULTS SUMMARY--%>
                    <asp:TabPanel runat="server" ID="TabPanel12" HeaderText="Team Results - Summary" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image10" style="width:80%; height:80%" runat="server" ImageAlign="Right" ImageUrl="~/ImgRpts/RptLandings.jpg" />--%>
                            <asp:Image ID="Image17" Style="width: 70%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRptsCustom/TeamResultsSummary.jpg" />
                            <h5>Custom Reports - Team Results - Summary</h5>
                            <p>
                                Shows total scores for each team and pilot.<br />
                                <br />

                                If all members of each team have the same Country Code, you will be asked to verify that this is an International competition.</br>
                                    - If Yes, then the team designation will Country Code</br>
                                    - If No, then the team designation will be Team Number</br></br>

                                If selected in the Competition setup screen:</br>
                                 - Country will print</br>
                                 - Registration will print</br>
                                    These choices can also made or overridden in the report selections screen.
                                </br></br>

                                When running the report, there are also options to include:</br>
                                - Pilot Start Numbers</br>
                                - Pilot Class</br>
                                - Percent</br>
                                - Raw Score
                                    </br><br />
                                <b>Note: The report shown was created from fabricated data. It is for demonstration purposes only.</b>
                        </ContentTemplate>
                    </asp:TabPanel>




                    <%--FLYOFF AND PRELIM RESULTS--%>
                    <asp:TabPanel runat="server" ID="TabPanel13" HeaderText="FlyOff and Prelim Results" TabIndex="4">
                        <ContentTemplate>
                            <asp:Image ID="Image18" Style="width: 70%; margin-right :12px; margin-left :4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgRptsCustom/FlyOffAndPrelimResults.jpg" />
                            <h5>Custom Reports - FlyOff and Prelim Results</h5>
                            <p>
                                This report shows summary scores from both the FlyOff rounds and the Preliminary rounds.<br />
                                <br />

                                You are asked to confirm the number of rounds to be taken into account from each competition.</br><br />
                                The report then runs.</br><br />

                                If selected in the Competition setup screen:</br>
                                 - Country will print</br>
                                 - Registration will print</br>
                                    These choices can also made or overridden in the report selections screen.
                                </br></br>

                                When running the report, there are also options to include:</br>
                                - Team</br>
                                - Pilot Class</br></br>
                             
                                    
                                    <b>Note: The report shown was created from fabricated data. It is for demonstration purposes only.</b>
                        </ContentTemplate>
                    </asp:TabPanel>


                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="EmailReports" HeaderText="Email Reports" TabIndex="0">
            <ContentTemplate>
                <div>
                    <h5>Email Reports<asp:Image ID="Image12" runat="server" style="width: 70%; margin-right :4px; margin-left :4px; margin-bottom :20px;" ImageAlign ="Right" ImageUrl="~/ImgEmail/EmailReports.jpg"></asp:Image>
                    </h5>
                    <p>
                        This screen is accessible from the Competition setup screen.<br />
                        Easily send emails to the pilots in the competition.<br />
                    </p>
                    <ul>
                        <li>Automatically fills in email addresses for the competition pilots.</li>
                        <li>Lists all available reports that can be attached. Click to attach.</li>
                        <li>Allows browsing for other files and attaching them to the email.<br />
                            These could be photos, PDF versions of the reports (that you create yourself) and
                        similar.</li>
                        <li>eScoring links can be emailed.<br />
                            Each pilot receives 1) his own link, or 2) links for all in his team, or 3) links for all pilots.<br />
                            Email recipients who are not pilots do not receive these links in their emails.
                        </li>
                    </ul>
                    <ul>
                        <li>Allows copies to be sent to others.</li>
                        <li>Allows space for a message.</li>
                        <li>All pilots are listed. Missing or invalid email addresses
                        can be edited on this screen. Changes are saved on the pilot master file record.</li>
                    </ul>
                    <ul>
                        <li>A copy of the email is sent to your nominated email address so that you have a record
                        of what was sent.</li>
                        <li>All downloaded reports are deleted when you close the screen.</li>
                    </ul>
                    <p>
                        Click the <b>Email Settings</b> button to create and save
                    the settings needed to send your email.<br />
                        See below for details about <b>Email Settings</b>.
                    </p>
                </div>

                <div>
                    <hr />
                    <h5>Email Settings
                     <asp:Image ID="Image13" runat="server" style="margin-right :4px; margin-left :4px;"  ImageAlign="Right" ImageUrl="~/ImgEmail/EmailSetup.jpg"></asp:Image>
                    </h5>


                    <p>
                        These settings depend on the email service that you want to use.
                    It may be the service provided by your internet service provider or a service provided by Google (gMail), Hotmail or similar.<br />
                        <br />
                        If provided by your internet service provider -
                        <br />
                        - From Email: email address, like <i>my.name@internetprovider.com.au.</i><br />
                        - SMTP Server: something like <i>mail.tpg.com.au</i><br />
                        - SSL Port: enter the value found from your service provider's website.<br />
                        - Login name: the login name used to log on to your email account. This may be different to the login to your service provider's website.<br />
                        - Password: the password used to log on to your email account.<br />
                        <br />
                        If you want to send using your gMail, Hotmail or similar account -
                        <br />
                        - From email: email address, like <i>my.name@gmail.com.</i><br />
                        - SMTP Server: will be like <i>smtp.gmail.com.</i> or like <i>mail.gmail.com</i>.<br />
                        - SSL Port: value is whatever gMail, Hotmail and so on specify for this purpose.<br />
                        - Login name and password are the same as you would normally use to log on to your email account.<br />

                        <br />
                        This information is saved on your computer and used for sending the emails that you create.<br />
                        <br />
                        Your password is saved in encrypted form to protect your privacy.<br />
                        <br />
                        You can change these settings at any time.
                    </p>
                    <p>
                        <b>If sending from a gMail account..........</b><br />
                        Google require two extra steps to send emails from a gMail account.<br />
                    </p>
                    <ul>
                        <li>Turn on 2-Step Verification, and</li>
                        <li>Generate an App Password (to use instead of the usual password)</li>
                    </ul>
                    <p>
                        Log in to your gMail account and click on the cog wheel for settings -

                   
                    <ul>
                        <li>Navigate to Settings→Accounts and Import→Change Account Settings→Other Google Account settings.</li>
                        <li>Activate 2-Step Verification<br />
                            Go to Sign-in and Security→Signing in to Google→2-Step Verification</li>
                        <li>Generate an App Password<br />
                            Go to Sign-in and Security→Signing in to Google->App passwords</li>
                    </ul>
                        <p>
                            In GliderScore, use the <b>App Password</b> that was generated instead of your usual password.<br />
                            Save your settings. Send your email!
                        </p>
                        <br />
                        <br />
                </div>

                <div>
                    <hr />
                    <h5>Pilot Email Addresses
                              <asp:Image ID="Image19" runat="server" style="margin-right :4px; margin-left :4px;"  ImageAlign="Right" ImageUrl="~/ImgEmail/PilotEmailAddress.jpg"></asp:Image>
                    </h5>

                    <p>
                        Click on <b>Pilots</b> on the Main Menu to access the pilot records.<br />
                        <br />
                        This is where the email addresses are saved.<br />
                        <br />

                        When you go to Email Reports, the email form is automatically filled
                            with addresses from the Pilots file.
                    </p>



                </div>

            </ContentTemplate>
        </asp:TabPanel>













    </asp:TabContainer>
</asp:Content>

