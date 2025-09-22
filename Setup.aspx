<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString
        Dim container As AjaxControlToolkit.TabContainer = CType(CompSetupGeneral, AjaxControlToolkit.TabContainer)
        Dim Pnl As AjaxControlToolkit.TabPanel

        If varID = "" Then
            Dim container0 As AjaxControlToolkit.TabContainer = CType(CompSetupGeneral, AjaxControlToolkit.TabContainer)
            'Dim Pnl0 As AjaxControlToolkit.TabPanel = container0.FindControl("CompSetupGeneralTab")
            'container0.ActiveTab = Pnl0
            Dim Pnl0 As AjaxControlToolkit.TabPanel = container0.FindControl("CompSetup")
            container0.ActiveTab = Pnl0
            Exit Sub
        End If

        Select Case varID
            Case "NewComp"
                Pnl = container.FindControl("NewComp")
                container.ActiveTab = Pnl
            Case "PilotOptions"
                Pnl = container.FindControl("PilotOptions")
                container.ActiveTab = Pnl
            Case "PilotEntry"
                Pnl = container.FindControl("PilotEntry")
                container.ActiveTab = Pnl
            Case "DrawOptions"
                Pnl = container.FindControl("DrawOptions")
                container.ActiveTab = Pnl
            Case "ScoringOptions"
                Pnl = container.FindControl("ScoringOptions")
                container.ActiveTab = Pnl
        End Select

        Dim container1 As AjaxControlToolkit.TabContainer = CType(ScoringRulesContainer, AjaxControlToolkit.TabContainer)

        container1.FindControl("F3BRules").Visible = (varID = "F3B")
        container1.FindControl("F3FRules").Visible = (varID = "F3F")
        container1.FindControl("F3JRules").Visible = (varID = "F3J")
        container1.FindControl("F3KRules").Visible = (varID = "F3K")
        container1.FindControl("F3QRules").Visible = (varID = "F3Q")
        container1.FindControl("F3LRules").Visible = (varID = "F3L")
        container1.FindControl("F5BRules").Visible = (varID = "F5B")
        container1.FindControl("F5JRules").Visible = (varID = "F5J")
        container1.FindControl("F5KRules").Visible = (varID = "F5K")
        container1.FindControl("F5LRules").Visible = (varID = "F5L")
        container1.FindControl("ElectricRules").Visible = (varID = "Electric")
        container1.FindControl("ThermalRules").Visible = (varID = "Thermal")
        container1.FindControl("ALESRules").Visible = (varID = "ALES")

        Select Case varID
            Case "F3B" : container1.ActiveTab = container1.FindControl("F3BRules")
            Case "F3F" : container1.ActiveTab = container1.FindControl("F3FRules")
            Case "F3J" : container1.ActiveTab = container1.FindControl("F3JRules")
            Case "F3K" : container1.ActiveTab = container1.FindControl("F3KRules")
            Case "F3Q" : container1.ActiveTab = container1.FindControl("F3QRules")
            Case "F3L" : container1.ActiveTab = container1.FindControl("F3LRules")
            Case "F5B" : container1.ActiveTab = container1.FindControl("F5BRules")
            Case "F5J" : container1.ActiveTab = container1.FindControl("F5JRules")
            Case "F5K" : container1.ActiveTab = container1.FindControl("F5KRules")
            Case "F5L" : container1.ActiveTab = container1.FindControl("F5LRules")
            Case "Electric" : container1.ActiveTab = container1.FindControl("ElectricRules")
            Case "Thermal" : container1.ActiveTab = container1.FindControl("ThermalRules")
            Case "ALES" : container1.ActiveTab = container1.FindControl("ALESRules")
        End Select

    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="CompSetupGeneral" runat="server" ActiveTabIndex="0">
          <%--COMPETITION--%>
         <asp:TabPanel runat="server" ID="CompSetup" HeaderText="Comp Setup" TabIndex="0">
            <ContentTemplate>
                <img id="Img13" runat="server" style="width: 60%; float: Right; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompetitionSetup.jpg"
                    alt="" />
                <h5>
                    Competition Setup
                </h5>
                <p>
                    This is like a 'Control Panel' for your competition. It puts you in control of how your competition will be run.<br />
                    Work through, from top to bottom, to complete this step. It looks a bit frightening, but in the end everything will make sense.<br /><br />
                    A lot of help is available by clicking on the [i]nformation buttons.<br /><br />
                    When finished, your competition setup screen will look something like this screen shot.<br /><br />
                    From here you can access the following screens
                </p>
                <ul>
                    <li><a href="scoring.aspx">Score Entry</a> - for all scoring tasks.</li>
                    <li><a href="scoring.aspx?eScoring">eScoring</a> - to use eScoring functions.</li>
                    <li><a href="Reports.aspx">Reports</a> - for access to all reports for preview, print or saving.</li>
                    <li><a href="Audio.aspx">Audio & Timer</a> - integrated audio and timer functions.</li>
                    <li><a href="scorecheck.aspx">Score Check</a> - for an overall check of scoring entries.</li>
                    <li><a href="EmailReports.aspx">Email Reports</a> - to email reports directly from GliderScore.</li>
                    <li>Lock Competition - prevents changes to entries already made. All reports are available.</li>
                </ul>
                <p>Check all the following tabs for complete details.</p>
                          
            </ContentTemplate>
        </asp:TabPanel>

        <%--NEW COMP--%>
        <asp:TabPanel runat="server" ID="NewComp" HeaderText="New Comp" TabIndex ="1">
            <ContentTemplate>
                <img   ID="Image00" src="~/ImgNewComp/NewComp.jpg" runat="server" style="width:60%; float:right; margin-right :4px; margin-left :4px;" alt=""/>
                
                <h5>
                    Competition Setup<br />New Competition</h5>
                <p>
                    This screen appears when you click on Competitions→New from the Main Menu.<br /><br />
                    This is where you create a new competition by giving it a</p>
                <ul>
                    <li>Name</li>
                    <li>Venue, and</li>
                    <li>Date</li>
                </ul>
                <p>
                    You can create a new competition with just this information or you can select an existing 
                    competition as a template for the new competition. Setup and/or pilots can be copied.
                    <br />
                    This saves a lot of time, particularly with entering pilots.
                </p>
                   <p><b>Competition Setup Details</b></p>
                   <ul>
                   <li>If checked, the new competition will have the same setup details 
                       as the selected competition.</li>
                   </ul>
                   <p><b>Pilot Details</b></p>
                   <ul>
                   <li>None - do not copy pilot details</li>
                   <li>All Pilots - copy all pilots to the new competition</li>
                   <li>Pilots for FlyOff - copy just the top pilots</li>
                   </ul>
                <p>
                    Some setup details need to be changed for fly-off competitions.<br />
                    Teams will not be applicable and for F3J and F5J the target time will be longer.<br />
                </p>

                <div>
                    <p>
                        GliderScore automatically de-selects 'Use Teams?' when creating fly-off competitions.<br />
                        <br />
                        Fly-off target time is selected in this screen.<br />
                        The fly-off competition is created with the selected time.
                    </p>
                    <img id="Img18" runat="server" style="width: 35%; align-content: center; position: relative; left: 350px; top: -40px; margin-right :4px; margin-left :4px;" src="~/ImgSetup/SetTargetTime.jpg" alt="" />

                </div>

                <p><b>When finished, click OK to go to the next screen. Click the Setup Comp tab (above) for details.</b></p>
                <div>
                    <hr />
                    <p><b>See how to setup a competition by copying from an existing competition.</b></p>
                    <iframe width="853" height="480" src="http://www.youtube.com/embed/IA1ssiqXtBU?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>



        <asp:TabPanel runat="server" ID="CompSetupGeneralTab" HeaderText="Setup Comp" TabIndex="2">
            <ContentTemplate>
               
                <div>
                <img id="Image01" runat="server" style="width: 60%; float: Right; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompNewComp.jpg"
                    alt="" />
                <h5>
                    Competition Setup<br />Setup Competition
                </h5>
                <p>
                    Complete the form in the following order</p>
                <ul>
                    <li>Select the Competition Class from the drop down list</a> </li>
                    <li>Pilot Options</a> </li>
                    <li>Pilot Entry</a> </li>
                    <li>Draw Options</a> </li>
                    <li>Scoring Options</a> </li>
                    <li>Scoring Rules (see Scoring Rules tab)</a> </li>
                </ul>
                </div>
                <div>
                    <img id="Img19" runat="server" style="width: 60%; float: Right; margin-right: 4px; margin-left: 4px;" src="~/ImgSetup/CompClasses.jpg"
                        alt="" />
                    <p>These are the competition classes currently supported by GliderScore. </p>


                </div>
                <div>

                <p>
                    <b>Automatic Recalculation</b><br />
                    Changing any of the Scoring Options (Group Score, Total Score rounding or Total
                    Score decimals)<br />
                    will trigger a recalculation of all scores.</p>
                <p>
                    Click on the tabs for more information.</p>
                <br />
                <p>
                    The latest FAI rules can be found
                        <asp:HyperLink ID="HyperLink7" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                            Target="_blank" runat="server" />
                    under 'Sporting Code'.
                </p>
                <p>
                    ALES competitions are run to a variety of local rules but the usual format is to
                    be found <a href="http://www.ales-league.org/amaelec2012.pdf">here</a>.</p>
                <br />
                    </div>
                  <div>
                <p><b>To view a setup video for your favourite competition, click on one of the links on the side menu.<br />
                      This video shows how to setup an F3B competition.</b></p>
                <iframe width="853" height="480" src="http://www.youtube.com/embed/tYesYLiLwzc?rel=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
        <%--PILOT OPTIONS--%>
        <asp:TabPanel runat="server" ID="PilotOptions" HeaderText="Pilot Options" TabIndex="4">
            <ContentTemplate>
                 <img id="Image03" runat="server" style="float: Right; width: 60%; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompPilotOptions.jpg"
                    alt="" />
                <h5>
                    Competition Setup<br />Pilot Options</h5>
                <p>
                    Tick the boxes to access these options in the Pilot Entry screen.</p>
                <ul>
                    <li>Use Teams<br />
                        - to enter team numbers against pilots<br />
                        - enter the number of pilots to be counted for the teams result<br />
                        - enables the Use Team Protection option in Draw Options</li>
                    <li>Use Pilot Start Numbers - to give pilots a specific number for this competition</li>
                    <li>Use Classes - generally used to classify pilots as (E)xpert, (A)dvanced, (J)unior
                        etc. but can be used for any purpose. Report information only</li>
                    <li>Use Roles - used to assign a Role to each entrant.<br />
                        The Role must exist in the Roles table (access from Main Menu).<br />
                        If using Roles, entrants can include (non-flying) officials.<br />
                        By using Roles, identification Badges can be printed for non-flying officials, as well as for pilots.</li>
                    <li>Use Models - to record a model or models against each pilot</li>
                </ul>
                <p>
                    The next step is to click the <b>Pilot Entry</b> button to get the Pilot Entry screen.<br />
                    To learn about Pilot Entry, click the Pilot Entry tab.</p>
            </ContentTemplate>
        </asp:TabPanel>
        <%--COMP SETUP - PILOT ENTRY--%>
        <asp:TabPanel runat="server" ID="PilotEntry" HeaderText="Pilot Entry" TabIndex="5">
            <ContentTemplate>
                <div>
                    <%--<img id="Img12" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompPilotEntryMethods.jpg" alt="" />--%>
                    <img id="Img12" runat="server" style="float: Right; width: 60%" src="~/ImgSetup/CompPilotEntryMethods.jpg" alt="" />
                <h5>
                    Competition Setup<br />Pilot Entry/Pilot Import</h5>
                    <p>There are two methods for entering pilots in a competition.<br /><br />
                        Pilots can be entered directly by reference to the Pilots table (Pilot Entry), or<br />
                        pilots can be imported into a competition from a file (Pilot Import).<br /><br />
                        It is also possible to use both methods for the one competition.
                    </p>
                </div>

                <div>
                <hr />
               <%-- <img id="Image04" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompPilotEntry.jpg"
                    alt="" />--%>
                     <img id="Image04" runat="server" style="float: Right; width: 60%; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompPilotEntry.jpg"
                    alt="" />
               
                    <h5>
                    Pilot Entry using the Pilots table</h5>
                    <ul>
                    <li>Select pilots on the left, and double click (or use the arrow key) to move them
                        into the competition</li>
                    <li>Pilots Available can be filtered on last name.<br />
                        Type the first few letters of the name that you are looking for in the 'Filter'
                        box.<br />
                        Click the 'Clear' button to cancel the filter.</li>
                    <li>Edit the Draw Frequency directly in the grid</li>
                    <li>A column is provided for each of the selected Pilot Options<br />
                        <b>Use Teams</b><br />
                        In this case 'Use Teams?' was selected and so the Team number and 'OTS' columns are visible.<br />
                        'OTS' means Omit from Team Score. Team results will omit the scores of selected pilots.<br />
                        <b>Use Models</b><br />
                        In this case 'Use Models?' was selected and so the column "# Models" is visible.<br />
                        Click in this column to register models for each pilot.<br />
                        See further down this page for more information about Models.
                    </li>
                    <li>New Pilots can be added to the database, and then to the competition</li>
                    <li>Pilot records can be edited from this screen by using the 'Edit Pilot' button.</li>
                    <li>Preview entries by frequency and/or team for quick checking</li>
                    <li>It is possible to add a pilot to the draw (a late pilot) without re-doing the draw</li>
                </ul>
                    <p><b>Switch Pilots button</b><br />
                    The Switch Pilots button has both left and right pointing arrows.<br />
                    This button is visible only after the draw has been made.<br />
                    It works this way ...<br />
                    1. Select a pilot on the left who is not in the competition.<br />
                    2. Select a pilot on the right (the pilot to be replaced by the first pilot).<br />
                    3. Click on the Switch Pilots button to make the first pilot replace the second pilot throughout the competition.<br />
                    <br />
                    This works at any stage of the competition, regardless of whether scores have been entered.<br />
                    It can fix issues where a pilot is entered by mistake (similar name) and this needs to be fixed.<br /><br />

                    It is not necessary to use this function to change a pilot's team. Just change the team number in the Pilot Entry screen.
                    </p>
                </div>
                <div>
                    <hr />
                    <img id="Img2" runat="server" style="float: Right; width: 60%; margin-right: 4px; margin-left: 4px;" src="~/ImgSetup/CompPilotEntryModels.jpg"
                        alt="" />
                    <p><b>Use Models - Model Data</b></p>
                    <p>Click in the '# Models" column to see the Model Data screen.</p>
                    <p>Click on 'Add' in the Model Data screen to add models.</p>
                    <p>The Model ID of the glider used can be recorded on the Score Card, in the Scoring Screen and when eScoring.</p>
                    <p>There is a 'Models' report available from the Reports menu.</p>
                    
                 </div>
                <div>
                    <br />
                </div>
                <div>
                    <img id="Img3" runat="server" style="float: Right; width: 45%; margin-right: 4px; margin-left: 4px;" src="~/ImgSetup/CompPilotEntryAddModels.jpg"
                        alt="" />
                    <p><b>Use Models - Add Model Data</b></p>

                    <ul>
                        <li>Give the model a unique Model ID.</li>
                        <li>Select the Model Name from the dropdown box.</li>
                        <li>Optional - Select the Device Name from the drop down box.</li>
                        <li>Optional - Enter the serial number of the device.</li>
                    </ul>
                </div>

                <div>
                    <hr />
                    <h5>
                    Pilot Entry using Pilot Import</h5>
                    <p>
                       
                        'Pilot Import' allows you to import pilots into your competition from a file.<br />
                        New pilots will be added to the Pilots table.</p>

                    <p>    Pilot Import - File Specifications</p>
                    <ul>
                        <li>File type: '.csv'.</li>
                        <li>Field delimiter: comma ',' or semi-colon ';' (according to your region).</li>
                        <li>File name: any name that ends in '.csv'</li>
                        <li>File location: any location accessible by your computer.</li>
                    </ul>
                    <p>This type of file can be created easily using Excel.</p>

                    <p>Use the first row of your file for field headings of your choice. This row will be ignored during the import process.<br />
                        There must be field headings for all 18 fields in the file.
                    </p>

                    <p>The fields in the file must be in the exact order below.<br />
                       Data for fields 1 to 4 will be sufficient for most competitions.</p>

                    <ul>
                        <li>1 FirstName (text, max 20 characters. No commas or semicolons).</li>
                        <li>2 LastName (text, max 20 characters. No commas or semicolons.). <br />
                            For existing pilots, name data to be identical to the name in the Pilots table.</li>
                        <li>3 Role (text, max 6 characters. A value in the Roles table. Normally = 'Plt')</li>
                        <li>4 DrawFreq (decimal, max 3 decimal places. Leave blank if Role is not 'Plt')</li>
                    </ul>
                    <p>Data for the remaining fields is optional. The field headings are mandatory.</p>
                    <ul>
                        <li>5 Team (integer. Defaults to 0 if blank)</li>
                        <li>6 PilotClass (text, max 4 characters. Defaults to ' ' if left blank or Role <> 'Plt')</li>
                        <li>7 Country (text, max 4 characters)</li>
                        <li>8 Club (text, max 50 characters)</li>
                        <li>9 FAINumber (text, max 8 characters)</li>
                        <li>10 OtherRegistration (text, max 8 characters)</li>
                        <li>11 FAI_ID (text, max 6 characters)</li>
                        <li>12 Street (text, max 50 characters)</li>
                        <li>13 Town (text, max 50 characters)</li>
                        <li>14 State (text, max 50 characters)</li>
                        <li>15 PostCode (text, max 50 characters)</li>
                        <li>16 Email (text, max 50 characters)</li>
                        <li>17 PrivatePhone (text, max 50 characters)</li>
                        <li>18 WorkPhone (text, max 50 characters)</li>
                    </ul>

                    <p>WARNING - Before import - <br />
                    Make sure that any pilots for import who are already in your database have their <br />
                    names spelt exactly the same way in the .csv file. If they are spelt even <br />
                    slightly differently you will be asked whether they match a person in your Pilots table.</p>

                    <p>Entrants that do not have a match will be added to your Pilots table.<br />
                    Pilots already in the Pilots file will have new data updated. All pilots will be entered into the competition.</p>

                    <p>After import - <br />
                    The Pilot Entry screen will open.  Check all pilot details such as:<br />
                    - Team number<br />
                    - Frequency<br />
                    - Correct spelling of first and last name<br />
                    - Country code<br />
                    If using Start Numbers, either fill these automatically or manually.</p>

                    <p>If you add a new pilot by mistake - <br />
                    - In Pilot Entry, remove the pilot from the competition.<br />
                    - In Main Menu → Pilots, delete the pilot record.</p>
                 



                </div>

            </ContentTemplate>
        </asp:TabPanel>
        <%--COMP SETUP - DRAW OPTIONS--%>
        <asp:TabPanel runat="server" ID="DrawOptions" HeaderText="Draw Options" TabIndex="6">
            <ContentTemplate>
                <img id="Img1" runat="server" style="float: Right; width: 60%; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompDrawOptions.jpg"
                    alt="" />

                <h5>
                    Competition Setup<br />Draw Options</h5>

                <p>
                    Team Protection</p>
                <ul>
                    <li>For group scored tasks, pilots from the same team will be drawn in different groups.</li>
                    <li>For &#39;one at a time&#39; tasks (Speed, F5B and F3F), pilots from the same team will
                        be separated in the order.</li>
                </ul>
                <p>
                    20kHz spacing</p>
                <ul>
                    <li>Pilots will be separated by at least 20kHz in the draw (except 2.4GHz)</li>
                </ul>
                <p>
                    Assign Helpers?
                </p>
                <ul>
                    <li style="list-style: none">Systematically assigns a helper to each pilot in each flight group (as part of the draw process).</li>
                    <li style="list-style: none">The assigned helpers appear in the scoring screen, scoring sheets, most draw reports, score cards and score records.</li>
                    <li style="list-style: none"></li>
                    <li style="list-style: none">Assigning helpers achieves maximum interaction between all contestants so that the less experienced pilots can learn from experienced pilots.<br />
                        Particularly suitable for smaller F3K and F5J competitions where there are no teams and two or more groups per round is chosen.</li>

                </ul>
                <ul>
                    <li>Available for single task competitions (F3J, F3K, F3L, F5J, F5K, Thermal, Electric, ALES)</li>
                    <li>Not available where team protection is selected.</li>
                    <li>Not available for multi-task competitions (F3B, F3Q).</li>
                    <li>Not available where there is one group per round (F3F, F5B).</li>
                    <li>Not available where pilots enter to fly in more than one class.</li>
                </ul>
                <p>
                    Lanes [None, Random, Team or Closest]
                </p>
                <ul>
                    <li>Available if the ONLY task to fly is duration<br />
                        Includes F3J, F3L, F5j, F5K, Thermal, Electric and ALES</li>
                    <li>Lanes are assigned during the draw process.</li>
                    <li>Lanes can be manually re-assigned in the Scoring screen (after the draw is made).</li>
                    <li>If <b>None</b> - Pilots will not be allocated to lanes.</li>
                    <li>If <b>Random</b> - Pilots will be randomly but systematically allocated to lanes.</li>
                    <li>If <b>Team</b> - A different lane will be allocated to each team for each round.</li>
                    <li style="list-style: none">&nbsp;&nbsp;&nbsp;Where team members fly in consecutive groups (within a round), they will fly from the same lane.</li>
                    <li>If <b>Closest</b> - Pilots will be given the lane that is closest to their team number.</li>
                    <li style="list-style: none">&nbsp;&nbsp;&nbsp;The number of lanes is to be specified.</li>
                    <li style="list-style: none">&nbsp;&nbsp;&nbsp;In larger competitions the number of teams may be greater than the number of lanes.</li>
                </ul>
                <br />
            </ContentTemplate>
        </asp:TabPanel>
        <%--COMP SETUP - SCORING OPTIONS--%>
        <asp:TabPanel runat="server" ID="ScoringOptions" HeaderText="Scoring Options" TabIndex="7">
            <ContentTemplate>
                <%--<asp:Image ID="Image11" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringOptions.jpg" />--%>
                <%--<img id="Image05" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringOptions.jpg"
                    alt="" />--%>
                <img id="Image05" runat="server" style="float: Right; width: 60%; margin-right :4px; margin-left :4px;" src="~/ImgSetup/CompScoringOptions.jpg"
                    alt="" />
                <h5>
                    Competition Setup<br />Scoring Options</h5>
                <p>
                    These are overall settings for the competition.</p>
               
                <ul>
                    <li><b>GroupScore</b></li>
                    <li style="list-style: none">There are three options for Group Scores.</li>
                    <li style="list-style: none">'None' - No group scoring. Raw scores (points) are used
                        instead.</li>
                    <li style="list-style: none">'Points' - Group Score of 1000 to the pilot with the most
                        points.</li>
                    <li style="list-style: none">'Time' - Group Score of 1000 to the pilot with the best
                        time. Landing bonus added to group scores.</li>
                    <li><b>Rounded or Truncated</b></li>
                    <li style="list-style: none">The score can be either rounded
                        or truncated to a specified number of decimals (see below).<br />
                        Under F3J rules (2011) the Total Score is truncated.</li>
                    <li><b>Decimals</b></li>
                    <li style="list-style: none">Specify the number of decimals for the score calculation.&nbsp;
                        Choices are 0 - 3 decimals.</li>
                </ul>
                <p>
                    <b>Drop Worst Scores (see F3Q below)</b></p>
                <p>Generally, if scores are to be discarded, it is the worst Task score from each task that is discarded.<br />
                   However, in the F3Q rules it is the worst Round score that is discarded.<br />
                   The ability to select 'Drop worst Round score' only becomes available when the selected class is F3Q.<br />
                   Otherwise, the only choice is 'Drop worst Task score'.
                </p>
                <ul>
                    <li>Enter the round numbers at which 1 and/or 2 worst scores are to be dropped.<br />
                        Enter 99 in any box to prevent dropped scores.</li></ul>
                <p>
                    <b>Drop Worst Scores - F3Q</b></p>
                <ul>
                    <li>Enter the round numbers at which up to 5 worst round scores are to be dropped.<br />
                        Note that five Drop Scores selection boxes show with class F3Q selected.<br />
                        Enter 99 in any box to prevent dropped scores.</li></ul>
                <br />
            </ContentTemplate>
        </asp:TabPanel>
        <%--SCORING RULES--%>
        <asp:TabPanel runat="server" ID="ScoringRules" HeaderText="Scoring Rules" TabIndex="8">
            <ContentTemplate>
                <asp:TabContainer ID="ScoringRulesContainer" runat="server" ActiveTabIndex="0">
                    <asp:TabPanel runat="server" ID="F3BRules" HeaderText="F3B" TabIndex="0">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image13" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3B.jpg" />--%>
                            <%--<img id="Image06" runat="server" style="float: Right; width: 73%; height: 73%" src="~/ImgSetup/CompScoringRulesF3B.jpg"
                                alt="" />--%>
                            <img id="Image06" runat="server" style="float: Right; width: 73%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF3B.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3B<br />
                                Multi-Task Glider</h5>
                            <p>
                                Duration (Task A)</p>
                            <ul>
                                <li>Set the default Duration target time in seconds</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>For F3B, set Deduction From Flight Score to None</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <p>
                                Distance (Task B)</p>
                            <ul>
                                <li>There are no optional settings for distance.&nbsp; Scoring is based purely on laps
                                    flown.</li>
                            </ul>
                            <p>
                                Speed (Task C)</p>
                            <ul>
                                <li>Set the Timing decimals places for the speed task.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.</li>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <p>
                                <b>The latest FAI F3B rules can be found
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="F3FRules" HeaderText="F3F" TabIndex="1">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image14" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRuleF3F.jpg" />--%>
                            <%--<img id="Image07" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRuleF3F.jpg"
                                alt="" />--%>
                            <img id="Image07" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRuleF3F.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3F<br />
                                Slope Soaring Glider</h5>
                            <ul>
                                <li>Set the Timing decimals places for the competition.&nbsp; Choices are 0 - 3 decimals.</li>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <p>
                                <b>The latest FAI F5F rules can be found
                                    <asp:HyperLink ID="HyperLink2" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="F3JRules" HeaderText="F3J" TabIndex="2">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image12" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3J.jpg" />--%>
                           <%-- <img id="Image08" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF3J.jpg"
                                alt="" />--%>
                             <img id="Image08" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF3J.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3J<br />
                                Thermal Duration Glider</h5>
                            <ul>
                                <li>F3J rules specify that in the score calculation any extra decimals are truncated.</li>
                                <li>Set the target time in seconds.&nbsp; eg 900=15mins</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>The Points/second should be set to '1' for F3J.</li>
                                <li>Timing decimals places.<br />
                                    Usually this would be set to 1 for F3J.<br />
                                    Choices are 0 - 3 decimals.</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Deduction From Flight Score.&nbsp; Can be None, Late Landing or Motor Run. For F3J
                                    choose Late Landing</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <p>
                                <b>The latest FAI F3J rules can be found
                                    <asp:HyperLink ID="HyperLink3" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="F3KRules" HeaderText="F3K" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image15" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3k.jpg" />--%>
                           <%-- <img id="Image09" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF3k.jpg"
                                alt="" />--%>
                             <img id="Image09" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF3k.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3K<br />
                                Hand Launched Glider</h5>
                            <p>
                                There are many different tasks (and scoring rules) for F3K.<br />
                                All of the FAI tasks are provided for, as well as two extra tasks where all times
                                entered will count. U10 is for user 10 minute tasks. U15 is for user 15 minute tasks.<br />
                                <br />
                                An F3K task is assigned to each Round after the draw is completed.<br />
                                This can be done from this screen, the Scoring screen or as part of the process
                                of printing score cards.
                            </p>
                            <br />
                            <p>
                                <b>The latest FAI F3K rules can be found
                                    <asp:HyperLink ID="HyperLink4" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F3LRules" HeaderText="F3L" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image15" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3k.jpg" />--%>
                           <%-- <img id="Image09" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF3k.jpg"
                                alt="" />--%>
                             <img id="Img16" runat="server" style="float: Right; width: 65%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRuleF3L.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3L<br />
                                Radio Controlled (Rudder, Elevator, Spoiler) Glider</h5>
                            <p>
                                Duration Task</p>
                            <ul>
                                <li>Set the default Duration target time in seconds</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.</li>
                                <li>Set the Points/second (normally 2 for F3L).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Set Deduction From Flight Score to None</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
