<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3KIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3KIntroTab" HeaderText="F3K Introduction">
            <ContentTemplate>
                <div>
                    <br />
                    <h5>
                        F3K - Hand Launched Glider</h5>
                        
                    <p>F3K is difficult to run partly because of the variety of tasks and partly<br />
                       because of the score collection and entry issues.<br />
                       GliderScore takes all of this into account in an integrated way so that the<br />
                       process of setting up, running and scoring F3K competitions is straightforward.</p>
                    <p>
                        Four new tasks become official effective 1 January 2020.<br />
                        Task D-ladder remains in GliderScore.<br />
                        Task D(1) - Two flights in 10 minutes. 5 minute maximum. Added to GliderScore.<br />
                        Task E - Poker - 5 flights to time counted in 10 minutes remains in GliderScore.<br />
                        Task E(1) - Poker - maximum of 3 flights to time counted (in 10 minutes). Added to GliderScore.<br />
                        Task E(2) - Poker - maximum of 3 flights to time counted (in 15 minutes). Added to GliderScore.<br />
                        Task L - One flight in 10 minutes. 9:59 maximum. Added to GliderScore.<br />
                        Task M - Huge Ladder - 3:00, 5:00 and 7:00 flights in 15 minutes. Added to GliderScore.
                    </p>
                    <p>
                        The "tie-break" rule 5.7.10.2 that specifies how to rank pilots with the same final score<br />
                        but different dropped scores is correctly implemented in the Overall Results report.
                    </p>


                    <p>
                        Main features</p>
                    <ul>
                        <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                    </ul>
                    <ul>
                        <li>Creates an optimised draw that avoids frequency and/or team clashes.</li>
                        <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                    </ul>
                    <ul>
                        <li>Tasks for each round can be selected as part of the process of printing Score Cards.<br />
                            Tasks can also be selected in the Scoring screen. In this case, scores automatically
                            re-calculate<br />
                            according to the newly selected task rules.</li>
                    </ul>
                    <ul>
                        <li>Enter actual flight times in the order flown. The program takes care of necessary
                            adjustments (except Poker).</li>
                        <li>One-click score entry for Task D. See below for details.</li>
                        <li>A task 'O' (Other) is provided for non-FAI tasks. All times entered are simply added
                            together.</li>
                    </ul>
                    <ul>
                        <li>Pilots can be moved between groups, and even rounds, for re-flights.</li>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                        <li>Deducts up to five drop scores at predetermined rounds flown.</li>
                        <li>Deducts penalties from the final score.</li>
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
                    <p><b>Expand <b>F3K</b> on the side menu to work through these features.</b></p>    
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
                            - print the score cards (scoring sheets also available) (see <a href="DrawRounds.aspx?ScoreCards">
                                here</a>)</li>
                        <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF3K">here</a>).</li>
                        <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
                            here</a>).</li>
                    </ul>--%>
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" width="60%" ImageAlign="Right" ImageUrl="~/ImgScore/ScoreF3K.jpg" />
                    <p>
                        Example of scoring for F3K</p>
                    <ul>
                        <li>The Task for the Round is selected here</li>
                        <li>If the Task is changed, all scores for the Round re-calculate automatically</li>
                    </ul>
                    <div>
                        <asp:Image ID="Image22" runat="server" width="60%" ImageAlign="Right" ImageUrl="~/ImgScore/ScoreF3K1.jpg" />
                        <p>
                            <b>Double-Click Score Entry</b><br />
                            <br />
                            Double-Click scoring for Task D (flight of 30 secs, then increasing by 15 secs).<br />
                            <br />
                            <b>Task D Example</b> as shown<br />
                            A pilot achieves all 7 flight times. A double-click in the Time7 column for that pilot
                            enters all scores instantly.<br />
                            Double-click on any other column and the scores to that point will be entered and later
                            scores adjusted to zero.<br />
                        </p>
                    </div>
                </div>
                <div>
                    <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawF3KScoreSheetSample.jpg" />
                    <p>
                        Example of Score Card printout for F3K<br />
                        <br />
                        For more details, look <a href="DrawRounds.aspx?ScoreCards">here</a>.</p>
                </div>
                <div>
                <p><b>Watch the Comp Setup F3K video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/zO-aAAP_4y4?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
