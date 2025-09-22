<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3GIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3GIntroTab" HeaderText="F3G Introduction">
            <ContentTemplate>
                <div>
                  
                    <h5>F3G - Multi-Task Glider with Electric Motor</h5>
                    <p>A round of F3G competition involves completion of three tasks.<br />
                        These are Duration, Distance and Speed.<br />
                        The duration task has a height penalty element that is similar to F5J.</p>
                    <p>eScoring is available for this Class.</p>
                    <p>Download the FAI F3G rules for 2025 <a href="/zipfile/SC4_vol_f3_soaring_25_F3G.pdf">here</a>.</p>
                    <p>
                        GliderScore makes the running of F3G comps as easy as it can be.<br />
                        It handles entering pilots, creating draws for duration, distance and speed,<br />
                        printing out the draws and score sheets,<br />
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
                        <b>Expand <b>F3G</b> on the side menu to work through these features.</b></p> 
                    <hr />
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesF3G.jpg" />
                    <p>
                        Example competition setup for F3G</p>
                    <ul>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>'Deduction from Flight Score' is set to 'Height Penalty'</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                </div>
                <div>
                <p><b>Watch the Comp Setup F3B video (very similar to setup for F3G).</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/tYesYLiLwzc?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
