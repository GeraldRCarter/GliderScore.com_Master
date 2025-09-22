<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" AutoEventWireup="false" CodeFile="CompF3L.aspx.vb" Inherits="CompF3L" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3LIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3LIntroTab" HeaderText="F3L Introduction">
            <ContentTemplate>
                <div>
                    <br />
                    <h5>
                        F3L - Radio Controlled Rudder/Elevator/Spoiler (RES) Gliders</h5>
                        
                    <p>F3L is a group scored thermal duration contest for low tech 2 meter span RES gliders.<br />
                       Each round comprises a duration task of 6 minutes in a 9 minute working time.<br />
                       Unlike most competitions, with F3L the time points are 2 x (flight time in seconds).<br /><br />
                        <b>Provisional Rules</b><br />
                        Provisional rules were approved at the 2021 FAI/CIAM Conference.<br />
                        The intent of the rules is that normalised scores are based on the total of flight score plus landing points.<br />
                        I believe that this point, and some others, will be edited for clarity before publication.<br />
                        The FAI Class Code is F3L.<br />
                        Download these rules <a href="/zipfile/sc4_vol_f3_soaring_24_F3L.pdf">here</a>.
<%--                       Landing points are exactly the same as for F3J.<br />--%>
<%--                       This is not an FAI class (at 6 November 2017).<br /><br />--%>

<%--                       The rules are in German but there is an English translation dating from 2016 on RCGroups.<br />
                       Apparently there have been some changes since this was done but no translation is available.<br />
                       If you find a better or more current translation then please let me know.<br />--%>
                       <%--<b>You can get the rules here</b> <input type="button" name="Button" style="color: #333333; font-size: 10px; 
                                position: relative; top: -0px; left: 0px; width: 160px; margin-top: 0px;" value="F3-RES (English Translation)" 
                                onclick ="window.open('zipfile/English Translation for Class F3-RES.pdf', 'download'); return false;"/>--%>
<%--                        <b>2016 translation of the rules is </b><a href="/zipfile/English Translation for Class F3-RES.pdf">here</a>.<br />
                        <b>2019 translation of the rules is </b> <a href="/zipfile/2019 English F3RES Rules Set Draft.pdf">here</a> (uploaded 2019-11-18).--%>
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
                        <li>Pilots can be moved between groups, and even rounds, for re-flights.</li>
                        <li>Whole groups can be re-flown.</li>
                        <li>New re-flight groups can be 'built' with selected pilots.</li>
                    </ul>
                    <ul>
                        <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                        <li>Deducts up to five worst Round scores at predetermined rounds flown.</li>
                        <li>Deducts penalties from the final score.</li>
                    </ul>
                    <ul>
                        <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                            or downloaded.</li>
                        <li>Score cards (for the duration task) can be printed from the Reports menu.</li>
                    </ul>
                    <p>Championship Reports<br />
                       Championship reports can be produced in two different ways.
                    </p>
                    <ul>
                        <li>Multiple competitions can be selected into a Competition Series (see Main Menu → Competition Series).<br />
                            The Competition Series report can then be produced.</li>
                        <li>The rounds flown from multiple competitions can be merged into a single competition file (see Main Menu → Merge).<br />
                            The standard competition reports apply to the merged competition.</li>
                    </ul>
                    <p><b>Expand <b>F3L</b> on the side menu to work through these features.</b></p>    
                    <hr />
                    
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server"  style="width: 65%; float: Right"  ImageUrl="~/ImgSetup/CompScoringRuleF3L.jpg" />
                    <p>
                        Basic competition setup for F3L</p>
                    <ul>
                        <li>Select the Duration task</li>
                        <li>Under Scoring Options<br />
                            - Select 'Drop worst Round scores'.<br />
                            - Select the round numbers at which drop scores will take effect.</li>
                        <li>Under Scoring Rules<br />
                            - Key in the 'Duration target time'.<br />
                            - Set the 'Points/Second' to 2.<br />
                            - Select the 'Landing bonus' table.
                        </li>
                    </ul>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>

