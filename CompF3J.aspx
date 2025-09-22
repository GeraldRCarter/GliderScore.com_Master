<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3JIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3JIntroTab" HeaderText="F3J Introduction">
            <ContentTemplate>
                <div>
                    <h5>
                        F3J - Thermal Duration Glider</h5>
                    <p>
                        For your F3J competition, GliderScore handles it all from start to finish including
                        <br />
                        - entering pilots, creating the draw, printing the draw, score sheets and score
                        cards,<br />
                        entering and calculating the scores and instantly producing the reports.<br />
                        'Team Lanes' can be allocated as part of the draw process. This means that teams
                        will use<br />
                        the same lane for all flights within a round. If there are more teams than lanes,
                        teams will<br />
                        use the same lane as long as their pilots are in consecutive flight groups. Team
                        Lane allocations<br />
                        change for every new round.</p>
                         
                    <p>
                        Here are some features to consider.</p>
                    <ul>
                        <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                        <li>Unlimited number of Landing Bonus tables.</li>
                    </ul>
                    <ul>
                        <li>Creates an optimised draw that avoids frequency and/or team clashes.</li>
                        <li>For team events, teams can be automatically allocated to lanes on a round by round
                            basis.</li>
                        <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                    </ul>
                    <ul>
                        <li>Pilots can be moved between groups, and even rounds, for re-flights.</li>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown).</li>
                        <li>Deducts drop scores at predetermined number of rounds flown.</li>
                        <li>Deducts penalties from the final score.</li>
                    </ul>
                    <ul>
                        <li>Allows for one or two timekeepers. If two, times are averaged (but if one time entered,
                            averaging does not occur).</li>
                        <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                            or downloaded.</li>
                        <li>Score cards can be printed from the Reports menu.</li>
                        <li>Pilot's Score Records can be printed from the Reports menu.</li>
                    </ul>
                    <ul>
                        <li>Multiple competitions can be selected into a Competition Series and a series Championship
                            report automatically produced.</li>
                    </ul>
                    <p>
                        <b>Expand <b>F3J</b> on the side menu to work through these features.</b></p>
                    <hr />
                    <%--<p>
            In summary</p>
        <ul>
            <li>The Main Menu appears when you start the program (see <a href="MainMenu.aspx">here</a>).</li>
            <li>Start a New or Open an existing competition (see <a href="NewComp.aspx">here</a>).</li>
            <li>Complete everything on the Competition setup screen (full details <a href="Setup.aspx">
                start here</a>).</li>
            <li>Create the draw and<br />
                - print the draw report (see <a href="DrawRounds.aspx?DrawReport">here</a>)<br />
                - print the scoring sheets (see <a href="DrawRounds.aspx?ScoringSheets">here</a>)<br />
                - print the score cards (see <a href="DrawRounds.aspx?ScoreCards">here</a>)<br />
                - print pilot score records (see <a href="DrawRounds.aspx?PilotScoreRecord">here</a>)</li>
            <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF3J">here</a>).</li>
            <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
                here</a>).</li>
        </ul>--%>
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesF3J.jpg" />
                    <p>
                        Example competition setup for F3J</p>
                    <ul>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>'Deduction from Flight Score' is set to 'Late Landing'</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                </div>
                   <div>
                <p><b>Watch the Comp Setup F3J video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/cmE7Zzs2PXU?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
