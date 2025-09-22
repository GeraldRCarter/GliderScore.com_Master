<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        If varID = "DrawRoundsCreateDraw" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("DrawRoundsCreateDraw")
            container.ActiveTab = Pnl
        End If

        If varID = "DrawRoundsCheckDraw" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("DrawRoundsCheckDraw")
            container.ActiveTab = Pnl
        End If

        If varID = "SwapLanes" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("SwapLanes")
            container.ActiveTab = Pnl
        End If

        If varID = "DrawReport" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("DrawReport")
            Container2.ActiveTab = Panel2
        End If

        If varID = "DrawSMOM" Then
            Dim Container As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = Container.FindControl("DrawSMOM")
            Container.ActiveTab = Pnl
        End If

        If varID = "ScoringSheets" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("ScoringSheets")
            Container2.ActiveTab = Panel2
        End If

        If varID = "ScoreCards" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("ScoreCards")
            Container2.ActiveTab = Panel2
        End If

        If varID = "QRCodedScoreCards" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("QRCodedScoreCards")
            Container2.ActiveTab = Panel2
        End If

        If varID = "QRCodeList" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("QRCodeList")
            Container2.ActiveTab = Panel2
        End If

        If varID = "Badges" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("Badges")
            Container2.ActiveTab = Panel2
        End If

        If varID = "MatrixBadge" Then
            Dim Container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
            Dim Panel1 As AjaxControlToolkit.TabPanel = CType(DrawReports, AjaxControlToolkit.TabPanel)
            Container1.ActiveTab = Panel1
            Dim Container2 As AjaxControlToolkit.TabContainer = CType(DrawReportsContainer, AjaxControlToolkit.TabContainer)
            Dim Panel2 As AjaxControlToolkit.TabPanel = Container2.FindControl("MatrixBadge")
            Container2.ActiveTab = Panel2
        End If

        'Dim container1 As AjaxControlToolkit.TabContainer = CType(DrawRounds, AjaxControlToolkit.TabContainer)
        'Dim Pnl1 As AjaxControlToolkit.TabPanel = container1.FindControl("ScoreCards")
        'Pnl1.Visible = (varID <> "F3F")


    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--DRAW ROUNDS--%>
    <asp:TabContainer ID="DrawRounds" runat="server" ActiveTabIndex="0">
        <asp:TabPanel runat="server" ID="DrawRoundsSpecs" HeaderText="Draw Rounds" TabIndex="0">
            <ContentTemplate>

                <img id="Img14" runat="server" style="float: Right; width: 60%; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawSpecs.jpg" alt="" />

                <h5>Draw Rounds<br />
                    Draw Specifications</h5>
                <p>GliderScore takes into account both the 'DRAW Options' and the 'DRAW' specifications.</p>
            
                <p><b>DRAW Options</b><br />
                    <b>Team Protection</b> If using teams, you can also enforce team protection. Pilots in the same team will be in different flight goups.<br />
                    <b>20KHz Spacing</b> Avoids frequency clashes in the draw. Not required if all entrants are on 2.4GHz.<br />
                    <b>Assign Helpers</b> Automatically assigns helpers to pilots flying. Not available if using team protection.<br />
                    <b>Lanes</b> Assigns pilots to a lane to fly from. Choices are
                    <ul>
                        <li>None - Lanes are not assigned.</li>
                        <li>Random - Lanes are assigned randomly.</li>
                        <li>Team - Lanes are assigned to teams but changed every round.</li>
                        <li>Closest - Assigns the lane number that is as close as possible to the pilot's team number.</li>
                    </ul>
                                                                          
                </p>
                
                
                <p>
                    <b>DRAW</b><br />
                    <b>Draw Mode</b><br />
                    You can choose between Man-On-Man or Seeded Man-On-Man.<br />
                    Most competitions are drawn using Man-On-Man. This maximizes the number of different pilots that a pilot will fly against.<br />
                    Seeded Man-On-Man (SMOM) requires a new draw after every round. It puts pilots with similar progressive scores into groups.<br />
                    There is more information about SMOM under the 'Seeded Draw' tab.<br />

                    <b>Groups/Round</b><br />
                    Adjust the number of Groups per Round to get your desired number of pilots per group.<br />
                    The minimum number of Groups per Round is limited by various settings such as<br />
                    - maximum number in any one team (if Team Protection selected)<br />
                    - maximum number on any one frequency (also allowing for 20kHz spacing selection)<br />
                    - whether the task is flown in groups (Speed and F5B are 1 group per round)<br />

                    <b>Pilots/Group (Min/Max)</b> figures will change automatically.<br />

                    <b>Allow Back-to-Back flights</b><br />
                    This option is only available if there are three or more groups per round.<br />
                    <ul>
                        <li>Yes - means that a pilot can be drawn in the last group of a round and the first group of the next round.<br />
                            This selection gives the best (fairest) draw.

                        </li>
                        <li>No - means that a pilot drawn in the last group of a round will not be drawn in the first group of the next round.<br />
                            Selecting this option will reduce the fairness of the draw but this effect can be small provided that<br />
                            the Groups per Round is large (perhaps five or more).
                        </li>
                    </ul>
                </p>

                <p>
                        Finally, click the <b>Draw</b> button.<br />
                        <br />
                        Click the Create Draw tab (above) for the next stage.
                    </p>
                    <br />
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" ID="DrawRoundsCreateDraw" HeaderText="Create Draw" TabIndex="1">
            <ContentTemplate>
                <%--CREATE DRAW--%>
                <h5>Draw Rounds<br />
                    Create Draw
                    <%--                    <asp:ImageMap ID="ImageMap5" runat="server" ImageAlign="Right" 
                    ImageUrl="~/ImgDraw/Draw2.jpg" Width="600px">
                </asp:ImageMap>--%>
                    <img id="Img1" runat="server" style="float: Right; width: 600px; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/Draw2.jpg" alt="" />
                </h5>
                <p>
                    Clicking on the Draw button brings up this screen.
                </p>
                <ul>
                    <li>Adjust the &#39;To Round&#39; number to the number of rounds that you want to create.</li>
                    <li>Click the Start Draw button to begin the draw processing.</li>
                </ul>
                <p>
                    The screen will then expand to show the progress of the draw.&nbsp; You can Cancel
                    the draw at any time.
                </p>
                <p>
                    You should always process the draw a number of times to see if a better draw is generated.
                    When processing, there are sometimes choices to be made between pilots who are equally good
                    candidates for the next place in the draw, and this choice can only be made randomly.  No
                    two draws will be the same, and the next one that you create might be better than the one
                    that you have.  The program will keep the best draw of the two (unless you tick the box to 
                    force replacement).
                </p>
                <p>Click the Check Draw tab (above) for the next stage.</p>
                <hr />
                <div>
                    <h5>Draw Rounds<br />
                        Create Draw - Speed Draw Options
                        <%--                        <asp:ImageMap ID="ImageMap1" runat="server" ImageAlign="Right"
                        ImageUrl="~/ImgDraw/CreateDrawSpd.jpg" Width="600px">
                    </asp:ImageMap>--%>
                        <img id="Img2" runat="server" style="float: Right; width: 600px; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/createDrawSpd.jpg" alt="" />
                    </h5>
                    <p>
                        If creating a draw for Speed task, additional options become available.<br />
                        Only the options that apply to your competition will be enabled.
                    </p>
                    <ul>
                        <li><b>Normal</b><br />
                            - Separates pilots in the order so that pilots with team and/or frequency conflicts do not follow each other.
                        </li>
                        <li><b>Duration Order</b><br />
                            - Places pilots in the Speed draw in the same order that they were drawn for Duration.<br />
                            This avoids the last pilots in Duration being the first in Speed,<br />
                            but it is possible that pilots with team and/or frequency conflicts will follow each other.                    
                        </li>
                        <li><b>Current Ranking</b><br />
                            - Ranks the pilot's scores up to and including the round being drawn.<br />
                            Pilots are then entered in the Speed draw in reverse order so that the leading pilots fly last.<br />
                            It is likely that pilots with team and/or frequency conflicts will follow each other.                    
                        </li>
                    </ul>

                </div>
                <div>
                    <h5>Draw Rounds<br />
                        Create Draw - F5B Draw Options
                      <%--  <asp:ImageMap ID="ImageMap2" runat="server" ImageAlign="Right"
                        ImageUrl="~/ImgDraw/CreateDrawF5B.jpg" Width="600px">
                    </asp:ImageMap>--%>
                        <img id="Img3" runat="server" style="float: Right; width: 600px; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/CreateDrawF5B.jpg" alt="" />
                    </h5>
                    <p>
                        If creating a draw for F5B, additional options become available.<br />
                        Only the options that apply to your competition will be enabled.
                    </p>
                    <ul>
                        <li><b>Mode A</b><br />
                            - Separates pilots in the order so that pilots with team and/or frequency conflicts do not follow each other.<br />
                            - While keeping pilots in the same overall order, moves the topmost pilots to the end for each round change.
                        </li>
                        <li><b>Mode B</b><br />
                            - Separates pilots in the order so that pilots with team and/or frequency conflicts do not follow each other.<br />
                            - Keeps this exact order for all rounds drawn.
                        </li>
                    </ul>

                </div>
            </ContentTemplate>
        </asp:TabPanel>
        <%--CHECK DRAW--%>
        <asp:TabPanel runat="server" ID="DrawRoundsCheckDraw" HeaderText="Check Draw" TabIndex="2">
            <ContentTemplate>

                <%--                <asp:Image ID="Image20" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/Draw4.jpg" />
                <asp:Image ID="Image4" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawMatrix.jpg" />--%>

                <img id="Img4" runat="server" style="float: Right; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/Draw4.jpg" alt="" />
                <img id="Img5" runat="server" style="float: Right; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawMatrix.jpg" alt="" />
                <h5>Draw Rounds<br />
                    Check Draw</h5>
                <p>
                    At the end of the draw the Check Draw button appears (on the competition setup screen).
                </p>
                <p>
                    This brings up the Check Draw screen that shows who flies against who, and how many
                    times.
                </p>
                <p>
                    The overall fairness of the draw is shown as measured by the Mean Absolute
                    Deviation number at the bottom of the screen. Generally, the lower the number, the better the draw.
                </p>
                <p>
                    The distribution of pilot 'meetings' is shown in the form of a bar graph to give
                    a quick sense of how well the draw has gone.  You can check this for any range of round numbers.
                </p>
                <p>
                    At the bottom of the screen there is a 'Draw Matrix' button.  This takes you direcly to the 'Draw Matrix' report.
                    The 'Draw Matrix' report can be downloaded, previewed on screen or printed.
                </p>
                <p>
                    You can do a Re-Draw at any time.
                </p>
                <br />
            </ContentTemplate>
        </asp:TabPanel>
        <%--SWAP LANES--%>
        <asp:TabPanel runat="server" ID="SwapLanes" HeaderText="Swap Lanes" TabIndex="2">
            <ContentTemplate>

                <%--                <asp:Image ID="Image14" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/SwapLanes.jpg" />--%>
                <img id="Img6" runat="server" style="float: Right; margin-right: 4px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/SwapLanes.jpg" alt="" />
                <h5>Draw Rounds<br />
                    Swap Lanes</h5>
                <p>
                    The allocation of lanes, changing with each round, is a feature of F3J, but can be used for other competitions having a duration task.
                </p>
                <p>
                    The Swap Lanes button on the Competition setup screen is enabled at the end of a draw where lanes are used.
                </p>
                <p>
                    This brings up the Swap Lanes screen that shows, round by round, who flies from each lane.
                </p>
                <p>
                    The lane allocation may not be ideal if there is a mixture of team sizes and the number of lanes is less than the number of teams.<br />
                    In this case, use the 'Swap Lanes' screen to make your adjustments.
                </p>
                <p>You can focus on specific teams by entering team numbers in the 'Team Filter' box.</p>

                <p>
                    Alternatively, you can simply change the lane numbers in the Scoring screens.
                    Any changes made will be reflected in the Draw reports.
                </p>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="DrawReports" HeaderText="Draw Reports" TabIndex="30">
            <ContentTemplate>
                <asp:TabContainer runat="server" ID="DrawReportsContainer">

                    <%--DRAW DETAIL REPORT--%>
                    <asp:TabPanel runat="server" ID="DrawReport" HeaderText="Draw Reports" TabIndex="3">
                        <ContentTemplate>
                            <div>
                                <%--                                <asp:Image ID="Image1" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawDetails.jpg" />--%>
                                <img id="Img7" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawDetails.jpg" alt="" />
                                <h5>Draw Reports<br />
                                    Draw Details Reports</h5>
                                <p>
                                    At the end of the draw the Draw Details can be printed or downloaded from the
                    <b>Reports</b> menu.
                                </p>
                                <p>As shown at right, four formats are available.</p>
                                <ul>
                                    <li>Draw (large format)</li>
                                    <li>Draw (small format)</li>
                                    <li>Draw Table</li>
                                    <li>Draw (Teams)</li>
                                </ul>
                                <p>You can choose to sort the reports by one of</p>
                                <ul>
                                    <li>Team</li>
                                    <li>Lane</li>
                                    <li>Pilot (competition number)</li>
                                    <li>Name (last name/first name)</li>
                                </ul>

                                <p>
                                    As well as these formats, you can print </br>
                                   individual Matrix Badges, one for each pilot</br>
                                   showing their round and group data.</br>
                                   Click on the tabs to see details of this and other reports.
                                </p>
                                <p>
                                    In the case of F5J team events, the draw reports will indicate whether the draw was 
                                    made with Team Protection ON or with Team Protection OFF.
                                </p>
                                <p>
                                    Where 'Assign Helpers?' is selected, the Helper name is also shown in the report.<br />
                                    This does not apply to all report layouts because of insufficient space.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <br />
                                <%--                                <asp:Image ID="Image3" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawDetailsSmall.jpg" />--%>
                                <img id="Img8" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawDetailsSmall.jpg" alt="" />
                                <p>
                                    <b>Draw (small format)</b><br />
                                    This is a more compact version of the first report shown.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <br />
                                <%--                                <asp:Image ID="Image8" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawTable.jpg" />--%>
                                <img id="Img9" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawTable.jpg" alt="" />
                                <p>
                                    <b>Draw Table</b><br />
                                    This is a tabular version with one row per pilot.<br />
                                    <br />

                                    For F3J, lane numbers can be included (if selected).<br />
                                    <br />

                                    For F3B, distance ID codes and speed flying sequence are both shown.<br />
                                    <br />

                                    Columns to be included are user selectable (other than Name).
                                </p>
                            </div>
                            <hr />
                            <div>
                                <br />
                                <%--                                <asp:Image ID="Image12" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawTeams.jpg" />--%>
                                <img id="Img10" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawTeams.jpg" alt="" />
                                <p>
                                    <b>Draw (Teams)</b><br />
                                    This report has one row per flight group, and one column per team. Note that Team numbers do not
                    have to form a continuous sequence.<br />
                                    <br />

                                    The number of rounds for the report can be selected.<br />
                                    <br />

                                    If more than one task (F3B) - the task/s for the report can be selected.<br />
                                    <br />
                                    For the Speed task and for F5B - the flying order is indicated by numbers against each name.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <br />
                                <%--                                <asp:Image ID="Image15" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawTeamsF3K.jpg" />--%>
                                <img id="Img11" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawTeamsF3K.jpg" alt="" />
                                <p>
                                    <b>Draw (Teams) for F3K</b><br />
                                    The F3K version of the report includes a brief description of the task that has been set for each round.
                                </p>
                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>
                    <%--SCORING SHEETS--%>
                    <asp:TabPanel runat="server" ID="ScoringSheets" HeaderText="Scoring Sheets" TabIndex="4">
                        <ContentTemplate>
                            <div>
                                <%--                                <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawScoringSheets.jpg" />--%>
                                <img id="Img12" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawScoringSheets.jpg" alt="" />
                                <h5>Draw Reports<br />
                                    Scoring Sheets</h5>
                                <p>
                                    At the end of the draw the Scoring Sheets can be printed or downloaded from the
                    <b>Reports</b> menu.
                                </p>
                                <p>Columns are provided according to the selected task and options.</p>
                                <br />


                            </div>



                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--SCORE CARDS--%>
                    <asp:TabPanel runat="server" ID="ScoreCards" HeaderText="Score Cards/Record" TabIndex="5">
                        <ContentTemplate>
                            <div>
                                <h5>Draw Reports<br />
                                    Score Cards/Score Record</h5>
                                <p>(Note: See below for Pilot's Score Record).</p>
                                <p>
                                    Both blank and pre-filled score cards can be printed for all duration tasks including F3K and F5K.
                                </p>
                                <ul>
                                    <li>F3B Duration Task A</li>
                                    <li>F3J</li>
                                    <li>F3K HLG/DLG</li>
                                    <li>F5B</li>
                                    <li>F5J</li>
                                    <li>F5K</li>
                                    <li>Open Thermal</li>
                                    <li>Electric Thermal</li>
                                </ul>
                                <hr />
                                <div>

                                    <%--                                    <asp:Image ID="Image7" Style="width: 50%; height: 50%" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawF3KScoreCardOptions.jpg" />--%>
                                    <img id="Img13" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawF3KScoreCardOptions.jpg" alt="" />
                                    <h5>F3K and F5K Score Cards</h5>
                                    <p>(See further below for Duration task score cards)</p>
                                    <p>
                                        F3K and F5K Score Cards follow a similar pattern as both require a layout suited to the task for the round.<br />
                                        Everything that applies to F3K score cards also applies to F5K score cards.
                                    </p>
                                    <p>
                                        This screen shows selections for pre-filled F3K score cards. The selections available
                        will differ according to the requirements. For example, there is a different selection
                        screen for blank score cards.<br />
                                        <br />
                                        There are two layouts for pre-filled score cards.
                        <ul>
                            <li>Score card Book layout - the pilots appear in the same position on each successive
                                page. Pages can be cut through to make a score card book for each pilot.</li>
                            <li>Score card Page layout - each pilot prints on a page/s until completed, to be followed
                                by the next pilot, and so on. </li>
                        </ul>
                                    </p>
                                    <br />
                                </div>
                            </div>
                            <%--<hr width="100%" />--%>
                            <div>
                                <%--                                <asp:Image ID="Image9" Style="width: 50%; height: 50%" runat="server" ImageAlign="Right"
                                    ImageUrl="~/ImgDraw/DrawF3KScoreSheetSample.jpg" />--%>
                                <img id="Img15" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawF3KScoreSheetSample.jpg" alt="" />
                                <p>
                                    This is an example of a pre-filled F3K Score Card.<br />
                                    <br />
                                    Printed 6 to a page, F3K pre-filled score cards include (as applicable).<br />
                                    <ul>
                                        <li>Task code and description</li>
                                        <li>Pilot name</li>
                                        <li>Pilot frequency</li>
                                        <li>Pilot country</li>
                                        <li>Pilot team number</li>
                                        <li>Pilot start number</li>
                                        <li>Pilot class</li>
                                        <li>Round number</li>
                                        <li>Group number</li>
                                        <li>Numbered boxes for entering scores. If only 5 flights are allowed (for example),
                                only 5 boxes will be numbered</li>
                                        <li>A box for recording penalties</li>
                                        <li>Spaces for the pilot and the timer to sign</li>
                                        <li>Sequence Number (the position of the pilot on the score entry screen)</li>
                                    </ul>
                                </p>
                            </div>
                            <hr width="100%" />
                            <div>
                                <div>
                                    <h5>Duration Task Score Cards</h5>
                                    <%--                                    <asp:Image ID="Image6" Style="width: 50%; height: 50%" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawDurScoreCardOptions.jpg" />--%>
                                    <img id="Img16" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawDurScoreCardOptions.jpg" alt="" />
                                    <p>
                                        This is the selection screen for Duration task score cards.<br />
                                        <br />
                                        Landings play a major part in the scoring process and so a
                            lot of information is made available on the score card.<br />
                                        <br />
                                        Complete the top section to specify the landing rules for your competition.<br />
                                        These rules are automatically saved for re-use (separately for F3J, F5J, Electric and all other).<br />
                                        <br />


                                        There are two layouts for pre-filled score cards.
                        <ul>
                            <li>Score card Book layout - the pilots appear in the same position on each successive
                                page. Pages can be cut through to make a score card book for each pilot.</li>
                            <li>Score card Page layout - each pilot prints on a page/s until completed, to be followed
                                by the next pilot, and so on. </li>
                        </ul>
                                    </p>
                                </div>
                                <br />
                                <div>
                                    <%--                                    <asp:Image ID="Image5" Style="width: 50%; height: 50%" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawDurScoreCards.jpg" />--%>
                                    <img id="Img17" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawDurScoreCards.jpg" alt="" />
                                    <p>
                                        This is an example of pre-filled duration task (F3J) Score Cards.<br />
                                        <br />
                                        Printed 8 to a page, these score cards include (as applicable)<br />
                                        <ul>
                                            <li>Pilot name</li>
                                            <li>Pilot frequency</li>
                                            <li>Pilot country</li>
                                            <li>Pilot team number</li>
                                            <li>Pilot start number</li>
                                            <li>Pilot class</li>
                                            <li>Round number</li>
                                            <li>Group number</li>
                                            <li>Lane number</li>
                                            <li>Boxes for entering scores, including re-flight scores if necessary</li>
                                            <li style="list-style-type: none">- Laps (F5B)</li>
                                            <li style="list-style-type: none">- Time</li>
                                            <li style="list-style-type: none">- Landing</li>
                                            <li style="list-style-type: none">- Motor Run (F5B and Electric)</li>
                                            <li>Box/s for recording penalties</li>
                                            <li style="list-style-type: none">- Late Landing (F3J)</li>
                                            <li style="list-style-type: none">- Safety</li>
                                            <li>Spaces for the pilot and the timer to sign</li>
                                            <li>Sequence Number (the position of the pilot on the score entry screen)</li>
                                        </ul>
                                    </p>
                                </div>
                            </div>
                            <hr />

                            <%--                            <asp:Image ID="Image13" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawPilotsScoreRecord.jpg" />--%>
                            <img id="Img18" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawPilotsScoreRecord.jpg" alt="" />
                            <h5>Pilot's Score Record</h5>
                            <p>
                                From the <b>Reports Menu → Score Cards</b> you can print Pilot Score Record cards
                    similar to this one.<br />
                                <br />
                                The Record cards can be printed for all competition types including F3B, F3K and so on.
                            </p>
                            <ul>
                                <li>F3B</li>
                                <li>F3J</li>
                                <li>F3Q</li>
                                <li>F5B</li>
                                <li>F5J</li>
                                <li>F5K</li>
                                <li>Open Thermal</li>
                                <li>Electric Thermal</li>
                                <li>ALES</li>
                            </ul>
                            <p>
                                The Record cards are in a standard format that allows pilots to keep a record of
                    their flight scores. They can be used to check against the scores that are entered.<br />
                                <br />
                                The Record cards are 'pre-filled' and will show round and group numbers if the draw
                    has been completed.
                            </p>
                            <p>
                                The QR Code print has the URL (also printed on the Score Record) embedded in it.<br />
                                Scanning the QR Code with a smartphone will open a score entry screen (if competition data has been uploaded using the eScoring menu).<br />
                                Typing the URL into the search area of any browser will do exactly the same thing.<br />
                            </p>


                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--        <%--QRCODED SCORE CARD--%>
                    <asp:TabPanel runat="server" ID="QRCodedScoreCards" HeaderText="QRCoded Score Card" TabIndex="6">
                        <ContentTemplate>
                            <%--                            <asp:Image ID="Image16" Style="width: 60%" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/QRCodedScoreCards.jpg" />--%>
                            <img id="Img19" runat="server" style="float: Right; width: 60%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/QRCodedScoreCards.jpg" alt="" />
                            <h5>Draw Reports<br />
                                QRCoded Score Card</h5>
                            <p>(Click <a href="MainMenu.aspx?QRCodeSetup">here</a> to see the QRCode Setup screen.)</p>
                            <p>
                                From the <b>Reports Menu → Score Cards</b> you can print pilot Score Cards
                    with a QRCode included like these.<br />
                                <br />
                                The QRCode Setup screen is available from the Main Menu and within the print selections for Score Cards.
                    This is where you can specify exactly what is to be encoded.</br>
                    
                            </p>

                            <p>
                                These QRCoded Score Cards are provided to assist developers who are able to create apps to collect scores using smartphones.<br />
                                <br />
                                If you are entering scores directly into GliderScore, you should use the standard Score Cards.
                    
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--        <%--QR CODE LIST--%>
                    <asp:TabPanel runat="server" ID="QRCodeList" HeaderText="QRCode List" TabIndex="6">
                        <ContentTemplate>
                            <%--                            <asp:Image ID="Image17" Style="width: 60%" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/QRCodeList.jpg" />--%>
                            <img id="Img20" runat="server" style="float: Right; width: 60%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/QRCodeList.jpg" alt="" />
                            <h5>Draw Reports<br />
                                QR Code List</h5>
                            <p>(Click <a href="MainMenu.aspx?QRCodeSetup">here</a> to see the QRCode Setup screen.)</p>
                            <p>
                                From the <b>Reports Menu → QR Code List</b> you can print a list of QR Codes. There is no provision for recording scores.<br />
                                <br />
                                Print this list to have a complete and compact list of all pilot QRCodes for your competition.</br>
                                There are up to 14 codes printed per A4 page.
                            </p>
                            <br />
                        </ContentTemplate>
                    </asp:TabPanel>

                    <%--BADGES--%>
                    <asp:TabPanel runat="server" ID="Badges" HeaderText="Badges" TabIndex="7">
                        <ContentTemplate>
                            <%--                            <asp:Image ID="Image10" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawBadges.jpg" />--%>
                            <img id="Img21" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawBadges.jpg" alt="" />
                            <h5>Draw Reports<br />
                                Badges</h5>
                            <p>
                                From the <b>Reports Menu → Badges</b> you can print identification badges for all entrants.<br />
                                This may be just for pilots, but if you selected 'Use Roles' in the competition setup screen, and 
                    entered people in roles such as Team Manager, Competition Director, Jury Member, and so on, badges 
                    for these entrants can also be printed.<br />
                                <br />



                                <b>Badge Size</b> - Within limits, the overall size of each badge can be changed.<br />
                                <b>Badge Logo</b> - Having a logo on the badge is optional. If selected, the height, width and location can be altered.<br />
                                <b>Badge Text Area</b> - the text area can be aligned to the left, centre or right and the width of the text area can be altered.<br />
                                <b>Badge Text</b> - the text within the text area can be aligned left, centre or right. Some text is optional.
                    
                            </p>
                            <div>
                                <hr />
                                <%--                                <asp:Image ID="Image11" runat="server" ImageAlign="Right" ImageUrl="~/ImgDraw/DrawBadgePrint.jpg" />--%>
                                <img id="Img22" runat="server" style="float: Right; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawBadgePrint.jpg" alt="" />
                                <p>
                                    The badges will print like this.<br />
                                    What actually gets printed depends on your selections.<br />
                                    <br />
                                    It is also possible to use the 'badges' as labels. Use on packages for entrants.
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="MatrixBadge" HeaderText="Matrix Badge" TabIndex="50">
                        <ContentTemplate>
                            <%--                            <asp:Image ID="Image25" runat="server" ImageAlign="Right" Style="float: right; width: 60%" ImageUrl="~/ImgDraw/DrawMatrixBadgePrint.jpg" />
                            <asp:Image ID="Image26" runat="server" ImageAlign="Right" Style="float: right; width: 60%" ImageUrl="~/ImgDraw/DrawMatrixBadgePrintout.jpg" />--%>

                            <img id="Img23" runat="server" style="float: Right; width: 60%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawMatrixBadgePrint.jpg" alt="" />
                            <img id="Img24" runat="server" style="float: Right; width: 60%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawMatrixBadgePrintout.jpg" alt="" />

                            <h5>Draw Reports<br />
                                Matrix Badge</h5>
                            <p>
                                From the <b>Reports Menu → Matrix Badges</b></br>
                    Print a separate badge for each pilot.</br>
                    Each badge has a table showing, for each round of the draw, the pilot's flight group.</br>
                    If using the Lanes facility, the print will also show the Lane number.</br></br>
                    The badges are sized so that they easily slip into a holder similar to a name badge holder.</br>
                    The badges print 10 on each A4 page.</br>
                    Up to 24 rounds can be printed per badge.
                            </p>

                        </ContentTemplate>
                    </asp:TabPanel>

                </asp:TabContainer>

            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="DrawSMOM" HeaderText="Seeded Draw" TabIndex="31">
            <ContentTemplate>
                <h5>Seeded Man-on-Man</h5>
                <p>
                    With Seeded Man-on-Man (SMOM) pilots are drawn in groups according to their cumulative scores.<br />
                    The first round is drawn randomly and then flown and scored. Only then is the second round drawn.<br />
                    The lowest scoring pilots (at Round 1) fill the first group, the next higher pilots fill the second group, and so on.<br />
                    In this way each round is flown and scored before the next round is drawn.<br />
                    If several pilots have the same score and are candidates for the last place in a flight group, GliderScore allocates them randomly.
                </p>
                <p>
                    There are some restrictions.<br />
                    <ul>
                        <li>You can't use SMOM where there are frequency clashes.</li>
                        <li>'Allow-back-to-back' becomes irrelevant because of the seeding.</li>
                        <li>There must be at least two flight groups per round.</li>
                        <li>The task must be a single task. Either one of the duration tasks, F3K or F5K.</li>
                        <li>SMOM is not available for F5B.</li>
                    </ul>
                </p>
                <p>From the Competition Setup screen, create the draw for Round 1 in the usual way.</p>
                <div>
                    <p>
                        <img id="Img25" runat="server" style="float: Right; width: 70%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/DrawNextRoundSMOM.jpg" alt="" />
                        After all the scores are in for Round 1, click on the button to draw the next round.
                    </p>
                </div>
                <div>
                    <p>
                        <img id="Img26" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/NewSMOMDraw.jpg" alt="" />
                        You will see a screen like this.<br />
                        Click on 'OK' to create the new Round and resume flying.<br />
                        You can 'Retire' pilots who are not able to continue. They will not be in the next round. See further below for an example.<br />
                        'Retired' pilots can be 'Un-Retired' at a later time if they overcome their issues.<br />
                    </p>
                </div>
                <div>
                    <img id="Img27" runat="server" style="float: Right; width: 50%; margin-right: 12px; margin-left: 4px; margin-bottom: 4px;" src="~/ImgDraw/NewSMOMDraw1.jpg" alt="" />
                    <p>In this example a pilot has been marked 'Retired' and will not be in the draw for Round 2.</p>
                </div>

            </ContentTemplate>
        </asp:TabPanel>

    </asp:TabContainer>

</asp:Content>
