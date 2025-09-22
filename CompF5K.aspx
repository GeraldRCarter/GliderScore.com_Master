<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="F5KIntro" runat="server">
        <asp:TabPanel runat="server" ID="F5KIntroTab" HeaderText="F5K Introduction">
            <ContentTemplate>
                <asp:Image ID="Image7" runat="server" Style="margin-right: 4px; margin-left: 4px;" AlternateText="" Width="98%"
                    ImageAlign="Left" ImageUrl="~/ImgOther/F5KFury.jpg" />
                <div>
                    <br />
                    <h5>F5K - Thermal Duration Gliders for Multiple Task Competition with<br />
                        Electric Motor and Altimeter/Motor Run Timer (AMRT)</h5>
                    <p>
                        F5K is a multi-task, electric launch glider class limited to 1.5 metres wingspan.                        
                    </p>
                    <p><b>F5K2024</b><br />
                        An updated set of rules has been written that simplifies F5K penalties and other details.<br />
                        In GliderScore this is called competition class F5K2024.<br />
                        These rules were submitted to the FAI for consideration at the 2023 CIAM Congerence.<br />
                        The tasks are exactly the same.<br />
                        Download these rules <a href="/zipfile/FAI_F5K_2024.pdf">here</a>.
                    </p>
                    <p>
                        There are five tasks.<br />
                        <ul>
                            <li>Task A - flights of 1, 2, 3 and 4 minutes in 10 minutes (any order).</li>
                            <li>Task B - Last flight with 5 minute maximum in 7 minutes. Maximum of 3 launches.</li>
                            <li>Task C - All Up - four minute max - 3 flights per round.</li>
                            <li>Task D - 3, 3, and 4 minute flights in 10 minutes (any order).</li>
                            <li>Task E - Poker - maximum of 3 flights to time counted in 10 minutes.</li>
                        </ul>
                        <p>
                            <b>F5K Rule Refinement for Task C (2021-06-01)</b><br />
                            A proposal to refine the flight timing for Task C will be sent to the FAI.<br />
                            The refinement is to allow 4:01 of working time for each flight.<br />
                            The extra second makes it possible to achieve the 4:00 target time.<br />
                            Flight time commences at the instant that the model is launched.<br />
                            Flight time ends when one of these events occurs.<br />
                            - when the model lands<br />
                            - when 4 minutes have been flown<br />
                            - when the ending horn begins to sound<br />
                            To make this change, go to Digital Timer->Timer Setup and edit the timer files that relate to F5K Task C.<br />
                            These are named F5K-5m4m15s and F5K-15s4m15s.<br />
                            Two new audio files have been added to both downloads. PilotsMustLand.wav and PrepareToLaunch.wav.<br />
                            Adding these audio files to the timer files in the launch and landing phases will reduce confusion.<br />
                            These changes have already been made for those downloading for the first time.
                        </p>
                        <p>
                            <b>General Scoring Principals</b><br />
                            One (1) point for each second of flight time.<br />
                            Gain or lose points according to launch height relative to a Nominal Launch Height (NLH).<br />
                            Launches higher than the NLH lose points. Launches lower than the NLH gain points.<br />
                            A number of flight and round penalties apply. The most usual penalty is for landing outside of the pilot's area.
                        </p>
                        <p>
                            <b>F5K Rules</b><br />
                            Because of Covid-19, the April 2020 CIAM conference (that was to consider the proposed F5K rules) was never held.<br />
                            Since that time various trial contests have been held and with this experience a revised set of rules was developed.<br />
                            These revised F5K rules have been approved by the FAI and can be viewed <a href="/zipfile/SC4_Vol_F5_Electric_21_F5K.pdf">here</a>.<br />
                            The F5K rules including the F5 General Rules and can be viewed <a href="/zipfile/SC4_Vol_F5_Electric_21_F5K1.pdf">here</a>.<br />
                            <br />

                            <b>For more information about F5K</b><br />
                            <ul>
                                <li>Contact Brian van der Gouw <u>b.vandergouw(at)gmail.com</u>.</li>
                                <li>Go to the F5K website <a href="https://thermal-soaring.com">https://thermal-soaring.com</a>.</li>
                                <li>Go to the Facebook page <a href="https://www.facebook.com/F5K-Thermal-Soaring-340712513247095">https://www.facebook.com/F5K-Thermal-Soaring-340712513247095</a>.</li>
                            </ul>

                        </p>

                        <p>
                            With F5K there is a lot of scoring data to collect. This is best handled using the eScoring system with the score data backed up on score cards or score records.
                        GliderScore handles this in an integrated way so that the process of setting up,
                        running and scoring F5K competitions is straightforward.
                        </p>

                        <p>To get started with F5K in GliderScore ...</p>
                        <ul>
                            <li>Create records for your pilots. You only have to do this once (Main Menu/Master Files).</li>
                            <li>Create the Height Bonus/Penalty tables (if different to table 'BP 2020-10'). You only have to do this once (Main Menu/Master Files).</li>
                        </ul>
                        <p>Set up a new competition ...</p>
                        <ul>
                            <li>Create a NEW competition (Main Menu/Competitions/New).</li>
                            <li>Select the competition class (FAI F5K).</li>
                            <li>Enter your pilots.</li>
                            <li>Select the Height Bonus/Penalty table.</li>
                            <li>Create the Draw.</li>
                            <li>Assign a task to each round drawn.</li>
                            <li>Start the competition.</li>
                        </ul>

                        <p>
                            GliderScore Main features
                        </p>
                        <ul>
                            <li>Unlimited number of pilots. Up to 99 rounds can be drawn.</li>
                            <li>Creates an optimised draw that avoids frequency and/or team clashes.</li>
                            <li>Pilots can be 'retired' and a re-draw made with the remaining pilots for later rounds.</li>
                            <li>Tasks for each round can be selected as part of the process of printing Score Cards.<br />
                                Tasks can also be selected in the Scoring screen. In this case, scores automatically<br />
                                re-calculate according to the newly selected task rules.</li>
                            <li>The Nominal Launch Height can be changed for each round and scores will adjust automatically.</li>
                            <li>Pilots can be moved between groups, and even rounds, for re-flights.</li>
                            <li>Whole groups can be re-flown.</li>
                            <li>New re-flight groups can be 'built' with selected pilots.</li>
                            <li>Keeps track of each pilot's best score for each round (if pilot is re-flown)</li>
                            <li>Deducts up to two drop scores at predetermined rounds flown.</li>
                            <li>Provides a comprehensive suite of reports. All reports can be previewed, printed
                            or downloaded.</li>
                            <li>Score cards and Score Records can be printed from the Reports menu.</li>
                            <li>Multiple competitions can be selected into a Competition Series and a series Championship
                            report automatically produced.</li>
                            <li>F5K can be scored using eScoring in a similar way to other classes.</li>
                        </ul>
                        <p><b>Expand <b>F5K</b> on the side menu to work through these features.</b></p>
                        <hr />
                </div>
                <div>
                    <asp:Image ID="Image1" runat="server" Width="60%" ImageAlign="Right" ImageUrl="~/ImgScore/ScoreF5K.jpg" />
                    <p>
                        Example of scoring for F5K
                    </p>
                    <ul>
                        <li>The Task for the Round can be selected here</li>
                        <li>If the Task is changed, all scores for the Round re-calculate automatically</li>
                        <li>The Nominal Launch Height can be changed here too. Scores will adjust.</li>
                        <li>The values are the points gained for each flight within the task.</li>
                    </ul>
                </div>
                <div>