<%--                            <ul style="position: relative; top: +0px">
                                <li style="list-style: none"><b>Translation of German F3RES Rules (Uploaded 2019-11-18)</b></li>
                                <li>A translation of the F3RES rules is available <a href="/zipfile/2019 English F3RES Rules Set Draft.pdf">here</a>.</li>
                            </ul>--%>

                            <p>
                                <b>The latest FAI F3L rules can be found
                                    <asp:HyperLink ID="HyperLink9" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                    Note that the separate 'General Rules' apply to all classes and should not be ignored.<br />
                           

                            Download the 2024 rules <a href="/zipfile/sc4_vol_f3_soaring_24_F3L.pdf">here</a>.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F3QRules" HeaderText="F3Q" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image15" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3k.jpg" />--%>
                           <%-- <img id="Image09" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF3k.jpg"
                                alt="" />--%>
                             <img id="Img14" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :10px;" src="~/ImgSetup/CompScoringRuleF3Q.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F3Q<br />
                                Radio Controlled Aero Tow Glider</h5>
                            <p>Select F3Q as the Competition Class.</p>
                            <p>
                                Duration Task</p>
                            <ul>
                                <li>Select 'Random' from the Lane Options.<br />
                                    This creates the Duration launch order when the Draw is done.
                                </li>
                                <li>Set the default Duration target time in seconds</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Set Deduction From Flight Score to 'Penalty F3Q'</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.<br />
                                    For eScoring, the number of Timekeepers must be one (1).
                                </li>
                            </ul>
                            <p>
                                Speed Task C</p>
                            <ul>
                                <li>Set the Timing decimals places for the speed task.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.</li>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <br />
                            <p>
                                <b>The latest FAI F3Q rules can be found
                                    <asp:HyperLink ID="HyperLink8" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F5BRules" HeaderText="F5B" TabIndex="4">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image16" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF5b.jpg" />--%>
                           <%-- <img id="Image10" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF5B.jpg"
                                alt="" />--%>
                             <img id="Image10" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF5B.jpg"
                                alt="" />
                            <h5>Competition stup<br />
                                for scoring F5B<br />
                                Electric Powered Motor Gliders</h5>
                            <ul>
                                <li>Set the Distance Points per Lap.</li>
                                <li>Set the Duration target time in seconds and <br />
                                    the Timing decimal places.</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new Landing Bonus table if needed.</li>
                            </ul>
                            <ul>
                                <li>Set the Penalty Points per second of motor run.</li>
                            </ul>
                            <ul>
                                <li>Watt-Minutes . . .<br />
                                    Set the Watt-min base quantity (free allowance with no penalty)<br />
                                    Set the Watt-min penalty factor (2018 rule - 1 point for every 3 excess Watt-Mins)<br />
                                    Set the Watt-Min penalty factor rounding.<br />
                                    &nbsp&nbsp&nbsp&nbsp 'Round Down' means one point for every <b>complete</b> 3 W-M over.<br />
                                    &nbsp&nbsp&nbsp&nbsp 'Round Up' means one point for every 3 W-M or <b>part of 3 W-M</b> over.<br />
                                    &nbsp&nbsp&nbsp&nbsp 'Round Normal' means 1/3 point for every 1 W-M over.<br />
                                </li>
                            </ul>
                            <p>
                                <b>The latest FAI F5B rules can be found
                                    <asp:HyperLink ID="HyperLink5" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F5JRules" HeaderText="F5J" TabIndex="5">
                        <ContentTemplate>
                             <img id="Image11" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF5J.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F5J<br />
                                Thermal Duration Gliders with Electric Motor and Altimeter/Motor Run Timer</h5>
                            <ul>
                                <li>Set the Decimals for Total Score to one (1). Raw Score decimals will also be one
                                    (1)</li>
                                <li>Set the Duration target time in seconds</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals. Normally set to zero decimals.</li>
                                <li>Set the Points/second ('1' for F5J).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Set the Deduction From Flight Score to Height Penalty. This action reveals the height
                                    penalty fields.</li>
                                <li>Set the Reference Start Height. Normally 200 metres</li>
                                <li>Set the Penalty/Metre up to the Reference Start Height. Normally 0.5 points/metre</li>
                                <li>Set the Penalty/Metre over the Reference Start Height. Normally 3.0 points/metre</li>
                                <li>Nbr of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording columns
                                    will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <ul>
                                <li style="list-style: none">Select one of the Motor Restart options. These change the way that Overall Results are compiled.</li>
                                <li style="list-style: none">The official (FAI) rules about Motor Restart apply from 1 January 2023.</li>
                                <li>FAI rule - Motor Restart is <b>not allowed</b> in Category 1 events (World and European championships).</li>
                                <li>FAI rule - Motor Restart is allowed at other events however the resulting zero score cannot be dropped.</li>
                                <li style="list-style: none">GliderScore provides a third option.</li>
                                <li>Unofficial rule - Motor Restart is allowed and the resulting zero can be dropped.</li>
                            </ul>
                            <p>
                                <b>Automatic Recalculation</b><br />
                                Changing any of the Height Penalty parameters will trigger a recalculation of all
                                scores.</p>
                            <br />
                            <p>
                                <b>The latest FAI F5J rules can be found
                                    <asp:HyperLink ID="HyperLink6" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                            <div>
