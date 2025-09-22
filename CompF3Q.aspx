<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F3QIntro" runat="server">
        <asp:TabPanel runat="server" ID="F3QIntroTab" HeaderText="F3Q Introduction">
            <ContentTemplate>
                <div>
                    <br />
                    <h5>
                        F3Q - Radio Controlled Aero Tow Gliders</h5>
                        
                    <p>F3Q is a two task contest for 'scale like' aero tow gliders.<br />
                       Each round comprises a duration task and a speed task.<br />
                       Unlike F3B, where worst task scores are discarded, with F3Q the<br />
                       worst round score is discarded.<br />
                       The rules for F3Q are FAI provisional rules (at 5 November 2016).
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
                    <p><b>Expand <b>F3Q</b> on the side menu to work through these features.</b></p>    
                    <hr />
                    
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server"  style="width: 65%; margin:10px; float: Right"  ImageUrl="~/ImgSetup/CompScoringRuleF3Q.jpg" />
                    <p>
                        Basic competition setup for F3Q</p>
                    <ul>
                        <li>Select both the Duration and Speed tasks</li>
                        <li>Select 'Random' from the Lane Options.<br />
                            This creates the Duration launch order when the Draw is done.
                        </li>
                        <li>Under Scoring Options<br />
                            - Select 'Drop worst Round scores'.<br />
                            - Select the round numbers at which drop scores will take effect.</li>
                        <li>Under Scoring Rules<br />
                            - Key in the 'Duration target time'.<br />
                            - Select the 'Landing bonus' table.
                        </li>
                    </ul>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
