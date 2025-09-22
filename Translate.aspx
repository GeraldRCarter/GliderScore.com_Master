<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
        Dim varID As String = Request.QueryString().ToString

        Dim CtrTranslate As AjaxControlToolkit.TabContainer = CType(TranslateTabContainer, AjaxControlToolkit.TabContainer)
             
        If varID = "TranslateInformation" Then
            Dim ActivePnl As AjaxControlToolkit.TabPanel = CtrTranslate.FindControl("TranslateInformation")
            CtrTranslate.ActiveTab = ActivePnl
            Exit Sub
        End If
        
       
              
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <style type="text/css">
        .style1
        {
            width: 400px;
            height:32px;
            float: left;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:TabContainer ID="TranslateTabContainer" runat="server">
      <%--Translate--%>
        <asp:TabPanel runat="server" ID="Translate" HeaderText="Translate Menus and Screens" TabIndex="0">
            <ContentTemplate>
                <div>
                    <asp:Image ID="Image6" runat="server" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgMainMenu/MainMenuSelectLanguage.jpg" />
                    <br />
                    <h5>
                        Translate into any language</h5>
                    <p>
                        GliderScore can translate practically everything on screen (and on
                        reports) into ANY language.<br /><br />
                        </p>
                    <p>From Version 6.51, all translation files are included with the full download.<br /><br />
                        The same files are available for download at the end of this page.<br />
                        After download, they should be moved to the C:\GliderScore6\Translations folder.
                    </p>
                    </div>
                <div>
                        <p>
                        There is only one requirement to make this all happen.</p>
                    <ul>
                        <li>The language files <i>MyLanguage.lng</i> must be in a sub-folder named 'Translations'.<br />
                            The sub-folder will normally be 'C:\GliderScore6\Translations'.<br />
                            More specifically, it will be a sub-folder of the folder where GliderScore.exe is located.<br />
                            If GliderScore.exe is located in 'C:\Users\Documents\GliderScore', then the sub-folder must be 'C:\Users\Documents\GliderScore\Translations'.
                        </li>
                    </ul>
                    <p>
                        Select a language from the list and translation happens instantly.<br />
                        Ukrainian is selected as an example.<br /><br />
                        
                        It helps a lot to know somebody who can translate English words into your
                        language. Translation software such as Google Translate can help.</p>
                    <p>
                        See below for an example of a translated screen and further below for 
                        instructions on making (or editing) your own language file.
                        </p>
                </div>
                <div>
                <asp:Image ID="Image1" runat="server" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgMainMenu/MainMenuUkrainian.jpg" />

                    <p>
                        This screen was translated according to the words in the file Ukrainian.lng.<br />
                        <br />
                        All screens are translated in a similar way.<br />
                        <br />
                        All of the critical user interface text is available for translation and this should enable anyone to use the program.<br />
                        <br />

                        Files are available for Chinese, Czech, Danish, Finnish, French, German, Greek, Hungarian, Italian, Japanese, Norwegian,
                 Russian, Slovakian, Slovenian, Spanish, Swedish, Turkish and Ukrainian as well as English.
                 These files are available from the <a href="Download.aspx">Download</a> page.<br />
                 However, they are all included in the full download of GliderScore Version 6.51 (and above).

                    </p>
                    
                </div>
                <div>
                    <br /><br />
                <asp:Image ID="Image2" runat="server" ImageAlign="Right" style="margin-right :4px;" ImageUrl="~/ImgMainMenu/EnglishUkrainian.jpg" />
                    <p>
                        <b>Create Your Own Language File</b><br />
                        In fact there must be at least two language files for translation to occur.<br />
                        English.lng and <i>YourLanguage.lng</i>.<br />
                        The file 'English.lng' always exists and is re-created every time the program runs so you do not have
                        to do anything with it.<br />
                        <br />
                        However 'English.lng' can be used as a starting point for a new language file.  Just copy it to make a new file
                        called <i>Mylanguage.lng</i>.
                        Then replace all the english words with words in your own language.<br />
                        <br />
                        Place your new file in the sub-folder 'Translations' (of the folder containing GliderScore.exe) and run the program. GliderScore will
                        add your language to the list so that you can select it. Once selected, translation takes
                        place for all translated words.<br />
                        <br />
                        The numbers provide the link that enables translation.<br />
                        <br />
                        The program takes care of limited formatting, stripping out double-quote marks,
                        removing leading spaces, trailing spaces and tab characters.<br />
                        </p>
                       <%-- <p>
                            <b>Submit Completed Translations</b> for the benefit of others.<br />
                            Because the language files are computer generated, they will generally be incomplete 
                        and quite possibly inaccurate translations of the file English.lng.<br />
                            If you have a complete translation for your language, please send your file to me<br />
                            and I will either add it to the downloads or use it to replace an existing download<br />
                            so that others can benefit.<br />
                            <br />

                        </p>--%>
                         <br /><br />
                        <h5>DOWNLOAD LANGUAGE FILES</h5>
                      <p>  I have created some 'starter' language files using Google Translate. I have no idea<br />
                        how good (or bad) the translation is. In some cases I believe that it is quite bad,<br />
                        but not always.  You can and should correct the translations in these files.<br />
                       <%-- <br />
                        Go to the <a href="Download.aspx">Download</a> page to download Translations.zip, a 'package' of language files.--%>
                    </p>
                    
                 <p>
                 <b>COMPLETED TRANSLATIONS</b> <br />
                    
                    Please send me your completed translations to replace the 'Google Translate' translations below.<br />
                   If you send a translation file for a &#39;new&#39; language I will add it to the available downloads.</p>
                
                
                  
                    All language files are included in the full download from Version 6.51 and higher.</p>
                    <ul>
                        <li style="list-style: none"><b>For Versions up to 6.50</b></li>
                        <li>Download, then move files to 'C:\GliderScore6'.</li>
                        <li style="list-style: none"><b>From Version 6.51</b></li>
                        <li>Download, then move file/s to 'C:\GliderScore6\Translations'.<br />
                            The 'Translations' folder must be a sub-folder of the folder where GliderScore.exe is located.
                        </li>
                    </ul>
                    
                   <p>
                    &nbsp;- Click below to download a particular language file. Translations made with 
                    the help of 'Google Translate' have black text.<br />
                    &nbsp;&nbsp;&nbsp;Full translations contributed by friends have
                    <span style="color:blue; font-size:13px">blue</span> text. Make corrections to 
                    the translations as needed.<br />
                    &nbsp;- Open &#39;C:\GliderScore6\Translations\English.lng&#39; to see all the English text and/or to use as a 
                    &#39;template&#39; to create a new language file.<br />
                    &nbsp;- Alternatively, download and save Translations.zip, then extract the 
                    language/s that you need to folder C:\GliderScore6\Translations.<br />
                   <%-- See the <a href="Translate.aspx">Translate</a> tab for more details about 
                    language files. You will also see how to make translations of the information files.<br />--%>
                    </p>
                
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                
                                      <input type="button" name="btnChinesen" style="color: #333333; font-size: 16px; 
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Chinese.lng" 
                                      onclick ="window.open('ziplang/Chinese.lng', 'download'); return false;"/>
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnCzech" style="color: #333333; font-size: 16px; 
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Czech.lng"
                                      onclick ="window.open('ziplang/Czech.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnDanish" style="color: #333333; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Danish.lng"
                                      onclick="window.open('ziplang/Danish.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnEnglish" style="color: #333333; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" English.lng"
                                      onclick="window.open('ziplang/English.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnEspañol" style="color:blue; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Español.lng"
                                      onclick="window.open('ziplang/Español.lng', 'download'); return false;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" name="btnFinnish" style="color: #333333; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Finnish.lng"
                                      onclick="window.open('ziplang/Finnish.lng', 'download'); return false;" />
                            </td>                   
                            <td>
                                &nbsp;<input type="button" name="btnFrench" style="color:blue; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" French.lng"
                                      onclick="window.open('ziplang/French.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnGerman" style="color:blue; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" German_TL.lng"
                                      onclick="window.open('ziplang/German_TL.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnGreek" style="color: #333333; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Greek.lng"
                                      onclick="window.open('ziplang/Greek.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnHungarian" style="color: #333333; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Hungarian.lng"
                                      onclick="window.open('ziplang/Hungarian.lng', 'download'); return false;" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <input type="button" name="btnItaliano" style="color:blue; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Italiano.lng"
                                      onclick="window.open('ziplang/Italiano.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnJapanese" style="color:blue; font-size: 16px;
                                      position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;" value=" Japanese.lng"
                                      onclick="window.open('ziplang/Japanese.lng', 'download'); return false;" />
                            </td>
                            <td>
                                &nbsp;<input type="button" name="btnNorwegian" style="color: blue; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Norwegian.lng"
                                    onclick="window.open('ziplang/Norwegian.lng', 'download'); return false;" />
                            </td>

                            <td>
                                &nbsp;<input type="button" name="btnPolish" style="color: blue; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Polish.lng"
                                    onclick="window.open('ziplang/Polish.lng', 'download'); return false;" />
                            </td>


                            <td>&nbsp;<input type="button" name="btnRussian" style="color: #333333; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                value=" Russian.lng"
                                onclick="window.open('ziplang/Russian.lng', 'download'); return false;" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>&nbsp;<input type="button" name="btnSlovak" style="color: blue; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                value=" Slovak.lng"
                                onclick="window.open('ziplang/Slovak.lng', 'download'); return false;" />
                            </td>
                            <td>
                                <input type="button" name="btnSlovenian" style="color: #333333; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Slovenian.lng"
                                    onclick="window.open('ziplang/Slovenian.lng', 'download'); return false;" />
                                <td>&nbsp;<input type="button" name="btnSwedish" style="color: blue; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Swedish.lng"
                                    onclick="window.open('ziplang/Swedish.lng', 'download'); return false;" />
                                </td>
                                <td>&nbsp;<input type="button" name="btnTurkish" style="color: #333333; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Turkish.lng"
                                    onclick="window.open('ziplang/Turkish.lng', 'download'); return false;" />
                                </td>
                                <td>&nbsp;<input type="button" name="btnUkrainian" style="color: #333333; font-size: 16px; position: relative; top: -10px; left: 0px; width: 150px; margin-top: 0px;"
                                    value=" Ukrainian.lng"
                                    onclick="window.open('ziplang/Ukrainian.lng', 'download'); return false;" />
                                </td>
                                <td></td>
                        </tr>
                      
                    </table>
                                      <input type="button" name="btnTranslations" style="color: #333333; font-size: 16px; 
                                      position: relative; top: -10px; left: 200px; width: 340px; margin-top: 0px;" value="Download Translations.zip"
                                      onclick="window.open('ziplang/Translations.zip', 'download'); return false;" />
                    


                </div>
            </ContentTemplate>
        </asp:TabPanel>

          <asp:TabPanel runat="server" ID="TranslateInformation" HeaderText="Translate Information (Help)" TabIndex="0">
            <ContentTemplate>
                <div>
                    <asp:Image ID="Image3" runat="server" ImageAlign="Right" style="border-style:solid; border-width :thin" ImageUrl="~/ImgMainMenu/EnglishInfo.jpg" />
                    <br />
                    <h5>
                        Translate the Information (help) text into any language</h5>
                    <p>
                        From V6.40, GliderScore information (help) text is stored in a file separate from the program file.<br />
                        This file is called English.info.<br />
                        A small sample from this file is shown on the right.<br />
                        Note that a fresh copy is created every time the program starts.<br />
                     
                        </p>
                    </div>
                <div>
                    <p>
                        The basic steps to follow to translate the Information to your language are quite straightforward.<br />
                        Note that all translation files are located in a separate folder called 'Translations'.<br />
                        This folder will normally be 'C:\GliderScore6\Translations'.<br />
                        More specifically, it must be a sub-folder of the folder where GliderScore.exe is located.
                    </p>
                    <ul>
                        <li>You must have firstly created a translation file for the menu and screen text called <i>MyLanguage</i>.lng.</li>
                        <li>Make a copy of English.info and rename it <i>MyLanguage</i>.info.</li>
                        <li>Make changes to your <i>MyLanguage</i>.info file to create the translated information.</li>
                        <li>Do not make any changes to the lines starting with #PageTag" or #ItemTag#.<br />
                            These lines are used by the program to find the required information.<br />
                            The text on the lines that start with #PageHdr# and #ItemHdr# can and should be translated.
                        </li>
                        <li>To use your translated information (help) file, simply select your language from the list on the Main Menu.</li>
                        <li>Note that the program will look for your file in the sub-folder 'Translations' as described above.<br />
                            If not found, the English.info data will be used instead.
                        </li>
                    </ul>
                    <br />           
                </div>

                <div>
                    <asp:Image ID="Image5" runat="server" ImageAlign="Right" style="border-style:solid; border-width :thin" ImageUrl="~/ImgMainMenu/InfoFileTranslationGuide.jpg" />
                    <p>When creating a translation of the English.info file, follow the guidelines shown here.<br />
                       Do not change the #PageTag# or #ItemTag# lines in any way.
                    </p>
                    <br />
                </div>

                <div>
                    <br />
                    <asp:Image ID="Image4" runat="server" ImageAlign="Right" ImageUrl="~/ImgMainMenu/EnglishInfoDisplay.jpg" />
                    <p>The first Information item above displays as shown on the right.</p>
                </div>

                

            </ContentTemplate>
        </asp:TabPanel>



    </asp:TabContainer>

</asp:Content>

