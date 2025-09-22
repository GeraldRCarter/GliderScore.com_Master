<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        If varID = "DisplayBudniak" Then
            Dim TabCont1 As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim TabPnl1 As AjaxControlToolkit.TabPanel = TabCont1.FindControl("DigitalTimer")
            TabCont1.ActiveTab = TabPnl1
            Dim TabCont2 As AjaxControlToolkit.TabContainer = TabPnl1.FindControl("DigitalTimerTabContainer")
            Dim TabPnl2 As AjaxControlToolkit.TabPanel = TabCont2.FindControl("DisplayPanels")
            TabCont2.ActiveTab = TabPnl2
        End If

        If varID = "DisplayPanels" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DigitalTimerContainer, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("DisplayPanels")
            container.ActiveTab = Pnl
        End If

        If varID = "DisplayBuild" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DigitalTimerTabContainer, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("DisplayBuild")
            container.ActiveTab = Pnl
        End If

        If varID = "DigitalTimer" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("DigitalTimer")
            container.ActiveTab = Pnl
        End If

        If varID = "TimerNextGroup" Then
            Dim TabCont1 As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim TabPnl1 As AjaxControlToolkit.TabPanel = TabCont1.FindControl("DigitalTimer")
            TabCont1.ActiveTab = TabPnl1
            Dim TabCont2 As AjaxControlToolkit.TabContainer = TabPnl1.FindControl("DigitalTimerTabContainer")
            Dim TabPnl2 As AjaxControlToolkit.TabPanel = TabCont2.FindControl("pnlDTCreatePlaylist")
            TabCont2.ActiveTab = TabPnl2
            Dim TabCont3 As AjaxControlToolkit.TabContainer = TabPnl2.FindControl("FileMaintenance")
            Dim TabPnl3 As AjaxControlToolkit.TabPanel = TabCont3.FindControl("DT_MergePlaylists")
            TabCont3.ActiveTab = TabPnl3
            Exit Sub
        End If



        If varID = "DT_MergePlaylists" Then
            Dim TabCont1 As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim TabPnl1 As AjaxControlToolkit.TabPanel = TabCont1.FindControl("DigitalTimer")
            TabCont1.ActiveTab = TabPnl1
            Dim TabCont2 As AjaxControlToolkit.TabContainer = TabPnl1.FindControl("DigitalTimerTabContainer")
            Dim TabPnl2 As AjaxControlToolkit.TabPanel = TabCont2.FindControl("pnlDTCreatePlaylist")
            TabCont2.ActiveTab = TabPnl2
            Dim TabCont3 As AjaxControlToolkit.TabContainer = TabPnl2.FindControl("FileMaintenance")
            Dim TabPnl3 As AjaxControlToolkit.TabPanel = TabCont3.FindControl("DT_MergePlaylists")
            TabCont3.ActiveTab = TabPnl3
            Exit Sub
        End If

        If varID = "AP_MergePlaylists" Then
            Dim TabCont1 As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim TabPnl1 As AjaxControlToolkit.TabPanel = TabCont1.FindControl("AudioPlayer")
            TabCont1.ActiveTab = TabPnl1
            Dim TabCont2 As AjaxControlToolkit.TabContainer = TabPnl1.FindControl("AP_TabContainer1")
            Dim TabPnl2 As AjaxControlToolkit.TabPanel = TabCont2.FindControl("AP_MergePlaylists")
            TabCont2.ActiveTab = TabPnl2
            Exit Sub
        End If



        If varID = "AudioPlayer" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("AudioPlayer")
            container.ActiveTab = Pnl
        End If

        If varID = "BigTimer" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(Audio, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("TabPanelBigTimer")
            container.ActiveTab = Pnl
        End If

        If varID = "OpenTimer" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DigitalTimerTabContainer, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("TabPanelOpenTimer")
            container.ActiveTab = Pnl
        End If

    End Sub
</script>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="Audio" runat="server">
        <asp:TabPanel runat="server" ID="DigitalTimer" HeaderText="Digital Timer">
            <ContentTemplate>
                <asp:TabContainer ID="DigitalTimerTabContainer" runat="server">
                    <asp:TabPanel runat="server" ID="TabPanel20" HeaderText="Introduction">
                        <ContentTemplate>

                            <img id="Img29" src="~/ImgAudio/DigitalTimer.jpg" runat="server" align="right" style="width: 59%; margin-right: 12px;" alt="" />
                            <img id="Img15" src="~/ImgAudio/DigitalTimerDisplayPanel.jpg" runat="server" style="float: right; width: 38%; margin-left: 4px; margin-right: 4px;" alt="" />

                            <h5>Digital Timer - Introduction</h5>
                            <p>
                                GliderScore DigitalTimer is a companion to Gliderscore.<br />
                            </p>
                            <p>The program</p>
                            <ul>
                                <li>Makes all audio announcements, including timer announcements</li>
                                <li>Runs a very accurate timer and displays the time on screen</li>
                                <li>Optionally outputs the time to a digital clock display panel (AerobTec LED panel shown)</li>
                                <li>No need for pre-recorded 'timing' .mp3 files</li>
                            </ul>
<%--                            <p>
                                <b>The progam can be run from the command prompt.<br />
                                    See the end of this page for details.</b>
                            </p>--%>
                            <p>Running the Digital Timer</p>
                            <ul>
                               <li> Create the Playlist using Gliderscore.<br />
                                   See 'Create Playlist' tab for details.</li>
                                <li>Open the DigitalTimer program (from within Gliderscore).</li>
                                <li>If using a display panel and it does not work with the Digital Timer program, contact me to resolve the issue.</li>
                            </ul>
                            &nbsp
                            <p>
                                <b>When using the DigitalTimer</b><br />
                                <ul>
                                    <li><b>Set your computer to stay awake</b>. If it goes to 'sleep', so will the DigitalTimer.</li>
                                    <li>Disable any anti-virus program from running.<br />
                                        McAfee Anti-Virus has been shown to intermittently interrupt the DigitalTimer.<br />
                                        Other anti-virus programs may well do the same. Avast seems to be OK.
                                    </li>

                                </ul>

                            </p>
                            <p>
                                Watch this <a href="http://youtu.be/GWRAQHxCdok">video</a> to see the program being used at a competition in Holland, or<br />
                                this earlier <a href="http://youtu.be/NtEWH460Bqw">video</a> made in a workshop including the use of a one minute landing window.<br />
                                Videos courtesy of Arjan Harmans.
                            </p>

                            <p>
                                The DigitalTimer program can be used with or without a display panel.<br />
                                Don't have a display panel? Click on the 'Display Panels' and 'Display Panel Build' tabs.
                            </p>

                            <%--<p>The timer will continue running while you go back to GliderScore to enter scores, or just go flying.</p>--%>
                            <p>
                                The first step is to create the Playlist.<br />
                                Click on the 'Create Playlist' tab to learn more.
                            </p>
<%--                            <p>
                                <b>Run DigitalTimer from the command prompt.</b><br />
                                <br />
                                You can supply one or two arguments.<br />
                                1. the path to the Audio files and/or<br />
                                2. the path to the file 'Translations.lng'. If this argument is not present the UI will be in English.<br />
                                <br />
                                Examples<br />
                                >D:\gliderscoredigitaltimer.exe c:\gliderscore6\audio<br />
                                >D:\gliderscoredigitaltimer.exe c:\gliderscore6\audio c:\gliderscore6<br />
                                <br />
                                Note that the file 'Translations.lng' is generated when running GliderScoreDigitalTimer.exe from<br />
                                within GliderScore. It is not deleted on exiting so, once created, it will be there for use<br />
                                by GliderScoreDigitalTimer.exe from the command prompt.

                            </p>--%>


                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="pnlDTCreatePlaylist" HeaderText="Create Playlist">
                        <ContentTemplate>
                            <asp:TabContainer runat="server" ID="FileMaintenance">
                                <asp:TabPanel runat="server" ID="TabPanel23" HeaderText="General">
                                    <ContentTemplate>
                                        <img id="Img13" src="~/ImgAudio/DigitalTimerGeneral.jpg" runat="server" align="right" style="width: 60%; margin-left: 4px; margin-right: 20px" alt="" />
                                        <h5>Digital Timer - Create Playlist - General</h5>

                                        <p>
                                            Clicking on 'Digital Timer' from the competition setup screen will bring up this screen.<br />
                                            <br />
                                            There are four sections.
                                        </p>
                                        <ul>
                                            <li>File Maintenance - gives you complete control over your Timers and related files</li>
                                            <li>Playlist Settings - allows you to customise your playlist</li>
                                            <li>Create Playlist/Open Timer - creates the Playlist that the Timer will use, and opens the Timer</li>
                                            <li>Merge Playlists - about merging playlists from two (or more) separate competitions.</li>
                                        </ul>
                                        <p>
                                            Take the time to look through the information about<br />
                                            File Maintenance and Playlist Settings now.
                                        </p>

                                    </ContentTemplate>
                                </asp:TabPanel>


                                <asp:TabPanel runat="server" ID="TabPanel24" HeaderText="File Maintenance">
                                    <ContentTemplate>
                                        <asp:TabContainer runat="server" ID="DigitalTimerContainer">
                                            <asp:TabPanel runat="server" ID="TabPanel26" HeaderText="General">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance - General</h5>
                                                    <div>
                                                        <img id="Img30" src="~/ImgAudio/DigitalFileMaintenance.jpg" runat="server" style="float: left; width: 95%; margin-bottom: 10px;" alt="" />
                                                    </div>

                                                    <p>
                                                        There are a number of files needed for the Digital Timer.
                                                    </p>
                                                    <ul>
                                                        <li>Announcements - audio recordings of announcements to be made while the timer is running</li>
                                                        <li>Timers - you control how each timer will run including when announcements and sounds (beeps) should play</li>
                                                        <li>F3K Task Files - recordings describing each F3K task (can be included in the playlist)</li>
                                                        <li>Pilot Name Files - recordings of each pilot name for pilot name announcements</li>
                                                        <li>Round, Group, ReFlight Files - recordings of round, group and reflight numbers</li>
                                                    </ul>
                                                    <p>
                                                        A special set of Announcement files has been put together to work with GliderScore.<br />
                                                        <b>These are all included with the full download and with upgrades to version 6.45.</b>
                                                    </p>

                                                    <p>
                                                        There is little need to re-visit any of these files once your timers are set up.<br />
                                                        <b>A preliminary set of Timers is included with the full download and with upgrades to version 6.45.</b><br />
                                                        See the following tabs for more details. 
                                                    </p>
                                                </ContentTemplate>
                                            </asp:TabPanel>

                                            <asp:TabPanel runat="server" ID="TabPanel28" HeaderText="Timers">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance - Timers</h5>
                                                    <img id="Img14" src="~/ImgAudio/DigitalTimerMaintenance.jpg" runat="server" style="float: right; width: 70%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />

                                                    <p>
                                                        This is where you decide everything about your timers.<br />
                                                        Timers can be added, deleted or copied.<br />
                                                        Export or Import timers (file extension '.timer').<br />
                                                        If creating a new timer, <b>it is highly recommended that you start by copying an existing timer</b>.
                                                    </p>
                                                    <p>
                                                        As the 'Timer Time' increases, the clock counts <b>down</b> from the 'Displayed Time'.
                                                          <br />
                                                        <br />
                                                        The 'Displayed Time' is always positive.<br />
                                                        <br />
                                                        The difference in seconds between any two consecutive 'Timer Times' will typically be exactly
                                           the same as the difference in seconds between the two 'Displayed Times'. 
                                                    </p>
                                                    <p>For each timer event, set the following</p>
                                                    <ul>
                                                        <li><b>Timer Time</b> - the time, in seconds, at which an announcement or a beep should happen. 
                                                              Negative values generally indicate preparation time. Positive values indicate working time and/or landing time.</li>
                                                        <li><b>Displayed Time</b> - the time to be displayed (at the Timer Time) on the screen and/or an external display.<br />
                                                            Examples: Enter 100 for 1:00, enter 500 for 5:00, enter 5 for 00:05.</li>
                                                        <li><b>Timer State</b> - indicates the timer's progress through these states -<br />
                                                            PT=preparation time; TT=testing time; NF=no-flying allowed; WT=working time;LT=landing time.</li>
                                                        <li><b>On New Round</b> - if ticked, the timer event will only happen when there is a change in round number.<br />
                                                            This does not apply to the first round in the playlist. Use this to extend the preparation time<br />
                                                            between rounds.
                                                        </li>
                                                        <li><b>Announcement</b> - a note of what the announcement, if any is to be. May be left blank.</li>
                                                        <li><b>Announcement File Name</b> - a file from 'Digital Timer Announcements' that is to be played at this time.<br />
                                                            You can type in the file name or browse to it using the 'Browse' button.</li>
                                                        <li><b>Beep Frequency</b> - If a sound is to be played, this is the frequency in hertz.</li>
                                                        <li><b>Beep Duration</b> - If a sound is to be played, this is the duration in milliseconds (1000ms = 1s).</li>
                                                    </ul>
                                                    <p>You cannot have beeps and announcements at the same time.</p>
                                                    <p>
                                                        You can introduce silence by adding a Timer event before any announcement.<br />
                                                        For example, putting a Timer event at -310 with a 'Displayed' Time of 5:10 (or even 0:00) will give 10 seconds silence before a '5 minutes' warning.
                                                    </p>
                                                    <div>
                                                        <img id="Img27" src="~/ImgAudio/DigitalTimerPrepTime.jpg" runat="server" style="float: right; width: 70%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />
                                                        <p>
                                                            <b>Negative Timer Times indicate Preparation time, Testing time or No-Fly time.</b><br />
                                                            The computer clock digits will be orange.
                                                        </p>
                                                    </div>
                                                    <div>
                                                        <img id="Img28" src="~/ImgAudio/DigitalTimerLandingTime.jpg" runat="server" style="float: right; width: 70%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />
                                                        <p>
                                                            <b>Positive Timer Times indicate Working Time and/or Landing Time.</b><br />
                                                            The computer clock digits will be green.<br />
                                                            <br />
                                                            <br />
                                                            If, during working time, the Displayed time increases (in this case from 00:01 to 00:30), this becomes landing time. The computer clock digits will be blue.
                                           

                                                        </p>
                                                    </div>


                                                </ContentTemplate>
                                            </asp:TabPanel>

                                            <asp:TabPanel runat="server" ID="TabPanel27" HeaderText="Announcements">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>Announcements</h5>
                                                    <img id="Img31" src="~/ImgAudio/DigitalAudioAnnouncements.jpg" runat="server" style="float: right; width: 70%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />
                                                    <p>
                                                        These are recordings of all possible announcements during the running of the timer.<br />
                                                        For example, "5 minutes to start", "4 minutes to start", ... "2 minutes remaining", 1 minute remaining".<br />
                                                        When creating or maintaining a timer, you choose what audio file (or beep) to play and at what time.<br />
                                                        <br />
                                                        You can replace the recordings provided with your own recordings. The file types allowed are .wav and .mp3.<br />
                                                        Recordings can be made
                                                    </p>
                                                    <ul>
                                                        <li>externally to GliderScore, copied into the Audio folder and then chosen using the Browse button</li>
                                                        <li>within GliderScore by clicking on the microphone icon and using a microphone</li>
                                                        <li>generated by GliderScore by clicking on the 'Phonetic to File' button (uses the text in the 'Phonetic column'</li>
                                                    </ul>
                                                    <p>Many of the announcement files supplied with GliderScore have come from the F3JTimer package.</p>

                                                </ContentTemplate>
                                            </asp:TabPanel>

                                            <asp:TabPanel runat="server" ID="TabPanel29" HeaderText="F3K Tasks">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>F3K Task Announcements</h5>
                                                    <p>
                                                        F3K Task announcement files can be generated by the program or recorded by the user.<br />
                                                        <br />
                                                        GliderScore automatically generates them for you when you first activate the Digital Timer or Audio Player.<br />
                                                        <br />

                                                        Suitable files are also available for download from the
                                        <asp:HyperLink ID="HyperLink16"
                                            NavigateUrl="http://olgol.com/F3KScore"
                                            Text="F3KScore"
                                            Target="_blank"
                                            runat="server" />
                                                        website and perhaps other websites.
                                        <br />
                                                        <p><b>Options for creating/enabling sound files.</b></p>
                                                        <ul>
                                                            <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                                The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                                            <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                                            <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                                See the 'Record Audio' tab for more details.
                                                            </li>
                                                        </ul>

                                                        <div>
                                                            <img id="Img19" src="~/ImgAudio/AudioPlayerFileMaintenanceF3KTasks.jpg" runat="server" style="float: right; width: 97%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />

                                                        </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="TabPanel10" HeaderText="F5K Tasks">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>F5K Task Announcements</h5>
                                                    <p>
                                                        F5K Task announcement files can be generated by the program or recorded by the user.<br />
                                                        <br />
                                                        GliderScore automatically generates them for you when you first activate the Digital Timer or Audio Player.<br />
                                                        <br />

                                                        <p><b>Options for creating/enabling sound files.</b></p>
                                                        <ul>
                                                            <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                                The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                                            <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                                            <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                                See the 'Record Audio' tab for more details.
                                                            </li>
                                                        </ul>

                                                        <div>
                                                            <img id="Img46" src="~/ImgAudio/AudioPlayerFileMaintenanceF5KTasks.jpg" runat="server" style="float: right; width: 97%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />

                                                        </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="DT_CreatePlaylist" HeaderText="Pilot Names">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>Pilot Name Announcements</h5>
                                                    <p>
                                                        Pilot name announcement files can be generated by the program or recorded by the user.<br />
                                                        <br />
                                                        GliderScore automatically generates pilot name audio for you when you first activate the Digital Timer or Audio Player.<br />
                                                        <br />

                                                    </p>
                                                    <p>
                                                        Using the selections available for pilot name (Multi-Row - Create Audio Settings)<br />
                                                        it is possible to select one or a number of pilots and generate files based on your selection.<br />
                                                        Click on the 'Create Audio for Selected Pilot/s' button.
                                                    </p>
                                                    <p><b>Options for 'speaking' the pilot name.</b></p>

                                                    <ul>
                                                        <li>LastName; FirstName</li>
                                                        <li>FirstName LastName</li>
                                                        <li>Phonetic</li>
                                                    </ul>
                                                    <p><b>Options for creating/enabling sound files.</b></p>
                                                    <ul>
                                                        <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                            The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                                        <li>Select one of the Name format options in the 'Multi-Row - Create Audio Settings' list.<br />
                                                            Select a pilot or pilots.<br />
                                                            Click 'Create Audio for Selected Pilot/s'. New audio is created for all selected pilots.
                                                        </li>
                                                        <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                                        <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                            See the 'Record Audio' tab for more details.
                                                        </li>
                                                    </ul>
                                                    <div>
                                                        <img id="Img20" src="~/ImgAudio/AudioPlayerFileMaintenancePilots.jpg" runat="server" style="float: right; width: 97%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />

                                                    </div>

                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="TabPanel31" HeaderText="Rounds/Groups">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>Round, Group and ReFlight Announcements</h5>
                                                    <p>
                                                        GliderScore automatically generates these for you when you first activate the Digital Timer or Audio Player.<br />
                                                        <br />
                                                    </p>
                                                    <p>
                                                        These are the announcement files for Round, Group and ReFlight numbers.<br />
                                                        ReFlight announcements are left out of the playlist if the ReFlight number is 0 (zero).
                                                    </p>
                                                    <p><b>Options for creating/enabling sound files.</b></p>
                                                    <ul>
                                                        <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                            The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                                        <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                                        <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                            See the 'Record Audio' tab for more details.
                                                        </li>
                                                    </ul>
                                                    <div>
                                                        <img id="Img21" src="~/ImgAudio/AudioPlayerFileMaintenanceRounds.jpg" runat="server" style="float: right; width: 97%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                            <asp:TabPanel runat="server" ID="TabPanel32" HeaderText="Record Audio">
                                                <ContentTemplate>
                                                    <h5>Digital Timer - Create Playlist - File Maintenance</h5>
                                                    <h5>Record Audio</h5>
                                                    <div>
                                                        <p>To record audio, click on the icon that you see in the File Maintenance screens.</p>
                                                        <img id="Img24" src="~/ImgAudio/AudioPlayerGoToRecordAudio.jpg" runat="server" style="float: right; width: 97%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />
                                                    </div>
                                                    <div>
                                                        <p>To successfully record audio, do the following - </p>
                                                        <ul>
                                                            <li>Make sure that your microphone is working.</li>
                                                            <li>and click on the 'Start Recording' button.</li>
                                                            <li>When finished speaking click on the 'Stop Recording' button.</li>
                                                            <li>Click on 'Playback' to listen to your recording.</li>
                                                            <li>Click on 'Save to File' to save the recording to the file named above.</li>
                                                        </ul>
                                                        <img id="Img25" src="~/ImgAudio/AudioPlayerRecordAudio.jpg" runat="server" style="float: right; width: 70%; margin-left: 4px; margin-right: 30px; margin-bottom: 10px;" alt="" />

                                                    </div>
                                                </ContentTemplate>
                                            </asp:TabPanel>
                                        </asp:TabContainer>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="TabPanel25" HeaderText="Playlist Settings">
                                    <ContentTemplate>
                                        <h5>Digital Timer - Create Playlist - Playlist Settings</h5>

                                        <div>
                                            <p>
                                                You can configure and save up to eight playlist Profiles. Be sure to give each Profile a meaningful name.<br />
                                                Each profile must be specific to a particular task.<br />
                                                Tasks available are Duration, Distance, Speed, F3K and F5K.
                                            </p>
                                            <p>Select the Profile that is appropriate for your competition.</p>

                                            </p>
                                              <h5>Playlist Settings</h5>
                                            <p>(for F3K and F5K, see Playlist Settings below)</p>
                                            <br />
                                            <img id="Img16" src="~/ImgAudio/DigitalPlaylistSettingsNonF3K.jpg" runat="server" style="float: right; width: 97%; margin-right: 22px; margin-bottom: 4px;" alt="" />
                                            <p>These selections control how your playlist is put together.</p>
                                            <ul>
                                                <li>Profile name - give your Profile a meaningful name</li>
                                                <li>Profile for task - select the type of task for which this Profile will be used</li>
                                                <li>Timer file - select the Timer file to use</li>
                                                <li>Pilot name audio - select pilot name audio option (None; Play; Play twice)</li>
                                                <li>Announcements - Timing<br />
                                                    &nbsp&nbsp&nbsp You can choose to have announcements for the current round played either<br />
                                                    before the timer starts for preparation time or after preparation time has started.<br />
                                                    If you choose the latter, the announcements will start 5 seconds into preparation time.<br />
                                                    &nbsp&nbsp&nbsp You can choose to make announcements for the NEXT group during working time by making a timing selection.<br />
                                                    Choices are 2:50, 3:50, 4:50, 2:50 X 2, 3:50 X 2 , 4:50 X 2 from the end of working time.<br />
                                                    The 'X 2' options will play the round, group and name files twice.<br />
                                                    If NOT announcing pilots for the next group during working time, select 'None' from the drop down box.</li>
                                                <li>Announcements - Selections<br />
                                                    Introduction - Choose an introduction audio file. It might announce "Next group, please go to the ready box".<br />
                                                    Clear all text from the box to cancel any introduction.<br />
                                                    Choose to play round and group audio.<br />
                                                    Choose to play pilot names.
                                                </li>
                                            </ul>

                                            <br />
                                            <h5>F3K and F5K Playlist Settings</h5>
                                            <br />
                                            <img id="Img22" src="~/ImgAudio/DigitalPlaylistSettingsF3K.jpg" runat="server" style="float: right; width: 97%; margin-right: 22px; margin-bottom: 4px;" alt="" />
                                            <p>These selections control how your playlist is put together.</p>
                                            <p>F3K and F5K have the same playlist settings.</p>
                                            <ul>
                                                <li>Profile name - give your Profile a meaningful name</li>
                                                <li>Profile for task - select F3K (or F5K) as the task for which this Profile will be used</li>
                                                <li>Announcements - Timing<br />
                                                    &nbsp&nbsp&nbsp You can choose to have announcements for the current round played either<br />
                                                    before the timer starts for preparation time or after preparation time has started.<br />
                                                    If you choose the latter, the announcements will start 5 seconds into preparation time.<br />
                                                    &nbsp&nbsp&nbsp You can choose to make announcements for the NEXT group during working time by making a timing selection.<br />
                                                    To make announcements for the next group during working time, make a timing selection.<br />
                                                    Choices are 2:50 or 2:50 X 2 from the end of working time.<br />
                                                    The '2:50 X 2' option will play the round, group and name files twice.<br />
                                                    If NOT announcing pilots for the next group during working time, select 'None' from the drop down box.</li>
                                                <li>Announcements - Selections<br />
                                                    Introduction - Choose an introduction audio file. It might announce "Next group, please go to the ready box".<br />
                                                    Clear all text from the box to cancel any introduction.<br />
                                                    Choose to play round and group audio.<br />
                                                    Choose to play pilot names.<br />
                                                    Choose to play F3K (or F5K) task descriptions.
                                                </li>
                                            </ul>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel9" HeaderText="Create Playlist/Open Timer">
                                    <ContentTemplate>
                                        <h5>Digital Timer - Create Playlist/Open Timer</h5>

                                        <div>
                                            <p>
                                                <b>SELECT FLIGHT GROUP</b><br />
                                                Select the flight group (Round; Group; ReFlight) where you want the playlist to start.
                                            </p>
                                            <p>
                                                <b>RETIRE / UNRETIRE PILOTS</b><br />
                                                If pilots have retired, or rejoined the competition, click on 'Retire / UnRetire Pilots' button to mark these pilots.<br />
                                                Retired pilots are excluded from the playlist.<br />
                                                Pilots retired (or unretired) here are also marked in the 'Pilot Entry' screen.
                                            </p>
                                            <p>
                                                <b>CREATE PLAYLIST</b><br />
                                                Click on 'Create Playlist' to generate the playlist file.<br />
                                                Review the playlist shown at the bottom of the screen.<br />
                                                The playlist file is called '~\Audio\GliderScoreDigitalPlaylist.m3u'.
                                            </p>

                                            <p>
                                                <b>OPEN TIMER</b><br />
                                                Click on 'Open Timer' to open the Digital Timer program and then start the playlist playing.
                                            </p>
                                        </div>
                                        <div>
                                            <img id="Img23" src="~/ImgAudio/DigitalOpenTimer.jpg" runat="server" style="float: left; width: 97%" alt="" />
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <asp:TabPanel runat="server" ID="DT_MergePlaylists" HeaderText="Merge Playlists">
                                    <ContentTemplate>
                                        <h5>Digital Timer - Merge Playlists</h5>

                                        <div>
                                            <p>
                                                It is possible to merge the playlists from two (or more) competitions to create a single continuous playlist.<br />
                                                The trigger to access this feature is that all competitions involved have the same competition date.<br />
                                                A typical use case is where separate competitions are being run for Seniors and Juniors or F3K and F5K.<br />
                                                <br />
                                                The system automatically generates audio files to 'speak' the name of each competition.<br />
                                                These audio files are named Competition1.wav, Competition2.wav, ... and are created in the Audio sub-folder.<br />
                                                If the computer generated files to not correctly 'say' the competition names, replace them with locally produced files.<br />
                                                These competition name files are inserted in the playlist ahead of the round and group announcements.<br />
                                                <br />

                                                The merge process works round by round.<br />
                                                In each round the playlist for the first competition is followed by the playlist of the second competition.<br />
                                                The sequence will look something like this:<br>
                                                Round 1<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 1<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 2<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 3<br />
                                                &nbsp&nbsp&nbsp Competition 2 Round 1 Group 1<br />
                                                &nbsp&nbsp&nbsp Competition 2 Round 1 Group 2<br />
                                                Round 2<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 1<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 2<br />
                                                &nbsp&nbsp&nbsp Competition 1 Round 1 Group 3<br />
                                                &nbsp&nbsp&nbsp Competition 2 Round 1 Group 1<br />
                                                &nbsp&nbsp&nbsp Competition 2 Round 1 Group 2<br />
                                                <br />
                                                To begin, create a playlist for the <u>first competition</u> to fly.<br />
                                                Open the <u>next competition</u>.<br />
                                                Click to create a playlist in the usual way.<br />
                                            </p>
                                            <%--                                                <img id="Img42" src="~/ImgAudio/MergePlaylistQuestion.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />--%>
                                            <img id="Img49" src="~/ImgAudio/MergePlaylistSelectOption.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />
                                            <p>
                                                You will see the 'Merge Playlists' screen because the two competitions have the same date.
                                            </p>


                                            <p>
                                                Choose <u>CREATE</u> to create a playlist for just the current competition or <u>MERGE</u> to merge the playlists together.<br />
                                                In this case choose <u>MERGE</u>.<br />
                                                Click Continue to generate the merged playlist (or Cancel to abandon the operation).<br />
                                                <br />
                                                Repeat the process for as many competitions as required.<br />
                                                Click on the 'Open Timer' button within any of the merged playlist competitions to play the merged playlist.<br />
                                                <br />
                                                If the competitions run perfectly smoothly then there is no more to do.<br />
                                            </p>
                                        </div>

                                        <div>
                                            <hr />

                                            <%--                                                <img id="Img43" src="~/ImgAudio/MergePlaylistSelectComp.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />--%>
                                            <img id="Img42" src="~/ImgAudio/MergePlaylistEditGroup1.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />


                                            <p>
                                                Sometimes things do not work out perfectly.<br />
                                                Changes have to be made.<br />
                                                <br />
                                                For example, the Seniors competition might end the day without completing the round in progress.<br />
                                                The next day you want to start with the unfinished seniors round and then move back to the juniors.<br />
                                                This is how to do it.
                                            </p>
                                            <ul>
                                                <li>Open the seniors competition and go to 'Create Playlist'.</li>
                                                <li>Select the CREATE option (because we now want the seniors to start the next day).</li>
                                                <li>Edit the FromRound (4) and FromGroup (3) numbers. </li>
                                                <li>Click on 'Continue'. </li>
                                                <li>The playlist starting at round 4 group 3 is created.</li>
                                            </ul>
                                        </div>
                                        <div>
                                            <img id="Img43" src="~/ImgAudio/MergePlaylistEditGroup2.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />
                                            <p>
                                                Next, go to the juniors competition.
                                            </p>
                                            <ul>
                                                <li>Open the juniors competition and go to 'Create Playlist'.</li>
                                                <li>The juniors had completed round 4 so they will start at round 5.</li>
                                                <li>Select the MERGE option and edit the FromRound for juniors to 5.</li>
                                                <li>Click on 'Continue'. The merged playlist is created.</li>
                                            </ul>
                                            <br />
                                            <p>Click on 'Open Timer' to play the merged playlist.</p>
                                            <p>
                                                <b>It is important to know that the FromRound, FromGroup and FromReFlight fields can all be edited if they are not greyed out.</b>
                                            </p>
                                        </div>

                                        <%--                                        <div>
                                            <hr />
                                            <img id="Img51" src="~/ImgAudio/MergePlaylistEditGroup3.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />
                                            <p>Here is an easier way to achieve the same thing.<br />
                                            </p>
                                                <ul>
                                                    <li>Open either competition, open the Digital Timer/Audio Player screen and click on 'Create Playlist'.</li>
                                                    <li>In the screen that appears select 'UPDATE'.</li>
                                                    <li>Now edit the values in the FromRound, FromGroup and FromReFlight columns.</li>
                                                    <li>Click on 'Continue'.</li>
                                                                                                </ul>

                                        </div>--%>
                                    </ContentTemplate>
                                </asp:TabPanel>

                            </asp:TabContainer>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="TabPanelOpenTimer" HeaderText="Open Timer">
                        <ContentTemplate>
                            <div>
                                <img id="Img18" src="~/ImgAudio/DigitalTimer.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" alt="" />
                                <h5>Digital Timer - Open Timer</h5>
                                <p>
                                    <b>Digital Timer</b><br />
                                    This screen appears when you click on 'Open Timer' within GliderScore.<br />
                                    When you click on 'Start' audio output goes to the audio port of your computer.<br />
                                    Also, if selected, output will be sent to your computer's COM ports (via USB adapters).
                                </p>
                            </div>
                            &nbsp<br />
                            <hr />

                            <div>
                                <img id="Img56" src="~/ImgAudio/DigitalTimer_StartNextGroup.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" alt="" />
                                <p>
                                    <b>Digital Timer - Start Next Group</b><br />
                                    After clicking on 'Start' the screen changes and reveals the 'Start Next Group' button (coloured red)<br />
                                    Click the 'Start Next Group' button to immediately start the Timer at the start of the next flight group.<br />
                                    There are no warnings or second chances with this button.<br />
                                    Be careful.
                                </p>
                            </div>
                            &nbsp<br />
                            <hr />







                            <div>
                                <img id="Img55" src="~/ImgAudio/ScheduledStartTime.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" alt="" />
                                <h5>Scheduled Start Time</h5>
                                <p>
                                    <b>Scheduled Start</b><br />
                                    Right-clicking the Start button opens the Scheduled Start Time screen.<br />
                                    Set the Scheduled Start Time (the time at which the Timer will start).<br />
                                    Optionally, elect to upload files to the cloud that are needed by GliderTimer devices.<br />
                                    Click the Start Countdown button.<br />
                                    This window will close and the Timer will start when the countdown reaches zero.<br />
                                </p>
                            </div>
                            &nbsp<br />
                            <hr />
                            <div>
                                <img id="Img47" src="~/ImgAudio/USB_Hub.jpg" runat="server" style="float: right; width: 30%; margin-top: 3px; margin-left: 4px; margin-right: 16px;" alt="" />
                                <p>
                                    <b>Serial (COM) Port Settings</b> (for external devices)<br />
                                    From Version 1.10 the Digital Timer can output to two separate COM ports.<br />
                                    These are labelled USB1 and USB2.<br />
                                    This allows separate settings to drive your display panel and your Pandora devices.<br />
                                    For example:<br />
                                    &nbsp&nbsp&nbsp USB1 with 'Extended Protocol' to drive an Embedded-Ability display.<br />
                                    &nbsp&nbsp&nbsp USB2 with 'Extended+Pandora' to drive the Pandora devices.<br />
                                    Typically COM ports are made available by means of a USB to Serial port adapter.<br />
                                    <br />
                                    If you only have one USB port available you will need to use a USB hub like this one.<br />
                                </p>
                            </div>&nbsp<br />
                            <hr />
                            <div>
                                
                                <img id="Img53" src="~/ImgAudio/DigitalTimerSelectPorts.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" alt="" />
                                <p>
                                    DigitalTimer scans for connected devices as soon as the program is started.<br />
                                    Plug in all devices before starting the DigitalTimer.<br />
                                    To select your USB devices, hover the mouse over the DeviceID area.<br />
                                    A list will appear like the one shown. Click on your selection.<br />
                                    Click on 'None' to clear your selection. This does not clear the other port settings (Baud rate etc.).<br />
                                    To close the list, move the mouse away from the list.
                                </p>
                                
                            </div>&nbsp<br />
                            <hr />
                            <div>
                                <img id="Img54" src="~/ImgAudio/CP210xSerialNumberChange.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px;" alt="" />
                                <p>
                                    <b>If using two Silicon Labs devices.</b><br />
                                    Silicon Labs gives all CP210x chips the same serial number, 0001.<br />
                                    You will notice that 0001 is the last part of the DeviceID.<br />
                                    <br />
                                    If you have two devices using the Silicon Labs chips<br />
                                    - the first device plugged in will have 0001 as the serial number.<br />
                                    - the second device will have a different serial number (allocated by Windows).<br />
                                    <br />
                                    It is recommended to change the serial number on one of the devices to '0002'.<br />
                                    This avoids Windows having to allocate a (temporary) serial number.<br /><br />
                                    You can change the serial number on your devices using a Silicon Labs program called CP210xSetIDs.exe.<br />
                                    Get the program from Silicon Labs website or download it <a href="/zipfile/CP210x_LegacyUtilities.zip">here</a>.<br />
                                    The download file is CP210x_LegacyUtilities.zip and includes a number of utility programs.
                                </p>

                            </div>
                            &nbsp<br />
                            <hr />

                            <p>
                                <b>Output Format</b><br />
                                If using an external display, select the Output Format that is specific to your display.<br />
                                You can use a different Output Format for Pandora devices if required.<br />
                                You can use one Port for the display and the other for the Pandora devices.
                            </p>
                            <p>The currently supported formats are</p>
                            <ul>
                                <li><b>mmss \r</b> (the minutes digits, the seconds digits, the Ascii character for Carriage Return)</li>
                                <li><b>Ammss \r</b> (the letter A, the minutes digits, the seconds digits, the Ascii character for Carriage Return)<br />
                                    Both Aerobtec and Embedded-Ability displays work with this setting, but round and group numbers will not display.</li>
                                <li><b>Aerobtec</b> for Aerobtec displays.<br />
                                    This format displays round and group numbers during name announcements.</li>
                                <li><b>Embedded-Ability</b> for Embedded-Ability displays.<br />
                                    This format displays round and group numbers during name announcements.</li>
                                <li><b>Extended Protocol</b> for displays programmed to show round, group and time data.<br />
                                    <b>This format has been created for a pilot who plans to share information about his display before December 2018.</b><br />
                                    <img id="Img40" src="~/ImgAudio/6DigitDisplay.jpg" runat="server" style="float: right; width: 30%; margin-right: 16px" alt="" />
                                    The output format is R99G99T9999+AA+CR<br />
                                    R99 - 99 is replaced by the round number<br />
                                    G99 - 99 is replaced by the group number<br />
                                    T9999 - 9999 is replaced by two characters for minutes and two characters for seconds<br />
                                    AA - two character code for the timer state (PT prep time; WT working time: LT landing time; ST sleep time; DT display time-of-day)<br />
                                    This allows for the possibility of changing the display colour according to the timer state.<br />
                                    CR is the ascii character for Carriage Return.<br />
                                    A typical output string could be <b>R09G01T0652WT+CR</b><br />
                                </li>
                                <li><b>Extended+Pandora</b> to drive Pandora devices.<br />
                                    <img id="Img48" src="~/ImgAudio/PandoraDisplay.jpg" runat="server" style="float: right; width: 30%; margin-top: 3px; margin-left: 4px; margin-right: 16px;" alt="" />
                                    With this output format two separate signals are sent with a 100ms delay between them.<br />
                                    The first signal is exactly the same as the 'Extended Protocol' timing signal as above.<br />
                                    100ms later a signal is sent that gives extra information for F3K/F5K pilots.<br />
                                    The Pandora devices display this information provided that they have the latest updated software.<br />
                                    The information sent is the round, group, flight number (for task C, otherwise 0), task code and description.<br />
                                    Flight number is important for task C (both for F3K and F5K) where up to 5 flights may be involved in a round.<br />
                                    The output string is P|RR|GG|F|TaskCodeAndDescription+CR<br />
                                    P is for Pandora; RR is for round number; GG is for group number; F is for flight number (for task C, otherwise 0).<br />
                                    A typical 'Pandora' output string could be <b>P|05|01|1|C(3) - AllUp 3:00*5+CR</b>.<br />
                                    In the image '03' is the round, 'B' is the group (A=1;B=2;C=3,..) and '2' is the flight number.<br />
                                    For more information about Pandora contact Robust at <b>zhouyinghang(at)gmail.com</b>.
                                </li>
                                 <li><b>Extended+RGB</b> to drive colour capable displays.<br />
                                    The output format is R99G99T9999+AA+RRR+GGG+BBB+CR<br />
                                    The colour code that is output is the RGB code for the colour selected according to the timer state.</br>
                                    R99 - 99 is replaced by the round number<br />
                                    G99 - 99 is replaced by the group number<br />
                                    T9999 - 9999 is replaced by two characters for minutes and two characters for seconds<br />
                                    AA - two character code for the timer state (PT prep time; WT working time: LT landing time; ST sleep time; DT display time-of-day)<br />
                                    RRR - three character code for the red</br>
                                    GGG - three character code for the green</br>
                                    BBB - three characted code for the blue</br>
                                    This allows for the possibility of changing the display colour according to the timer state.<br />
                                    CR is the ascii character for Carriage Return.<br />
                                    A typical output string could be <b>R09G01T0652WT255175084+CR</b><br />
                                </li>
                            </ul>
                            <p>
                                <b>Embedded-Ability</b> has updated software to take advantage of the 'Extended Protocol'.<br />
                                Existing users will need to obtain a replacement chip.<br />
                                Here is how it works
                                <ul>
                                    <li>Prep Time - Round/Group displays for 3 seconds every 15 seconds but not when there is less than 2 minute left.</li>
                                    <li>Working Time - Round/Group displays for 3 seconds every 20 seconds but not when there is less than 4 minutes left.</li>
                                    <li>The decimal dots are turned on while Round/Group is being displayed.</li>
                                </ul>
                            </p>
                            <p>
                                The AerobTec LED Time Display uses the 'Ammss /r' format.<br />
                                Unfortunately AerobTec no longer offer this display panel.                               
                            </p>

                            <p>
                                <b>If your display needs a string format that is not listed, 
                                    contact me and I will add it to the list and update the program.</b>
                            </p>
                            <hr />
                            <p><b>Using the Timer</b></p>
                            <p>
                                You can start at any point within the playlist. Either -
                            </p>

                            <ul>
                                <li>Click on the 'Start' button to start with the selected item.</li>
                                <li>Click on the item where you want to start, then click on the 'Start' button, or</li>
                                <li>Double-Click on the item where you want to start.</li>
                            </ul>
                            <div>
                                <img id="Img41" src="~/ImgAudio/DigitalTimer-GoTo.jpg" runat="server" style="margin-right: 20px; float: right; width: 30%" alt="" />
                                <p>You can 'Go-To' to any Round/Group/ReFlight in the playlist.</p>
                                <ul>
                                    <li>Right-click on the playlist to see the Go-To screen.</li>
                                    <li>The default values will be for the next flight group.</li>
                                    <li>Click OK to go to the selected point.</li>
                                </ul>
                            </div>
                            <p>The Round, Group, ReFlight information always shows where you are in the playlist.</p>
                            <p>When the playlist is running you can -</p>
                            <ul>
                                <li>Pause, then Resume</li>
                                <li>Pause, then Cancel</li>
                                <li>Cancel</li>
                            </ul>

                            <p>
                                It is possible to display the Time Of Day.<br />
                                It is possible to load a newly generated playlist without closing the Digital Timer.
                            </p>

                            <div>
                                <br />
                                <img id="Img26" src="~/ImgAudio/DigitalTimerSmall.jpg" runat="server" style="float: left; width: 30%" alt="" />
                                <p>
                                    You get this screen by clicking the small arrows at bottom right.<br />
                                    These move the DigitalTimer to a corner of your screen.<br />
                                    This makes it easy to see how the time is going while still making full use of GliderScore.<br />
                                    <br />
                                    Click on the small arrows again to restore the screen to full size.<br />
                                    <br />
                                    The colour of the computer clock digits will change -<br />
                                    - Orange for preparation time<br />
                                    - Green for working time<br />
                                    - Blue for the landing time (mainly for F3K)
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="DisplayPanels" HeaderText="Display Panels">
                        <ContentTemplate>
                            <h5>Digital Timer - Display Panels</h5>
                            <p>There are three options for obtaining a suitable external display panel.</p>
                            <ul>
                                <li>Purchase a commercially made panel such as the one from AerobTec.<br />
                                    Unfortunately AerobTec no longer offer this display panel but<br />
                                    you may be able to buy a pre-owned panel. </li>
                                <li>Purchase a display interface board designed and built for GliderScore from
                                    <asp:HyperLink ID="HyperLink13"
                                        NavigateUrl="http://www.embedded-ability.com/gliderscore-display-interface/"
                                        Text="Embedded-Ability"
                                        Target="_blank"
                                        runat="server" />.</li>
                                <li>Build your own display panel from components.</li>
                            </ul>
                            <p>Each option has obvious advantages and disadvantages. </p>
                            <ul>
                                <li>The commercially made panel is quick and easy, but may be expensive.</li>
                                <li>The display interface board solves all the electronics and programming issues for you,<br />
                                    but requires that you purchase some components and carry out some assembly yourself.<br />
                                    However, comprehensive instructions are provided and nothing more than basic soldering is required.</li>
                                <li>Building your own display from components requires good electronics knowledge, programming skills<br />
                                    and construction skills to put it all togther, including the electronics components.</li>
                            </ul>
                            <p>
                                It is possible to make the serial connection using a radio link instead of a cable.<br />
                                Suitable products can be seen 
                                <asp:HyperLink ID="HyperLink9"
                                    NavigateUrl="http://shop.ciseco.co.uk/rf-module-range/"
                                    Text="here"
                                    Target="_blank"
                                    runat="server" />
                                and similar products should be available from other suppliers.<br />
                                I assume that you would need some electronics knowledge to use this kind of product.
                            </p>
                            <hr />
                            <div>
                                <img id="Img17" src="~/ImgAudio/DigitalTimerDisplayPanel.jpg" runat="server" style="float: right; margin-right: 16px; width: 40%" alt="" />
                                <p>
                                    With AerobTec you will have a display panel that looks like this.<br />
                                    A complete solution with no more to do other than make the serial cable connection.<br />
                                    Unfortunately AerobTec no longer offer this display panel. You will have to buy a used one.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <img id="Img32" src="~/ImgAudio/DigitalTimerDisplayControllerBoard.jpg" runat="server" style="float: right; margin-right: 16px; width: 20%" alt="" />
                                <p>
                                    The
                                    <asp:HyperLink ID="HyperLink14"
                                        NavigateUrl="http://www.embedded-ability.com/gliderscore-display-interface/"
                                        Text="Embedded-Ability"
                                        Target="_blank"
                                        runat="server" />
                                    display interface board looks like this (actual size 120 x 98.5mm).<br />
                                    Add cabling, 7 segment LED panels, some assembly time and a serial cable connection and it's done.<br />
                                    All cables connect to the board with screw-type terminal blocks, options are activated with<br />
                                    plug-in jumpers, and the user guide provides lots of board and LED display installation help.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <img id="Img34" src="~/ImgAudio/LED Strip.jpg" runat="server" style="float: right; width: 48%; margin-right: 16px;" alt="" />
                                <img id="Img39" src="~/ImgAudio/Maarten Broess LED display box-2018-01-04.jpg" runat="server" style="float: right; width: 48%; margin-right: 8px;" alt="" />
                            </div>
                            <div>
                                <p>
                                    This idea, and images, come from Maarten Broess. Thank you Maarten.<br />
                                    The idea is to cheaply build a display panel using LED strip lighting as shown in the images above.<br />
                                    You will still need a controller such as the one from Embedded-Ability, but you benefit by not having<br />
                                    to either build or buy the LED panels.<br />
                                    I have not seen it all working and I do not know whether the LED strip lighting is bright enough,<br />
                                    but it is worth a try. I believe that wiring it all up would be similar to the wiring described<br />
                                    in the tab 'Display Panel Build'.                                    
                                </p>
                            </div>
                               <hr />
                            <div>
                                <img id="Img51" src="~/ImgAudio/RobertBudniak_Image2-1.jpg" runat="server" style="float: left; width: 40%; margin-right: 16px;" alt="Image1" />
                                <img id="Img52" src="~/ImgAudio/RobertBudniak_Image1-1.jpg" runat="server" style="float: left; width: 20%; margin-right: 8px;" alt="Image2" />
                            </div>
                            <div>
                                <p>
                                    If you are after a low cost display board and are prepared to build it all yourself, Robert Budniak has the project for you.<br />
                                    Robert writes ...<br />
                                    "There was previous discussion about LED timing boards. People found these helpful but they all were pretty expensive.<br />
                                    I got thinking and ended designing and constructing some boards. <br />
                                    What I call the <b>Gliderscore Timing Board</b> is used to display the countdown timer, the group and the round information.<br />
                                    What I call the <b>Gliderscore Information Board</b> only displays the Group and Round information <br />
                                    (its purpose is to go near the pits and just keep people informed about the state of the schedule).<br />
                                    A third piece is a small transmitter which connects to the USB port and sends the serial Gliderscore output to the boards, <br />
                                    so no wiring between computer and boards is required.<br />
                                    It's all built around an Arduino running a sketch and serial addressable LEDs. The characters are 250mm (10 inches) in height.<br />
                                    The construction articles are at 
                                     <asp:HyperLink ID="HyperLink10"
                                        NavigateUrl="https://www.instructables.com/howto/gliderscore/"
                                        Text="Instructables"
                                        Target="_blank"
                                        runat="server" /> and you'll find the three construction articles, some videos and pictures.<br />
                                    Double-click on the images in Instructables to see the full construction articles.<br />
                                    I hope this adds to the community."<br />
                                    There are some videos on YouTube.<br />
                                       <asp:HyperLink ID="HyperLink11"
                                        NavigateUrl="https://www.youtube.com/watch?v=boUfkCiYvWI"
                                        Text="https://www.youtube.com/watch?v=boUfkCiYvWI"
                                        Target="_blank"
                                        runat="server" /><br />

                                       <asp:HyperLink ID="HyperLink12"
                                        NavigateUrl="https://www.youtube.com/watch?v=Tsda61DY5tw"
                                        Text="https://www.youtube.com/watch?v=Tsda61DY5tw"
                                        Target="_blank"
                                        runat="server" /><br />

                                    <asp:HyperLink ID="HyperLink15"
                                        NavigateUrl="https://www.youtube.com/watch?v=IN5FRD4WxyA"
                                        Text="https://www.youtube.com/watch?v=IN5FRD4WxyA"
                                        Target="_blank"
                                        runat="server" />
                               
                                </p>
                            </div>












                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="DisplayBuild" HeaderText="Display Panel Build">
                        <ContentTemplate>
                            <h5>Digital Timer - Display Panel Build</h5>

                            <asp:Image ID="Image1" runat="server" ImageAlign="Right" Style="margin-right: 16px;" Width="600" Height="233" ImageUrl="~/ImgAudio/Gerrysdisplaypanel.JPG"
                                ToolTip='Display panel built by Gerry Carter' />
                            <p>
                                For this project I decided to build a double sided display panel.<br />
                                <br />
                                Putting the display panel in the middle of the flight line means that it will easily be seen from both ends.<br />
                                <br />
                                By setting up the panels at around 30 degrees to each other, they will also be clearly visible from all parts of the landing area.<br />
                            </p>

                            <p>
                                <br />
                                I have enjoyed carrying out this project and seeing the display panel that I built work for the very first time. A great feeling.<br />
                                <br />
                                Nothing is really difficult. It all just needs to be thought through before you begin so that there aren’t any surprises.
                                
                            </p>
                            <hr />
                            <h5>The Display Panel Build story</h5>
                            <p>
                                Get the printable version of this build project (9 pages .pdf). Click to open <%-- Click <a href="Downloadmgr.aspx?">HERE</a>.<br />--%>
                                <input type="button" name="Button" style="color: #333333; font-size: 10px; position: relative; top: -0px; left: 0px; width: 150px; margin-top: 0px;"
                                    value="DisplayPanelBuild.pdf"
                                    onclick="window.open('zipaudio/DisplayPanelBuild.pdf', 'download'); return false;" />
                                <br />
                                It describes everything, step by step.</br>
                                Hopefully this document will help you with your own project.<br />
                                <br />

                                If you need the Silicon Labs USB to TTL drivers, click button to download. 
                                <input type="button" name="Button" style="color: #333333; font-size: 10px; position: relative; top: -0px; left: 0px; width: 150px; margin-top: 0px;"
                                    value="CP210x_Windows_Drivers.zip"
                                    onclick="window.open('zipfile/CP210x_Windows_Drivers.zip', 'download'); return false;" />
                            </p>
                            <hr />
                            <div>
                                <h5>Display Panel Stand</h5>
                                <p>
                                    <asp:Image ID="Image2" runat="server" ImageAlign="Right" Style="margin-left: 4px; margin-right: 70px;" ImageUrl="~/ImgAudio/GerrysDisplay.JPG"
                                        ToolTip='Display panel with stand built by Gerry Carter' />

                                    Pierre Louis LE MESLE of Aéro-Model-Club de Châteaudun France inspired this build by sending me a photo of his display, with stand.
                                This stand is made of 7m of 32mm diameter pressure PVC pipe with associated fittings.
                                The pressure pipe fittings are all 90 degrees. I found that drainage pipe and fittings were not suitable.<br />
                                    <br />
                                    The ropes are needed because the stand, although strong, is not very stable in the wind.
                                The ropes are attached using large cable ties and so is the chain that the display hangs from.
                                There are two short attachments at the bottom of the display to prevent it swinging in the wind.<br />
                                    <br />
                                    Approximate dimensions are 1200mm wide x 1700mm high x 600mm deep (width of the base).
                                I split the uprights to keep the overall length down.
                                The stand breaks down into 8 pieces
                                <ul>
                                    <li>1 x top rail</li>
                                    <li>1 x bottom rail</li>
                                    <li>2 x uprights lower section</li>
                                    <li>2 x uprights upper section</li>
                                    <li>2 x base pieces</li>
                                </ul>
                                    <p>
                                        The bottom rail and the two longer (lower) uprights are all the same length so that they are interchangeable.<br />
                                        The two shorter (upper) uprights have a collar at one end.
                                    </p>
                                    <p>
                                        Below is the detail of the base.<br />
                                        Two T-connectors are used in the centre.
                                    </p>
                                    <asp:Image ID="Image3" runat="server" ImageAlign="Left" Width="200" ImageUrl="~/ImgAudio/GerrysDisplayStandBase.JPG"
                                        ToolTip='Display panel stand base built by Gerry Carter' />
                                </h5>
                            </div>
                            <div>
                                <br />
                            </div>
                            <hr />
                            <br />
                            <br />
                            <h5>Success!</h5>
                            <p>
                                <b>Have a look at this short video to see how it all worked out in the end.</b><br />
                                <br />
                                Note that the time in the video 'jumps' ahead about every 5 seconds so that you don't have to sit through<br />
                                the full timing sequence of around 12 minutes for one round.
                                  
                            </p>

                            <iframe width="840" height="473" src="https://www.youtube.com/embed/VAbmSDl-s38" frameborder="0"></iframe>

                        </ContentTemplate>
                    </asp:TabPanel>


                    <asp:TabPanel runat="server" ID="TabPanel33" HeaderText="About">
                        <ContentTemplate>
                            <h5>Digital Timer - About</h5>
                            <p>I had a lot of help in developing the Digital Timer and would like to acknowledge the following</p>
                            <ul>
                                <li>IronRazerz for replying to my question about timers on the MSDN forums.</li>
                                <li>Arjan Harmans for testing the program with an actual display panel, creating videos and for many useful suggestions.</li>
                                <li>Gerben van Berkum for suggestions and for helping to unravel the syntax of the string to be sent to the serial port.</li>
                                <li>Gernot Fink for clarifying exactly what the syntax had to be.</li>
                                <li>Denis Truffo (author of F3JTimer) for his support and assistance.</li>
                                <li>Lukas Palkovic of AerobTec (former manufacturer of the test display panel) for help at various times.</li>
                            </ul>

                        </ContentTemplate>
                    </asp:TabPanel>

                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>



        <asp:TabPanel runat="server" ID="AudioPlayer" HeaderText="Audio Player">
            <ContentTemplate>
                <asp:TabContainer ID="AP_TabContainer1" runat="server">

                    <asp:TabPanel runat="server" ID="AudioGeneral" HeaderText="Audio">
                        <ContentTemplate>
                            <img id="ImgAudioPlayer" src="~/ImgAudio/AudioPlayer.jpg" runat="server" style="float: right; width: 60%; margin-right: 12px;" alt="" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h5>Audio Player</h5>
                            <p>
                                The Audio Player will create a playlist to run your competition just the 
                            way that you want it to run.<br />
                                <br />
                                <b>Audio Player</b> uses a combination of pre-recorded audio timing tracks counting down the preparation time and through the working time.<br />
                                It also uses other audio files to announce round and group numbers and pilot names. These can be system generated or recorded separately and slotted into the system.<br />
                                <br />
                                <b>Digital Timer</b> does everything that the Audio Player does, and more. It is perfect to use for audio alone.<br />
                                You can use Digital Timer without a timer display panel.<br />
                                Instead of pre-recorded timing tracks, the Digital Timer uses small audio files for timing calls. These are placed in a schedule maintained by you.<br />
                                This schedule, known as the Timer Files, gives total flexibility and can be changed on or off the field.<br />
                                The Digital Timer uses the same system generated audio for rounds, groups and pilot names.<br />
                                <p>
                                    The <b>Audio Player</b> has three main sections described on the following tabs.
                                </p>
                                <ul>
                                    <li>File Maintenance - work with audio files</li>
                                    <li>Playlist Settings - select playlist options</li>
                                    <li>Create Playlist/Start Player - to create and play the playlist file</li>

                                </ul>

                            </p>
                            <p>
                                It is highly recommended that you download and instal
                        <img id="Img9" src="~/ImgAudio/VLCMediaIcon.jpg" runat="server" style="float: left; width: 3.0%" alt="" />
                                <asp:HyperLink ID="HyperLink1"
                                    NavigateUrl="http://www.videolan.org"
                                    Text="VLC Media Player"
                                    Target="_blank"
                                    runat="server" />
                                . It gives perfect control over the playback of your audio.
                            </p>
                            <h5>Audio Player Folder</h5>
                            <p>
                                <b>ALL audio files must be in a sub-folder called 'Audio'.</b>
                                <br />
                                <br />
                                This sub-folder will normally be 'C:\GliderScore6\Audio'.<br />
                                The rule is that it must be a sub-folder of the folder containing GliderScore.exe.
                            </p>

                        </ContentTemplate>
                    </asp:TabPanel>




                    <%--     AUDIO PLAYER - FILE MAINTENANCE--%>
                    <asp:TabPanel runat="server" ID="AudioFileMaint" HeaderText="File Maintenance" TabIndex="1">
                        <ContentTemplate>
                            <asp:TabContainer ID="AudioFileMaintTab" runat="server" ActiveTabIndex="0">

                                <%--   Timer Files--%>
                                <asp:TabPanel runat="server" ID="AudioTimerFiles" HeaderText="Timer Files" TabIndex="2">
                                    <ContentTemplate>
                                        <h5>Audio Player - File Maintenance</h5>
                                        <p><b>Timer Files</b></p>
                                        <img id="Img7" src="~/ImgAudio/AudioPlayerFileMaintenanceTimers.jpg" runat="server" style="float: right; width: 60%; margin-right: 20px;" alt="" />
                                        <p>
                                            Timer files are previously made recordings to run the actual rounds to time. 
                                They are available for download from various sites.<br />
                                            <br />
                                            In this screen you can add new timers, delete timers, and change the file to which a timer relates. 
                                        You can simply overwrite the file name OR Browse to the file required.
                                        <br />
                                            <br />
                                            A special set of timer files has been put together to work with GliderScore.<br />
                                            You should download these files from the <a href="Download.aspx">download page</a> when upgrading to Version 6.44.
                                        </p>
                                        <p>
                                            <b>Create your own Timer Files</b><br />
                                            It is easy to create your own timer files.<br />
                                            One program that I have tried and found to be excellent is
                                        <img id="Img10" src="~/ImgAudio/WavePad.jpg" runat="server" style="float: left; width: 3.0%" alt="" />
                                            <asp:HyperLink ID="HyperLink7"
                                                NavigateUrl="http://www.nch.com.au/wavepad/index.html"
                                                Text="WavePad"
                                                Target="_blank"
                                                runat="server" />. There are many other programs that could be used.
                                        </p>
                                        <p>
                                            The files available from this website were downloaded from the 'Rocky Mountains Soaring Association' site. 
                                        Their download page (additional files are available) is 
                                        <asp:HyperLink ID="HyperLink2"
                                            NavigateUrl="http://www.rmsadenver.com/f3j_announcements.htm"
                                            Text="here"
                                            Target="_blank"
                                            runat="server" />.<br />
                                            <br />
                                            There is a long list of files available for download from Jo Grini's site 
                                        <asp:HyperLink ID="HyperLink3"
                                            NavigateUrl="http://www.jojoen.no/f3j/index.htm"
                                            Text="here"
                                            Target="_blank"
                                            runat="server" />.
                                        </p>
                                        <p>
                                            Special timer files (ALES, 12m working time, etc) can be downloaded <a href="Download-OtherAudio.aspx">here</a>. 
                                        </p>

                                    </ContentTemplate>
                                </asp:TabPanel>
                                <%-- F3K Timer Files--%>
                                <asp:TabPanel runat="server" ID="TabPanel3" HeaderText="F3K Timer Files" TabIndex="3">
                                    <ContentTemplate>
                                        <h5>Audio Player - File Maintenance</h5>
                                        <p><b>F3K Timer Files</b></p>
                                        <img id="Img5" src="~/ImgAudio/AudioPlayerFileMaintenanceF3KTimers.jpg" runat="server" style="float: right; width: 60%; margin-right: 20px;" alt="" />
                                        <p>
                                            F3K Timer files are previously made recordings to run the actual F3K tasks to time.<br />
                                            <br />
                                            In this screen you can only change the file to which a timer relates. 
                                        You can simply overwrite the file name OR Browse to the file required.
                                            <br />
                                            <br />
                                            A special set of timer files has been put together to work with GliderScore.<br />
                                            You should download these files from the <a href="Download.aspx">download page</a> when upgrading to Version 6.44.
                                        </p>

                                        <p>
                                            <b>Create your own Timer Files</b><br />
                                            It is easy to create your own timer files.<br />
                                            One program that I have tried and found to be excellent is
                                        <img id="Img12" src="~/ImgAudio/WavePad.jpg" runat="server" style="float: left; width: 3.0%" alt="" />
                                            <asp:HyperLink ID="HyperLink8"
                                                NavigateUrl="http://www.nch.com.au/wavepad/index.html"
                                                Text="WavePad"
                                                Target="_blank"
                                                runat="server" />. There are many other programs that could be used.
                                        </p>
                                        <p>
                                            The files available from this website were created by Oleg Golovidov but renamed by me. 
                                        The originals can be downloaded from the 
                                        <asp:HyperLink ID="HyperLink4"
                                            NavigateUrl="http://olgol.com/F3KScore"
                                            Text="F3KScore"
                                            Target="_blank"
                                            runat="server" />
                                            website.
                                       <br />
                                            <br />
                                            There is a long list of files for download from Jo Grini's site available
                                        <asp:HyperLink ID="HyperLink5"
                                            NavigateUrl="http://www.jojoen.no/f3j/index.htm"
                                            Text="here"
                                            Target="_blank"
                                            runat="server" />.
                                        </p>

                                    </ContentTemplate>
                                </asp:TabPanel>
                                <%-- F3K Task Files--%>
                                <asp:TabPanel runat="server" ID="TabPanel1" HeaderText="F3K Tasks" TabIndex="3">
                                    <ContentTemplate>
                                        <h5>Audio Player - File Maintenance</h5>
                                        <p><b>F3K Task Announcements</b></p>
                                        <p>
                                            F3K Task announcement files can be generated by the program or recorded by the user.<br />
                                            Suitable files are also available for download from the
                                        <asp:HyperLink ID="HyperLink6"
                                            NavigateUrl="http://olgol.com/F3KScore"
                                            Text="F3KScore"
                                            Target="_blank"
                                            runat="server" />
                                            website and perhaps other websites.
                                        <br />
                                            <p><b>Options for creating/enabling sound files.</b></p>
                                            <ul>
                                                <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                    The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                                <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                                <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                    See the 'Record Audio' tab for more details.
                                                </li>
                                            </ul>

                                            <div>
                                                <img id="Img4" src="~/ImgAudio/AudioPlayerFileMaintenanceF3KTasks.jpg" runat="server" style="float: left; width: 97%" alt="" />

                                            </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <%-- Pilots--%>
                                <asp:TabPanel runat="server" ID="TabPanel2" HeaderText="Pilot Names" TabIndex="3">
                                    <ContentTemplate>
                                        <h5>Audio Player - File Maintenance</h5>
                                        <p><b>Pilot Name Announcements</b></p>
                                        <p>
                                            Pilot name announcement files can be generated by the program or recorded by the user.
                                        </p>
                                        <p>
                                            Using the selections available for pilot name (Multi-Row - Create Audio Settings)<br />
                                            it is possible to select one or a number of pilots and generate files based on your selection.<br />
                                            Click on the 'Create Audio for Selected Pilot/s' button.
                                        </p>
                                        <p><b>Options for 'speaking' the pilot name.</b></p>

                                        <ul>
                                            <li>LastName; FirstName</li>
                                            <li>FirstName LastName</li>
                                            <li>Phonetic</li>
                                        </ul>
                                        <p><b>Options for creating/enabling sound files.</b></p>
                                        <ul>
                                            <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                            <li>Select one of the Name format options in the 'Multi-Row - Create Audio Settings' list.<br />
                                                Select a pilot or pilots.<br />
                                                Click 'Create Audio for Selected Pilot/s'. New audio is created for all selected pilots.
                                            </li>
                                            <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                            <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                See the 'Record Audio' tab for more details.
                                            </li>
                                        </ul>
                                        <div>
                                            <img id="Img6" src="~/ImgAudio/AudioPlayerFileMaintenancePilots.jpg" runat="server" style="float: left; width: 97%" alt="" />

                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>

                                <%-- Rounds--%>
                                <asp:TabPanel runat="server" ID="TabPanel4" HeaderText="Rounds, Groups,..." TabIndex="3">
                                    <ContentTemplate>
                                        <h5>Audio Player - File Maintenance</h5>
                                        <p><b>Rounds, Groups and ReFlights Announcements</b></p>
                                        <p>
                                            These are the announcement files for Round, Group and ReFlight numbers.<br />
                                            ReFlight announcements are left out of the playlist if the ReFlight number is 0 (zero).
                                        </p>
                                        <p><b>Options for creating/enabling sound files.</b></p>
                                        <ul>
                                            <li>Generate from the text entered in the 'Phonetic' column. Click on the 'Phonetic→File' button.<br />
                                                The speed at which the text is spoken, and the volume can be adjusted in Synthesizer Settings.</li>
                                            <li>Use a file created externally. Copy the file to the 'Audio' folder and then browse to it to create the relationship.</li>
                                            <li>Record your own voice file. Click on the 'Record' icon and follow the directions.<br />
                                                See the 'Record Audio' tab for more details.
                                            </li>
                                        </ul>
                                        <div>
                                            <img id="Img8" src="~/ImgAudio/AudioPlayerFileMaintenanceRounds.jpg" runat="server" style="float: left; width: 97%" alt="" />

                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>



                            </asp:TabContainer>
                        </ContentTemplate>

                    </asp:TabPanel>


                    <%--     AUDIO PLAYER - PLAYLIST SETTINGS--%>
                    <asp:TabPanel runat="server" ID="AudioPlayerPlaylistSettings" HeaderText="Playlist Settings" TabIndex="2">
                        <ContentTemplate>
                            <h5>Audio Player - Playlist Settings</h5>
                            <div>
                                <div>
                                    <p>
                                        There are several Playlist profiles saved that depend on the type of competition.<br />
                                        The next time you run a similar competition, the same profile settings will be used.<br />
                                        You cannot select a different profile (except F3B) but you can change the profile details.<br />
                                        Any changes made will be saved and used for your next similar competition.
                                    </p>
                                    <p>
                                        The 'Timer file name' section includes the option of 'None'.<br />
                                        If this is selected the playlist will announce only round, group and pilot names.<br />
                                        Add 1 minutes silence to your playlist if using this option. You can then cleanly start and stop playback.
                                    </p>
                                    <p>
                                        Decide on
                                    </p>
                                    <ul>
                                        <li>the Timer file to use (except F3K)</li>
                                        <li>the one minute of silence timer file to use</li>
                                        <li>how many minutes of silence to have (from 0 to 5 minutes)</li>
                                        <li>select pilot name announcement option (None; Play; Play twice)</li>
                                        <li>select round/group announcement option (None; Play; Play twice; Play at start and end)</li>
                                        <li>For F3K - whether to include F3K timers in the playlist</li>
                                        <li>For F3K - whether to include F3K task announcements in the playlist</li>
                                    </ul>
                                    <p>All of these settings are saved as a profile and automatically set when a similar competition is created.</p>

                                </div>

                                <img id="Img1" src="~/ImgAudio/AudioPlayerPlaylistSettings.jpg" runat="server" style="float: left; width: 97%" alt="" />
                            </div>

                        </ContentTemplate>

                    </asp:TabPanel>

                    <%--     AUDIO PLAYER - CREATE PLAYLIST--%>
                    <asp:TabPanel runat="server" ID="TabPanel5" HeaderText="Create Playlist/Start Player" TabIndex="2">
                        <ContentTemplate>
                            <h5>Audio Player - Create Playlist</h5>
                            <div>
                                <p>
                                    <b>SELECT FLIGHT GROUP</b><br />
                                    Select the flight group (Round; Group; ReFlight) where you want the playlist to start.
                                </p>
                                <p>
                                    <b>RETIRE / UNRETIRE PILOTS</b><br />
                                    If pilots have retired, or rejoined the competition, click on 'Retire / UnRetire Pilots' button to mark these pilots.<br />
                                    Retired pilots are excluded from the playlist.<br />
                                    Pilots retired (or unretired) here are also marked in the 'Pilot Entry' screen.
                                </p>
                                <p>
                                    <b>CREATE PLAYLIST</b><br />
                                    Click on 'Create Playlist' to generate the playlist file.<br />
                                    Review the playlist shown at the bottom of the screen.<br />
                                    The playlist file is called '~\Audio\GliderScorePlaylist.m3u'.
                                </p>

                                <p>
                                    <b>START PLAYER</b><br />
                                    Click on 'Start Player' to start the playlist playing
                                </p>
                            </div>
                            <div>
                                <img id="Img2" src="~/ImgAudio/AudioPlayerCreatePlaylist.jpg" runat="server" style="float: left; width: 97%" alt="" />
                            </div>


                        </ContentTemplate>

                    </asp:TabPanel>
                    <%--     AUDIO PLAYER - RECORD AUDIO--%>
                    <asp:TabPanel runat="server" ID="TabPanel6" HeaderText="Record Audio" TabIndex="2">
                        <ContentTemplate>
                            <h5>Audio Player - Record Audio</h5>
                            <div>
                                <p>To record audio, click on the icon that you see in the File Maintenance screens.</p>
                                <img id="Img11" src="~/ImgAudio/AudioPlayerGoToRecordAudio.jpg" runat="server" style="float: left; width: 97%" alt="" />
                            </div>
                            <div>
                                <p>To successfully record audio, do the following - </p>
                                <ul>
                                    <li>Make sure that your microphone is working.</li>
                                    <li>and click on the 'Start Recording' button.</li>
                                    <li>When finished speaking click on the 'Stop Recording' button.</li>
                                    <li>Click on 'Playback' to listen to your recording.</li>
                                    <li>Click on 'Save to File' to save the recording to the file named above.</li>
                                </ul>
                                <img id="Img3" src="~/ImgAudio/AudioPlayerRecordAudio.jpg" runat="server" style="float: none; width: 70%" alt="" />

                            </div>

                        </ContentTemplate>
                    </asp:TabPanel>

                    <asp:TabPanel runat="server" ID="AP_MergePlaylists" HeaderText="Merge Playlists">
                        <ContentTemplate>
                            <h5>Audio Player - Merge Playlists</h5>

                            <div>
                                <p>
                                    It is possible to merge the playlists from two (or more) competitions to create a single continuous playlist.<br />
                                    The trigger to access this feature is that all competitions involved have the same competition date.<br />
                                    A typical use case is where separate competitions are being run for Seniors and Juniors or F3K and F5K.<br />
                                    <br />
                                    The system automatically generates audio files to 'speak' the name of each competition.<br />
                                    These audio files are named Competition1.wav, Competition2.wav, ... and are created in the Audio sub-folder.<br />
                                    If the computer generated files to not correctly 'say' the competition names, replace them with locally produced files.<br />
                                    These competition name files are inserted in the playlist ahead of the round and group announcements.<br />
                                    <br />

                                    The merge process works round by round.<br />
                                    In each round the playlist for the first competition is followed by the playlist of the second competition.<br />
                                    The sequence will look something like this:<br>
                                    Round 1<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 1<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 2<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 3<br />
                                    &nbsp&nbsp&nbsp Competition 2 Group 1<br />
                                    &nbsp&nbsp&nbsp Competition 2 Group 2<br />
                                    Round 2<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 1<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 2<br />
                                    &nbsp&nbsp&nbsp Competition 1 Group 3<br />
                                    &nbsp&nbsp&nbsp Competition 2 Group 1<br />
                                    &nbsp&nbsp&nbsp Competition 2 Group 2<br />
                                    <br />
                                    To begin, create a playlist for the <u>first competition</u> to fly.<br />
                                    Open the <u>next competition</u>.<br />
                                    Click to create a playlist in the usual way.<br />
                                </p>
                                <%--                                                <img id="Img42" src="~/ImgAudio/MergePlaylistQuestion.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />--%>
                                <img id="Img44" src="~/ImgAudio/MergePlaylistSelectOption.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />
                                <p>
                                    You will see the 'Merge Playlists' screen because the two competitions have the same date.
                                </p>


                                <p>
                                    Choose <u>CREATE</u> to create a playlist for just the current competition or <u>MERGE</u> to merge the playlists together.<br />
                                    In this case choose <u>MERGE</u>.<br />
                                    Click Continue to generate the merged playlist (or Cancel to abandon the operation).<br />
                                    <br />
                                    Repeat the process for as many competitions as required.<br />
                                    Click on the 'Start Player' button within any of the merged playlist competitions to play the merged playlist.<br />
                                    <br />
                                    If the competitions run perfectly smoothly then there is no more to do.<br />
                                </p>
                            </div>

                            <div>
                                <hr />

                                <%--                                                <img id="Img43" src="~/ImgAudio/MergePlaylistSelectComp.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />--%>
                                <img id="Img45" src="~/ImgAudio/MergePlaylistEditGroup1.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />


                                <p>
                                    Sometimes things do not work out perfectly.<br />
                                    Changes have to be made.<br />
                                    <br />
                                    For example, the Seniors competition might end the day without completing the round in progress.<br />
                                    The next day you want to start with the unfinished seniors round and then move back to the juniors.<br />
                                    This is how to do it.
                                </p>
                                <ul>
                                    <li>Open the seniors competition and go to 'Create Playlist'.</li>
                                    <li>Select the CREATE option (because we now want the seniors to start the next day).</li>
                                    <li>Edit the FromRound (4) and FromGroup (3) numbers. </li>
                                    <li>Click on 'Continue'. </li>
                                    <li>The playlist starting at round 4 group 3 is created.</li>
                                </ul>
                            </div>
                            <div>
                                <img id="Img50" src="~/ImgAudio/MergePlaylistEditGroup2.jpg" runat="server" style="float: right; width: 60%; margin-left: 4px; margin-right: 16px; margin-bottom: 10px;" alt="" />
                                <p>
                                    Next, go to the juniors competition.
                                </p>
                                <ul>
                                    <li>Open the juniors competition and go to 'Create Playlist'.</li>
                                    <li>The juniors had completed round 4 so they will start at round 5.</li>
                                    <li>Select the MERGE option and edit the FromRound for juniors to 5.</li>
                                    <li>Click on 'Continue'. The merged playlist is created.</li>
                                </ul>
                                <br />
                                <p>Click on 'Start Player' to play the merged playlist.</p>
                                <p>
                                    <b>It is important to know that the FromRound, FromGroup and FromReFlight fields can all be edited if they are not greyed out.</b>
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:TabPanel>

                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="TabPanelBigTimer" HeaderText="Big Timer">
            <ContentTemplate>
                <asp:TabContainer ID="TabContainer3" runat="server">

                    <asp:TabPanel runat="server" ID="BigTimer" HeaderText="Big Timer">
                        <ContentTemplate>
                            <div>
                                <img id="Img33" src="~/ImgAudio/BigTimer1.jpg" runat="server" style="float: right; width: 60%; margin-bottom: 4px; margin-right: 16px;" alt="" />
                                <img id="Img35" src="~/ImgAudio/BigTimer2.jpg" runat="server" style="float: right; width: 60%; margin-bottom: 4px; margin-right: 16px;" alt="" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h5>Big Timer</h5>
                                <p>
                                    If you have the Big Timer display panel from Mickey Nowell then this is the section for you.<br />
                                    <br />
                                    (If you would like to know more about this panel, email Mickey at <b>mickeysbigtimer@gmail.com</b>).<br />
                                    <br />
                                    The Big Timer display shows names and times as well as making audio announcements.<br />
                                    <br />
                                    To do this, it requires a set of files specially created for each competition.<br />
                                    <br />
                                    GliderScore does exactly that, and very easily.<br />
                                    <br />
                                    The Big Timer only handles audio files in .wav format.<br />
                                    <%--                                    As part of its process, GliderScore uses an open source program called lame.exe 
                                    to convert .wav files created in GliderScore to .mp3 files.
                                    This program (lame.exe) is included with the GliderScore download.<br />--%>
                                </p>
                            </div>
                            <hr />
                            <div>
                                <h5>Using the Big Timer functions in GliderScore</h5>
                                <br />
                                <img id="Img36" src="~/ImgAudio/BigTimer3.jpg" runat="server" style="float: left; width: 15%" alt="" />
                                <p>

                                    <br />
                                    After opening a competition, hover or click on the 'Audio & Timer' button, and select 'Big Timer'.<br />

                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    The screen below will be opened.
                                </p>
                            </div>
                            <hr />
                            <div>
                                <img id="Img37" src="~/ImgAudio/BigTimer4.jpg" runat="server" style="float: right; width: 60%; margin-right: 16px;" alt="" />
                                <p>
                                    <b>Select the Profile that matches your competition.</b><br />
                                    <br />
                                    You can re-name the eight timer profiles with your own profile names.
                                    All profiles can set up and edited without changing the competition.<br />
                                    <br />

                                    You can save separate profiles for preliminary and fly-off rounds, as well as for different
                                    types of competition (F3K, F5J, F3J, ...).<br />
                                    <br />
                                    Click on the '<b><i>i</i></b>' button for more information about the various options that are available.<br />
                                    <br />
                                    When you click on <b>Create Files</b>, the Selected Task must match the current competion.<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                    Having made your choices, click on the <b>Create Files</b> button.</br/>
                                    
                                </p>
                            </div>
                            <hr />
                            <div>
                                <img id="Img38" src="~/ImgAudio/BigTimer5.jpg" runat="server" style="float: right; width: 30%; margin-right: 16px;" alt="" />
                                <p>
                                    Clicking on the <b>Create Files</b> button brings up three choices.
                                </p>
                                <ul>
                                    <li>YES - saves the files both on the computer AND on an attached SD card.<br />
                                        You will be asked to identify the location of the SD card.</li>
                                    <li>NO - saves the files on the computer in a sub-directory called 'BigTimer'</li>
                                    <li>CANCEL - cancels the operation.</li>
                                </ul>
                            </div>
                            <hr />
                            <div>
                                <p>
                                    Once the files are on the SD card, take the card to your Big Timer, select your competition and start the timer.
                                </p>
                            </div>



                        </ContentTemplate>
                    </asp:TabPanel>




                </asp:TabContainer>
            </ContentTemplate>
        </asp:TabPanel>


    </asp:TabContainer>

</asp:Content>
