<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<script runat="server" type="text/javascript">
    
</script>

 
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="TabContainer1" runat="server">
        <%--FAQ--%>
        <asp:TabPanel runat="server" ID="FAQ" HeaderText="FAQ" TabIndex="0">
            <ContentTemplate>

<%--http://www.randomsnippets.com/2011/04/10/how-to-hide-show-or-toggle-your-div-with-jquery/
--%>
                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
                <script type="text/javascript">
                    function toggleDiv(divId)
                    {
                    $("#" + divId).toggle();
                    }
                </script>

               <%-- <asp:Image ID="Image5" runat="server" AlternateText="F3J WC 2013 Closing Ceremony"
                        ImageAlign="Left" ImageUrl="~/ImgFAQ/FAQImage.JPG" ToolTip='F3J WC 2013 Closing Ceremony' />--%>
               <%-- <asp:Image ID="Image7" runat="server" AlternateText="Mildura 2013"
                        ImageAlign="Left" ImageUrl ="~/ImgFAQ/DSC00299a.jpg" ToolTip='Mildura 2013' />--%>
                  <asp:Image ID="Image7" runat="server" ImageAlign="Right" style="margin-right :4px;" ToolTip='LSF Tournament, Jerilderie 2012, Andy MacDonald photo'
                    ImageUrl="~/ImgFAQ/GliderLanding.JPG" AlternateText="LSF Tournament, Jerilderie 2012" />
                <br />
                <h5>
                    Frequently Asked Questions</h5>
                <p>
                    <i>Click on text to Show/Hide answers.</i></p>
                                      
                <%--FAQ1--%>
                <div><p id="hdrFAQ1" onclick="javascript:toggleDiv('FAQ1');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                    <b>1. Can I run a competition with pilots flying two classes of model?</b></p></div>

                <div id="FAQ1" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        There is more information <a href="MainMenu.aspx?MainMenuPilotsMultiClass">here</a>.<br />
                        <br />
                        As an example, we want to allow pilots to fly ALES and Legacy class models
                        in the one competition.<br />
                        The two classes are to fly at the same time in mixed class groups.</p>
                    <br />
                    <div>
                        <asp:Image ID="Image6" runat="server" ImageAlign="Right" style="margin-right :4px; margin-bottom :4px;" ImageUrl="~/ImgFAQ/FAQ1a.jpg" />
                        <p>
                            On the Competition Setup screen -</p>
                        <ul>
                            <li>Select 'Use Teams?'</li>
                            <li>Select 'Use Classes?'</li>
                            <li>Select 'Team Protection?'</li>
                        </ul>
                    </div>
                    <div>
                        <asp:Image ID="Image1" runat="server" Width="400px" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgFAQ/FAQ1b.jpg" />
                        <p>
                            In the Pilot Entry screen -</p>
                        <ul>
                            <li>Create two Pilot entries for each person that enters for both classes.<br />
                                Append the Last Name with the class like this<br />
                                Baxter+ALES<br />
                                Baxter+Legacy'<br />
                                The class field is automatically filled in when the pilot is entered.</li>
                            <li>Enter both into the competition AND put both into their own<br />
                                two person 'team' so that they will be in different flight groups.</li>
                            <li>If a pilot enters for only one class simply enter them into the competition<br />
                                as normal and type in the class code for which they have entered.
                            </li>
                            <li>The Class code is for reporting only and does not effect the draw.</li>
                            <li>Finally, create the draw.</li>
                        </ul>
                    </div>
                    <div>
                    <p>
                        Team protection takes care of keeping pilots entered in both classes separated in
                        the draw.<br />
                        <br />
                        
                        The class code will show on the reports.<br />
                        This makes things clear for pilots who entered in only one class<br />
                        but did not have their names modified.
                    </p>
                    </div>
                </div>
                <%--FAQ2--%>
                 <div><p id="hdrFAQ2" onclick="javascript:toggleDiv('FAQ2');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                    <b>2. Can I run a thermal duration competition with target times changing from round to round?</b></p></div>
                 
                           

                <div id="FAQ2" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <div>
                        <asp:Image ID="Image2" runat="server" Width="400px" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgFAQ/FAQ2a.jpg" />
                        <p>
                            Step 1. Set the default target time in the Competition setup screen.<br />
                            This is used unless a different target time is set in the Scoring screen.</p>
                       <br /><br /><br />                       
                    </div>
                    
                    <div>
                        <asp:Image ID="Image3" runat="server" Width="400px" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgFAQ/FAQ2b.jpg" />
                        <p>
                            Step 2. In the Scoring screen there is provision to override the default target time.<br />
                            Change the Target Time for each Round as needed.</p>
                        <p>
                            The target time entered applies for the whole round.  All scores for the round
                            are automatically adjusted if you change the target time.
                        </p>
                    </div>
                    <br />
                </div>

                <%--FAQ3--%>
                <div><p id="hdrFAQ3" onclick="javascript:toggleDiv('FAQ3');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                <%--<div><p id="hdrFAQ3">--%>
                    <b>3. Can I produce a Team Result where only nominated team members qualify for the
                        result?</b></p></div>

                <div id="FAQ3" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        Normally, GliderScore takes the top 'n' pilot scores from each team for the final
                        team result.<br />
                        You nominate how many pilots from each team are to count for the team result.<br />
                        <br />
                        What you need to do in this case is a little different.<br />
                        In this case a team comprises both 'helper' pilots and 'team' pilots, but<br />
                        only the scores of the 'team' pilots are to count for the team result.</p>
                    <p>
                        The steps to take are -</p>
                    <ul>
                        <li>Enter all team members, including helpers, under a unique team number.</li>
                        <li>Create the draw and run the competition.</li>
                        <li>Before producing the final team report, change all 'helpers' to new team numbers<br />
                            so that each 'helper' has his/her own unique team number.</li>
                        <li>Produce the final team report.</li>
                    </ul>
                    <p>
                        It is important to leave the change to the team numbers until the competition is
                        finished.<br />
                        By taking this approach, GliderScore is able to help avoid team clashes in the event
                        of a re-flight.</p>
                </div>
                <%--FAQ4--%>
                <div><p id="hdrFAQ4" onclick="javascript:toggleDiv('FAQ4');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                <%--<div><p id="hdrFAQ4">--%>
                    <b>4. Can I run a World Championship where the defending champion will fly with his country's
                        team members?</b></p></div>

              

                <div id="FAQ4" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        You need to -<br />
                        1. avoid the defending world champion being drawn against pilots from his country's
                        team, and<br />
                        2. exclude the defending world champion's score from the teams result.</p>
                    <p>
                        The steps to take are -</p>
                    <ul>
                        <li>Enter all team members, including the defending world champion, under a unique team
                            number.</li>
                        <li>Ensure that 'Team Protection?' is selected.</li>
                        <li>In the Pilot Entry screen there will be a column headed OTS.<br />
                            This means Omit from Team Score.<br />
                            Place a tick in this column against the entry for the defending world champion.<br />
                            The defending world champion will be excluded from Team results.
                        </li>
                        <li>Create the draw in the normal way. Team protection keeps team members in separate groups.</li>
                    </ul>
             
                </div>
                <%--FAQ5--%>
                <div><p id="hdrFAQ5" onclick="javascript:toggleDiv('FAQ5');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                <%--<div><p id="hdrFAQ5">--%>
                    <b>5. Can I use channel numbers instead of actual frequencies?</b></p></div>

            

                <div id="FAQ5" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        Pilots having the same channel number will be drawn in different flight groups.<br />
                    </p>
                    <p>
                        If you use channel numbers you need to be aware of these points -</p>
                    <ul>
                        <li>Always specify 2.4 as the frequency for pilots on 2.4GHz.</li>
                        <li>The '20KHz Spacing' functionality will not work for channel numbers.</li>
                    </ul>
                </div>
                <%--FAQ6--%>
                <div><p id="hdrFAQ6" onclick="javascript:toggleDiv('FAQ6');" onmouseover="style.color='blue'" onmouseout="style.color='black'" >
                <%--<div><p id="hdrFAQ6">--%>
                    <b>6. I want to draw 3 Groups per Round but GliderScore won't allow less than 5. Why is this?</b></p></div>

             

                <div id="FAQ6" style="display: none; border: 1px solid rgb(0,0,0)">
                    <asp:Image ID="Image4" runat="server" Width="600px" ImageAlign="Right" style="margin-right :4px;margin-top :4px;" ImageUrl="~/ImgFAQ/FAQ6.jpg" />
                    <p>If you are having issues with the minimum Groups/Round, check the number of pilots
                    in each team (if using teams) and the number of pilots on each frequency.</p>
                    <p>
                        To explain, GliderScore adjusts the minimum allowable Groups/Round according to your settings.<br />
                        <br />
                        If 'Use Teams?' AND 'Team Protection?' are selected, the minimum Groups/Round will
                        be the greater of</p>
                    <ul>
                        <li>The count of pilots in the largest team.</li>
                        <li>The count of pilots on the 'most used' frequency (except 2.4GHz)</li>
                    </ul>
                    <p>
                        Otherwise, it will be</p>
                    <ul>
                        <li>The count of pilots on the 'most used' frequency (except 2.4GHz)</li>
                    </ul>
                    <p>
                        What qualifies as the 'most used' frequency can depend on whether '20kHz
                        Spacing?' is selected.<br />
                        For example, pilots on 35.010 and 35.020 would be counted together since, with '20kHz Spacing?' selected,
                        they cannot be drawn in the same group.
                    </p>
                    
                </div>

                <%--FAQ7--%>
                <div>
                    <p id="hdrFAQ7" onclick="javascript:toggleDiv('FAQ7');" onmouseover="style.color='blue'" onmouseout="style.color='black'">
                        <b>7. Can I run two (or more) instances of GliderScore at the same time?</b>
                    </p>
                </div>


                <div id="FAQ7" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        You might want to do this to run two different competitions at the same time, or<br />
                        you might want to keep a particular screen open to avoid having to navigate to it each time,<br />
                        for example, the Reports screen.
                    </p>
                    <p>
                        Start by opening the two instances of GliderScore as shown below.<br />
                        Any window that you open will be centered (as nearly as possible) on the centre of the Main Menu screen.<br />
                        You can tell which competition is open by looking at the top of the currently open screen.<br />
                        The competition name is there to help you.
                    </p>

                    <p>
                        You can only run one instance of the Digital Timer at any one time (from either instance).<br />
                        However, if you have the same competition date for both competitions, it is possible to create<br />
                        a merged Playlist that covers both competitions. If you do this then one instance of the Timer will<br />
                        handle the audio for both competitions.<br />
                        For more information look under the Display/Timer/Audio tab.
                    </p>
                    <asp:Image ID="Image5" runat="server" Width="865px" ImageAlign="Left" ImageUrl="~/ImgFAQ/FAQ7-1.jpg" />

                </div>

                 <%--FAQ8--%>
                <div>
                    <p id="hdrFAQ8" onclick="javascript:toggleDiv('FAQ8');" onmouseover="style.color='blue'" onmouseout="style.color='black'">
                        <b>8. Does GliderScore write data anywhere outside of the C:\GliderScore6 folder?</b>
                    </p>
                </div>


                <div id="FAQ8" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>

                    <p>
                        GliderScore stores your preferences in special folders.<br />
                        It saves preferences that apply every time that you use GliderScore and not just for the current session.<br />
                        One example is the re-sizing of a form. The re-sizing preference is saved for next time.
                    </p>
                    <p>
                        The location of the GliderScore.exe saved data is - <br />
                        &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScore.<br />
                        The Digital Timer also saves preferences such as COM port settings in its own folder -<br />
                        &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScoreDigitalTimer.<br />
                    </p>

                    <p>
                        You can safely delete these two folders at any time. <br />
                        If the folders have been deleted, when you next use the program the folders will be regenerated and<br />
                        any previously saved preferences will be replaced by the default values.<br />
                    </p>

                </div>

                <div>
                    <p id="hdrFAQ9" onclick="javascript:toggleDiv('FAQ9');" onmouseover="style.color='blue'" onmouseout="style.color='black'">
                        <b>9. Can I set up a backup computer in case my primary computer fails?</b></p></div>


                <%-- FAQ 9--%>
                <div id="FAQ9" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>

                    <p><b>Special Folders</b></p>

                    <ul style="position: relative; top: +0px">
                        <li style="list-style: none">In both of the two cases below, there are two special folders that need to be copied onto the backup computer.</li>
                        <li style="list-style: none">They are:<br />
                            &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScore, and<br />
                            &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScoreDigitalTimer.</li>
                        <li style="list-style: none">These folders store your GliderScore settings/preferences including the COM port settings for the Timer program.</li>
                        <li style="list-style: none">It is not sufficient to have these folders on a USB drive. To be effective they have to be on the backup computer.</li>
                    </ul>

                    <p><b>If using eScoring</b></p>

                        <ul style="position: relative; top: +0px">
                            <li style="list-style: none">The rule is that everything to do with the competition must be done using exactly the same data</li>
                            <li style="list-style: none">on both computers.</li>
                            <li style="list-style: none">In setting up the backup computer, an exact copy of the original GliderScore6 folder must be used.</li>
                            <li style="list-style: none">This means that everything, including all of the audio files, will be available.</li>
                            <li style="list-style: none">It also guarantees that the Comp ID and the (internal) pilot numbers are the same on both computers.</li>
                            <li style="list-style: none">Copying the complete GliderScore6 folder is the only way to achieve this.</li>
                        </ul>

                        <ul style="position: relative; top: +0px">
                            <li style="list-style: none">When you are satisfied about everything on your primary computer (competition setup, the pilots, the draw)</li>
                            <li style="list-style: none">copy the entire C:\GliderScore6 folder to a USB drive.<br /></li>
                            <li style="list-style: none">You can run GliderScore from the USB drive after inserting it in the backup computer or</li>
                            <li style="list-style: none">you can copy the complete folder from the USB drive to the backup computer.</li>
                            <li style="list-style: none">In either case you may need to use the Main Menu option 'View/Change DB Folder' to navigate</li>
                            <li style="list-style: none">and connect to the desired database.</li>
                        </ul>



                    <ul style="position: relative; top: +0px">
                            <li style="list-style: none">Exporting the competition and importing it on the backup computer will not work.</li>
                            <li style="list-style: none">The CompIDs and the (internal) pilot numbers will be different on each computer.</li>
                            <li style="list-style: none">The backup computer will not be able to access online data uploaded from the primary computer.</li>
                        </ul>

                        
                        <p><b>If not using eScoring</b></p>

                        <ul style="position: relative; top: +0px">
                            <li style="list-style: none">When you are satisfied with everything on your primary computer (competition setup, the pilots, the draw)</li>
                            <li style="list-style: none">use the Main Menu 'Export' option to export the competition to your selected folder.</li>
                            <li style="list-style: none">Copy the file created by the Export function to the backup computer.</li>
                            <li style="list-style: none">On the backup computer use the Main Menu 'Import' function to import the competition to</li>
                            <li style="list-style: none">the GliderScore database.</li>
                            <li style="list-style: none">You may not have all of the necessary audio files but GliderScore will create any that are missing.</li>
                            <li style="list-style: none">The imported competition will have a new CompID but this does not matter because eScoring is not being used.</li>
                        </ul>
                                    
                    </div>

                                 <%--FAQ8--%>
                <div>
                    <p id="hdrFAQ10" onclick="javascript:toggleDiv('FAQ10');" onmouseover="style.color='blue'" onmouseout="style.color='black'">
                        <b>10. Can I transfer GliderScore to a new computer without losing anything?</b>
                    </p>
                </div>


                <div id="FAQ10" style="display: none; border: 1px solid rgb(0,0,0)">
                    <p><b>Yes.</b></p>
                    <p>
                        This FAQ deals with the situation where your current computer is being 'retired' from GliderScore duties.<br />
                        Instead, a new computer is to take over the running of GliderScore.<br />
                        <br />

                        There is one folder that has to be to be copied across to the new computer and<br />
                        two folders that are optional.<br />
                        The easiest way to move the folders is to use a USB drive.<br />
                        <br />

                        <b>C:\GliderScore6</b><br />
                        This is the folder that has to be copied to the new computer.<br />
                        Copy the C:\GliderScore6 folder from the old computer onto the USB drive.<br />
                        Copy the GliderScore6 folder from the USB drive to the new computer's C drive.<br />
                        <br />

                        At this stage you can use GliderScore on the new computer. However there is more that can be done.<br />
                        <br />

                        <b>C:\Users\YourUserName\AppData\Local\GliderScore</b><br />
                        <b>C:\Users\YourUserName\AppData\Local\GliderScoreDigitalTimer</b><br />
                        Copying these two folders to the new computer is optional.<br />
                        <br />
                        GliderScore stores your preferences in special folders.<br />
                        It saves preferences that are applied every time that you use GliderScore.<br />
                        One example is the re-sizing of a form. The re-sizing preference is saved for next time.<br />
                        Another example is the Email settings that you create.<br />
                    </p>
                    <p>
                        The location of GliderScore's saved preferences is -
                        <br />
                        &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScore<br />
                        The location of DigitalTimer's saved preferences including COM port settings is -
                        <br />
                        &nbsp&nbsp&nbsp C:\Users\YourUserName\AppData\Local\GliderScoreDigitalTimer<br />
                    </p>

                    <p>
                        Locate the two folders on your old computer.<br />
                        They may be hidden folders so you might have to un-hide them.<br />
                        Copy these folders from the old computer onto the USB drive.<br />
                        Copy these folders from the USB drive into the equivelant location on your new computer.<br />
                    </p>
                    <p>
                        You can now run GliderScore on the new computer and it will behave exactly as it did on your old computer.
                    </p>
                </div>





            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
    
   
    
    
</asp:Content>
