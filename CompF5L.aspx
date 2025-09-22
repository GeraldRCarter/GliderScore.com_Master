<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" AutoEventWireup="false" CodeFile="CompF5L.aspx.vb" Inherits="CompF5L" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F5LIntro" runat="server">
        <asp:TabPanel runat="server" ID="F5LIntroTab" HeaderText="F5L Introduction">
            <ContentTemplate>
                <div>
                    <br />
                    <h5>
                        F5L - Radio Controlled Thermal Gliders RES with Electric Motor and AMRT</h5>
                        
                    <p>F5L is a group scored thermal duration contest for low tech 2 meter span RES gliders.<br />
                       Each round comprises a duration task of 6:30 minutes in a 9 minute working time.<br />
                       Unlike most competitions, with F5L the time points are 2 x (flight time in seconds).<br />
                       Relaunches are allowed with only the final flight to be counted.<br /><br />
                        <b>Provisional Rules</b><br />
                        Rules for F5L are provisional at this time (February 2023).<br />
                        You can find the rules at this link <a href="https://www.fai.org/page/ciam-code">https://www.fai.org/page/ciam-code</a>.
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
                    <p><b>Expand <b>F5L</b> on the side menu to work through these features.</b></p>    
                    <hr />
                    
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server"  style="width: 65%; float: Right"  ImageUrl="~/ImgSetup/CompScoringRulesF5L.jpg" />
                    <p>
                        Basic competition setup for F5L</p>
                    <ul>
                        <li>Select the competition class 'FAI F5L'.</li>
                        <li>Under Scoring Options<br />
                            - Select 'Drop worst Task scores'.<br />
                            - Select the round number at which the drop score will take effect (normally 6).</li>
                        <li>Under Scoring Rules<br />
                            - Key in the 'Duration target time' in seconds (normally 390).<br />
                            - Set the 'Points/Second' to 2.<br />
                            - Select the 'Landing bonus' table.
                        </li>
                    </ul>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>