<hr />
                    <br />
                    <asp:Image ID="Image22" runat="server" Width="60%" ImageAlign="Right" ImageUrl="~/ImgScore/ScoreF5K1.jpg" />
                    <p><b>F5K Data entry form </b><br />
                        See below for F5K2024 data entry form.
                    </p>
                    <p><b>To open the Scoring_F5KDataEntry form</b>, start by opening the 'Score Entry' form shown above. Then ...</p>
                    <ul>
                        <li>Click on any row to open the F5KDataEntry form for that pilot, or</li>
                        <li>Navigate to the pilot's row and press the 'Enter' key.</li>
                    </ul>
                    <p>
                        Once in the F5KDataEntry form, navigate to any pilot's score data by using the Next and Previous buttons or<br />
                        use [Ctrl]+[Right] and [Ctrl]+[Left] to move through the pilot records.<br />
                        Click or use [Ctrl]+[S] to Save, [Ctrl]+[C] to Cancel.
                    </p>
                    <hr />
                </div>
                <div>
                    <br />
                    <asp:Image ID="Image2" runat="server" Width="60%" ImageAlign="Right" ImageUrl="~/ImgScore/ScoreF5K2024.jpg" />
                    <p><b>F5K2024 Data entry form</b></p>
                    <p><b>To open the Scoring_F5K2024DataEntry form</b>, start by opening the 'Score Entry' form shown above. Then ...</p>
                    <ul>
                        <li>Click on any row to open the F5K2024DataEntry form for that pilot, or</li>
                        <li>Navigate to the pilot's row and press the 'Enter' key.</li>
                    </ul>
                    <p>
                        Once in the F5KDataEntry form, navigate to any pilot's score data by using the Next and Previous buttons or<br />
                        use [Ctrl]+[Right] and [Ctrl]+[Left] to move through the pilot records.<br />
                        Click or use [Ctrl]+[S] to Save, [Ctrl]+[C] to Cancel.<br />
                        <br />
                        Click in the 'Out of Pilot Area' and 'Overfly Window' columns to change the value.<br />
                        Clicking toggles between zero and the applicable penalty number.
                    </p>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
