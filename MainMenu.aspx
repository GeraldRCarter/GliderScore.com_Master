<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString
        Dim container As AjaxControlToolkit.TabContainer = CType(MainMenu, AjaxControlToolkit.TabContainer)
        Dim Pnl As AjaxControlToolkit.TabPanel

        If varID = "" Then
            Dim container0 As AjaxControlToolkit.TabContainer = CType(MainMenu, AjaxControlToolkit.TabContainer)
            Dim Pnl0 As AjaxControlToolkit.TabPanel = container0.FindControl("MainMenuGeneral")
            container0.ActiveTab = Pnl0
            Exit Sub
        End If

        Select Case varID
            Case "MainMenuCompSeries"
                Pnl = container.FindControl("MainMenuCompSeries")
                container.ActiveTab = Pnl
            Case "MainMenuPilots"
                Pnl = container.FindControl("MainMenuPilots")
                container.ActiveTab = Pnl

            Case "MainMenuPilotsMultiClass"
                Dim Ctr1 As AjaxControlToolkit.TabContainer = CType(MainMenu, AjaxControlToolkit.TabContainer)
                Dim Tab1 As AjaxControlToolkit.TabPanel = Ctr1.FindControl("MainMenuPilotsTabPanel")
                Ctr1.ActiveTab = Tab1
                Dim Ctr2 As AjaxControlToolkit.TabContainer = CType(MainMenuPilotsTabContainer, AjaxControlToolkit.TabContainer)
                Dim Tab2 As AjaxControlToolkit.TabPanel = Ctr2.FindControl("MainMenuPilotsMultiClass")
                Ctr2.ActiveTab = Tab2
                Exit Sub


            Case "MainMenuLandings"
                Pnl = container.FindControl("MainMenuLandings")
                container.ActiveTab = Pnl
            Case "MainMenuRoles"
                Pnl = container.FindControl("MainMenuRoles")
                container.ActiveTab = Pnl
            Case "CountryCodes"
                Pnl = container.FindControl("CountryCodes")
                container.ActiveTab = Pnl
            Case "QRCodeSetup"
                Pnl = container.FindControl("QRCodeSetup")
                container.ActiveTab = Pnl
            Case "Merge"
                Pnl = container.FindControl("Merge")
                container.ActiveTab = Pnl
            Case "Export_Import"
                Pnl = container.FindControl("Export_Import")
                container.ActiveTab = Pnl
        End Select

    End Sub
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:TabContainer ID="MainMenu" runat="server">
        <asp:TabPanel runat="server" ID="MainMenuGeneral" HeaderText="Main Menu">
            <ContentTemplate>
                <img id="ImgMainMenu"
                    src="~/ImgMainMenu/MainMenu.jpg"
                    runat="server"
                    style="float: right; width: 60%; padding-right: 10px;"
                    alt="" />

                <h5>Main Menu</h5>
                <p>
                    The Main Menu has several sections as described below.
                </p>
                <p>
                    Competitions
                </p>
                <ul>
                    <li>Open - work with an existing competition</li>
                    <li>New - create a new competition</li>
                    <li>Merge - create a new competition by merging two compatible competitions (see Merge tab)</li>
                    <li>Delete - delete an existing competition</li>
                    <li>Export - create a file containing any number of selected competitions (see Export/Import tab)</li>
                    <li>Import - import a competition from a file that was exported and sent to you (see Export/Import tab)</li>
                </ul>
                <p>
                    Competition Series
                </p>
                <ul>
                    <li>Allows a series of competitions to be combined to show the series winner </li>
                </ul>
                <p>
                    Database Utilities
                </p>
                <ul>
                    <li>Compact DB - to compress your database folder</li>
                    <li>Backup DB - to make a backup copy of your database file<br />
                        - right click to copy your database files to another location.</li>
                    <li>Restore Backup - to restore a previously saved backup</li>
                    <li>View/Change DBFolder - to 'point' to a different database folder.<br />
                        You can have multiple databases in different folders.</li>
                </ul>
                <p>Screen Size</p>
                <ul>
                    <li>Most screens can be resized by dragging the borders. The change is saved.</li>
                    <li>'Adjust Size' changes the size of ALL SCREENS by the percentage chosen.</li>
                    <li>Restore Size - click this button to restore all screens to their default sizes.</li>
                </ul>

                <div>
                    <img id="Img1"
                        src="~/ImgMainMenu/MainMenu_MasterFiles.jpg"
                        runat="server"
                        style="float: right; width: 25%; padding-right: 10px;"
                        alt="" />
                    <p>Master Files</p>
                    <ul>
                        <li>Pilots - to maintain the 'Pilots' masterfile (see Pilots tab)</li>
                        <li>Landings  - to maintain the 'Landings' masterfile (see Landings tab)</li>
                        <li>Timers - to control audio and timer functionality.</li>
                        <li>F5K Bonus Tables - to maintain the height vs bonus (or penalty) tables for F5K</li>
                        <li>Roles - to maintain the 'Roles' masterfile (see Roles tab)</li>
                        <li>Country Codes</br>
                                This table holds all country codes as determined by the International Olympic Committee.</br>
                                The FAI uses the same codes. When adding a country code to a pilot's record, one of these codes must be used.</li>
                        <li>QRCode Setup</br>
                                This is where you specify data to be encoded when using QRCodes on Score Cards.</br>
                                QRCodes are useful when using smartphones to gather scores. Third party software is required to do this.</br>
                                If entering scores manually, there is no need to do anything here.<br />
                            If using GliderScore's eScoring, you need to click the 'Reset for eScoring' button.
                        </li>
                        <li>Model Names - holds names of model types to be used if the 'Use Models?' option is selected.</li>
                        <li>Device Names - holds the names of on-board devices used in the models such as AMRT devices.</li>
                    </ul>
                </div>

                <p>Language</p>
                <ul>
                    <li>It is possible to run GliderScore in a language other than English.<br />
                        Use the drop down box to select a different language (if installed).<br />
                        See the <a href="Translate.aspx">Translate</a> tab for more details.</li>
                </ul>
            </ContentTemplate>
        </asp:TabPanel>


        <%--     MAIN MENU - MERGE--%>
        <asp:TabPanel runat="server" ID="Merge" HeaderText="Merge" TabIndex="1">

            <ContentTemplate>
                <h5>Main Menu<br />
                    Merge Competitions
                    <%--                            <asp:ImageMap ID="ImageMap1" runat="server" ImageAlign="Right"
                                ImageUrl="~/ImgMainMenu/MergeComps.jpg" Width="600px">
                            </asp:ImageMap>--%>
                    <asp:Image runat="server" ID="ImageM1" Style="float: right; width: 70%; margin-right: 4px; margin-left: 4px;" ImageUrl="~/ImgMainMenu/MergeComps.jpg" />
                </h5>
                <p>
                    You can merge any two compatible competitions to create a new 'merged' competition.<br />
                    <br />
                    Compatible means that they must be identical in the task/s flown and in all the score calculation details.<br />
                    <br />
                    The merged competition is just like any other competition and all competition reports are available.<br />
                    <br />
                    Use the Merge function if you run two (one day) events over a weekend and need to combine the results.<br />
                    <br />
                    In the case of F3Q, the rounds across a whole season can be merged into one 'Master' competition.
                            As competitions are run, they can be merged into the 'Master' competition and a progressive report produced.
                </p>

                <p>The Merge function runs in two separate ways according to the selections made.</p>
                <ul>
                    <li>COMBINE FLIGHT GROUPS - Select any two competitions to create a new merged competition.<br />
                        This combines the pilots together to make up the flight groups.<br />
                        Example: Pilots for Round 1 Group 1 for both competitions will all be in Round 1 Group 1 in the merged competition.<br />
                        Useful where you need to make separate draws for (say) Juniors and Seniors and then combine the two draws.<br />
                        The original competitions remain unchanged.</li>
                    <li>ADD FLIGHT GROUPS - Select a Primary competition and an un-merged Secondary competition to merge the Secondary competition into the Primary competition.<br />
                        If the Primary competition is not a merged competition the merge will create a new competition.<br />
                        If the Primary competition is a merged competition the merge can add onto the Primary competition.
                                    
                </ul>

          <%--      <p>Effect of Drop Score options when merging multi-task events</p>
                <ul>
                    <li>Drop worst task scores (F3B) - for each task, the rounds will be added after the last round flown in each task of the Primary competition.</li>
                    <li>Drop worst round scores (F3Q) - the rounds will be added after the last round flown in the Primary competition.</li>
                </ul>--%>


            </ContentTemplate>

        </asp:TabPanel>

        <%--     MAIN MENU - EXPORT/IMPORT--%>
        <asp:TabPanel runat="server" ID="Export_Import" HeaderText="Export/Import" TabIndex="1">

            <ContentTemplate>
                <h5>Main Menu<br />
                    Export/Import Competitions
                </h5>
                <div>

                    <p><b>Export Competitions</b></p>
                    <asp:ImageMap ID="ImageMap3" runat="server" Style="margin-right: 4px; margin-left: 4px;" ImageAlign="Right"
                        ImageUrl="~/ImgMainMenu/ExportCompSelection.jpg" Width="500px">
                    </asp:ImageMap>
                    <p>
                        You can export one or more competitions for sharing.<br />
                        <br />
                        The file created is GliderScoreDownload.zip.<br />
                        The GliderScoreDownload.zip file will be in the same folder as the GliderScoreData.mdb file that was used to create it.<br />
                        <br />
                        Use this .zip file to share competitions with other users.<br />
                        <br />
                        <%--<b>Earlier Versions</b><br />
                                You can select one competition for sharing.<br />
                                <br />
                                The file downloaded is GliderScoreDownload.mdb.<br />
                                <br />
                                The file will be created in the same folder as the GliderScoreData.mdb file that was used to create it.<br />--%>
                    </p>
                    <br />
                </div>

                <hr />

                <div>
                    <asp:Image ID="ImportComp" runat="server" Style="margin-right: 4px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgMainMenu/ImportCompSelection.jpg" Width="500px" />
                    <p><b>Import Competition</b></p>
                    <p>
                        You can import competitions (one at a time) from a GliderScoreDownload.zip file.<br />
                        <br />
                        The GliderScoreDownload.zip file must be located in the same folder as the destination database (GliderScoreData.mdb).<br />
                        <br />
                        <br />
                        <b>If you are sent GliderScoreDownload.mdb . . .</b><br />
                        <ul>
                            <li>Rename the file to GliderScoreDownload.txt.</li>
                            <li>Create a .zip archive file named GliderScoreDownload.zip that contains the file GliderScoreDownload.txt.</li>
                            <li>Go ahead and import the data.</li>
                        </ul>
                    </p>
                </div>



            </ContentTemplate>

        </asp:TabPanel>



        <%--     MAIN MENU - COMPETITION SERIES--%>
        <asp:TabPanel runat="server" ID="MainMenuCompSeries" HeaderText="Competition Series" TabIndex="1">
            <ContentTemplate>
                <asp:TabContainer ID="CompSeriesTab" runat="server" ActiveTabIndex="0">
                    <asp:TabPanel runat="server" ID="CompSeriesGeneral" HeaderText="General" TabIndex="0">
                        <ContentTemplate>
                            <h5>Main Menu<br />
                                Competition Series
                                <%--                                        <asp:ImageMap ID="ImageMap2" runat="server" ImageAlign="Right"
                                            ImageUrl="~/ImgCompSeries/CompSeriesSelections.jpg" Width="600px">
                                        </asp:ImageMap>--%>
                                <asp:Image ID="Image9" runat="server" Style="width: 600px; margin-right: 12px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesSelections.jpg" />
                            </h5>
                            <p>
                                You can construct a competition series from your competitions.<br />
                                <br />
                                Useful where you run a series of (say) thermal comps over a season and need to work
                                        out the series winner.<br />
                                <br />
                                Competitions can be added to more than one series.  A single competition can be included in a
                                        National, Regional and Local series all at the same time.<br />
                                <br />

                                As the competitions are run, they can be added to the series and a progressive report
                                        produced.<br />
                                <br />
                                Scores from the selected competitions can be made up of either<br />
                                 - normalised points (each competition winner gets 1000 points), or<br />
                                 - points (each pilot gets the final points from each competition).<br />
                                <br />
                                In the case of competitions having preliminary rounds and flyoff rounds,<br />
                                it possible to have a report that takes into account the actual points from<br />
                                both the preliminary and flyoff competitions.
                            </p>
                            <div>
                                <p><b>Watch the Competition Series video.</b></p>
                                <iframe width="853" height="480" src="http://www.youtube.com/embed/xpRYnHHGWL0?rel=0" frameborder="0"></iframe>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="CompSeriesReport" HeaderText="Report" TabIndex="2">
                        <ContentTemplate>
                            <div>
                                <%--                                    <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesReportOptions.jpg" />--%>
                                <asp:Image ID="Image10" runat="server" Style="margin-right: 12px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesReportOptions.jpg" />

                                <h5>Competition Series Report Options</h5>
                                <p>
                                    This report can be run for 'All' or any combination of a selected 'Country', 'Club' and/or 'Class'.
                                      The default setting is 'All'.<br />
                                    <br />
                                    If selecting a particular Class, the Class used is the Class saved on the Pilot record.
                                    <br />
                                    <br />
                                    If the report is restricted by making a selection, the scores can be reported in one of two ways.<br />
                                    - Restricted Scope Scoring selected - scores are re-calculated as if the only pilots who flew were the pilots within the selection.<br />
                                    - Restricted Scope Scoring NOT selected - uses the same scores as for the 'All Pilots' version of the report.<br />
                                    <br />
                                    Restricted Scope Scoring is useful for competitions<br />
                                    where, for example, only the pilots from a particular<br />
                                    Country qualify for a series based National Championship,<br />
                                    and where it is important to remove the effect of the flights<br />
                                    of pilots from other countries from the results.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <%--                                    <asp:Image ID="Image5" runat="server" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesReport.jpg" />--%>
                                <asp:Image ID="Image11" runat="server" Style="margin-right: 12px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesReport.jpg" />
                                <%-- <a name="report"></a>--%>
                                <h5>Competition Series Report</h5>
                                <p>
                                    This example shows a competition series where five events have been flown, and the
                                        best four results of each pilot are counted.<br />
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>




                    <%--  MAIN MENU - PILOTS--%>
                    <asp:TabPanel runat="server" ID="MainMenuPilotsTabPanel" HeaderText="Pilots" TabIndex="1">
                        <ContentTemplate>
                            <asp:TabContainer ID="MainMenuPilotsTabContainer" runat="server" ActiveTabIndex="0">
                                <asp:TabPanel runat="server" ID="MainMenuPilots" HeaderText="Pilots" TabIndex="3">
                                    <ContentTemplate>
                                        <asp:Image ID="Image1" runat="server" Style="width: 60%; margin-right: 12px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgMainMenu/Pilots.jpg" />

                                        <h5>Main Menu<br />
                                            Pilots</h5>
                                        <p>
                                            From the Main Menu you can access this screen to add new pilots, edit pilots or delete pilots.
                                        </p>
                                        <p>Pilots created here are entered into competitions from the competition setup screen.</p>
                                        <p>
                                            There are three fields for pilot registration.</br>
                            These are used as follows:</br>
                             - FAI Number - this is the number given to a pilot <b>by their National Association</b> that is affiliated with the FAI.</br>
                             - Other Registration - this is any pilot registration number that is <b>not related to the FAI</b>.</br>
                             - FAI ID - this is a number <b>issued by the FAI</b> to pilots who participate in Category 1 or Category 2 events.
                            Most pilots will not have an FAI ID

                                        </p>
                                        <div>
                                            <p>
                                                <b>Watch the Pilots video.</b><br />
                                                Note that the field 'Usual Frequency' shown in the video has since been deleted from the program.</br>
                            Note that the field 'Country Code' now has to be a code from the table 'Country Codes'.
                                            </p>
                                            <iframe width="853" height="480" src="http://www.youtube.com/embed/o539OeltEM8?rel=0" frameborder="0" allowfullscreen></iframe>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="MainMenuPilotsMultiClass" HeaderText="Multi-Class Competitions" TabIndex="2">
                                    <ContentTemplate>
                                        <div>
                                            <asp:Image ID="Image7" runat="server" Style="margin-right: 12px; margin-left; 4px" ImageAlign="Right" Width="70%" ImageUrl="~/ImgMainMenu/PilotsWithMultiClasses.jpg" />
                                            <h5>Pilot Setup for Multi-Class Competitions</h5>
                                            <p>
                                                GliderScore supports competitions where a single pilot can enter to fly in a number of different classes
                                      and all classes fly the same task each round.<br />
                                                <br />
                                                To keep the pilot/class combinations separate for scoring and report purposes you need to set them up in a special way.
                                            </p>
                                            <ul>
                                                <li>Create a 'Pilot' entry for each pilot/class combination.</li>
                                                <li>Include the class designation in the Last Name field like this<br />
                                                    Anderson+ALES<br />
                                                    Anderson+Woody<br />
                                                    Anderson+Open
                                                </li>
                                            </ul>
                                            <p>GliderScore recognises the '+' symbol in the last name field and will process it accordingly.</p>
                                            <ul>
                                                <li>In Pilot Entry (with UseClasses? selected)<br />
                                                    The Class field is automatically filled with the first four characters that follow the '+' symbol.
                                                </li>
                                                <li>All screens and reports that display the pilot class will show the name as just the name.</li>
                                                <li>In creating audio, a pilot class that is all capitals will be treated as separate letters.<br />
                                                    For example, +ALES would sound out each letter A...L...E...S, and not sound like beer (Ales).<br />
                                                    In other cases, like Anderson+Woody, these would be treated as separate words, Anderson, Woody.
                                                </li>
                                            </ul>
                                            </p>
                                        </div>
                                        <hr />
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </ContentTemplate>

                    </asp:TabPanel>


                    <%--MAIN MENU - LANDINGS--%>
                    <asp:TabPanel runat="server" ID="MainMenuLandings" HeaderText="Landings" TabIndex="2">
                        <ContentTemplate>
                            <%--<div>
                                <a href="#" style="font-size: 10px;">Back to top</a></div>--%>
                            <div>
                                <%--<hr />
                              <a name="landings"></a>--%>
                                <asp:Image ID="Image4" runat="server" Style="margin-right: 4px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgMainMenu/Landings.jpg" />
                                <h5>Main Menu<br />
                                    Landings</h5>
                                <p>
                                    From the Main Menu you can access this screen to maintain your Landing Bonus tables.&nbsp;
                                You can have as many as you like.<br />
                                    <br />
                                    Although the columns are headed Distance and Points, what you enter in each is up
                                to you.<br />
                                    <br />
                                    It is important to know that the Scoring screen will only allow values that you
                                put in the Distance column.<br />
                                    <br />
                                    The program then adds the related Points to the pilot&#39;s score.<br />
                                    <br />
                                    There is nothing to stop you from having the same values in both columns. If you do this, 
                                what you enter in the Score Entry screen will equal the points given.<br />
                                    <br />
                                </p>
                            </div>
                            <div>
                                <p><b>Watch the Landings video</b></p>
                                <iframe width="853" height="480" src="http://www.youtube.com/embed/oGGke9hA_U4?rel=0" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                                        <%--MAIN MENU - F5K HEIGHT BONUS/PENALTY TABLES--%>
                    <asp:TabPanel runat="server" ID="TabPanel3" HeaderText="F5K Height Bonus" TabIndex="3">
                        <ContentTemplate>

                            <div>
                                <asp:Image ID="Image5" Style="width: 60%; margin-right: 4px; margin-left: 4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgMainMenu/F5KBonusPenaltyTables.jpg" />
                                <h5>Main Menu<br />
                                    F5K Height Bonus/Penalty Tables</h5>
                                <p>
                                    F5K uses the concept of a 'nominal launch height' (NLH).<br />
                                    There are bonus points for launches below the NLH and penalty points for launches above the NLH.<br />
                                    The NLH is decided by the CD according to conditions on the day.<br />
                                    <br />
                                    This master file contains the data for the calculation of the bonus or penalty.<br />
                                    <br />
                                    In the competition setup screen you will select which of these tables to use for your competition.<br /><br />

                                    Try out the effect of different arrangements using the 'Check Bonus/Penalty' section, or<br />
                                    run the Report to see the bonus or penalty at each metre of launch height.
                                    </p>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>



                <asp:TabPanel runat="server" ID="OtherMasterFiles" HeaderText="Other Master Files" TabIndex="1">
            <ContentTemplate>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">




                    <%--MAIN MENU - ROLES--%>
                    <asp:TabPanel runat="server" ID="MainMenuRoles" HeaderText="Roles" TabIndex="3">
                        <ContentTemplate>

                            <div>

                                <asp:Image ID="Image3" runat="server" Style="margin-right: 4px; margin-left: 4px" ImageAlign="Right" ImageUrl="~/ImgMainMenu/Roles.jpg" />
                                <h5>Main Menu<br />
                                    Roles</h5>
                                <p>
                                    There is no need to use Roles if you do not have a use for identification badges for officials.<br />
                                    <br />
                                    From the Main Menu you can access this screen to maintain your Roles table.&nbsp;
                                You can define as many as you like.<br />
                                    <br />
                                    <b>What are Roles?</b><br />
                                    A Role describes the reasons why people may be on the competition flying field.<br />
                                    Those without a role should not be there.<br />
                                    The key role is Plt=Pilot. This role cannot be deleted.<br />
                                    Other roles might be CD=Competition Director, TM=Team Manager, and so on.<br />
                                    There can be a combined role such as Plt/TM=Pilot and Team Manager.<br />
                                    Any Role code containing the letter sequence Plt always means a pilot to the system, and this person will be entered into the draw.<br />
                                    Entrants with the following role code examples will all be taken to be pilots and may have other roles. Plt, Plt/TM, Plt/CD, TM/Plt.<br />
                                    <br />

                                    <b>What are Roles used for?</b><br />
                                    Roles are used when printing out identification Badges for those people who have a reason to be on the flying field.<br />
                                    The badges show the role and name, and if a pilot, other information as well.<br />
                                    When entering pilots, by using Roles, you are also able to enter officials as well.<br />
                                    Note that a person might take on different Roles at different competitions.<br />
                                    <br />

                                    To use Roles you must tick the 'Use Roles' box on the Competition Setup screen.<br />
                                    However, you can print identification badges for pilots even when 'Use Roles?' is not ticked.<br />

                                </p>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--MAIN MENU - COUNTRY CODES--%>
                    <asp:TabPanel runat="server" ID="CountryCodes" HeaderText="Country Codes" TabIndex="3">
                        <ContentTemplate>

                            <div>

                                <asp:Image ID="Image6" runat="server" Style="width: 60%; margin-right: 4px; margin-left: 4px;" ImageAlign="Right" ImageUrl="~/ImgMainMenu/CountryCodes.jpg" />
                                <h5>Main Menu<br />
                                    Country Codes</h5>
                                <p>
                                    The Country Codes table lists all country codes as recognised by the International Olympic Committee (IOC).</br></br>
                                The FAI uses the IOC's list as the source for its country codes.</br></br>
                                When creating or updating a Pilot record, any entry in the Country Code field must first exist in this table.</br></br>
                                 You will almost never need to make changes to this table but if you do, the table should always remain consistent with the IOC's codes.
                                </p>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--MAIN MENU - QRCODE SETUP--%>
                    <asp:TabPanel runat="server" ID="QRCodeSetup" HeaderText="QRCode Setup" TabIndex="3">
                        <ContentTemplate>

                            <div>
                                <asp:Image ID="Image8" Style="width: 60%; margin-right: 4px; margin-left: 4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgMainMenu/QRCodeSetup.jpg" />
                                <h5>Main Menu<br />
                                    QRCode Setup</h5>
                                <p>(Click <a href="DrawRounds.aspx?QRCodedScoreCards">here</a> to see QRCoded Score Cards.)</p>
                                <p>
                                    <b>eScoring:</b>
                                    If using GliderScore's eScoring system, you need to click on the 'Reset for eScoring' button so that the QRCode is configured correctly.
                                </p>
                                <p>
                                    <b>Manual Score Entry:</b>
                                    If entering scores manually, there is no need to do anything here. You can ignore it.</br></br>
                                </p>
                                <p>
                                    <b>Electronic Scoring Interface:</b>
                                    QRCodes can embed exactly the data required for a system that gathers scores using smartphones.</br></br>
                                Use this screen to specify the URL used by the electronic score gathering software.</br>
                                Enter test data in other fields as required</br></br>
                                You can include or exclude exactly the fields that are required and in the order required by the score gathering software.</br></br>
                                Any changes made are instantly reflected in the 'Message string' box and the generated QRCode.</br></br>
                                You can check for correct encoding by scanning the QRCode directly from the screen.</br></br>
                                
                                </p>

                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--MAIN MENU - MODEL NAMES AND DEVICE NAMES--%>
                    <asp:TabPanel runat="server" ID="TabPanel1" HeaderText="Model Data" TabIndex="3">
                        <ContentTemplate>

                            <div>
                                <asp:Image ID="Image2" Style="width: 60%; margin-right: 4px; margin-left: 4px;" runat="server" ImageAlign="Right" ImageUrl="~/ImgMainMenu/ModelNames.jpg" />
                                <h5>Main Menu<br />
                                    Model Names and Device Names</h5>
                                <p>
                                    At major competitions (world and continental championships) it is usual for pilots to register
                                their models and give each model an identifying letter (or number).<br />
                                    <br />
                                    The Model Names and Device Names tables are there to hold the names of every
                                model and device used by the entrants.<br />
                                    <br />
                                    Devices are the on-board devices used by the pilots (eg AMRT devices).<br />
                                    <br />
                                    Select 'Use Models' on the Competition Setup screen to use these functions.<br />
                                    In Pilot Entry the number of registered models is shown.<br />
                                    To make changes, click on this number and the data entry screen will appear.<br />
                                    Each pilot's models can be recorded with details of<br />
                                    - Model ID<br />
                                    - Model Name (from the Model Names table)<br />
                                    - Device Name (from the Device Names table)<br />
                                    - Device Serial Number (from the actual device)<br />
                                    <br />
                                    You can add as much or as little information about a pilot's models as you like. But the minimum is Model ID and Model Name.
                                <br />
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>


                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>


    </asp:TabContainer>

</asp:Content>