<%--                        <table>
                            <tr>
                                <td>
                                    Click to view and/or save the official FAI F5J rules (2021 Edition).<br />
                                    Note that this includes both the general F5 rules and the specific F5J rules.
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageAlign="Middle"
                                        ImageUrl="~/ImgAdobe/pdficon_large.gif" OnClientClick="window.open('SC4_Vol_F5_Electric_21_F5J1.pdf')"
                                        Width="32px" AlternateText="Click to view/download the rules" />
                                </td>
                            </tr>
                        </table>--%>
                    </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F5KRules" HeaderText="F5K" TabIndex="5">
                        <ContentTemplate>
                            <img id="Img4" runat="server" style="float: Right; width: 60%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgSetup/CompScoringRulesF5K.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F5K<br />
                                Thermal Duration Gliders for Multiple Task Competition with<br />
                                Electric Motor and Altimeter/Motor Run Timer (AMRT)</h5>
                            <p>DRAW Options section</p>
                            <ul>
                                <li>If using teams, select 'Team Protection'. Team members will not be drawn to fly against each other.</li>
                                <li>20KhSpacing was for the days before 2.4GHz. Select or do not select as you like.</li>
                                <li>AssignHelpers to automatically assign a helper to each pilot. Helper changes with each round. Not available if Team Protection is selected.</li>
                                <li>Use Lanes to allocate a pilot area to each pilot. Use Random as the allocation method. Select the number of lanes.</li>
                            </ul>

                            <p>SCORING Options section</p>
                            <ul>
                                <li>Select GroupScore option = Points.</li>
                                <li>Select Total Score = Rounded to 0 decimal points.</li>
                                <li>Drop worst task scores -<br />
                                    Input for 1 at Round = 5<br />
                                    input for 2 at Round = 99
                                </li>
                            </ul>

                            <p>SCORING Rules section</p>
                            <ul>
                                <li>Set the Timing decimals to zero (0).</li>
                                <li>Select the Height Bonus/Penalty table to be used.</li>
                                <li>Set the Nominal Launch Height. This can be changed in the Scoring screen after the draw has been made.</li>
                                <li>Edit F5K Tasks (for each round) - do this AFTER the draw has been done.</li>
                            </ul>
                            <br />
                            <p>
                                <b>The latest FAI F5K rules can be found
                                    <asp:HyperLink ID="HyperLink10" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="F5LRules" HeaderText="F5L" TabIndex="3">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image15" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRulesF3k.jpg" />--%>
                           <%-- <img id="Image09" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesF3k.jpg"
                                alt="" />--%>
                             <img id="Img5" runat="server" style="float: Right; width: 65%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesF5L.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring F5L<br />
                                Radio Controller Thermal Gliders RES with Electric Motor and AMRT</h5>
                            <p>
                                Duration Task</p>
                            <ul>
                                <li>Set the default Duration target time in seconds normally 390)</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.&nbsp;
                                    <br />
                                    Choices are 0 - 3 decimals.(normally 0)</li>
                                <li>Set the Points/second (normally 2 for F5L).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Set Deduction From Flight Score to None</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged. Select 1 for eScoring.</li>
                            </ul>
