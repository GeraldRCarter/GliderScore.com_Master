<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F5JIntro" runat="server">
        <asp:TabPanel runat="server" ID="F5JIntroTab" HeaderText="F5J Introduction">
            <ContentTemplate>
                <div>
                    <h5>
                        F5J - Thermal Duration Glider<br />
                        with Electric Motor and Altimeter/Motor Run Timer</h5>
                    <p>
                        A rules proposal for F5J was considered and approved by CIAM in April 2011<br />
                        and became an official FAI provisional class on 1 January 2012.<br />
                        F5J was elevated to full official status at the 2016 CIAM Plenary Meeting effective 1 January 2017.<br />
                        <br />

                        A good resource for F5J (particularly in the USA) is <a href="http://www.f5j-usa.com" target="_blank">www.f5j-usa.com</a>.<br />
                        <br />

                        GliderScore 6.23 (and later) has the features to run F5J competitions.<br />
                        <br />
                        F5J is like F3J but with electric powered models.<br />
                        In the F5J rules there is a height penalty based on "... the maximum altitude recorded
                        from<br />
                        the moment the model leaves the launchers hand until 10 seconds after the motor
                        is stopped."<br />
                        <br />
                        An F5J score is made up of<br />
                        - one point per second of flight time, plus<br />
                        - the F5J landing bonus, less<br />
                        - the height penalty.<br />
                        <br />
                        The height penalty is based on a reference height of 200 metres.<br />
                        0.5 points per metre is deducted for start heights up to 200 metres.<br />
                        3 points per metre is deducted for start heights above 200 metres.<br />
                        <br />
                        As an example, a start height of 201 metres would incur a height penalty of 103
                        points.<br />
                        With GliderScore the reference height and penalty points per metre can be changed
                        for local competitions.

                        <br />
                        <br />
                        <ul>
                            <li style="list-style: none">Select one of the Motor Restart options. These change the way that Overall Results are compiled.</li>
                            <li style="list-style: none">The official (FAI) rules about Motor Restart apply from 1 January 2023.</li>
                            <li>FAI rule - Motor Restart is <b>not allowed</b> in Category 1 events (World and European championships).</li>
                            <li>FAI rule - Motor Restart is allowed at other events however the resulting zero score cannot be dropped.</li>
                            <li style="list-style: none">GliderScore provides a third option.</li>
                            <li>Unofficial rule - Motor Restart is allowed and the resulting zero can be dropped.</li>
                        </ul>
                        <br />
                    </p>
                     
                    
                    <div>
                        <table>
                            <tr>
                                <td>
                                    Click to view and/or save the official FAI F5J rules (2018 Edition).
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageAlign="Middle"
                                        ImageUrl="~/ImgAdobe/pdficon_large.gif" OnClientClick="window.open('zipfile/SC4_Vol_F5_Electric_21_F5J.pdf')"
                                        Width="32px" AlternateText="Click to view the rules proposal" />
                                </td>
                            </tr>
                        </table>
                    </div>
                   
                    <p>
                        Main features</p>
                    <ul>
                        <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                        <li>Unlimited number of Landing Bonus tables.</li>
                        <li>Reference height and penalty points per metre can be changed if required.</li>
                    </ul>
                    <ul>
                        <li>The draw separates pilots in the order based on same frequency and/or same team.</li>
                        <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                    </ul>
                    <ul>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                        <li>Deducts drop scores at predetermined number of rounds flown.</li>
                        <li>Deducts (safety) penalties from the final score.</li>
                    </ul>
                    <ul>
                        <li>Allows for one or two timekeepers. If two, times are averaged (but if one time entered,
                            averaging does not occur).</li>
                        <li>Where a time or landing score is entered, validates that a height has also been entered.</li>
                        <li>Where a time greater than the target time is entered<br />
                             - prevents entry of a landing score, and<br />
                             - time score is based on the target time.</li>
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
                    <p>
                        <b>Expand <b>F5J</b> on the side menu to work through these features.</b></p>
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
                        <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF5J">here</a>).</li>
                        <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
                            here</a>).</li>
                    </ul>--%>
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesF5J.jpg" />
                    <p>
                        Example competition setup for F5J</p>
                    <ul>
                        <li>Decimals for Total Score should be set to 1</li>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>'Deduction from Flight Score' is set to 'Height Penalty'</li>
                        <li>Reference height and penalty points per metre can all be changed</li>
                        <li>Number of timekeepers can be one or two</li>
                        <li>Motor ReStart options are<br />
                            - Not allowed<br />
                            - Allowed but zero cannot be dropped<br />
                            - Allowed and zero can be dropped.
                        </li>
                    </ul>
                </div>
                <div>
                <p><b>Watch the Comp Setup F5J video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/GAw-FU3nRHw?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
