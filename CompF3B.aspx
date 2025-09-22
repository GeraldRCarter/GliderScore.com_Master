<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3BIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3BIntroTab" HeaderText="F3B Introduction">
            <ContentTemplate>
                <div>
                  
                    <h5>
                        F3B - Multi-Task Glider</h5>
                   
                    <p>
                        GliderScore makes the running of F3B comps as easy as it can be.<br />
                        It handles entering pilots, creating draws for duration, distance and speed<br />
                        (or any combination of the three), printing out the draws and score sheets,<br />
                        entering and calculating the scores, and instantly producing the reports.<br />
                        The draws are all 'fair'. To speed up the competition, in the case of speed<br />
                        the order separates pilots on the same frequency and/or in the same team.<br />
                        The distance draw is totally separate from the duration draw to maximise fairness.</p>
                        
                        
                    <p>
                        Main features</p>
                    <ul>
                        <li>Can select any or all three tasks. Run speed and distance only if desired.</li>
                        <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                        <li>Unlimited number of Landing Bonus tables.</li>
                    </ul>
                    <ul>
                        <li>Creates an optimised draw that avoids frequency and/or team clashes (except speed).</li>
                        <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                    </ul>
                    <ul>
                        <li>Pilots can be moved between groups, and even rounds, for re-flights.</li>
                        <li>A speed group can be split into two, and split again if necessary.</li>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                        <li>Deducts drop scores (for each task) at selected number of rounds flown.</li>
                        <li>Deducts penalties from the final score.</li>
                    </ul>
                    <ul>
                        <li>Allows for one or two timekeepers. If two, times are averaged (but if one time entered,
                            averaging does not occur).</li>
                    </ul>
                    <ul>
                        <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                            or downloaded.</li>
                        <li>Score cards can be printed for the duration task from the Reports menu.</li>
                    </ul>
                    <ul>
                        <li>Multiple competitions can be selected into a Competition Series and a series Championship
                            report automatically produced.</li>
                    </ul>
                    <p>
                        <b>Expand <b>F3B</b> on the side menu to work through these features.</b></p> 
                    <hr />
                    <%--<ul>
            <li>The Main Menu appears when you start the program (see <a href="MainMenu.aspx">here</a>).</li>
            <li>Start a New or Open an existing competition (see <a href="NewComp.aspx">here</a>).</li>
            <li>Complete everything on the Competition setup screen (full details <a href="Setup.aspx">
                start here</a>).</li>
            <li>Create the draw and<br />
                - All tasks - print the draw reports (see <a href="DrawRounds.aspx?DrawReport">here</a>)<br />
                - All tasks - print the scoring sheets (see <a href="DrawRounds.aspx?ScoringSheets">
                    here</a>)<br />
                - Duration only - print the score cards (see <a href="DrawRounds.aspx?ScoreCards">here</a>)</li>
            <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF3B">here</a>).</li>
            <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
                here</a>).</li>
        </ul>--%>
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesF3B.jpg" />
                    <p>
                        Example competition setup for F3B</p>
                    <ul>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>'Deduction from Flight Score' is set to 'None'</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                </div>
                <div>
                <p><b>Watch the Comp Setup F3B video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/tYesYLiLwzc?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