<%--                            <ul style="position: relative; top: +0px">
                                <li style="list-style: none"><b>Translation of German F3RES Rules (Uploaded 2019-11-18)</b></li>
                                <li>A translation of the F3RES rules is available <a href="/zipfile/2019 English F3RES Rules Set Draft.pdf">here</a>.</li>
                            </ul>--%>

                            <p>
                                <b>The latest FAI F5L rules can be found
                                    <asp:HyperLink ID="HyperLink11" NavigateUrl="https://www.fai.org/page/ciam-code" Text="here"
                                        Target="_blank" runat="server" />
                                    under 'Sporting Code'.<br />
                                Note that the separate 'General Rules' apply to all classes and should not be ignored.</b>
                            </p>
                        </ContentTemplate>
                    </asp:TabPanel>


                    <asp:TabPanel runat="server" ID="ThermalRules" HeaderText="Thermal" TabIndex="6">
                        <ContentTemplate>
                            <%--<asp:Image ID="Image17" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRuleThermal.jpg" />--%>
                           <%-- <img id="Image12" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRuleThermal.jpg"
                                alt="" />--%>
                             <img id="Image12" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRuleThermal.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring Thermal Glider</h5>
                            <ul>
                                <li>Set the target time in seconds.</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.<br />
                                    Choices are 0 - 3 decimals.</li>
                                <li>Set the Points/second (normally '1' for Thermal).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Deduction From Flight Score.&nbsp; Can be None, Late Landing or Motor Run. Choose
                                    None.</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="ElectricRules" HeaderText="Electric" TabIndex="7">
                        <ContentTemplate>
                            <%--COMP SETUP - SCORING RULES - ELECTRIC--%>
                            <%--<asp:Image ID="Image18" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRuleElectric.jpg" />--%>
                           <%-- <img id="Image13" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRuleElectric.jpg"
                                alt="" />--%>
                             <img id="Image13" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRuleElectric.jpg"
                                alt="" />
                            <h5>Competition setup<br />
                                for scoring Electric Glider</h5>
                            <ul>
                                <li>Set the target time in seconds.</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.<br />
                                    Choices are 0 - 3 decimals.</li>     
                                <li>Set the Points/second (normally '1' for Electric).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Deduction From Flight Score.&nbsp; Can be None, Late Landing or Motor Run. Choose
                                    Motor Run.</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="ALESRules" HeaderText="ALES" TabIndex="8">
                        <ContentTemplate>
                            <%--COMP SETUP - SCORING RULES - ALES--%>
                            <%--<asp:Image ID="Image18" runat="server" ImageAlign="Right" ImageUrl="~/ImgSetup/CompScoringRuleElectric.jpg" />--%>
                           <%-- <img id="Img10" runat="server" style="float: Right; width: 60%; height: 60%" src="~/ImgSetup/CompScoringRulesALES.jpg"
                                alt="" />--%>
                             <img id="Img10" runat="server" style="float: Right; width: 60%; margin-right :12px; margin-left :4px; margin-bottom :4px;" src="~/ImgSetup/CompScoringRulesALES.jpg"
                                alt="" />
                             
                            <h5>Competition setup<br />
                                for scoring ALES (Altitude Limited Electric Soaring)</h5>
                            <p>
                                This a a competition setup for ALES as run in the USA to rules to be found <a href="http://www.ales-league.org/amaelec2012.pdf">
                                    here</a></p>
                            <br />
                            <ul>
                                <li>Set the GroupScore option to 'Time' for these rules.>br>
                                    Best flight time in a group gets 1000 points plus any landing bonus.
                                </li>
                            </ul>
                            <ul>
                                <li>Set the target time in seconds.</li>
                                <li>If desired, the Duration target time can be changed (in the Scoring screen) for each Round.</li>
                                <li>Set the Timing decimals places.<br />
                                    Choices are 0 - 3 decimals.</li>
                                <li>Set the Points/second (normally '1' for ALES).</li>
                            </ul>
                            <ul>
                                <li>Select the Landing Bonus table to use.&nbsp; When you enter scores, the value that
                                    you enter is looked up to see how many points it is worth.&nbsp; The lookup value
                                    and the points value can be the same.&nbsp; You can view the Landing Bonus table
                                    that is selected to see if you have the right one.&nbsp; Make a new one if needed.</li>
                            </ul>
                            <ul>
                                <li>Deduction From Flight Score.&nbsp; Can be None, Late Landing or Motor Run. Choose
                                    'None' for this class.</li>
                            </ul>
                            <ul>
                                <li>Number of Timekeepers.&nbsp; Select one or two.&nbsp; One or two time recording
                                    columns will be provided.&nbsp; If two, the times are averaged.</li>
                            </ul>
                            <p>
                                ALES competitions are run to a variety of local rules but the usual format is to
                                be found <a href="http://www.modelaircraft.org/files/RCE13-2-2Kallevang.pdf">here</a>.<br />
                                A feature of these rules is that flight times are group scored and the landing bonus
                                is added on afterwards.</p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
