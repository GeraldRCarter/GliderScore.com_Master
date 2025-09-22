        <%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Dim varID As String = Request.QueryString().ToString

        If varID = "QuickStart" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(MainMenuTabs, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("QuickStart")
            Ctr1.ActiveTab = Tab1
            Exit Sub

        ElseIf varID = "Pilots" Or varID = "NewComp" Or varID = "NewCompSetup" Or varID = "CreateDraw" Or varID = "ScoreEntry" Or varID = "Reports" Then
            Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(MainMenuTabs, AjaxControlToolkit.TabContainer)
            Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("QuickStart")
            Ctr1.ActiveTab = Tab1
            Dim ctr2 As AjaxControlToolkit.TabContainer = Tab1.FindControl("QuickStartTabContainer")
            Dim tab2 As AjaxControlToolkit.TabPanel = ctr2.FindControl(varID)
            ctr2.ActiveTab = tab2
            Exit Sub
        End If

    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<%--CONTENT STARTS HERE--%>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--HOME PAGE--%>
    <asp:TabContainer ID="MainMenuTabs" runat="server">
        <asp:TabPanel runat="server" ID="Home" HeaderText="Home">
            <ContentTemplate>

                <asp:Image ID="Image7" runat="server" style="margin-right:4px; margin-left :4px;" AlternateText="Mildura 2013" Width ="98%"
                    ImageAlign="Left" ImageUrl="~/ImgHomePage/DSC01993a.jpg" ToolTip='Wentworth, NSW, Australia October 2019' />

                <div>
                    <p style="margin-top: 0px; padding-bottom: 0px;">
                        You can find the latest FAI (Sporting Code) rules here <a href="https://www.fai.org/page/ciam-code">https://www.fai.org/page/ciam-code</a>.
                    </p>
                </div>

<%--                <h5 style="margin-bottom:5px; margin-top:5px;">Introduction</h5>--%>

                <p>
                    GliderScore has all the features needed from pilot entry to final results.<br />
                    It is largely intuitive but of course there is a learning curve to go through.<br />
                    To help you there is this website and the help that is built into the program.<br /><br />
                </p>
                <ul>
                    <li>You will need a Windows PC and the GliderScore program.</li>
                    <li>You can download the program <a href="download.aspx">here</a>.</li>
                    <li>To start learning, click on the QuickStart tab above or click <a href="Default.aspx?QuickStart">here.</a></li>
                </ul>

                <p>
                    GliderScore ...
                </p>
                <ul>
                    <li>Automates the running of your competition.<br />
                         - The DigitalTimer automates calling pilots to fly and timing of flight groups.<br />
                         - eScoring and the Automatic Download/Upload feature automates score collection and updating.
                    </li>
                    <li>creates an excellent draw</li>
                    <li>produces draw reports, scoring sheets and score cards</li>
                    <li>allows easy entry of flight data and instantly calculates scores</li>
                    <li>produces up to date competition results at any time</li>
                    <li>allows emailing of draw reports and final results to all competition pilots</li>
                    <li>integrates audio, timing and digital clock display to run the competition</li>
                    <li>has a built in eScoring system to submit scores using smartphones</li>
                    <li>helps users to avoid mistakes with extensive validation code</li>
                </ul>
                
                <p style="position: relative; top: -0px">
                    <b>RECENT UPDATES</b> (Click <a href="Download.aspx">here</a> for the download page.)<br />
<%--                    The latest downloads include all bug fixes.--%>
                </p>


                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>2025-22-09: GliderScore.com Online Scores updated; GliderScore minor bugs fixed.</b></li>
                    <li style="list-style: none"><b>GliderScore 6.78 Build 2025-07-01 Update 2 (Updated 2025-09-22)</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GliderScore.com Online Scores now includes Team Results reporting. Any competitions uploaded using GliderScore 6.77<br />
                        or higher will have automatically uploaded the required team scoring parameters.<br />
                        Early competitions with the UseTeams? option selected can be re-uploaded to make the team report available.</li>
                    <li>GS - A few very minor bugs have been fixed.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.78 Build 2025-07-01 Update 1 (Updated 2025-08-05)</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS - 'Create a New Group' process improved so that only valid Round numbers can be selected.</li>
                    <li>GS - Bug fix - The Check, Swap Lanes and Swap Helpers buttons were not enabled in some circumstances.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.78 Build 2025-07-01</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS Website - GliderScore.com is now https instead of http.</li>
                    <li>GS - The selected Registration option now relates to a competition instead of becoming the default for the whole system.</li>
                    <li>GS - Score Check function now shows all pilots in a round. Previously only showed pilots having out-of-range values.</li>
                    <li>GS - A new translation file for Polish has been contributed by Andrzej Kokoszka.<br />
                            It is included in the full download and is also available from the Translate page.</li>
                    <li>GS - Updated country codes for Singapore and Lebanon to new IOC codes.</li>
                    <li>GS - F3K - New task L, one flight in 7 minutes (6:59 max) is now supported.</li>
                </ul>


                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.78 Build 2025-07-01</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS Website - GliderScore.com is now https instead of http.</li>
                    <li>GS - The selected Registration option now relates to a competition instead of becoming the default for the whole system.</li>
                    <li>GS - Score Check function now shows all pilots in a round. Previously only showed pilots having out-of-range values.</li>
                    <li>GS - A new translation file for Polish has been contributed by Andrzej Kokoszka.<br />
                            It is included in the full download and is also available from the Translate page.</li>
                    <li>GS - Updated country codes for Singapore and Lebanon to new IOC codes.</li>
                    <li>GS - F3K - New task L, one flight in 7 minutes (6:59 max) is now supported.</li>
                </ul>


                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 4 Build 2025-04-22</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS - Fixes bug - Create Playlist - incorrect display time if announcements are during preparation time.<br />No effect on actual running of the Digital Timer.</li>
                    <li>DT - Minor code changes to improve performance.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 3 Build 2025-04-14</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug preventing 'Create a New Group' (option in Scoring screen) from working.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 2 Build 2025-04-07</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug in 'Draw Helpers' report when there are two unequal groups per round.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 1 Build 2025-03-26</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug preventing generation of a playlist for the Digital Timer program.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Build 2025-03-25</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Additional score entry validation created for (NonFAI) Electric class.</li>
                    <li>GS - For F5B - added scoring column for no laps flown penalty (Rule 5.5.4.5 f)</li>
                    <li>GS - Number of characters allowed for pilot's first and last names increased to 30.</li>
                    <li>GS - FAI Class F3G is now fully supported by GliderScore.</li>
                </ul>
                                                                   
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="QuickStart" HeaderText="QuickStart">
            <ContentTemplate>
                <asp:TabContainer ID="QuickStartTabContainer" runat="server">
                    <asp:TabPanel runat="server" ID="QuickStart_Home" HeaderText="Quick Start" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start</h5>
                            <p>
                                OK. You have downloaded and installed GliderScore and it all looks a bit complicated.<br />
                                What comes next?<br />
                                <br />
                                This Quick Start section will guide you through the basic setting up of a Thermal Duration competition.<br />
                                <br />
                                Each step is described in the tabs that follow.<br />
                                Click on each tab to go through the steps in order.<br />
                                <br />
                            </p>
                            <ul>
                                <li><a href="Default.aspx?Pilots"><b>Pilots</b></a> How to get pilot details into GliderScore.</li>
                                <li><a href="Default.aspx?NewComp"><b>NewComp</b></a> See how to create a new competition record.</li>
                                <li><a href="Default.aspx?NewCompSetup"><b>NewComp Setup</b></a> Set things up for scoring and be ready to create the draw.</li>
                                <li><a href="Default.aspx?CreateDraw"><b>Create Draw</b></a> A few clicks and your pilots will be assigned to their flight groups.</li>
                                <li><a href="Default.aspx?ScoreEntry"><b>ScoreEntry</b></a> Exactly how to enter scores into GliderScore.</li>
                                <li><a href="Default.aspx?Reports"><b>Reports</b></a> How to get the reports that you need (at any stage of your competition).</li>
                            </ul>
                            <p>Remember that these are the basics and there are other options available to deal with more complicated competitions.<br /><br />
                                Click on the <a href="Default.aspx?Pilots">Pilots</a> tab to continue.
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%-- **** PILOTS ****--%>
                    <asp:TabPanel runat="server" ID="Pilots" HeaderText="Pilots" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - Pilots</h5>
                            <p><b>Create pilot records</b></p>
                            <p>
                                We cannot avoid the creation of pilot records.<br />
                                Fortunately, it only has to be done once and the same records are used for all competitions.
                            </p>
                            <p>One method of creating pilot records is described here.</p>
                            <div>
                                <p><b>Click  the Pilots button on the Main Menu.</b></p>
                                <asp:Image ID="Image1" runat="server" ImageAlign="Left" Style="width:60%;" ImageUrl="~/ImgQuickStart/MainMenu.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p><b>Click the New button.</b></p>
                                <asp:Image ID="Image2" runat="server" ImageAlign="Left" Style="width:60%;" ImageUrl="~/ImgQuickStart/Pilots.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p>
                                    <b>Enter details for your pilot.</b><br />
                                    You must enter a First name and a Last name.<br />
                                    Other data is optional and may be left blank. You can edit the other details at a later time.<br />
                                    Click on the Save button.<br />
                                </p>
                            </div>
                            <div>
                                <asp:Image ID="Image3" runat="server" ImageAlign="Left" Style="width:60%;" ImageUrl="~/ImgQuickStart/AddPilot.jpg" />
                            </div>
                            <div>
                                <p>
                                    Repeat for all of your pilots. Or maybe just create six pilot records for now and do the rest later.<br /><br />
                                Click on the <a href="Default.aspx?NewComp">NewComp</a> tab to continue.
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <%-- **** NEWCOMP **** --%>

                    <asp:TabPanel runat="server" ID="NewComp" HeaderText="NewComp" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - NewComp</h5>
                            <p><b>Create a new competition</b></p>
                            <p>All that is needed here is a name, venue and date for the new competition.</p>
                            <div>
                                <p><b>Click the New button.</b></p>
                                <asp:Image ID="Image4" runat="server" ImageAlign="Left" Style="width:60%;" ImageUrl="~/ImgQuickStart/MainMenuNew.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p><b>Enter the competition name, venue and date. Then click OK.</b></p>
                                <asp:Image ID="Image5" runat="server" ImageAlign="Left" Style="width:60%;" ImageUrl="~/ImgQuickStart/NewComp.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p><b>You will then see this screen. Click OK and click Select.</b></p>
                                <asp:Image ID="Image6" runat="server" Style="width: 98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompSetup1.jpg" />
                            </div>
                            <div>
                                <p><b>Select a Competition Class</b></p>
                                <asp:Image ID="Image21" runat="server" Style="width: 98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompSetup1a.jpg" />
                            </div>
                            <div>
                                <p>
                                    <b>Click on the <a href="Default.aspx?NewCompSetup">NewComp Setup</a> tab to continue.</b>
                                    </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%-- **** NEWCOMPSETUP **** --%>
                    <asp:TabPanel runat="server" ID="NewCompSetup" HeaderText="NewComp Setup" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - NewComp Setup</h5>
                            <p>
                                <b>Now we are going to enter details for our thermal duration competition</b><br />
                                This is the <b>Competition Setup</b> screen.<br />
                                This screen has all the fields appropriate for the selected competition class.<br /><br />
                                <p>
                                    <b>Now we are going to enter our pilots for this competition.</b><br />
                                    Click on the Pilot Entry button.
                                </p>
                            </p>
                            <br />
                            <div>
                                <asp:Image ID="Image8" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompSetup3.jpg" />
                            </div>
                            <br>

                            <div>
                                <p>
                                    <b>You will then see the Pilot Entry screen.</b><br />
                                    To select a pilot, click on a pilot on the left, then use the right pointing arrow to add that pilot to your competition.<br />
                                    You can simply double click a pilot on the left and the same thing will happen.<br />
                                    Pilot frequencies can be edited directly in the grid on the right. For 2.4GHz enter 2.4.
                                    When all pilots are entered click on the Save button.
                                </p>
                                <asp:Image ID="Image10" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/PilotEntry.jpg" />
                            </div>
                            <br />
                            <div>
                                <p><b>Just a few more things and we will be ready to create the draw.</b></p>

                                <p>
                                    You might want a score discard after a certain number of rounds.<br />
                                    If so, change the Drop Worst Task Scores - 1 at Rnd 99 to read 1 at Rnd 6, or whatever round number you choose.
                                </p>
                                <p>
                                    Set the Duration target time in seconds. In this case it is 600 seconds (10 minutes).<br />
                                    Choose the timing decimals. The range is 0 - 3 decimals.<br />
                                    Set the Points/Second to '1'. You would choose '2' for F3L.<br /><br />

                                    You will probably want to award points for good landings.<br />
                                    Select one of the Landing Bonus tables from the drop down list.<br />
                                    You can check the landing bonus table details by clicking on the View Lndg button.<br />
                                    You can create your own landing bonus table from the Main Menu.
                                </p>
                                <p>
                                    Change the number of flight groups per round to a suitable figure.<br />
                                    The Pilots/Group (Min/Max) figures change to reflect the number of flight groups per round.
                                </p>
                            </div>
                            <div>
                                <asp:Image ID="Image11" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompSetup4.jpg" />
                            </div>
                            <div>
                                <p>
                                    Now we are ready to create the draw.<br /><br />
                                Click on the <a href="Default.aspx?CreateDraw">Create Draw</a> tab to continue.
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%-- **** CREATE DRAW **** --%>
                    <asp:TabPanel runat="server" ID="CreateDraw" HeaderText="Create Draw" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - Create Draw</h5>
                            <p><b>Now we are going to create our draw</b></p>
                            <br />
                            <div>
                                <p><b>Clicking on the Draw button in the Competition setup screen gives us this.</b></p>
                                <p>Adjust the number of rounds that you want to draw then click the Start Draw button.</p>
                                <asp:Image ID="Image12" runat="server" ImageAlign="Left" ImageUrl="~/ImgQuickStart/CreateDraw.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p>
                                    <b>When finished, close this screen to return to the Competition Setup screen.</b><br />
                                    At this stage you might want to print some draw reports, scoring sheets and so on.<br />
                                    Click on the Reports button to see all available reports at this stage.<br />
                                    I will leave you to investigate all of that on your own.<br />
                                    <br />
                                    I want to move on to Scoring.<br />
                                    In the Competition Setup screen, click on Score Entry.<br /><br />
                                Click on the <a href="Default.aspx?ScoreEntry">Score Entry</a> tab to continue.
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>


                    <%-- **** SCORE ENTRY DRAW **** --%>
                    <asp:TabPanel runat="server" ID="ScoreEntry" HeaderText="Score Entry" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - Score Entry</h5>
                            <p><b>Now we are going to enter some scores</b></p>
                            <br />
                            <div>
                                <p><b>Click on the Score Entry button.</b></p>
                                <asp:Image ID="Image13" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompScoreEntry.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p>
                                    Entering scores is pretty easy.<br />
                                    For times, enter the time without anything between the minutes and the seconds.<br />
                                    So, for 9:59, enter 959. For 10:00, enter 1000. Your data is automatically formatted.<br />
                                </p>
                                <p>Hint: An easy way to move to the next flight group is to hold down the Ctrl key and press the right-arrow key (on the keyboard).</p>
                                <asp:Image ID="Image14" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/ScoreEntry.jpg" />
                            </div>
                            <br />
                            <div>
                                <p>
                                    Now enter the landing score.<br />
                                    Any value from the Landing Bonus table 'Distance' column is valid.<br />
                                    The Landing Bonus table 'Points' value is added to the 'Points' score.<br />
                                </p>

                                <asp:Image ID="Image15" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/ScoreEntry1.jpg" />
                            </div>

                            <div>
                                <p>
                                    Enter the scores for the other pilots in a similar way.<br />
                                    As you enter scores, the 'TotalScore' figures are updated for you.
                                </p>

                                <asp:Image ID="Image16" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/ScoreEntry2.jpg" />
                            </div>
                            <div>
                                <p>
                                    Enter the scores for all pilots for all groups and you are done.<br />
                                    Close the Score Entry screen and go to Reports to generate the results.<br /><br />
                                Click on the <a href="Default.aspx?Reports">Reports</a> tab to continue.
                                </p>

                            </div>


                        </ContentTemplate>
                    </asp:TabPanel>

                    <%-- **** REPORTS **** --%>
                    <asp:TabPanel runat="server" ID="Reports" HeaderText="Reports" TabIndex="10">
                        <ContentTemplate>
                            <h5>Quick Start - Reports</h5>
                            <p><b>Let's have a look at the Overall Results report.</b></p>
                            <br />
                            <div>
                                <p><b>Click on the Reports button.</b></p>
                                <asp:Image ID="Image17" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/NewCompSetup5.jpg" />
                            </div>
                            <br></br>
                            <div>
                                <p>
                                    Click on the Overall Results button.<br />
                                </p>
                                <asp:Image ID="Image18" runat="server" style="width:98%;" ImageAlign="Left" ImageUrl="~/ImgQuickStart/Reports.jpg" />
                            </div>
                            <br />
                            <div>
                                <p>Click to Preview or Print the report.                                                                   </p>

                                <asp:Image ID="Image19" runat="server" ImageAlign="Left" ImageUrl="~/ImgQuickStart/Reports1.jpg" />
                            </div>

                            <div>
                                <p>Either selection will give you something like this.</p>

                                <asp:Image ID="Image20" runat="server" ImageAlign="Left" ImageUrl="~/ImgQuickStart/Reports2.jpg" />
                            </div>
                            <div>
                                <p>
                                    Generate the other reports in a similar way.<br />
                                    <br />
                                    Congratulations, you are well on your way to mastering GliderScore.<br /><br />
                                    Now please dive in to the rest of the website where there is a lot more to learn.
                                </p>

                            </div>


                        </ContentTemplate>
                    </asp:TabPanel>

                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>



    </asp:TabContainer>
</asp:Content>
