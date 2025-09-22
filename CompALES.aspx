<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="ElectricIntro" runat="server">
        <asp:TabPanel runat="server" ID="ALESIntroTab" HeaderText="ALES Introduction">
            <ContentTemplate>
                <div>
                    <h5>
                        Altitude Limited Electric Soaring (non-FAI)</h5>
                    <p>
                        This page is about altitude limited electric soaring gliders as flown in the USA.<br /><br />
                        <b>Rules</b><br />
                        These competitions are run to a variety of local rules.  A proposed set of rules has<br />
                        been submitted to the 'Academy of Model Aeronautics' (the AMA) and can
                        be found <a href="http://www.modelaircraft.org/files/RCE13-2-2Kallevang.pdf">here</a>.<br />
                        
                        A feature of these rules is that flight times are group scored and the<br />
                        landing bonus is added on afterwards.  The maximum round score is 1050.<br />
                        Generally the group scored flight time is the major component of the score.</p>
                    <p>
                        Main features</p>
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
                   
                    <p>
                        <b>Expand <b>ALES</b> on the side menu of this web page to work through these features.</b></p>
                    <hr />
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%" ImageUrl="~/ImgSetup/CompScoringRulesALES.jpg" />
                    <p>
                        Example competition setup for ALES</p>
                    <ul>
                        <li>GroupScore option selected is 'Time'</li>
                        <li>Target time can be changed</li>
                        <li>Decimal places for timing can be changed</li>
                        <li>Different Landing bonus tables can be used</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                </div>
                <div>
                <p><b>Watch the Comp Setup ALES video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/2j5aUJqXxU0?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
