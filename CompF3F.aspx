<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3FIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3FIntroTab" HeaderText="F3F Introduction">
            <ContentTemplate>
             
                <h5>
                    F3F - Slope Soaring Glider</h5>
               
                <p>
                    To assist with F3F, GliderScore handles entering pilots, creating the draw,
                    <br />
                    printing out the draw and the score sheets, entering and calculating the scores<br />
                    and instantly producing the reports.<br />
                    To speed up the competition, the draw order separates pilots on the same frequency
                    and/or in the same team.</p>
                 <p>
                    Note that the score calculation for F3F is exactly the same as for the F3B Speed task.<br />
                    The shortest time wins so please select 'Speed' as the task for your F3F competition.</p>    
                     
                    
                <p>
                    Main features</p>
                <ul>
                    <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                </ul>
                <ul>
                    <li>Creates a draw that keeps pilots separated in the order by frequency and team.</li>
                    <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                </ul>
                <ul>
                    <li>A group can be split into two, and split again if necessary.</li>
                    <li>Whole groups can be re-flown.</li>
                    <li>New re-flight groups can be 'built' with selected pilots.</li>
                </ul>
                <ul>
                    <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                    <li>Deducts drop scores at predetermined rounds flown.</li>
                    <li>Deducts penalties from the final score.</li>
                </ul>
                <ul>
                    <li>Allows for one or two timekeepers. If two, times are averaged (but if one time entered,
                        averaging does not occur).</li>
                </ul>
                <ul>
                    <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                        or downloaded.</li>
                </ul>
                <ul>
                    <li>Multiple competitions can be selected into a Competition Series and a series Championship
                        report automatically produced.</li>
                </ul>
                <p>
                    <b>Expand <b>F3F</b> on the side menu to work through these features.</b></p>
                <hr />
                <%--  <p>
        In summary</p>
    <ul>
        <li>The Main Menu appears when you start the program (see <a href="MainMenu.aspx">here</a>).</li>
        <li>Start a New or Open an existing competition (see <a href="NewComp.aspx">here</a>).</li>
        <li>Complete everything on the Competition setup screen (full details <a href="Setup.aspx">
            start here</a>).</li>
        <li>Create the draw and<br />
         - print the draw report (see <a href="DrawRounds.aspx?DrawReport"> here</a>)<br />
         - print the scoring sheets (see <a href="DrawRounds.aspx?ScoringSheets">here</a>)</li>
        <li>Start the competition and enter scores (see <a href="Scoring.aspx?ScoringF3F">here</a>).</li>
        <li>When all scores are entered and checked, print the results (see <a href="Reports.aspx?Overall">
            here</a>).</li>
    </ul>--%>
                <div>
                    <asp:Image ID="Image1" runat="server" style="float: Right; width: 73%"  ImageUrl="~/ImgSetup/CompScoringRuleF3F.jpg" />
                    <p>
                        Example competition setup for F3F</p>
                    <ul>
                        <li>Decimal places for timing can be changed</li>
                        <li>Number of timekeepers can be one or two</li>
                    </ul>
                </div>
                <div>
                <p><b>Watch the Comp Setup F3F video.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/bacGAuogUc8?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
