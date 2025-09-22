<%@ Page Title="" Language="VB" MasterPageFile="MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        If varID = "GliderScoreUpdates" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DownloadPages, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("GliderScoreUpdates")
            container.ActiveTab = Pnl
        End If

        If varID = "AppleMac" Then
            Dim container As AjaxControlToolkit.TabContainer = CType(DownloadPages, AjaxControlToolkit.TabContainer)
            Dim Pnl As AjaxControlToolkit.TabPanel = container.FindControl("AppleMac")
            container.ActiveTab = Pnl
        End If


    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:TabContainer ID="DownloadPages" runat="server">
        <asp:TabPanel runat="server" ID="DownloadTab" HeaderText="Downloads" TabIndex="0">
            <ContentTemplate>
                <asp:Image ID="Image3" runat="server" ImageAlign="Right" ImageUrl="~/ImgDownload/GliderLaunching1.JPG"
                    ToolTip='Mildura 2013, Gerry Carter photo' />

                <h5>&nbsp&nbsp&nbsp Download<br />
<<<<<<< HEAD
                    &nbsp&nbsp&nbsp GliderScore 6.78 Update 2 (Updated 2025-09-22) and<br />
=======
                    &nbsp&nbsp&nbsp GliderScore 6.78 and<br />
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                    &nbsp&nbsp&nbsp DigitalTimer 1.20
                </h5>
                
                <p>
                    <b>Check your system before downloading this software.</b><br />
                    <br />
                    <font color="darkslateblue">If using Windows XP, download GliderScore 6.39. 
                        Later versions WILL NOT RUN on Windows XP computers.</font><br />
                    <br />

                    For the latest version, you will need a computer with
                </p>
                <ul>
                    <li>Windows Vista SP2, W7 SP1, W8.1, W10 or W11 </li>
                    <li>Microsoft .Net Framework Version 4.8 (Runtime) (<asp:HyperLink ID="HyperLink1" NavigateUrl="https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48"
                        Text="download" Target="_blank" runat="server" />).</li>

                    <li>or an Apple Mac (see how to set it up <a href="download.aspx?AppleMac">here</a>.</li>
                </ul>
                <p>Please support GliderScore by making a <a href="donate.aspx">donation</a>.</p>

                <p>
                    The downloads are self extracting archive files created using
                    <asp:HyperLink ID="HyperLink2" NavigateUrl="http://www.izarc.org/download.html" Text="IZArc"
                        Target="_blank" runat="server" />
                    software. They will ...
                </p>
                <ul>
                    <li>create a new folder &quot;C:\GliderScore6&quot; (if necessary)</li>
                    <li>copy the files into the new folder</li>
                </ul>
                <hr>     
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Package (13.0MB)"
<<<<<<< HEAD
                    onclick="window.open('zipfile/gliderscorefiles678_2025-07-01 U2.exe', 'download'); return false;" />
=======
                    onclick="window.open('zipfile/gliderscorefiles678_2025-07-01.exe', 'download'); return false;" />
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
<<<<<<< HEAD
                    onclick="window.open('zipfile/GliderScoreExe678_2025-07-01 U2.exe', 'download'); return false;" />
=======
                    onclick="window.open('zipfile/GliderScoreExe678_2025-07-01.exe', 'download'); return false;" />
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
<<<<<<< HEAD
                        <li>GliderScore.exe 6.78 Build 2025-07-01 Update 2 (Updated 2025-09-22)</li>
=======
                        <li>GliderScore.exe 6.78 Build 2025-07-01</li>
>>>>>>> 162c89ce1b9b81eb528ac4ce5d2223d791b7fe09
                        <li>GliderScoreDigitalTimer.exe 1.20 Build 2025-04-22</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>
                <hr />
                <%--  *****************  IF YOU HAVE WINDOWS XP  ********************    --%>

                <p><b>IF YOU HAVE WINDOWS XP</b></p>
                       <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore 6.39 Package for Windows XP / .Net 3.5 (0.6MB)"
                    onclick="window.open('zipfile/gliderscore639files.exe', 'download'); return false;" />
                <p style="padding-left: 40px; color: darkslateblue">
                    <b>Download this 'Package' to run GliderScore on Windows XP.</b><br />
                    GliderScore 6.39 does not have audio or timer capabilities.
                </p>

                <p style="padding-left: 40px">
                    When finished all downloads, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  OPTIONAL DOWNLOADS  ********************    --%>
                <p><b>OPTIONAL DOWNLOADS</b></p>

                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="Audio timer files for GliderScore AudioPlayer (103MB)"
                    onclick="window.open('zipfile/GliderScoreAudioforAudioPlayer.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Optional - Download these audio timer files.</b><br />
                    These files are pre-set to work with GliderScore AudioPlayer. They are not required for the DigitalTimer.
                         This is a once only download.<br />
                    <b>Special audio files</b> (ALES, 12m working time, etc) can be downloaded <a href="Download-OtherAudio.aspx">here</a>. 
                </p>

                <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="'F3J Enter Cms' Landing table (0.1MB)"
                    onclick="window.open('zipfile/GliderScoreLanding.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Optional - Download the 'F3J Enter Cms' landing table.</b><br />
                    The table has one entry for each centimetre out to 15 metres<br />
                    and was used for the 2012 F3J WC.<br />
                    DO NOT USE this landing table with eScoring. The scroll list will far too long.<br />
                    When finished downloading follow the instructions in the 'GliderScore Landing Help.txt' file.  
                </p>

                <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="eScoring Interface program"
                    onclick="window.open('zipfile/eScoringInterfaceExe.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Optional - Download the 'eScoring Interface' program.</b><br />
                    This program enables a PC to be used like a smartphone for eScoring score entry.<br />
                    For more details go to Scoring→eScoring→ForPilots.<br />
                    Scroll down to 'Entering scores with a shared computer'.
                </p>

                <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="F5J Audio and Timer files"
                    onclick="window.open('zipfile/Magnus_F5J_Timer_Files.zip', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Optional - Download Audio and Timer files used at Swedish F5J competitions.</b><br />
                    These files were contributed by Magnus Hedland.<br />
                    The audio (.wav) files should be saved to the C:\GliderScore6\Audio folder.<br />
                    The timer files should be imported using GliderScore's 'Import' button on the Digital Timer/Timer Setup screen.
                </p>




                <%--        <p>
                        <b>GLIDERSCORE BETA VERSION</b> (Optional)</p>
                        <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                            value="GliderScoreBetaFiles.exe"
                            onclick="window.open('zipfile/GliderScoreBetaFiles.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    A beta version is available. This is a further development<br />
                    from the currently released version and is distinguished by the<br />
                    program name GliderScoreBeta.exe. It may solve an issue that you are having.<br />
                    <br />
                    The download includes a file GliderScoreBeta.rtf with information about the new developments and
                    <br />
                    issues that the beta version handles. The self extracting archive is named GliderScoreBetaFiles.exe<br />
                    <br />
                    The major change this time relates to F3K, enforcing entry of max times only and enforcing rule 5.7.7.<br />
                    There are also some bug fixes and these relate to relatively rare cases. More details in GliderScoreBeta.rtf.<br />
                    <br />
                    Note that the beta version is not fully tested. When it is complete and has been fully tested<br />
                    it will be released as a new version.
                </p>--%>

                <p>
                    <b>TRANSLATIONS</b><br />
                    From Version 6.51, all translation files are included in the 'GliderScore Pack'.<br />
                    For earlier versions, the individual files are still available for download and can be found under the 'Translate' tab.
                </p>
                <p>
                    <b>Check regularly for updates. See the GliderScore Updates tab for details of 
                    changes.</b><br />
                    I value your feedback. See the Contact page for my email address.
                </p>

                <p>
                </p>

            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="TabPanel2" HeaderText="Previous Versions" TabIndex="1">
            <ContentTemplate>
                <h5>Previous Versions for Download</h5>
                <br />


                <%--GLIDERSCORE v6.77--%>
                <hr />
                <h5>GliderScore 6.77 with Digital Timer 1.19</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Package (13.0MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles677_U4_2025-04-22.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                         
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe677_U4_2025-04-22.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.77 Update 4 Build 2025-04-22</li>
                        <li>GliderScoreDigitalTimer.exe 1.20 Build 2025-04-22</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>


                <%--GLIDERSCORE v6.76--%>
                                <hr />
                 <h5>GliderScore 6.76 with Digital Timer 1.19</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Package (13.0MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles676_2025-01-26.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                                          
                         
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe676_2025-01-26.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.76 Build 2025-01-26</li>
                        <li>GliderScoreDigitalTimer.exe 1.19 Build 2024-08-23</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>


                <%--GLIDERSCORE v6.75--%>
                <hr />
                 <h5>GliderScore 6.75 with Digital Timer 1.19</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Package (13.0MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles675_2024-08-23.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfilePrevious/GliderScoreExe675_2024-08-23.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.76 Build 2025-01-26</li>
                        <li>GliderScoreDigitalTimer.exe 1.19 Build 2024-08-23</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>

                <%--GLIDERSCORE v6.74--%>
                <hr />
                <h5>GliderScore 6.74 with Digital Timer 1.18</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Package (13.0MB)"
                    onclick="window.open('zipfilePrevious/gliderscorefiles674_2024-05-20.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfilePrevious/GliderScoreExe674_2024-05-20.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.74 Build 2024-05-20</li>
                        <li>GliderScoreDigitalTimer.exe 1.18 Build 2024-05-20</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>

                <%--GLIDERSCORE v6.73--%>
                <hr />
                <h5>GliderScore 6.73 with Digital Timer 1.17</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Package (12.4MB)"
                    onclick="window.open('zipfilePrevious/gliderscorefiles673_2024-03-12.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfilePrevious/GliderScoreExe673_2024-03-12.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.73 Build 2024-03-12</li>
                        <li>GliderScoreDigitalTimer.exe 1.17 Build 2024-03-12</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>




                <%--GLIDERSCORE V6.72--%>

                <hr />
                <h5>GliderScore 6.72 with Digital Timer 1.16</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Package (12.4MB)"
                    onclick="window.open('zipfilePrevious/gliderscorefiles672_2024-01-31.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Package'</b> to get the latest updated versions of
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,
                    Pilots*.csv (for importing pilot data), all language files,<br />
                    gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                                          
                         
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Programs (4.81MB)"
                    onclick="window.open('zipfilePrevious/GliderScoreExe672_2024-01-31.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore Programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li>GliderScore.exe 6.73 Build 2024-03-12</li>
                        <li>GliderScoreDigitalTimer.exe 1.17 Build 2024-03-12</li>
                        <li>gma.qrcodenet.encoding.dll (generates QR codes)</li>
                    </ul>
                </p>



                <%--GLIDERSCORE v6.71--%>

                <hr />
                <h5>GliderScore 6.71 with Digital Timer 1.14</h5>


                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles671_2023-07-21.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>



                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe671_2023-07-21.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing .)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.71</b> Build 2023-07-21</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.14</b> Build 2023-07-21</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>







                <%--GLIDERSCORE v6.70--%>

                <hr />
                <h5>GliderScore 6.70 with Digital Timer 1.14</h5>

                <p>GliderScore Version 6.70 has been replaced by Version 6.71.<br />
                    Digital Timer Version 1.14 has been replaced by Version 1.15 (because Version 1.14 did not work on many PCs.)<br />
                    These versions are no longer available for download.<br />
                    Please use a later version.
                </p>

                <%--GLIDERSCORE v6.69--%>

                <hr />
                <h5>GliderScore 6.69 with Digital Timer 1.13</h5>


                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles669_2022-12-12.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>



                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe669_2022-12-12.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.69</b> Build 2022-12-12</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.13</b> Build 2022-01-24</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>


                <%--GLIDERSCORE v6.68--%>

                <hr />
                <h5>GliderScore 6.68 with Digital Timer 1.13</h5>


                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles668_2022-06-02.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                        
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe668_2022-06-02.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.69</b> Build 2022-12-12</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.13</b> Build 2022-01-24</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>

<%--GLIDERSCORE v6.67--%>

                <hr />
                <h5>GliderScore 6.67 with Digital Timer 1.13</h5>
                
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right:5px; margin-right:5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles667_2022-01-24.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
               
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe667_2022-01-24.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.67</b> Build 2022-01-24</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.13</b> Build 2022-01-24</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>
                                                                                           
<%--GLIDERSCORE v6.66--%>

                <hr />
                <h5>GliderScore 6.66 (Update 1) with Digital Timer 1.12</h5>
                              

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles666_2021-11-22U1.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

               


                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe666_2021-11-22U1.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.66</b> Build 2021-11-22 U1</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.12</b> Build 2021-08-30</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>





                <hr />
                <h5>GliderScore 6.65 with Digital Timer 1.12</h5>
               


                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles665_2021-08-30.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>





                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe665_2021-08-30.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.66</b> Build 2021-11-08</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.12</b> Build 2021-08-30</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>






                <hr />
                <h5>GliderScore 6.64 (Update 1) with Digital Timer 1.11</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles664_2021-06-01.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>
                                                          
                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.17MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe664_2021-06-01.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: Updates to GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.64</b> Build 2021-06-01</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.11</b> Build 2021-06-01</li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>
                                                                                                                                       
                <hr />
                <h5>GliderScore 6.63 (Update 1) with Digital Timer 1.10</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: black; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore Pack (12.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles663U1.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 400px; margin-top: 0px; margin-right: 5px; margin-right: 5px;"
                    value="GliderScore programs (4.16MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe663U1.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <font color="darkslateblue">(Note: GliderScore and the DigitalTimer are designed to work together. You must extract all files, replacing previous versions.)</font><br />
                    <b>Download GliderScore programs</b> - includes<br />
                    <ul style="margin-left: 40px">
                        <li><b>GliderScore.exe 6.63U1</b> Build 2020-12-03</li>
                        <li><b>GliderScoreDigitalTimer.exe 1.10</b> Build 2020-11-30<br />

                        </li>
                        <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                    </ul>
                </p>

                <hr />
                <h5>GliderScore 6.62 (Update 1) with Digital Timer 1.09</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right: 5px;"
                    value="GliderScore Pack (11.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles662U1.exe', 'download'); return false;" />
                    
                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right: 5px;"
                    value="GliderScore programs (33.5MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe662U1.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.62</b> Build 2020-02-17 + Update 1</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.09</b> Build 2020-02-17</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                        </ul>
                </p>

                <hr />
                <h5>GliderScore 6.61 with Digital Timer 1.08</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (11.9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles661U1.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database file with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (33.5MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe661U1.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.61</b> (Update 1) Build 2019-12-27</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.08</b> Build 2019-12-10</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>Audio files for the Digital Timer.</b></li>
                            <li><b>New F3K related Audio AND a Timer file for the Digital Timer.</b></li>
                            <li><b>New F3K related audio file for the 15 minute task.</b></li>
                        </ul>
                </p>

                <hr />
                <h5>GliderScore 6.60</h5>
                <p style="padding-left: 40px">
                    GliderScore 6.60 was a major release but had some significant bugs.<br />
                    It was withdrawn and replaced with GliderScore 6.61.<br />
                    GliderScore 6.60 is not available for download.<br />
                </p>

                <hr />
                <h5>GliderScore 6.59</h5>
                <p style="padding-left: 40px">
                    GliderScore 6.59 was a Beta release for evaluation purposes.<br />
                    It was never officially released.<br />
                    For technical reasons the next released version was GliderScore 6.60 with GliderScoreDigitalTimer 1.08.<br />
                    Both were officially released on 2019-12-12.
                </p>

                <hr />
                <h5>GliderScore 6.58 with Digital Timer 1.07</h5>
                <hr />
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.6MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles658.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.3MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe658.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.58 (Update5)</b> (Build 2019-04-07)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.07</b> (Build 2019-03-31)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                        </ul>
                </p>
                <br />

                <hr />
                <h5>GliderScore 6.57 with Digital Timer 1.06</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.6MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles657.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.3MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe657.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.57 (Update1)</b> (Build 2019-01-29)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.06</b> (Build 2018-12-17)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                        </ul>
                </p>
                <br />


                <hr />
                <h5>GliderScore 6.56 with Digital Timer 1.05</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.6MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles656.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.3MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe656.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.56</b> (Build 2018-09-19)(Update 3)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.05</b> (Build 2018-09-19)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                        </ul>
                </p>
                <br />


                <hr />
                <h5>GliderScore 6.55 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.7MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles655.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.2MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe655.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.55</b> (Build 2018-06-18)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-12-05)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                        </ul>
                </p>
                <br />





                <hr />
                <h5>GliderScore 6.54 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.7MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles654.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.2MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe654.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.54</b> (Build 2018-03-28)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-12-05)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>
                </p>
                <br />



                <hr />
                <h5>GliderScore 6.53 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9.7MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles653.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), all language files, gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (2.2MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe653.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.53</b> (Build 2017-11-15)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-12-05)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>
                </p>
                <br />


                <hr />
                <h5>GliderScore 6.52 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles652.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (1.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe652.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.52</b> (Build 2017-06-01)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-06-08)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>

                </p>


                <br />

                <hr />
                <h5>GliderScore 6.51 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles651.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (1.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe651.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.51</b> (Build 2016-12-05)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-06-08)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>

                </p>


                <br />
                <hr />




                <h5>GliderScore 6.50 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles650.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (1.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe650.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.50</b> (Build 2016-09-02)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-06-08)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>

                </p>


                <br />
                <hr />
                <h5>GliderScore 6.49 with Digital Timer 1.04</h5>
                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles649.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,<br />
                    Pilots*.csv (for importing pilot data), gma.qrcodenet.encoding.dll, lame.exe (needed for BigTimer) and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore programs (1.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe649.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>1. Download GliderScore programs</b> - includes
                        <ul style="margin-left: 40px">
                            <li><b>GliderScore.exe 6.49</b> (Build 2016-06-08)</li>
                            <li><b>GliderScoreDigitalTimer.exe 1.04</b> (Build 2016-06-08)</li>
                            <li><b>gma.qrcodenet.encoding.dll</b> (generates QR codes)</li>
                            <li><b>lame.exe</b> (converts .wav files to .mp3 format)</li>
                        </ul>

                </p>
                <%--                ***************************************************************************************************************************--%>
                <br />
                <hr />
                <h5>GliderScore 6.48 and Digital Timer 1.03</h5>

                <p><b>IF YOU DO NOT HAVE GLIDERSCORE</b></p>
                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore Pack (9MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles648.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Download this 'Pack'</b> to get the latest updated versions of<br />
                    GliderScore.exe, GliderScoreDigitalTimer.exe, audio files for DigitalTimer, database files with sample competitions,
                       Pilots*.csv (for importing pilot data), gma.qrcodenet.encoding.dll and ReadMe.txt.<br />
                    When finished downloading, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <input type="button" name="Button" style="color: red; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="Audio timer files for GliderScore AudioPlayer (75MB)"
                    onclick="window.open('zipfileprevious/GliderScoreAudioforAudioPlayer.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Optional - Download these audio timer files.</b><br />
                    These files are pre-set to work with GliderScore AudioPlayer. They are not required for the DigitalTimer. 
                       This is a 'once only' download.<br />
                    <b>Special audio files</b> (ALES, 12m working time, etc) can be downloaded <a href="Download-OtherAudio.aspx">here</a>. 
                </p>

                <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore 6.39 Pack for Windows XP / .Net 3.5 (0.6MB)"
                    onclick="window.open('zipfileprevious/gliderscorefiles639.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Download this 'Pack' to run GliderScore on Windows XP.</b><br />
                    GliderScore 6.39 does not have audio or timer capabilities.
                </p>
                <br />

                <%--  *****************  IF YOU ALREADY HAVE GLIDERSCORE  ********************    --%>
                <p><b>IF YOU ALREADY HAVE GLIDERSCORE</b></p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="GliderScore 6.48 (1.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreExe648.exe', 'download'); return false;" />
                <p style="padding-left: 40px"><b>1. Download GliderScore.exe</b> (Build 2016-02-16) includes gma.qrcodenet.encoding.dll.</p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="DigitalTimer 1.03 (81KB)"
                    onclick="window.open('zipfileprevious/GliderScoreDigitalTimerExe103.exe', 'download'); return false;" />
                <p style="padding-left: 40px">

                    <b>2. Download GliderScoreDigitalTimer.exe</b> (Build 2016-02-23).
                </p>
                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="Audio files for GliderScore DigitalTimer (8MB)"
                    onclick="window.open('zipfileprevious/GliderScoreAudioforDigitalTimer.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>3. Download the 'Audio Files for GliderScore DigitalTimer'</b> (once only download).<br />
                </p>

                <p style="padding-left: 40px">
                    When finished all downloads, navigate to C:\GliderScore6 and click on GliderScore.exe to run the program.
                </p>

                <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="Audio timer files for GliderScore AudioPlayer (75MB)"
                    onclick="window.open('zipfileprevious/GliderScoreAudioforAudioPlayer.exe', 'download'); return false;" />

                <p style="padding-left: 40px">
                    <b>Optional - Download these audio timer files.</b><br />
                    These files are pre-set to work with GliderScore AudioPlayer. They are not required for the DigitalTimer.
                         This is a once only download.<br />
                    <b>Special audio files</b> (ALES, 12m working time, etc) can be downloaded <a href="Download-OtherAudio.aspx">here</a>. 
                </p>

                <input type="button" name="Button" style="color: darkslateblue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px; margin-right:5px;"
                    value="'F3J Enter Cms' Landing table (0.1MB)"
                    onclick="window.open('zipfileprevious/GliderScoreLanding.exe', 'download'); return false;" />
                <p style="padding-left: 40px">
                    <b>Optional - Download the 'F3J Enter Cms' landing table.</b><br />
                    The table has one entry for each centimetre out to 15 metres<br />
                    and was used for the 2012 F3J WC.<br />
                    When finished downloading follow the instructions in the 'GliderScore Landing Help.txt' file.  
                </p>

                <hr />
                <p>End: GliderScore 6.48 and Digital Timer 1.03</p>
                <hr />


            </ContentTemplate>
        </asp:TabPanel>


        <asp:TabPanel runat="server" ID="GliderScoreUpdates" HeaderText="GliderScore Updates" TabIndex="1">
            <ContentTemplate>
                                                                      
                <h5>GliderScore Updates</h5>
                <p>
                    Updates usually involve extensive changes.  I do a lot of testing but I cannot test everything.<br />
                    <b>Send me an email (gerry.carter(at)gliderscore.com) if you find any problems with GliderScore.</b><br />
                </p>

                <p>GliderScore 6.78</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.78 Build 2025-07-01</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS Website - GliderScore.com is now https instead of http.</li>
                    <li>GS - The selected Registration option now relates to a competition instead of becoming the default for the whole system.</li>
                    <li>GS - Score Check function now shows all pilots in a round. Previously only showed pilots having out-of-range values.</li>
                    <li>GS - A new translation file for Polish has been contributed by Andrzej Kokoszka.<br />
                            It is included in the full download and is also available from the Translate page.</li>
                    <li>GS - Updated country codes for Singapore and Lebanon to new IOC codes.</li>
                    <li>GS - F3K - New task L, one flight in 7 minutes (6:59 max) is now supported.</li>
                </ul>

                <p>GliderScore 6.77</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 4 Build 2025-04-22</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>GS - Fixes bug - Create Playlist - incorrect display time if announcements are during preparation time.<br />No effect on actual running of the Digital Timer.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 3 Build 2025-04-14</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug preventing 'Create a New Group' (option in Scoring screen) from working.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 2 Build 2025-04-07</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug in 'Draw Helpers' report when there are two unequal groups per round.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 1 Build 2025-03-26</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Fixes bug preventing generation of a playlist for the Digital Timer program.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Build 2025-03-25</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Additional score entry validation created for (NonFAI) Electric class.</li>
                    <li>GS - For F5B - added scoring column for no laps flown penalty (Rule 5.5.4.5 f)</li>
                    <li>GS - Number of characters allowed for pilot's first and last names increased to 30.</li>
                    <li>GS - FAI Class F3G is now fully supported by GliderScore.</li>
                </ul>


                <p>GliderScore 6.76</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.76 Build 2025-01-26</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - Major rewriting of code for Flight Scores reports. While most reports will appear to be unchanged, maintainability is greatly improved.</li>
                    <li>GS - Flight Scores reports for ALES better reflect the scoring system in use.</li>
                    <li>GS - Truncation of long names on some reports has been fixed so that names will print in full.</li>
                    <li>GS - Various user requests have been adopted and some bugs have been found and fixed.</li>
                </ul>

                <p>GliderScore 6.75</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.75 Build 2024-08-23</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>GS - F5K2024 Updated so that phone data entry uses keypad instead of dropdown lists.</li>
                    <li>GS - F5K2024 Must update to this version to continue to use eScoring as data storage format has changed.</li>
                    <li>GS - Minor bug fixes and enhancements.</li>
                </ul>

                <p>GliderScore 6.74</p>
                
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.74 Build 2024-05-20</b> (with GliderScoreDigitalTimer 1.18 Build 2024-05-20)</li>
                    <li>GS - Updated to make FAI_ID available for online Results download.</li>
                    <li>GS - Custom Reports - FlyOff & Prelim Results report. Now shows percentages for every pilot.</li>
                    <li>GS - F5K - Bug fix to enable change to 'Nominal Launch Height' in all relevant places.</li>
                </ul>
       
                <p>GliderScore 6.73</p>
                
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.73 Build 2024-03-12</b> (with GliderScoreDigitalTimer 1.17 Build 2024-03-12)</li>
                    <li>GS - Updated for F3K FAI Rule changes effective 2024-01-01.</li>
                    <li>GS - made some small but significant useability changes.</li>
                    <li>OnLineScoring - Data entry method changed to keypad for class F3K.</li>
                </ul>

                <p>GliderScore 6.72</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.72 Update 1 Build 2024-01-31</b> (with GliderScoreDigitalTimer 1.16 Update 2 Build 2024-01-31)</li>
                    <li>GS - Critical update for users of eScoring.<br /> Fixes Download bug where, on the first download, all score records were marked as Updated = 'True'.<br />
                        This prevented any further downloads being accepted into the local database.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.72 Build 2024-01-16</b> (with GliderScoreDigitalTimer 1.16 Build 2024-01-16)</li>
                    <li>GS - Raw Score (Points) now displays with decimals according to the selected timing decimal places.</li>
                    <li>GS - Various bug fixes.</li>
                    <li>OnLineScoring - Data entry method is changing to keypad in place of dropdown lists where appropriate.</br>
                        F5J is the first to be changed to the new method. Other classes will be updated progressively.
                    </li>
                </ul>



                <p>GliderScore 6.71</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.71 Build 2023-07-19</b> (with GliderScoreDigitalTimer 1.15 Update 1 Build 2023-07-21)</li>
                    <li>DT - Fixed bug where round number and group number output to COM port was incorrect.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.71 Build 2023-07-19</b> (with GliderScoreDigitalTimer 1.15 Build 2023-07-19)</li>
                    <li>GS - Bug fix related to Distance task scoring data entry.</li>
                    <li>GS - From this version, requires .Net Framework 4.8 (Runtime).</li>
                    <li>DT - Bug fix related to timing of output to COM ports.</li>
                    <li>DT - From this version, requires .Net Framework 4.8 (Runtime).</li>
                </ul>

                <p>GliderScore 6.70</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.70</b> (with GliderScoreDigitalTimer 1.14)</li>
                    <li>GS + DT - Both programs replaced shortly after release and no longer available for download.</li>
                </ul>

                <p>GliderScore 6.69</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.69 Build 2022-12-12</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS - Upgraded to implement new F5J rules about Motor ReStart. See the <a href="CompF5J.aspx">F5J</a> page for more details.</li>
                    <li>GS - Various minor bug fixes and enhancements.</li>
                    <li>GS - F5L now selectable as its own competition class.</li>
                </ul>

                <p>GliderScore 6.68</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 U5 Build 2022-07-18</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - Digital Timer Playlist - fixed timing of announcements where '...AFTER preparation time starts' is selected AND some timer items are marked to play only on Round change.</li>
                    <li>GS BugFix - Made Information text scrollable so that all information can be read.</li>
                    <li>GS BugFix - For F5K: Bug in Competitions=>Merge code. </li>
                    <li>GS BugFix - For F5K: Bug in Scoring=>Move Pilot code when Lanes are being used.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 U4 Build 2022-06-02</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - For F5K: Fixed another bug related to F5K users in regions using the comma as the decimal separator.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 U3 Build 2022-05-27</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - For F5K: Fixed bug causing incorrect height points calculations in regions using the comma as the decimal separator.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 U2 Build 2022-05-22</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - Email Reports: Fixed bug causing attachments to be added more than once per email sent.</li>
                </ul>
                                             
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 U1 Build 2022-04-19</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - eScoring Upload Code fixed for computers using the comma as the decimal separator.</li>
                    <li>GS Update - The Pilot Listing report now has the option to include the System Pilot Number in the output.</li>
                </ul>
                                                                      
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.68 Build 2022-03-01</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS BugFix - Email Reports function to send eScoring links fixed.</li>
                    <li>GS Update - Competition Series report can be run using normalised scores OR score points.<br />
                        This means that you could select a preliminary comp with its flyoff comp to create a series<br />
                        where both preliminary comp and flyoff scores are all counted in the final result.</li>
                    <li>GS Update - improved screen handling of functions within the eScoring menu.</li>
                    <li>GS Update - improved translation possibilities by adding many words and phrases to the English.lng file.</li>
                </ul>
                               
                <p>GliderScore 6.67</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.67 Build 2022-01-24</b> (with GliderScoreDigitalTimer 1.13 Build 2022-01-24)</li>
                    <li>GS Update - Improved screens related to eScoring Download and Upload processes.<br />
                    <li>GS Update - Various changes to go from the F3RES comp type to the new FAI F3L comp type (for RES gliders).<br />
                    <li>GS Update - FAI F3L rules 2024 available for download  <a href="/zipfile/sc4_vol_f3_soaring_24_F3L.pdf">here</a>.<br />
                    <li>GS Bug fix - Fixed bug causing Auto Download/Upload to fail on some systems (particularly new instals).<br />
                </ul>

                <p>GliderScore 6.66</p>
                
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.66 Build 2021-11-22</b> (with GliderScoreDigitalTimer 1.12 Build 2021-08-30)</li>
                    <li>GS Update - Email Reports: code extensively updated.
                    <li>GS Update - Email Reports: if using eScoring, can now email links for pilots, teams or all pilots.<br />
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Pilots can click on their link to go to their scoring screen.
                    </li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.66 Build 2021-11-08</b> (with GliderScoreDigitalTimer 1.12 Build 2021-08-30)</li>
                    <li>GS Update - OnLine Scoring Automatic Download/Upload feature added. More information click <a href="Scoring.aspx?eScoringForOrganisersAutoDnUp">here</a>.
                    <li>GS Update - Various screens changed to a more intuitive layout.</li>
                    <li>GS Bug fix - A number of bug fixes are included with this release.</li>
                </ul>
                               
                <p>GliderScore 6.65</p>

                  <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.65 Build 2021-08-18</b></li>
                    <li>Bug fix - Email Reports: Sent attachments but not the message body.</li>
                    <li>Bug fix - Email Reports: Took too long to send emails. Time needed is now much shorter.</li>
                    <li>Bug fix - Stopped DigitalTimer=>OpenTimer from crashing because of conflicting date formats.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.65 Build 2021-08-16 </b>(with GliderScoreDigitalTimer 1.12 Build 2021-08-16)</li>
                    <li>Feature - For F5K - Enter scores by pilot fully implemented.</li>
                    <li>Feature - Enhanced Competition=>Merge functions. More information <a href="MainMenu.aspx?Merge">here</a>.</li>
                    <li>Feature - Merge playlists has largely been re-written.</li>
                    <li>Feature - Digital Timer: Full file path removed from playlist data.</li>
                    <li>Feature - Email Reports: Links to pilot's eScoring pages can be automatically included. More information <a href="Reports.aspx?EmailReports">here</a>.</li>
                    <li>Bug fix - Draw Report (small format) will not over-write the page footer.</li>
                    <li>Bug fix - Fix scores upload when decimal separator is a comma.</li>
                    <li>Bug fix - various minor bug fixes.</li>
                </ul>
                                               
                <p>GliderScore 6.64</p>

                 <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.64 Build 2021-06-01</b></li>
                    <li>Feature - Timer clock colours can now be changed.</li>
                    <li>Feature - Timer (reduced size) window can be made full screen.</li>
                    <li>F5K Rule Refinement for Task C. See details <a href="CompF5K.aspx">here.</a></li>
                    <li>Bug fix - Big Timer working again.</li>
                    <li>Bug fix - various minor bug fixes.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.64 Build 2021-04-06 Update 1</b> (2021-05-13)</li>
                    <li>Bug fix - Timer files 'Browse' for file not working.</li>
                    <li>Bug fix - Digital Timer not working (crashes) on some laptop PCs.</li>
                    <li>Bug fix - When scoring speed task, scoring screen not sorting correctly on sequence number column.</li>
                    <li>Feature - Export Comp - can now choose download location and file name.</li>
                    <li>Feature - Import Comp - can now browse to location and name of file to import.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.64 Build 2021-04-06 and GliderScoreDigitalTimer 1.11 Build 2021-04-06</b></li>
                    <li>GliderScore - DigitalTimer and Audio Player<br />
                        New process for merging playlists from two (or more) competitions.<br />
                        - The merged playlist will run (say) seniors/juniors or F3K/F5K with no need to do anything at the changeover.<br />
                        - There is greatly increased flexibility provided with this change.</li>
                    <li>If a playlist exists for a competition it will be automatically loaded in the DigitalTimer/AudioPlayer screen.<br />
                        - If there are no changes required simply click on Open Timer/Start Player to proceed.</li>
                    <li>eScoring - modified server database to allow for Chinese words to be correctly displayed.</li>
                    <li>Scoring screen - improved process for moving to a different round, group or reflight.</li>
                    <li>A number of minor bugs have been fixed.</li>
                </ul>

                <p>GliderScore 6.63 (Update 1)</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.63 Build 2020-12-03</b></li>
                    <li>GliderScore - Fixes a minor bug in the preliminary checks before the Draw Rounds program starts.</li>
                    <li>GliderScore 6.63 and GliderScoreDigitalTimer 1.10 Build 2020-11-30</li>
                    <li>GliderScore - Major upgrade to include class F5K for both PC and eScoring. More information here.</li>
                    <li>GliderScore - Flight Scores report options: group by flight groups or pilot names; run for all pilots or selected pilots.</li>
                    <li>DigitalTimer - Upgraded to support two COM ports simutaneously. More information here.</li>
                    <li>DigitalTimer - Upgrade to support new Pandora functions. More information here.</li>
                    <li>Database Backups - Minimum of 10 retained. Backups deleted if more than 10 and over 3 months old.</li>
                    <li>eScoring - If closing competition and last action was a download, message given suggesting upload before closing.</li>
                </ul>
                                                          
                <p>GliderScore 6.62</p>

                   <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.62 Build 2020-02-17</b></li>
                    <li>Merge playlists from any two competitions (with the same competition date) into a single playlist.<br>
                        Example: fly seniors round 1 groups followed by juniors round 1 groups, then seniors round 2 ....<br />
                        More info at Display/Timer/Audio->Digital Timer->Create Playlist->Merge Playlists, or<br />
                        Display/Timer/Audio->Audio Player->Merge Playlists.
                    </li>
                    <li>Updated Pilot Listing reports. Group by country, team, frequency or pilot class.</li>
                    <li>Updated Score Records for F3K to allow more space for writing times to one decimal.<br />
                        Also added an optional portrait format with two score records per page.
                    </li>
                </ul>
                

                <p>GliderScore 6.61</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.61 Update 1 Build 2019-12-27 with Bug Fixes</b></li>
                    <li style="list-style: none">The latest downloads include these bug fixes.</li>
                    <li>2020-01-13 - Fixes issue where moving a pilot to another group could fail.</li>
                    <li>2020-01-03 - Fixes issue with DigitalTimer playlist creation involving F3K Tasks C(2) and/or C(3).</li>
                    <li>2020-01-01 - Fixes issue when Import(ing) a Timer that was previously Export(ed).</li>
                </ul>


                  <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.61 (Update 1) Build 2019-12-27)</b></li>
                    <li>F3K - Added Task E - Poker - 3 flights to time in 15 minutes.</li>
                    <li>Bug Fix - Scoring screen - Now formats cells correctly when changing the Round, Group or ReFlight numbers.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.61 Build 2019-12-18</b></li>
                    <li>Digital Timer Settings - Fixes various issues.</li>
                    <li>Digital Timer Settings - added the ability to play all announcements within Preparation Time.</li>
                </ul>



                <p>GliderScore 6.60</p>
                
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.60 Build 2019-12-10</b></li>
                    <li>Competition Setup - Type of competition is set by Class, not by selecting a task or tasks.</li>
                    <li>Create Playlist now allows specifying a 'From' round and group and a 'To' round and group.</li>
                    <li>Competition Series report
                        <br />
                        - Not-counted scores are now highlighted.<br />
                        - Percentage of winners score is now shown.
                    </li>
                    <li>Models and Devices -
                        <br />
                        - The 'Usual Model' field in Pilot maintenance has been removed.<br />
                        - Two new tables for Models and Devices have been added.<br />
                        - If 'Use Models?' is selected, all the models registered for each pilot can be entered in the 'Pilot Entry' screen.<br />
                        - Devices means any on-board device such as an AMRT device.<br />
                        - Each model is given its own Model ID.<br />
                        - The Model ID can be entered on the Score Card, in eScoring or the Scoring screen.<br />
                        - There is a new Models report.</li>
                    <li>English.lng file now includes the long form of abbreviated words.</li>
                    <li>Scoring On-line Download Missing Scores List - Pilots can now be marked 'Retired'.                        </li>
                    <li>If 'Use Teams?" is selected, there will be a new column in the Pilot Entry screen.<br />
                        - The column is headed 'OTS' meaning, Omit from Team Score.<br />
                        - A tick in this column excludes the pilot from team scoring completely.
                    </li>
                    <li>The F5J 'Height' report can optionally be run showing Height or Height Penalty.</li>
                    <li>Bug fixes -<br />
                        - If using lanes, and the lane was changed in the Scoring screen, changes were not saved. Fixed.<br />
                        - If a re-flight group was used the Overall Results report could crash. Fixed.<br />
                        - The Competition Series report could crash if run on a PC where the decimal separator was a comma. Fixed.
                    </li>
                    <li>F3K<br />
                        - Support for timing to one decimal place has been added.<br />
                        - New tasks for 2020 have been added to GliderScore and to eScoring.<br />
                        - A new 15 minute timer is added for the new task M.
                         - Non-FAI task 'O' is replaced with non-FAI task 'U10'. There is a new non-FAI task 'U15'.
                    </li>
                    <li>Timer Setup includes a new column 'Timer State'. this is to specify whether timer is<br />
                        in preparation time, testing time, no-fly time, working time, or landing time.<br />
                    </li>
                    <li>New 'Lanes' option - allocates a lane that is as close as possible to the team number (only if using teams).</li>
                    <li>Re-layout of some reports so that Country Code and FAI Number print together.</li>
                    <li>Create link to OnLine scores.<br />
                        In the eScoring Menu, get a link (URL) that goes directly to the competition.</li>
                    <li>Much improved scaling of all screens.</li>
                    <li>F3J/F5J correctly resolves ranking in the case of a tied score.</li>


                </ul>






                <p>GliderScore 6.59</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.59 (Build 2019-11-30) Released 2019-12-09</b></li>
                    <li>Competition Setup - Type of competition is set by Class, not by selecting a task or tasks.</li>
                    <li>Create Playlist now allows specifying a 'From' round and group and a 'To' round and group.</li>
                    <li>Competition Series report
                        <br />
                        - Not-counted scores are now highlighted.<br />
                        - Percentage of winners score is now shown.
                    </li>
                    <li>Models and Devices -
                        <br />
                        - The 'Usual Model' field in Pilot maintenance has been removed.<br />
                        - Two new tables for Models and Devices have been added.<br />
                        - If 'Use Models?' is selected, all the models registered for each pilot can be entered in the 'Pilot Entry' screen.<br />
                        - Devices means any on-board device such as an AMRT device.<br />
                        - Each model is given its own Model ID.<br />
                        - The Model ID can be entered on the Score Card, in eScoring or the Scoring screen.<br />
                        - There is a new Models report.</li>
                    <li>English.lng file now includes the long form of abbreviated words.</li>
                    <li>Scoring On-line Download Missing Scores List - Pilots can now be marked 'Retired'.                        </li>
                    <li>If 'Use Teams?" is selected, there will be a new column in the Pilot Entry screen.<br />
                        - The column is headed 'OTS' meaning, Omit from Team Score.<br />
                        - A tick in this column excludes the pilot from team scoring completely.
                    </li>
                    <li>The F5J 'Height' report can optionally be run showing Height or Height Penalty.</li>
                    <li>Bug fixes -<br />
                        - If using lanes, and the lane was changed in the Scoring screen, changes were not saved. Fixed.<br />
                        - If a re-flight group was used the Overall Results report could crash. Fixed.<br />
                        - The Competition Series report could crash if run on a PC where the decimal separator was a comma. Fixed.
                    </li>
                    <li>F3K<br />
                        - Support for timing to one decimal place has been added.<br />
                        - New tasks for 2020 have been added to GliderScore and to eScoring.<br />
                        - A new 15 minute timer is added for the new task M.
                         - Non-FAI task 'O' is replaced with non-FAI task 'U10'. There is a new non-FAI task 'U15'.
                    </li>
                    <li>Timer Setup includes a new column 'Timer State'. this is to specify whether timer is<br />
                        in preparation time, testing time, no-fly time, working time, or landing time.<br />
                    </li>
                    <li>New 'Lanes' option - allocates a lane that is as close as possible to the team number (only if using teams).</li>
                    <li>Re-layout of some reports so that Country Code and FAI Number print together.</li>
                    <li>For On-line scores, provides a link (URL) that brings up the competition immediately.</li>
                    <li>Much improved scaling of all screens.</li>
                    <li>F3J/F5J correctly resolves ranking in the case of a tied score.</li>
                </ul>

                <p>GliderScore 6.58</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 (Update 5 2019-04-15) Build 2019-04-07)</b></li>
                    <li>F3K Score Records report - Penalty column added.</li>
                    <li>Score Records - Moved QR Code slightly to avoid cropping when printed.</li>
                    <li>Score Records - Increased width of 'Time' column (except F3K).</li>
                    <li>Moved 'Export Pilots' button from Main Menu to Pilot (Master File Maintenance) screen.</li>
                    <li>Bug Fix - Program would crash if nothing was entered in Drop Scores box.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 (Update 4) Build 2019-04-07)</b></li>
                    <li>Bug fix - Score entry validations could cause program to crash.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 (Update 3) Build 2019-04-06)</b></li>
                    <li>Bug fix - Score time entry allowed invalid entries to be made.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 (Update 2 2019-04-05)</b></li>
                    <li>Bug fix - Importing competitions where there is more than one comp in the downloaded zip file.<br />
                        Release data remains at 2019-04-02.
                    </li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 (Update 1) 2019-04-02</b></li>
                    <li>Bug fix - Generation of QR codes not working.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.58 released 2019-03-31</b></li>
                    <li>Added support for seeded man-on-man competitions. Click <a href="DrawRounds.aspx?DrawSMOM">here</a> for more information.</li>
                    <li>Added dropdown list of 'Leaders' on Scoring screen.</li>
                    <li>Improved validation of F5J data entry.</li>
                    <li>Various bug fixes.</li>
                </ul>


                <p>GliderScore 6.57</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.57 (Update 1) 2019-01-29</b></li>
                    <li>Bug fix - Overall Results Report - error occurs if some pilots are retired and then later rounds are redrawn.</li>
                </ul>


                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.57 Released 2018-12-17</b></li>
                    <li>Reports<br />
                        - Overall Results report can (optionally) include flight details in addition to the usual data. Click <a href="Reports.aspx?OverallAndDetails">here</a> for more.<br />
                        - extensive changes to make it easy to select columns to show or hide.</br>
                        - Club can now be included in reports for the first time.<br />
                        - Restricted Scope options have been extended to more reports.</li>
                    <li>Competition Series - code updated to handle a mix of events in the one series (example F3J with F3K and F5J).</li>
                    <li>Competition Setup - Options to Print Country and/or Print Registration are now selected on the various Report Selection screens.</li>
                    <li>Various bug fixes.</li>
                </ul>

                <p>GliderScore 6.56</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.56 (Update 3) 2018-11-08</b></li>
                    <li>Bug fix - Overall Results Report - error when Restricted Scope Scoring is selected AND a pilot took a reflight in a different round.</li>
                    <li>Version details and Build Date remain unchanged.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.56 (Update 2) 2018-11-07</b></li>
                    <li>For F3K - Task descriptions now appear on relevant Draw reports.</li>
                    <li>Bug fix - Fixed bug in Restricted Scope Scoring when a pilot has two scores for the same Round.</li>
                    <li>Multiple instances of GliderScore can now be run at the same time (easily run two competitions at the same time). See FAQ 7 for more information.</li>
                    <li>Better handling of discard scores in Overall Results report regardless of the range of rounds selected.</li>
                    <li>Version details and Build Date remain unchanged.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.56 (Update 1) 2018-10-03</b></li>
                    <li>Bug fix for competitions where the same pilot can enter in more than one class.<br />
                        See FAQ number 1 for more information. Version details remain unchanged.
                    </li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.56 Released 2018-09-19</b></li>
                    <li>Competitions created using the Merge function now get a unique Competition ID.</li>
                    <li>Audio profile now stored with the competition and copied if used to create a new competition.</li>
                    <li>New 'Position Report' added. Shows pilot position at the end of each round.</li>
                    <li>F3K - Enforces rule 5.7.7 "where maximum or target flight times are specified, ... the sum of all flight<br />
                        times per task must not be greater than the working time minus the number of scored flights in seconds."
                    </li>
                    <li>Audio and Timer button is always enabled, even when a draw has not been created.</li>
                    <li>Where a report scope can be restricted, any number of the available restrictions can be applied<br />
                        (previously only one restriction was allowed).</li>
                    <li>Various bug fixes.</li>
                </ul>

                <p>GliderScore 6.55</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.55 Updated 2018-06-18</b></li>
                    <li><b>For F5B</b> - now allows for Laps Penalty (FAI Rule 5.5.4.5.f) for all scoring and reports.</li>
                    <li><b>For Big Timer</b> - code updated so that output is suitable for the latest version of Big Timer.</li>
                    <li><b>For Reports Menu</b> - 'QR Code List' report added. Prints a complete <a href="DrawRounds.aspx?QRCodeList">QR Code List</a> for a competition.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.55 Released 2018-05-09</b></li>
                    <li><b>For F3Q</b> - updated for correct handling of particular F3Q penalties.</li>
                    <li><b>For F5B</b> - functions (including eScoring) overhauled to comply with all current FAI rules.</li>
                    <li><b>For Digital Timer</b> - new type of timer event so that extra time can be added between rounds.</li>
                    <li><b>For Online Scoring</b> - 'Delete from server' button that removes all online data for a competition.</li>
                    <li><b>For Reports Menu</b> - 'Publish OnLine' button to publish competition data on the GliderScore website.</li>
                    <li>Many minor improvements and bug fixes.</li>
                </ul>

                <p>GliderScore 6.54</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.54 Updated 2018-03-18</b></li>
                    <li><b>Assign Helpers</b> function has been improved. Click <a href="Setup.aspx?DrawOptions">here</a> for more information.</li>
                    <li>Additional support in relation to separation of Class names from Pilot names for multi-class competitions.<br />
                        See MainMenu→Pilots→Multi-Task Competitions for more details.
                    </li>
                    <li>Improved code related to automatic score claculations.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.54 Released 2018-01-08</b></li>
                    <li><b>Assign Helpers</b> function added. Click <a href="Setup.aspx?DrawOptions">here</a> for more information.</li>
                    <li>Additional step introduced when creating fly-off competitions. Target time is selected before the fly-off comp is created.</li>
                    <li style="list-style: none;">Click <a href="Setup.aspx?NewComp">here</a> for more information.<br />
                    </li>
                </ul>

                <p>GliderScore 6.53</p>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.53 Released 2017-11-15</b></li>
                    <li><b>Publish online scores</b> for competitions in progress or completed competitions with a single click.</li>
                    <li style="list-style: none">Click <a href="OnLineScores.aspx">here</a> to go to the OnLine Scores page.</li>
                    <li><b>Support for F3RES</b> class has been added.</li>
                    <li><b>Update for F3Q</b> class so that duration task launch order is properly managed.</li>
                    <li><b>Support for Multi-Class competitions</b> has been added. Click <a href="MainMenu.aspx?MainMenuPilotsMultiClass">here</a> for more information.</li>
                    <li>eScoring was not working for some classes. Now works for all classes.</li>
                    <li>Small changes to some report layouts for better printing.</li>
                    <li>Various bug fixes.</li>
                    <li>'Email Reports' page has moved to the 'Reports' page.</li>
                </ul>

                <p>GliderScore 6.52</p>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.52 Update 2017-06-01</b></li>
                    <li style="list-style: none">Bug fix - fixes incorrect score calculations when using group score by time and<br />
                        using various flight times for different rounds.
                    </li>
                </ul>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.52 Update 2017-05-29</b></li>
                    <li>Bug fix - eScoring progressive results incorrectly formatted when using the comma as the decimal separator.</li>
                </ul>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.52 Update 2017-04-29</b></li>
                    <li>Bug fix - Custom audio files could be deleted in some circumstances.</li>
                    <li>eScoring - Missing Scores screen is now available from the Scoring screen.</li>
                    <li>Score Entry - Improvements to ensure correct score calculation.</li>
                    <li>Bug fix - Uploading in regions using comma as decimal separator could fail.</li>
                </ul>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.52 Update 2017-04-13</b></li>
                    <li>Bug fix - adding a new timer announcement did not work properly.</li>
                    <li>eScoring - revised code for date dependent operations such as backup and restore.</li>
                    <li>eScoring - additional validation of start height data entry.</li>
                </ul>
                <ul>
                    <li style="list-style: none"><b>GliderScore 6.52 Critical Update 2017-04-11</b></li>
                    <li>Bug fix - adding a pilot after the draw was made led to major errors.</li>
                    <li>eScoring - additional functions added. For more information click <a href="Scoring.aspx?eScoringOtherOptions">here</a>.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>GliderScore 6.52 Released 2017-04-02</b></li>
                    <li>New eScoring module.</li>
                    <li style="list-style: none">1 &nbsp Upload data to the cloud server.</li>
                    <li style="list-style: none">2 &nbsp Scan QRCode to access data on the cloud server.</li>
                    <li style="list-style: none">3 &nbsp Enter, then and Submit scores to the cloud server.</li>
                    <li style="list-style: none">4 &nbsp Download from the cloud server to the PC.<br />
                        &nbsp&nbsp&nbsp&nbsp Scores update automatically.</li>
                    <li style="list-style: none">5 &nbsp CD checks scores for a round.</li>
                    <li style="list-style: none">6 &nbsp CD uploads official scores to the cloud server.</li>
                    <li style="list-style: none">7 &nbsp Pilots view official scores on their phones.</li>
                    <li style="list-style: none">&nbsp&nbsp&nbsp&nbsp Available for all competition types including<br />
                        &nbsp&nbsp&nbsp&nbsp F3K&nbsp&nbsp F3B&nbsp&nbsp F3F&nbsp&nbsp F3Q&nbsp&nbsp F3J&nbsp&nbsp F5B&nbsp&nbsp F5J&nbsp&nbsp Thermal&nbsp&nbsp Electric&nbsp&nbsp ALES</li>
                    <li style="list-style: none">&nbsp&nbsp&nbsp&nbsp Click <a href="Scoring.aspx?eScoring">here</a> for details.</li>
                    <li>Added 'Over 75 metre' feature for F3J and F5J.</li>
                    <li>Greatly revised Height Penalty report for F5J.</li>
                    <li>Digital Timer audio has file NiceHorn.wav added.</li>
                    <li>Various minor bug fixes and user interface improvements.</li>
                </ul>

                <p>GliderScore 6.51</p>
                <ul>
                    <li style="list-style: none"><b>GliderScore 6.51 Released 2016-12-05</b></li>
                    <li>Support added for provisional class <a href="CompF3Q.aspx">F3Q Aero Tow Glider</a>.</li>
                    <li>New <a href="MainMenu.aspx?Merge">Merge</a> (competitions) function added.</li>
                    <li><a href="MainMenu.aspx?Export_Import">Export</a> (competitions) now allows for multiple competitions to be selected for export to a single .zip file.<br />
                        <a href="MainMenu.aspx?Export_Import">Import</a> (competitions) allows import of one competition at a time from the exported .zip file.
                    </li>
                    <li>Duration Task - Flight Time Validation<br />
                        General - flight time entered cannot exceed target time + 60 seconds.<br />
                        F3J and F5J - flight time entered cannot exceed target time.
                    </li>
                    <li>All translation files (*.lng, *.info) now moved to a subfolder '\Translations'.</li>
                    <li>Files lame.exe and gma.qrcodenet.encoding.dll now moved to subfolder '\Extensions'.</li>
                    <li>Various minor bug fixes and user interface improvements.</li>
                </ul>

                <p>GliderScore 6.50</p>
                <ul>
                    <li style="list-style: none"><b>GliderScore 6.50 Updated 2016-09-02</b></li>
                    <li>Bug fix - Creating a new re-flight group crashed the program. Now fixed.</li>
                    <li>Draw (Teams) report now includes letter codes for pilots in distance task.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>GliderScore 6.50 Released 2016-08-31</b></li>
                    <li>F5J - Draw reports for team events now indicate whether the draw was made with Team Protection ON or OFF.</li>
                    <li>F5J - Flight Scores report now shows Start Height as well as Height Penalty.</li>
                    <li>Removed the need for a separate GliderScoreDataStructure.mdb file. This file (GliderScoreDataStructure.mdb) can be safely deleted.</li>
                    <li>The encoding of all report downloads has been changed. Character accent marks will now print.</li>
                </ul>

                <p>GliderScore 6.49</p>
                <ul>
                    <li style="list-style: none"><b>GliderScore 6.49 Build 2016-06-08</b></li>
                    <li>Added support for Mickey Nowell's <a href="Audio.aspx?BigTimer">BIG TIMER</a>. GliderScore generates all required files for you.</li>
                    <li>Added a <a href="Scoring.aspx?ScoringInterface">scoring interface</a> for developers. Enables simple download of draw data and import of score data.</li>
                    <li>Score card 'books' now print with score card tops to the edge of the paper for easy stapling.</li>
                    <li>Added and improved processes for sizing windows for different screen sizes and resolutions.</li>
                    <li>Added database copy function. Right-click the <b>Backup DB</b> button to access this feature.</li>
                    <li>Up to eight named audio profiles now can be stored (examples F3J; F3J FlyOff; F5J; F5J FlyOff).</li>
                    <li>F5B support updated for latest rules, particularly the Watt-min rule.</li>
                </ul>

                <p>
                    GliderScore 6.48<br />
                </p>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.48 Updated 16 Feb 2016</b> (Build 2016-02-16)</li>
                    <li>Bug fix to do with Export/Import Pilots from Main Menu.</li>
                </ul>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.48 Released 13 Jan 2016</b> (Build 2016-01-13)</li>
                    <li>Added 'Country Codes' table. This table is populated with all the country codes used by</br>
                                the International Olympic Committee and in turn used by the FAI.</br> 
                                Click <a href="MainMenu.aspx?CountryCodes">here</a> for more information.
                    </li>
                    <li>Added new 'Matrix Badge' to reports.</br>
                                 The Martix Badge prints a separate badge for each pilot with a table showing,</br>
                                 for each round of the draw, the pilot's flight group.</br>
                                 This is sized so that it can easily slip into a holder similar to a name badge holder.</br>
                                 Click <a href="DrawRounds.aspx?MatrixBadge">here</a> for more information.</li>
                    <li>Custom Reports</br>
                                 Custom reports have been added that will print two selected logos, six lines of header information</br>
                                 and two lines of report footer information.</br>
                                 Reports that can be customised in this way are</br>
                                  - Overall Results</br>
                                  - Team Results</br>
                                  - Team Results - Summary</br>
                                  - Fly-Off and Prelim Results (a report combining results for the whole competiton)</br>
                                Click <a href="Reports.aspx?CustomReports">here</a> for more information.
                    </li>
                    <li>QRCodes to print on Score Cards</br>
                                 It is now possible to print Score Cards with a QRCode.</br>
                                 This is mainly for developers of software to gather scores using smartphones.</br>
                                 It resolves the problem of getting the data needed to insert the score into the database correctly.</br>
                                 The information to be encoded is freely configurable and can include any or all key fields of the Scores table as well as some other data.</br>
                                 Click <a href="MainMenu.aspx?QRCodeSetup">here</a> for more information.</br>
                                 Click <a href="DrawRounds.aspx?QRCodedScoreCards">here</a> to see QRCoded Score Cards.
                    </li>
                </ul>



                <p>
                    GliderScore 6.47<br />
                </p>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.47 Update 12 Jul 2015</b> (Build 2015-07-12)</li>
                    <li>Updated so that F3K (digital) timers can shared using the Export and Import facility.<br />
                        In the case of F3K (digital) timers, on Import the existing data will be replaced with the new data.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.47 Update 30 Jun 2015</b> (Build 2015-06-30)</li>
                    <li>Updated design of Score Cards for competitions with a duration task.<br />
                        The new design provides for the various landing scenarios.<br />
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.47 Update 11 Jun 2015</b> (Build 2015-06-11)</li>
                    <li>Bug fix for new installations to do with adding support for new F3K task 'Big Ladder'.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.47 Released 25 May 2015</b> (Build 2015-05-25)</li>
                    <li>Support for new F3K task 'Big Ladder' added as Task K.<br />
                        Audio for task announcement is automatically generated for you.</li>
                    <li>Some improvements to pilot editing from Pilot Entry screen.<br />
                        Changes to pilot class and country data is immediately reflected in Pilot Entry grid.
                    </li>
                </ul>


                <p>
                    GliderScore 6.46<br />
                </p>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.46 Released 10 May 2015</b></li>
                    <li>New 'Swap Lanes' function added. See more <a href="DrawRounds.aspx?SwapLanes">here</a>.</li>
                    <li>Emailing reports - all recipients are now BCC for improved privacy and security.</li>
                    <li>Bug fix - Team Results report was not working, now fixed.</li>
                    <li>Added 'Build' identifier to bottom left of screen. This is 'Build 2015-05-10'.</li>
                </ul>

                <p>
                    GliderScore 6.45<br />
                </p>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.45 Updated 26 April 2015</b></li>
                    <li>Fixed formatting issue with Audio Player setup screen.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.45 Updated 23 April 2015</b></li>
                    <li>Bug fix to do with Digital Timer setup options.<br />
                        Some of the 'Play pilot names in working time' options did not work correctly.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.45 Updated 16 April 2015</b></li>
                    <li>The database backup system has had improvements.</li>
                    <li>Timer data can now be exported and imported from the Timer maintenance screen.</li>
                    <li>For F3K, announcements of pilots for the next group can now be made in working time.</li>
                    <li>Pilot announcements in working time can now be made twice.</li>
                    <li>The DigitalTimer program has had improvements to the Pause/Resume function.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>VERSION 6.45 Updated 8 April 2015</b><br />
                        The database backup protocol has been greatly strengthened.<br />
                        Backups will be automatically created each time the program is closed<br />
                        until at least five backups have been made. After that has been done,<br />
                        the user will be asked to confirm creation of a new backup.<br />
                        Backups are kept in C:\GliderScore6\Backup folder.                        
                    </li>
                </ul>
                <ul>
                    <li style="list-style: none"><b>VERSION 6.45 Released 6 April 2015</b></li>
                    <li><b>Digital Timer</b><br />
                        Implemented integrated audio, timing and with external clock display panel. <a href="Audio.aspx">(details)</a>.<br />
                        F3J/F3K/F5J/Thermal etc are fully supported.<br />
                        This removes the need to have pre-recorded timing files.<br />
                        The Digital Timer is extremely accurate and is usable without a display clock.
                    </li>

                </ul>


                <p>
                    GliderScore 6.44<br />
                </p>

                <ul>
                    <li><b>Updated 24 November 2014</b><br />
                        <b>Bug fix</b> - Running Results/Overall Results Report run from Scoring screen would not run following<br />
                        changes on 20 October 2014. Now fixed.</li>
                    <li>Some formatting issues on the Scoring screen have been fixed.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 4 November 2014</b></li>
                    <li><b>Bug fix</b> - Solved problem importing competition database from a previous version.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 20 October 2014</b></li>
                    <li><b>Pilot Entry</b> - Switch Pilots function is now available at all times (previously, only after a draw).</li>
                    <li><b>Overall Results</b> - report can now be run for any range of Rounds flown.<br />
                        Enables a two day comp to be treated as two one-day comps, particularly for LSF purposes.</li>
                    <li><b>Audio player</b> - can now repeat audio for round/group and pilot name announcements.</li>
                    <li><b>Translations</b> - English.lng file has four new entries related to Audio changes.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 14 September 2014</b></li>
                    <li><b>Bug fix</b> - Fixed problem importing competition from previous versions.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 7 September 2014</b></li>
                    <li><b>Bug fix</b> - Pilot Import function on Main Menu now works properly.</li>
                    <li><b>Bug fix</b> - Lane number (if used) now prints on Score Card.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 13 August 2014</b></li>
                    <li><b>Bug fix</b> - Program may fail to load where the decimal symbol is a comma.<br />
                        Due to error in new function that checks database version before applying updates.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Released 22 July 2014</b></li>
                    <li><b>Audio Player</b><br />
                        New functions to create audio playlist to run competition while you fly <a href="Audio.aspx">(details)</a>.</li>
                    <li><b>Full support for all variants of F3K tasks A, B and C.</b></li>
                    <li><b>Selecting F3K tasks for each round is now much easier.</b></li>
                    <li><b>English.lng</b> file has additional entries related to the 'Audio' screens.</li>
                </ul>

                <p>
                    GliderScore 6.43<br />
                </p>

                <ul>
                    <li style="list-style: none"><b>Update 11 June 2014</b></li>
                    <li>Bug fix - Overall Results report failed to run if Report Scope selection was Country, Club or Class.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Update 5 June 2014</b></li>
                    <li><b>Keyboard shortcuts added to Scoring screen navigatin buttons.</b><br />
                        Use Ctrl+Right, Ctrl+Left, Ctrl+Home or Ctrl+End to change group. <a href="Scoring.aspx">(details)</a>.</li>
                    <li><b>Minor bug fix</b><br />
                        Rounds selection for Draw (Teams) report had no effect. Now fixed.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Released 21 May 2014</b></li>
                    <li><b>New 'Score Check' function.</b><br />
                        Creates report on scoring 'exceptions' according to user determined 
                           minimums and maximums <a href="ScoreCheck.aspx">(details)</a>.</li>
                    <li><b>New 'Switch Pilot' function.</b><br />
                        Completely replaces a pilot (already entered) with a different pilot. Can only be used after a draw is made <a href="Setup.aspx?PilotEntry">(details)</a>.<br />
                    </li>
                    <li><b>English.lng</b> file has additional entries related to the 'Score Check' screen.</li>
                    <li><b>English.info</b> file has an additional section at '#PageTag#Scoring - Score Check'.</li>
                    <li>Bug fix - editing the Pilot master file could fail in some circumstances.</li>
                    <li>Bug fix - running 'Compact DB' could fail in some circumstances.</li>
                </ul>

                <p>
                    GliderScore 6.42<br />
                </p>

                <ul>
                    <li style="list-style: none"><b>Update 4 April 2014</b></li>
                    <li><b>Moving pilots from a flight group</b><br />
                        - It is now possible to move all pilots from a flight group to another flight group.<br />
                        &nbsp;&nbsp; Moving the last pilot results in the empty flight group being deleted.</li>
                    <li><b>Bug fix to do with calculation of minimum groups per round</b><br />
                        - Where 'Use Roles' was selected, the calculation could produce an incorrect result.</li>
                    <li><b>New data added to the database provided with the full download</b><br />
                        - A new landing table 'F3J Enter Cms' added. This table has an entry for every centimetre out to 15 metres.</li>
                    <li><b>New download provided for those wanting the 'F3J Enter Cms' landing table</b><br />
                        - This download contains a single competition that must be imported.<br />
                        &nbsp;&nbsp;Importing the competition also imports the landing table.<br />
                        &nbsp;&nbsp;The imported competition can then be deleted.</li>
                </ul>


                <ul>
                    <li style="list-style: none"><b>Update 15 March 2014</b></li>
                    <li><b>Draw (Teams) Report</b> reworked for greater readability.<br />
                        - Columns reduce in width if the number of teams is more than 6 teams. The minimum width is reached with 13 or more teams.<br />
                        - Font size gradually reduces as the number of teams increases beyond 6 teams.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Released 3 March 2014</b></li>
                    <li><b>New 'Height Penalties' report</b> for F5J is available from the Reports menu.<br />
                        It is also available from the Running Results menu (button on the Scoring screen) and<br />
                        for emailing to contestants and others directly from GliderScore.<br />
                        For an example click <a href="Reports.aspx?HeightPenalty">(here)</a> or go to 'Reports' / 'Draw Details Reports'.
                    </li>
                    <li><b>New 'Draw (Teams)' report</b> is available from the Reports menu.<br />
                        This report has a row for every flight group and a column for each team.<br />
                        Team members can easily see when they will fly and who they will fly against.<br />
                        For an example click <a href="DrawRounds.aspx?HeightPenalty">(here)</a> or go to 'Draw Rounds' / 'Draw Details Reports'.
                       <li><b>New input validation for F5J</b>: each scoring line is validated to make sure that a height has been entered.<br />
                           The validation takes place when leaving the scoring grid (to move to another group, perhaps).<br />
                           A message is given and it is not possible to move to another scoring screen until the error is fixed.</li>

                        <li><b>New option in the Import Comp(etition)</b> process to automatically match pilots to be imported<br />
                            with pilots in the database. Match is not case sensitive. Full name and country must all be the same.</li>
                        <li><b>Bug fix in 'Pilot Import'</b> (importing pilots into a competition). Process crashed the<br />
                            program in some, but not all, circumstances.</li>
                        <li><b>Help file updated</b> in the 'Reports' section of the English.info file.<br />
                            The English.info file is generated automatically whenever the program is run. It is not a separate download.<br />
                            The updated English.info file has information about the two new reports.
                            <br />
                            If you wish to follow the procedures <a href="Translate.aspx?TranslateInformation">(here)</a> to create a translated version of the help (English.info) file,<br />
                            the new content can be found by searching for <b>#ItemTag#Info - Height Penalty</b> and <b>#ItemTag#Info - Draw (Teams)</b>.<br />
                            Otherwise the content is accessible by clicking on the appropriate buttons on the Reports menu.
                        </li>
                </ul>

                <p>
                    GliderScore 6.41<br />
                </p>

                <ul>
                    <li style="list-style: none"><b>Update 20 December 2013</b></li>
                    <li>Any competition exported from a previous version of GliderScore can now be imported into the latest version.<br />
                        The program handles differences in structure between the old and new databases.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Released 22 November 2013</b></li>
                    <li><b>Pilot Entry - bug fix</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Fixed bug where pilots could not be entered in the usual way.<br />
                </ul>


                <p>
                    GliderScore 6.40<br />
                </p>

                <ul>
                    <li style="list-style: none"><b>Released 18 November 2013</b></li>
                    <li><b>Microsoft .Net Framework 4.5</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">This software requires .Net Framework 4.5 to run</font> (<asp:HyperLink ID="HyperLink3" NavigateUrl="http://www.microsoft.com/en-us/download/details.aspx?id=30653"
                            Text="download" Target="_blank" runat="server" />).</li>
                    <li><b>Pilot Import</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;By following a strict file format, pilots can be imported into a competition instead of using the Pilot Entry screen.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The process will also add new pilots to the Pilots table<a href="Setup.aspx?PilotEntry">(details)</a>.</li>
                    <li><b>Roles Table/Pilot Entry/Indentification Badges</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;There is new table called Roles. These are user defined role codes and descriptions such as Plt=Pilot, CD=Competition Director.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Within Pilot Entry (and Pilot Import) each entrants role can be specified. This includes non-pilots.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;This enables identification Badges to be printed for all pilots and officials at your competition.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The layout of the badges is very flexible and can include a logo for your competition if desired 
                        <a href="MainMenu.aspx?MainMenuRoles">(Roles)</a> <a href="DrawRounds.aspx?Badges">(Badges)</a>.</li>
                    <li><b>Information Text</b> - now held in a file external to the program making translation possible.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The file English.info is written each time the program starts.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;You can create an .info file for your own language. If your language is selected then the program will use your language file.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="Translate.aspx?TranslateInformation">(details)</a>.
                    </li>
                    <li><b>Translation of Main Menu items</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The number of menu and screen items available for translation has been extended.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;See the English.lng file that is created whenever the program starts.</li>
                    <li><b>Usual Frequency removed</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The need to continue with the idea of 'Usual Frequency' on the Pilot record has gone.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;There is now only one place to enter a frequency, in Pilot Entry (or Pilot Import)<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;With Pilot Entry, the program suggests the last frequency used by the pilot in a competition.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;If the first competition for the pilot, the program suggests 0.000. Simply over-write with the frequency.</li>
                    <li><b>Competition Draw - bug fix</b><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Competitions with a very large number of competitors but very few flight groups per round could fail to complete.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;This has now been fixed.<br />
                    </li>





                </ul>





                <p>
                    GliderScore 6.39<br />
                </p>

                <ul>
                    <li style="list-style: none"><b>Update 2 July 2013</b></li>
                    <li>Information Screens - data can now be printed, print previewed or saved to file.<br />
                        Also the font size has been increased making it much easier to read the information provided.</li>
                </ul>


                <ul>
                    <li style="list-style: none"><b>Update 30 May 2013</b></li>
                    <li>Bug fix - The Team Results report now works for F3K Comps.</li>
                    <li>Bug fix - Changing the F3K task in the scoring screen now correctly adjusts all scores for the Round.</li>
                    <li>Overall Results Report - For F3K Comps a task description is now shown in the headings.</li>
                    <li>Team Results Report - For F3K Comps a task description is now shown in the headings.</li>

                </ul>


                <ul>
                    <li style="list-style: none"><b>Update 28 April 2013</b></li>
                    <li>Bug Fix for Overall Results Report<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;When a re-flight is taken in a round other than the round where the re-flight was granted,<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;the re-flight score now appears in the report correctly as the score for the round where the re-flight was granted.</li>
                    <li>Bug Fix for Competition Setup<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Fixes program error arising where only one pilot has been entered for a competition.</li>
                    <li>Duration competitions - Enabled editing of Lane number field in the Scoring screen.</li>
                    <li>Speed Task - Enabled editing of the Pilot order (Sequence number field) in the Scoring screen.</li>
                </ul>


                <ul>
                    <li style="list-style: none"><b>Released 19 February 2013</b></li>
                    <li>CRITICAL UPDATE - Bug fix for Calculaton of Group Scores for Multi-Task (F3B) Competitions<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Fixes a bug where Group Scores for multi-task competitions were incorrectly calculated.</li>
                    <li>Creating a Fly-Off Competition<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;The following changes are made when a fly-off competition is created from an existing competition.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp; - 'Use Teams? and 'Team Protection?' check boxes are cleared.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp; - 'Groups per Round' is set to one (1).<br />
                        &nbsp;&nbsp;&nbsp;&nbsp; - Lane Option is set to 'None'.</li>


                    <li>Emailing Reports<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;Fixed some issues with emailing of some F3K and F5B reports.</li>


                </ul>



                <p>
                    GliderScore 6.38<br />


                    <ul>
                        <li style="list-style: none"><b>Update 7 January 2013</b></li>
                        <li>Competition Setup Screen.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;This screen has been made slightly wider to allow more room for text and input fields.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;This solves an issue where part of the competition date was not visible for some computer display settings.<br />
                            <li>Updated French Language file.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Marc Pujol has provided an updated translation file for the French language.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Please help by sending me a copy of any manually created language files.</li>
                    </ul>



                    <ul>
                        <li style="list-style: none"><b>Update 20 December 2012</b></li>
                        <li>GliderScore on a USB key/USB stick.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;This update allows GliderScore, with translations, to be run from a USB key/USB stick (provided that a suitable computer is available).<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;It is a requirement that GliderScore.exe and any translation files be in the same folder (and for simplicity, the database files as well).<br />
                            <li>Updated French Language file.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Marc Pujol kindly provided his translation file for the French language.</li>
                    </ul>

                    <ul>
                        <li style="list-style: none"><b>Update 12 November 2012</b></li>
                        <li>F3K - A warning screen appears if the total of all times entered exceeds the working time (normally 10 minutes).</li>
                        <li>Minor changes to text on reports and screens have also been made.</li>
                    </ul>



                    <ul>
                        <li style="list-style: none"><b>Update 29 September 2012</b></li>
                        <li>Uploaded to website new translation file for Español.</li>
                        <li>Added more items to English.lng file.  These new items can now be translated.</li>
                    </ul>
                    <ul>
                        <li style="list-style: none"><b>Released 25 September 2012</b></li>
                        <li>Email Reports<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;It is now possible to email reports using a gMail, Hotmail or similar account.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;There is a small amount of extra setup in the Email Settings screen.</li>
                        <li>Draw Rounds<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;New option to avoid pilots being drawn to fly in two consecutive groups.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;If selected, a pilot drawn in the last group of a round will not be drawn<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;in the first group of the next round.</li>
                        <li>Duration Target Time<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;It is now possible to override the default target time for the competition and<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;set a different target time for each round.</li>
                        <li>A variety of bugs were also fixed.</li>
                    </ul>










                    <p>
                        GliderScore 6.37<br />

                        <ul>
                            <li style="list-style: none"><b>Updated 27 July 2012</b></li>
                            <li>Competition Series - fixed bug preventing Comp Series screen from opening.</li>
                        </ul>

                        <ul>
                            <li style="list-style: none"><b>Updated 24 July 2012</b></li>
                            <li>F3J - bug fix related to truncating of scores.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;It was possible for a normalised score that should have been 1000.0 to be reported as 999.9.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;This was due to computer arithmetic issues. Now fixed.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Apparently this never caused a problem as it was never reported.</li>
                        </ul>

                        <ul>
                            <li style="list-style: none"><b>Released 18 July 2012</b></li>
                            <li>F3K - several bug fixes in Scoring module.</li>
                            <li>All competitions - Prevents creating a new group with one pilot.</li>
                        </ul>

                        <p>GliderScore 6.36</p>

                        <ul>
                            <li style="list-style: none"><b>Updated 17 June 2012</b></li>
                            <li>F3K - Overall Results Report<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Updated so that if two or more pilots have the same score, they are ranked according to F3K rule 5.7.10.2.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;This rules specifies that "In the case of a tie break, the best dropped score defines the ranking."<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;If the tie still exists, the next best dropped score is used, and so on.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;If a tie still exists after all dropped scores have been tested, the pilots will be reported as having<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;the same (equal) ranking and a fly-off must be held to resolve the tie.</li>
                        </ul>


                        <ul>
                            <li style="list-style: none"><b>Updated 5 June 2012</b></li>
                            <li>OVERALL RESULTS REPORT<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;The report can now be run for 'All Pilots', a selected 'Country', a selected 'Club' or a selected 'Class'.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;If the report is restricted by making a selection, the scores can be reported as if the only pilots<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;who flew were the pilots within the selection (Restricted Scope Scoring).<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;This is useful for competitions where, for example, only the pilots from a particular Country<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;could qualify to be National Champion, and where it is important to remove the effect of the flights<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;of pilots from other countries from the results.</li>
                            <li>COMPETITION SERIES REPORT<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;The report can now be run for 'All Pilots', a selected 'Country' or a selected 'Club'.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;If the report is restricted by making a selection, the scores can be reported as if the only pilots<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;who flew were the pilots within the selection (Restricted Scope Scoring).<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;This is useful for competitions where, for example, only the pilots from a particular Country<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;could qualify for a series based National Championship, and where it is important to remove the effect<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;of the flights of pilots from other countries from the results.<br />
                            </li>
                            <li>BUG FIX
                        &nbsp;&nbsp;&nbsp;&nbsp;Fixed bug in the draw process that could potentially result in the process going into an endless loop.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Only effected the draw for competitions having a lot of frequency clashes.<br />
                            </li>
                        </ul>

                        <ul>
                            <li style="list-style: none"><b>Updated 7 May 2012</b></li>
                            <li>BUG FIX<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Fixed bug to do with different decimal symbols in different regions.<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;Error occurred if decimal symbol was a comma.
                        </ul>


                        <ul>
                            <li style="list-style: none"><b>Updated 4 May 2012</b></li>
                            <li>RE-FLIGHT PILOT'S SCORE<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;It is now possible to exclude a re-flight pilot's score from their final result.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;This would normally be used only for a pilot randomly selected to fly in the re-flight group<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;to increase the number of pilots in the group.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;GliderScore will ignore a score for any pilot given the Round Number 0 (zero) in the re-flight group.</li>

                            <li style="list-style: none"><b>For more details go to <a href="Scoring.aspx?BuildGroup">Scoring/Pilot Management/Create New Group</a>.</b></li>

                            <li>REPORTS → ROUND SCORES<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Fixed bug where, for F5J competitions, the Height reported was different to the actual height.</li>
                            <li>COMPETITION SETUP → TEAM LANES<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;Improved validation of the number of lanes selected.</li>
                        </ul>


                        <ul>
                            <li style="list-style: none"><b>Updated 29 March 2012</b></li>
                            <li>ADDITIONAL OPTIONS WHEN DRAWING SPEED TASK<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - <b>Normal</b> - Separates pilots in the order so that pilots with team and/or frequency conflicts do not follow each other.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - <b>Duration Order</b> - Places pilots in the Speed draw in the same order that they were drawn for Duration.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - <b>Current Ranking</b> - Ranks the pilot's scores up to and including the round to be drawn.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Pilots are then entered in the Speed draw in the reverse order.</li>

                            <li style="list-style: none"><b>For more details go to <a href="DrawRounds.aspx?DrawRoundsCreateDraw">Draw Rounds/Create Draw</a>.</b></li>

                            <li>REPORTS → DRAW TABLE<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Fixed bug where report did not format correctly under some circumstances.</li>
                        </ul>

                        <ul>
                            <li style="list-style: none"><b>Updated 27 March 2012</b></li>
                            <li>REPORTS → DRAW MATRIX → SAVE AS FILE<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Header now includes the task name. </li>
                            <li>MAIN MENU → IMPORT COMPETITION<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Fixed bug that crashed the process where a name included an apostrophe (for example, O'Neill).</li>
                            <li>REPORTS → ROUND SCORES<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Moved report footer so that it can no longer obscure report data.</li>
                        </ul>


                        <ul>
                            <li style="list-style: none"><b>Updated 19 March 2012</b></li>
                            <li>PILOTS FOR TEAM SCORE<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; This field has been changed back to a text box for data
                        entry. </li>
                            <li>BUG FIX<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Fixed issue where Landings and Task Results reports crashed
                        under some settings. </li>
                            <li>MULTI-TASK (F3B) REPORTS<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Overall and Team Results Reports now drop scores correctly
                        under all situations.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Previously would drop a 0 for any task not flown in an
                        incomplete round. </li>
                        </ul>

                        <ul>
                            <li style="list-style: none"><b>Released 15 March 2012</b></li>
                            <li>PILOT ENTRY<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; In 'Pilot Entry', a pilot was given the 'Usual Frequency' from their Pilot record.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; This has been changed to be the first of the following frequencies:<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - the frequency used by the pilot in his/her last competition<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - the 'Usual Frequency' on the Pilot record<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - if neither is present, a frequency of 0.000.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; The frequency given can be changed if needed.
                            </li>
                            <li>BUG FIX<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - deleting all Rounds in the Scoring screen will no longer crash the program.
                            </li>
                            <li>ADDING A LATE PILOT after the draw has been done<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - if the the number of pilots per group is the same for all groups within a round, and<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - if the task is duration, distance or F3K, then<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; you will no longer be asked to increase the maximum pilots per group.
                            </li>
                            <li>PILOTS TABLE<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - a new field 'Other Registration' has been added to the Pilots table.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; This allows Pilot registrations other than the FAI Number to be recorded.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - The FAI Number and the 'Other Registration' fields are now alphanumeric with a<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; maximum of 8 characters.
                            </li>
                            <li>PRINT OPTIONS in the Competition setup screen<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - There are now three 'Print Registration' options.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - Options are: do not print, print FAI number, print Other Registration.
                            </li>
                            <li>EXPORT PILOTS function added to Main Menu<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - Exports all Pilot data to a file formatted for importing into another database.
                            </li>
                            <li>PILOTS FOR TEAM SCORE in the Competition setup screen<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; - this is now a drop down box containing the available values.
                            </li>
                            <li>SCORING PARAMETERS FOR F5J ('Deduction from Flight Score' = 'Height Penalty')<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;   Data for reference height and penalties must now be typed.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;   Scores are immediately updated when these values are changed.
                            </li>
                        </ul>


                        <p>GliderScore 6.35</p>
                        <ul>
                            <li style="list-style: none"><b>Updated 27 February 2012</b></li>
                            <li>In Scoring screen, 'ScoreForRound' column removed except where the score for a pilot counts<br />
                                towards an earlier round (than the round being scored). This can happen where a pilot cannot<br />
                                be reflown in the original round and is granted a reflight in a later round.</li>




                            <li style="list-style: none"><b>Updated 23 February 2012</b></li>
                            <li>'Team Lanes' allocation algorithm significantly improved.<br />
                                Where there are more teams than lanes, teams will stay in 'their' lane more often.</li>
                            <li>Changing a 'Scoring Option' can now happen even though scores may have been entered.<br />
                                Changing options for GroupScore, Rounding or DecimalPlaces triggers a full re-calculation of all<br />
                                scores and group scores according to the changed settings.</li>
                            <li>Minor bug fix related to re-sizing the Competition Setup screen.<br />
                                'Pilots per Group' boxes now re-size correctly.</li>

                            <li style="list-style: none"><b>Updated 15 February 2012</b></li>
                            <li>Language files extended to include more words and phrases.<br />
                                All language files have been updated with the extended data.</li>
                            <li>The default Group Score option has been changed from 'None' to 'Points' for new competitions.<br />
                                This only applies to competitions created without copying from an existing competition.</li>
                            <li>Bug fix for scoring where Group Score option is set to 'None'.<br />
                                Scores no longer 'normalise' if a group that has been scored is opened (viewed) again.</li>

                            <li style="list-style: none"><b>Released 3 February 2012</b></li>
                            <li>Added F3K tasks I and J.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; These new tasks became official on 1 January 2012.</li>
                            <li>Added 'Group Score - Time' option.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; If selected, best time receives 1000 points.  Other pilots receive<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; a proportion of 1000 points depending on their time.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Landing bonus is then added (or height penalty deducted).<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; If Motor Run is selected, this is deducted from flight time before<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; normalisation of times.</li>
                            <li>Added functionality to resize forms.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Practically any form (screen) can be resized simply by dragging a border<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; or a corner.  GliderScore 'remembers' the changed size for future use.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; Forms can be resored to their default size by clicking the 'Restore Size'<br />
                                &nbsp;&nbsp;&nbsp;&nbsp; button on the Main Menu.</li>
                        </ul>

                        <p>GliderScore 6.34</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 19 November 2011</b></li>
                            <li>New Draw Report (Draw Table) in a compact grid format (Details <a href="DrawRounds.aspx?DrawReport">here</a>).</li>
                            <li>Bug fix - competitions would not open if progam run in a language other than English.</li>

                            <li style="list-style: none"><b>Uploaded 14 November 2011</b></li>
                            <li>Modified "Initial folder for saving reports defaults to C:\GliderScore6\Reports".<br />
                                If a different folder is selected for saving a report, this will become the default folder<br />
                                for the next report/s to be saved.</li>
                            <li style="list-style: none"><b>Uploaded 13 November 2011</b></li>
                            <li>Report headings re-formatted to align to left of page.</li>
                            <li>Initial folder for saving reports defaults to C:\GliderScore6\Reports.</li>
                            <li style="list-style: none"><b>Uploaded 7 November 2011</b></li>
                            <li>In Scoring screen, fixed bugs related to Delete Round and Delete Group.</li>
                            <li>Change for multi-task competitions when moving from task to task in the Scoring screen.<br />
                                When changing to a task that has already been visited, you will be returned to the last group viewed.</li>
                            <li style="list-style: none"><b>Uploaded 4 November 2011</b></li>
                            <li>Fixed bug in 'Pilot Entry'.
                                <br />
                                Error occurred if a pilot was removed from 'Pilots Entered' while the<br />
                                'Pilots Available' filter excluded the pilot.</li>

                            <li style="list-style: none"><b>Uploaded 1 November 2011</b></li>
                            <li>Revised code relating to emailing reports to fix incorrect 'Send failed' message appearing.</li>

                            <li style="list-style: none"><b>Uploaded 30 October 2011</b></li>
                            <li>Added facility to easily email reports to pilots (details <a href="EmailReports.aspx">here</a>).</li>

                        </ul>

                        <p>GliderScore 6.33</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 13 October 2011</b></li>
                            <li>Revised versions of Chinese.lng and Czech.lng put on website.<br />
                                These did not work due to an extra 'carriage return' character at the end of each file.
                     <li>Revised Report Preferences screens to show all tasks for multi-task competitions.</li>
                                <li style="list-style: none"><b>Uploaded 11 October 2011</b></li>
                                <li>Score entry option for F3K Task D changed from single-click to double-click.<br />
                                    Single-click could easily cause scores to change when that was not intended.</li>
                                <li style="list-style: none"><b>Uploaded 5 October 2011</b></li>
                                <li>Fixed bug in draw for Speed when run in languages where the decimal symbol is a comma (example 2,4).</li>
                                <li>Re-formatted various screens for easier use and to provide more space for translated text.</li>
                                <li>The list of words and phrases available for translation has been extended by 42.<br />
                                    There are now 314 words and phrases in the list.<br />
                                    All language files have been updated (using Google Translate).  This includes the language files contributed<br />
                                    by native speakers so these later translations may be inaccurate.
                                         
                                </li>
                        </ul>

                        <p>GliderScore 6.32</p>
                        <ul>

                            <li style="list-style: none"><b>Uploaded 15 September 2011</b></li>
                            <li>Fixed bug that prevented entry of FAI number on Pilot record.</li>
                            <li>Improved display of translated text when too long for the available space.</li>
                            <li style="list-style: none"><b>Uploaded 9 September 2011</b></li>
                            <li>Bug fix - Scoring screen would not load if selected language was not English.</li>
                        </ul>

                        <p>GliderScore 6.31</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 7 September 2011</b></li>
                            <li>Draw reports - can now select the sort order.</li>
                            <li>Flyoff competitions - can now select the number of pilots to be included from the preliminary competition.</li>
                            <li>Scoring screen - now loads much more quickly.</li>

                            <li style="list-style: none"><b>Uploaded 31 August 2011</b></li>
                            <li>Increased space on Flight Scores reports to allow for pilot numberings over 99.</li>
                            <li>Added option to round or truncate in calculation of Group scores.<br />
                                Most FAI class rules are silent on this, but F3J rules specify truncation.</li>
                            <li>Added option to print Country code and/or FAI Number on the Overall Results and<br />
                                Team Results reports.</li>
                        </ul>

                        <p>GliderScore 6.30</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 16 August 2011</b></li>
                            <li>Increased space on Draw Report (small format) to allow for pilot numberings over 99.</li>
                            <li>Changed code to do with Team Lanes.  It now works correctly where there are<br />
                                more teams than lanes.</li>
                            <li style="list-style: none"><b>Uploaded 12 August 2011</b></li>
                            <li>Competitions can now be added to more than one Competition Series.<br />
                                A single competition can be included in a National, Regional and Local series<br />
                                all at the same time.</li>
                        </ul>


                        <p>GliderScore 6.29</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 12 August 2011</b></li>
                            <li>Competitions can now be added to more than one Competition Series.<br />
                                A single competition can be included in a National, Regional and Local series<br />
                                all at the same time.</li>

                            <li style="list-style: none"><b>Uploaded 10 August 2011</b></li>
                            <li>Replaced Spanish.lng file with Español.lng kindly contributed by Javier Montilla.</li>
                            <li>Fixed bug where, if a distance in the 'Landings' table had a decimal part (example 0.3)<br />
                                and the computer region settings had the decimal symbol as a comma, the
                                <br />
                                'Flight Scores' and 'Flight Scores - Ranked' reports for duration contests<br />
                                would not run.</li>
                        </ul>

                        <p>GliderScore 6.28</p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 9 August 2011</b></li>
                            <li>Replaced Italian.lng file with Italiano.lng kindly contributed by Urs Schaller.</li>

                            <li style="list-style: none"><b>Uploaded 8 August 2011</b></li>
                            <li>More words translated, particularly within the Reports area.</li>
                            <li>New version of this website made live.</li>

                            <li style="list-style: none"><b>Uploaded 4 August 2011</b></li>
                            <li>Replaced Swedish.lng file with a version kindly contributed by Magnus Hedland.</li>

                            <li style="list-style: none"><b>Uploaded 15 July 2011</b></li>
                            <li>Fixed bug where, if the words 'Height Penalty' were translated and the non-English
                        language file was selected, the fields for Reference height, Penalty up-to and Penalty
                        over did not appear.<br />
                                Thanks to Palo Lishak for bringing this to my attention.</li>
                            <li style="list-style: none"><b>Uploaded 6 July 2011</b></li>
                            <li>Minor adjustments to the user interface, particularly in 'Enter Pilots' when the
                        filter is used and then cleared.</li>
                            <li style="list-style: none"><b>Uploaded 25 June 2011</b></li>
                            <li>Removed one-click scoring for F3K Task H.</li>
                            <li style="list-style: none"><b>Uploaded 24 June 2011</b></li>
                            <li>Improved formatting of input in Scoring screen.</li>
                            <li>Fixed recent bug preventing F5B events from running successfully.</li>
                            <li>Introduced one-click scoring for F3K Task D and Task H.</li>
                        </ul>
                        <p>
                            GliderScore 6.27
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 22 June 2011</b></li>
                            <li>Added language 'starter' files for Chinese, French, Russian and Turkish.</li>
                            <li style="list-style: none"><b>Uploaded 21 June 2011</b></li>
                            <li>Introduced multi-lingual support covering most text on screens and limited text on reports.</li>
                            <li>Fixed bug where pilots with equal scores may not have been given equal ranking in reports.</li>
                            <li>Changed flight scores reports for F5J so that height is reported in addition to height penalty.</li>
                        </ul>


                        <p>
                            GliderScore 6.26
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 2 June 2011</b></li>
                            <li>FAI approved provisional rules for F5J uploaded.  See the F5J page for PDF file download.</li>
                            <li style="list-style: none"><b>Uploaded 29 May 2011</b></li>
                            <li>Fixed bug - if landing distances were created in the 'Landings' table with a comma as the decimal symbol (for example 0,2 and valid for</li>
                            <li style="list-style: none">many countries), the calculation of landing points was not handled.</li>
                        </ul>



                        <p>
                            GliderScore 6.25
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 27 May 2011</b></li>
                            <li>Fixed issue where, if a pilot was moved between groups and the Scoring screen was immediately closed, the move was not saved.</li>
                            <li>Fixed bug in draw process that could cause a round draw to make more attempts than were necessary.</li>
                            <li style="list-style: none">This related to comps with lots of frequency clashes. The overall quality of the draw was not effected.</li>
                            <li>Fixed bug in Reports → Draw Matrix where the report would not run if 'Print' was selected.</li>
                            <li>Bug in Competition Series screen when 'Report' button was pressed is now fixed.</li>
                            <li>When importing a comp, the 'Import Comp Progress' form now stays on top until closed by the user.</li>
                        </ul>


                        <p>
                            GliderScore 6.24
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 13 May 2011</b></li>
                            <li style="list-style: none">Updated handling of report range selections so that the
                        correct range</li>
                            <li style="list-style: none">of rounds, groups and re-flights is always shown.</li>
                            <li style="list-style: none"><b>Uploaded 7 May 2011</b></li>
                            <li style="list-style: none">Fixed reports issue with multi-task events where, if more
                        rounds of speed were flown
                        <li style="list-style: none">than other tasks, the Overall Results report would not
                            include the 'extra' rounds of speed.
                            <li style="list-style: none">Download version 6.24 again if this update is important
                                to you.</li>
                            <li style="list-style: none"><b>Uploaded 19 April 2011</b></li>
                            <li style="list-style: none">Fixed reports issue where some reports would not run.
                                <li style="list-style: none">This could happen when pilots were retired and a new draw
                                    was created for the remaining rounds.</li>
                        </ul>


                        <p>
                            GliderScore 6.23
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 16 March 2011</b></li>
                            <li style="list-style: none">- For F5J ('Height Penalty' selected) Where flight time
                        entered is greater than the target time -</li>
                            <li style="list-style: none">&nbsp;&nbsp; - Any time over the target time is ignored
                        in score calculations.</li>
                            <li style="list-style: none">&nbsp;&nbsp; - Entry of a non-zero landing is prevented.</li>
                            <li style="list-style: none"><b>Uploaded 13 March 2011</b></li>
                            <li style="list-style: none">- Further adjustment to reports so that large numbers print
                        without wrapping.</li>
                            <li style="list-style: none"><b>Uploaded 10 March 2011</b></li>
                            <li style="list-style: none">- Adjusted reports so that large numbers print without
                        wrapping.</li>
                            <li style="list-style: none"><b>Uploaded 9 March 2011</b></li>
                            <li style="list-style: none">- New features added to support the new (proposed) FAI
                        F5J Thermal Electric Glider class. See the details <a href="CompF5J.aspx">here</a>.</li>
                            <li style="list-style: none">- Minor formatting changes to various reports.</li>
                            <li style="list-style: none">- For new competitions, the default number of decimals
                        for group scoring has been changed from zero to one.</li>
                            <li style="list-style: none">&nbsp;&nbsp;The allowable range is zero to three.</li>
                        </ul>
                        <p>
                            GliderScore 6.22
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 24 February 2011</b></li>
                            <li>All Competitions</li>
                            <li style="list-style: none">- The Competition setup screen has been modified to show the number of teams entered.</li>
                            <li style="list-style: none"><b>Uploaded 17 February 2011</b></li>
                            <li>Duration/F3J Competitions</li>

                            <li style="list-style: none">- The 'Team Lanes' function has been modified to handle larger competitions where the number of teams is</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;greater than the number of lanes.<br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;See Setup Comp → Draw Options.</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;In this case, where team members are drawn in consecutive groups (within a round), they will be allocated</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;to the same lane in the consecutive groups. This saves on setup time between groups.</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;Team lanes change with each round so that each team flies from different parts of the flight line.<br />
                        </ul>
                        <p>
                            GliderScore 6.21
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 10 February 2011</b></li>
                            <li>Fixed bug for small screens (height=600px) where 'Running Results' menu was hidden behind Scoring screen.</li>
                            <li style="list-style: none"><b>Uploaded 4 February 2011</b></li>
                            <li>In Pilot Entry, Pilots Available can now be filtered on Last Name.<br />
                                &nbsp;&nbsp;&nbsp;See Setup Comp → Pilot Entry.</li>
                            <li style="list-style: none"><b>Uploaded 3 February 2011</b></li>
                            <li>F3K Competitions</li>
                            <li style="list-style: none">- A specific task for a Round now has to be selected before
                        scores can be entered for that Round.</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;Task 'O'ther is no longer the default task but it is
                        still available for selection.</li>
                            <li>All Competitions</li>
                            <li style="list-style: none">- Penalties now appear in the results both in total and
                        against the Round in which they were incurred.<br />
                                &nbsp;&nbsp;&nbsp;See Reports →Competition Reports → Overall Results.</li>
                            <li style="list-style: none">- Fixed the Competition listing so that all columns, especially
                        the date column, show on all computer screens without scrolling.</li>
                            <li>All Duration based tasks (except F3K)</li>
                            <li style="list-style: none">- Added a 'Pilot's Score Record' to the system.</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;This is a new option within Reports → Score Cards. The
                        'Pilot's Score Record' is to help each</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;pilot to keep a record of their scores for checking.
                        If the draw is done before printing, the</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;Record will show the round and group in which the pilot
                        is drawn to fly.<br />
                                &nbsp;&nbsp;&nbsp;See Draw Rounds → Pilot's Score Record.</li>

                        </ul>
                        <p>
                            GliderScore 6.20
                        </p>
                        <ul>

                            <li style="list-style: none"><b>Uploaded 14 January 2011</b></li>
                            <li>Score cards can now be printed for any duration based task, including F5B. See the Draw Rounds → Score Cards tab.</li>
                            <li>Updates for F3K</li>
                            <li style="list-style: none">- When an F3K task is changed, input focus returns to the scoring grid.</li>
                            <li style="list-style: none">- Columns not available for input are headed 'n/a'. This changes according to the task.</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;For example, Task A. First time column is available, all others are not available.</li>
                            <li style="list-style: none">- An 'Edit F3K Tasks' button has been added to the competition setup screen.
                        This button is enabled once the draw has been completed</li>
                            <li style="list-style: none">&nbsp;&nbsp;&nbsp;and allows the F3K task to be set for each Round.</li>
                            <li style="list-style: none">- When separated along the cut lines, score cards are exactly the same size
                        on A4 paper on all printers.</li>
                            <li>F3B - Distance</li>
                            <li style="list-style: none">- Within each group, a letter ID eg A, B, C, etc. is allocated to each pilot.</li>
                        </ul>
                        <p>
                            GliderScore 6.19
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 31 December 2010</b></li>
                            <li>For F3K, added facility to print score cards with many options including a score card book option.<br />
                                For more details, look <a href="DrawRounds.aspx?ScoringSheets">here</a>.</li>
                            <li>Report selections forms (From Round, To Round etc) code revised so that selections are easier to make.</li>
                            <li style="list-style-type: none"><b>Uploaded 1 January 2011</b></li>
                            <li>F3K pre-filled score card selections / View/Edit F3K Tasks.  Improved screen layout for laptop computers.</li>
                            <li>Fixed bug. Draw Matrix menu now displays on low resolution screens when called from the CheckDraw screen.</li>
                        </ul>
                        <p>
                            GliderScore 6.18
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 14 December 2010</b></li>
                            <li>In the Scoring Screen, the 'Running Results' button now brings up a menu of reports.<br />
                                Previously you would have to close the Scoring screen to access these reports.<br />
                                With this update you will be able to preview or print the reports directly from the Scoring screen.<br />
                                Reports include -<br />
                                - Overall Results<br />
                                - Team Results<br />
                                - Landings Results<br />
                                - Round Results - Current Round<br />
                                - Flight Scores - Current Round<br />
                                - Flight Scores - Current Group<br />
                            </li>

                        </ul>
                        <p>
                            GliderScore 6.17
                        </p>
                        <ul>
                            <li style="list-style: none"><b>Uploaded 8 December 2010</b></li>
                            <li>Added Import Pilot facility. Pilot names and other data can be bulk imported from
                        a file named Pilots.csv located in the database folder.<br />
                                A proforma file Pilots.csv is now included with the full download and (for a time)
                        with the program only download.<br />
                                Full instructions are available by clicking the information button in the program.<br />
                                Pilots.csv is most easily edited with a program such as Excel but must always be
                        saved as Pilots.csv.</li>
                            <li>Removed the restriction for multi-task competitions when entering/viewing scores in single pilot mode.<br />
                                You can change to a different task without leaving this mode.</li>
                            <li>Removed restrictions on characters that can be used in pilot names.</li>
                            <li style="list-style-type: none"><b>Uploaded 12 December 2010</b></li>
                            <li>Tidied up code relating to 'Team Lanes' in Scoring screen and in Draw and Scoring reports.</li>

                        </ul>
                        <p>
                            GliderScore 6.16
                        </p>
                        <ul>
                            <li>Reworked code related to F3K score calculations.</li>
                            <li>Added ability to enter/view scores for a selected pilot. This is accessed by right clicking in the Scoring
                    screen.<br />
                                More details available under the Scoring/Score by Pilot tab.</li>
                            <li>Automatically checks that the latest version is installed (if online).</li>
                        </ul>
                        <p>
                            GliderScore 6.15
                        </p>
                        <ul>
                            <li>Fixed bug related to entering Penalty data for F3K comps.</li>
                            <li>Improved information message where scores entered in an invalid format.</li>
                        </ul>
                        <p>
                            GliderScore 6.14
                        </p>
                        <ul>
                            <li>Added a 'Team Lanes' option to Draw Options.<br />
                                Applies to Duration only competitions with 'Team Protection' selected.<br />
                                If 'Team Protection' and 'Team Lanes' are selected, team members will be in the same lane within each Round.</li>
                        </ul>
                        <p>
                            GliderScore 6.13
                        </p>
                        <ul>
                            <li>Added a new Draw Matrix report to the Reports menu.<br />
                                This report is also available from the Draw - Check Draw screen.</li>
                        </ul>
                        <p>
                            GliderScore 6.12
                        </p>
                        <ul>
                            <li>Modified report headings and enabled printing of multiple copies.</li>
                            <li>Added a new Draw report in a two column format for more economical printing.</li>
                            <li>Slightly changed draw process. The change reduces the 'spread' of pilot 'meetings'
                        (in the Check Draw screen).</li>
                        </ul>
                        <p>
                            GliderScore 6.11
                        </p>
                        <ul>
                            <li>Further revisions to draw process to maximize pilot meetings.</li>
                        </ul>
                        <p>
                            GliderScore 6.10
                        </p>
                        <ul>
                            <li>Revised draw process to better achieve objective of maximizing pilot meetings.</li>
                            <li>Fixed bug - the Check Draw display could be wrong if this button was clicked first on opening a competition.</li>
                        </ul>
                        <p>
                            GliderScore 6.09
                        </p>
                        <ul>
                            <li>Fixed draw issue involving teams. Draw failed if all teams were full and the groups
                        per round was equal to the number of pilots per team.</li>
                        </ul>
                        <p>
                            GliderScore 6.08
                        </p>
                        <ul>
                            <li>Fixed issue where last score entered might not be saved in some circumstances.</li>
                            <li>Additional statistics now given at the end of the draw process.</li>
                            <li>Fixed various issues related to display on 600 pixel high screens.</li>
                            <li>Added code so that, if a pilot is in EVERY group, that pilot cannot be moved.</li>
                            <li>Minor changes to Flight Scores reports for F3J and F5B comps.</li>
                        </ul>
                        <p>
                            GliderScore 6.07
                        </p>
                        <ul>
                            <li>Fixed issue where a new competition is created without copying from an earlier competition.</li>
                            <li>Fixed issue where, in some circumstances, pilots in the same team could be drawn
                        against each other.</li>
                            <li>Slightly changed layout of Draw and Score Sheets reports.</li>
                            <li>Fixed issue in re-draw process where, in some circumstances, a better draw would
                        not be kept.</li>
                            <li>Fixed issue with 'Lock Data' in Scoring screen. If a screen with 'Lock Data' checked
                        is entered, Scores will not re-calculate.</li>
                            <li>Fixed issue for screens with height of 600 pixels where Scoring screen would stay
                        on top when trying to preview results.</li>
                        </ul>
                        <p>
                            GliderScore 6.06
                        </p>
                        <ul>
                            <li>Fixed bug related to splitting groups in the Scoring screen (Speed and F5B only).</li>
                            <li>Added 'Lane' column to Draw report where Duration is the only task.</li>
                            <li>A change to the sort order in the Scoring screen now persists when changing groups.</li>
                        </ul>


                        <p>
                            GliderScore 6.05
                        </p>
                        <ul>
                            <li>A vast number of screens have been re-designed to be no more than 600 pixels high.<br />
                                This is the screen height for EEE 'baby' PC's.<br />
                                Thanks to Kevin Smeaton (Australia) for this suggestion.</li>

                        </ul>
                        <p>
                            GliderScore 6.04
                        </p>
                        <ul>
                            <li>Fixed bug for Swedish (and other) language users that caused the program to crash in<br />
                                the Scoring screen.</li>
                            <li>Increased width of 'Name' field in the Draw report so that longer names do not wrap.<br />
                                Thanks to Magnus Hedland (Sweden) for telling me about these problems.</li>
                        </ul>

                        <p>
                            GliderScore 6.03
                        </p>
                        <ul>
                            <li>Changed so that the program will run in environments where the number decimal symbol<br />
                                is either a comma or a period. </li>
                        </ul>
                        <p>
                            GliderScore 6.02
                        </p>
                        <ul>
                            <li>Fixes a minor bug with the display settings of the Information screen.</li>
                            <li>Prevents changing the selected Landing Bonus table once landing scores have been
                        entered.</li>
                            <li>Fixes a bug where pilot Start numbers (if selected) did not automatically fill correctly.</li>
                        </ul>
                        <p>
                            GliderScore 6.01
                        </p>
                        <ul>
                            <li>Updates reports that show pilot rankings so that equal performance is highlighted
                        (for example '=3').</li>
                        </ul>
            </ContentTemplate>
        </asp:TabPanel>

        <asp:TabPanel runat="server" ID="TabPanel1" HeaderText="DigitalTimer Updates" TabIndex="1">
            <ContentTemplate>

                <h5>GliderScore DigitalTimer Updates</h5>


                <p>
                    Updates usually involve extensive changes.  I do a lot of testing but I cannot<br />
                    test everything. <b>Send me an email if you find any problems with GliderScore DigitalTimer.</b><br />
                </p>

                <p>Digital Timer 1.20</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.77 Update 4 Build 2025-04-22</b> (with GliderScoreDigitalTimer 1.20 Build 2025-04-22)</li>
                    <li>DT - Minor code changes to improve performance.</li>
                </ul>

                <p>Digital Timer 1.19</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScore 6.75 Build 2024-08-23</b> (with GliderScoreDigitalTimer 1.19 Build 2024-08-23)</li>
                    <li>DT - Minor changes.</li>
                </ul>

                <p>Digital Timer 1.18</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.18 Build 2024-05-20</b></li>
                    <li>DT - F3K - Bug fix - on some PCs, timer stopped after first flight of F3K Task C. Now fixed.</li>
                </ul>


                <p>Digital Timer 1.17</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.17 Build 2024-03-12</b></li>
                    <li>DT - Updated with button to start the next flight group immediately.</li>
                </ul>

                <p>DigitalTimer 1.16</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.16 Update 2 Build 2024-01-31</li>
                    <li>DT - Bug fix - The Timer incorrectly started if the Cancel button was pressed during announcements but only if 1. using delayed start and 2. announcements were set to play before prep time.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.16 Update 1 Build 2024-01-23</b></li>
                    <li>DT - Critical update for all users. Fixes bug where timer ran for only the current flight group.<br />
                        There are other known (but not critical) bugs to be worked out. A new release will come when that has been done.
                    </li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.16 Build 2024-01-16</b></li>
                    <li>DT - Updated to work with the <a href="https://www.gliderkeeper.com">GliderKeeper</a> device for F5J. Timer accuracy has been improved.</li>
                </ul>




                <p>DigitalTimer 1.15</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.15 Update 1 Build 2023-07-21</li>
                    <li>DT - Fixed bug where round number and group number output to COM port was incorrect.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.15 Build 2023-07-19</li>
                    <li>DT - Bug fix related to timing of output to COM ports.</li>
                    <li>DT - From this version, requires .Net Framework 4.8 (Runtime).</li>
                </ul>

                <p>DigitalTimer 1.14 (This version was withdrawn due to issues when running the program on some computers.)</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.14 Build 2023-05-22</b></li>
                    <li>DT - Bug fixes particularly related to Pandora device output.</li>
                    <li>DT - Right-click on Start button to schedule start time. </li>
                </ul>


                <p>DigitalTimer 1.13</p>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.13 Build 2022-01-24</b></li>
                    <li>DT Update - Output device selection now based on device IDs instead of the COM port number.</li>
                    <li>DT Update - Improved code that changes the screen to 'Full Screen' mode. </li>
                </ul>


                <p>DigitalTimer 1.12</p>

                  <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.12 Build 2021-08-16</b></li>
                    <li>Feature - Digital Timer: Added new output format 'Synchronic'.</li>
                    <li>Feature - Digital Timer: Full file path removed from playlist data.</li>
                    <li>Bug fix - Digital Timer: Fixed announcements with incorrect Display Time. </li>
                </ul>

                <p>DigitalTimer 1.11</p>

                 <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.11 Build 2021-04-22</b></li>
                    <li>Fixed a bug that prevented program running on a PC with no COM ports.</li>
                </ul>

                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.11 (Build 2021-04-06)</b></li>
                    <li>Added code to handle updated merged playlist feature.<br />
                </ul>

                <p>DigitalTimer 1.10</p>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.10 Build 2020-11-30</b></li>
                    <li>DigitalTimer - Upgrade to support new Pandora functions. More information <a href="Audio.aspx?OpenTimer">here</a>.</li>
                </ul>
                                             
                <p>DigitalTimer 1.09</p>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>DigitalTimer 1.09 (Build 2020-02-17)</b></li>
                    <li>Various changes to handle the 'merge playlists' feature just added.</li>
                </ul>

                <p>DigitalTimer 1.08</p>
                <ul style="position: relative; top: +0px">
                    <li style="list-style: none"><b>DigitalTimer 1.08 (Build 2019-12-10)</b></li>
                    <li>The default values in the 'GoTo' screen are the values for the next flight group.</li>
                    <li>Support added for handling the Timer State data in the playlist instead of by calculation.<br />
                        Necessary because of F3K where preparation time is divided into three states. Preparation time, testing time and no-fly time.
                    </li>
                </ul>

                <p>DigitalTimer 1.07</p>
                <ul>
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.07 released 2019-03-31</b></li>
                    <li>Improved program load time.</li>
                    <li>Fixed bug stopping timer items being played only at the start of a new round.</li>
                    <li>Cleaner user interface.</li>
                </ul>


                <p>Digital Timer 1.06</p>
                <ul>
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.06 Released 2018-12-17</b></li>
                    <li>New GO-TO screen to quickly jump to any point in the playlist. Accessed by a right-click on the playlist.</li>
                    <li>Bug fix - the function to 'play pilot names in working time' now works again.</li>
                </ul>

                <p>DigitalTimer 1.05</p>
                <ul>
                    <li style="list-style: none"><b>GliderScoreDigitalTimer 1.05 Build 2018-09-19</b></li>
                    <li>New timer output format added, 'Extended Protocol'. Outputs round, group and time data every second. Suitable for
                                         <br />
                        displays that have sufficient modules to show all of this data.<br />
                        For more information navigate to Display/Timer/Audio→Digital Timer→Open Timer.
                    </li>
                    <li>The Output String (sent to the COM port) is displayed below the Output Format.</li>
                    <li>Minor bug fix.</li>
                </ul>

                <p>DigitalTimer 1.04</p>
                <ul>
                    <li style="list-style: none"><b>GliderScore DigitalTimer 1.04 Build 2016-12-05</b></li>
                    <li>This is mainly a re-build using Visual Studio 2015.</li>
                    <li>Some minor changes.</li>
                </ul>
                <ul>
                    <li style="list-style: none"><b>GliderScore DigitalTimer 1.04 Build 2016-06-08</b></li>
                    <li>Stores the last used serial port and warns if this is not available.</li>
                    <li>Can display the round number and group number during pilot announcements on Aerobtec and Embedded-Ability displays.</li>
                    <li>The timer screen is now resizable.</li>
                </ul>


                <p>DigitalTimer 1.03</p>
                <ul>
                    <li style="list-style: none"><b>Updated 23 Feb 2016</b> (Build 2016-02-23)</li>
                    <li>Improved handling of COM Port and various interface enhancements.</br></li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 13 Jan 2016</b> (Build 2016-01-13)</li>
                    <li>Fixed bug on exiting in case of computer having no serial ports.</li>
                </ul>

                <p>DigitalTimer 1.02</p>
                <ul>
                    <li style="list-style: none"><b>Updated 5 May 2015</b></li>
                    <li>Fixed display problem when screen was resized.</li>
                    <li>Improved synchronisation between PC display and external display.</li>

                    <li>Added 'Build' identifier to bottom left of screen.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Updated 26 April 2015</b></li>
                    <li>Fixed issue where, under specific circumstances, timer could stop at the end of a timer sequence.</li>
                </ul>

                <ul>
                    <li style="list-style: none"><b>Released 23 April 2015</b></li>
                    <li>Various stability issues to do with Pause/Resume/Cancel have been resolved.</li>
                    <li>On loading, the program will now check for new versions.</li>
                </ul>



            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" ID="AppleMac" HeaderText="GliderScore on Apple Mac" TabIndex="1">
            <ContentTemplate>
                <h5>GliderScore on Apple Mac</h5>

                <p>
                    The quote below is from an email received on 16 January 2012.<br />
                    I hope that this information will help Apple Mac users to run GliderScore on their computers.
                </p>

                <p>
                    "I'm using a Mac with the latest Lion OS 7 and have downloaded an 'APP' Parallels desktop for Mac 7 
                     (<asp:HyperLink ID="link1" runat="server" Text="www.parallels.com" NavigateUrl="http://www.parallels.com" />)<br />
                    and loaded windows XP plus SP2 & SP3 with Net Framework 3.5 and can report that Gliderscore runs fine.<br />
                    I have attached a screen shot of it running on my desk top, opens up from the 'APP' icon on the left of the screen<br />
                    which brings up the windows start panel and opens like any other program on my Mac.<br />
                    I will keep you updated if I come up against any problems but so far it's working great, thanks again for a great program."
                </p>

                <p>(The screen shot mentioned in the quote was not attached to the email.)</p>


            </ContentTemplate>
        </asp:TabPanel>



    </asp:TabContainer>
</asp:Content>

