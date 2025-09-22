<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F5BIntro" runat="server">
        <asp:TabPanel runat="server" ID="F5BIntroTab" HeaderText="F5B Introduction">
            <ContentTemplate>
                <div>
                    <h5>
                        F5B - Electric Powered Motor Glider</h5>
                    <p>GliderScore integrates all aspects necessary to setup and run an F5B competition.<br />
                       In addition, you can change the landing points table, the points per lap and the<br />
                       target time to suit the level of competition to be run.  Other factors can be varied<br />
                       and the draw order keeps things running smoothly without delays due to frequency<br />
                       and/or team clashes.<br /><br />
                        GliderScore complies with all aspects of the 2016 FAI F5B rules.
                    </p>
                       
                    <p>
                        Main features</p>
                    <ul>
                        <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                        <li>Unlimited number of Landing Bonus tables.</li>
                    </ul>
                    <ul>
                        <li>The draw separates pilots in the order based on same frequency and/or same team.</li>
                        <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                    </ul>
                    <ul>
                        <li>A group can be split into two, and split again if necessary.</li>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                        <li>Deducts drop scores at predetermined number of rounds flown.</li>
                        <li>Deducts penalties from the final score.</li>
                    </ul>
                    <ul>
                        <li>Allows for one or two timekeepers. If two, times are averaged (but if one time entered,
                            averaging does not occur).</li>
                    </ul>
                    <ul>
                        <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                            or downloaded.</li>
                        <li>Score cards can be printed from the Reports menu.</li>
                    </ul>
                    <ul>
                        <li>Multiple competitions can be selected into a Competition Series and a series Championship
                            report automatically produced.</li>
                    </ul>
                    <p><b>Expand <b>F5B</b> on the side menu to work through these features.</b></p>    
                    <hr />
                   <%-- <p>
                        In summary</p>
                    <ul>
                        <li>The Main Menu appears when you start the program (see <a href="MainMenu.aspx">here</a>).</li>
                        <li>Start a New or Open an existing competition (see <a href="NewComp.aspx">here</a>).</li>
                        <li>Complete everything on the Competition setup screen (full details <a href="Setup.aspx">
                            start here</a>).</li>
                        <li>Create the draw and<br />
                            - print the draw report (see <a href="DrawRounds.aspx?DrawReport">here</a>)<br />
                            - print the scoring sheets (see <a href="DrawRounds.aspx?ScoringSheets">here</a>)<br />
                            - print score cards (see <a href="DrawRounds.aspx?ScoreCards">here</a>)<br />
                            - print pilot score records (see <a href="DrawRounds.aspx?PilotScoreRecord">here</a>)</li>
                        <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF5B">here</a>).</li>
                        <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
                            here</a>).</li>
                    </ul>--%>
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesF5B.jpg" />
                    <p>
                        Example competition setup for F5B</p>
                    <ul>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>'Deduction from Flight Score' is set to 'Watt-min'</li>
                        <li>Points per lap can be changed</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                    <p>When entering scores, enter the excess number of Watt-minutes used. 
                        The system calculates the penalty points according to the selections made.
                        </p>
                </div>
                <div>
                <p><b>Watch the Comp Setup F5B video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/jLEkAHSvDak?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
