<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TabContainer ID="EmailReports" runat="server" ActiveTabIndex="0">
        <asp:TabPanel runat="server" ID="TabHome" HeaderText="Email Reports" TabIndex="0">
            <ContentTemplate>
             <div>
                   <h5>
                    Email Reports<asp:Image ID="Image1" runat="server" ImageAlign="Right" ImageUrl="~/ImgEmail/EmailReports.jpg">
                    </asp:Image>
                </h5>
                <p>
                    This screen is accessible from the Competition setup screen.<br />
                </p>
                <ul>
                    <li>Automatically fills in email addresses for the competition pilots.</li>
                    <li>Lists all available reports that can be attached. Click to attach.</li>
                    <li>Allows browsing for other files and attaching them to the email.<br />
                        These could be photos, PDF versions of the reports (that you create yourself) or
                        anything else at all.</li>
                </ul>
                <ul>
                    <li>Allows copies to be sent to others.</li>
                    <li>Allows space for a message.</li>
                    <li>All pilots are listed. Missing or invalid email addresses
                        can be edited on this screen. Changes are saved on the pilot master file record.</li>
                </ul>
                <ul>
                    <li>A copy of the email is sent to your nominated email address so that you have a record
                        of what was sent.</li>
                    <li>All downloaded reports are deleted when you close the screen.</li>
                </ul>
                <p>  
                    Click the <b>Email Settings</b> button to create and save
                    the settings needed to send your email.<br />
                    See below for details about <b>Email Settings</b>.
                </p>
                </div>
             
                <div>
                <hr />
                    <h5>Email Settings
                     <asp:Image ID="Image2" runat="server" ImageAlign="Right" ImageUrl="~/ImgEmail/EmailSetup.jpg"></asp:Image>
                    </h5>
                
             
                <p>
                    <b>These settings depend on the email service that you want to use.</b>
                    It may be the service provided by your internet service provider or a service provided by Google (gMail), Hotmail or similar.<br /><br />
                    
                    <b>If provided by your internet service provider -</b> <br />
                     - your email address will be of the form <i>my.name@internetprovider.com.</i><br />
                     - your POP/SMTP Server name will be of the form <i>mail.internetprovider.com.</i><br />
                     - there is no need to enter anything in the SSL Port field.<br />
                     - your login name and password are the same as you would normally use to log on to your email account.<br /><br />
                    
                    <b>If you want to send using your gMail, Hotmail or similar account -</b> <br />
                     - your email address will be of the form <i>my.name@serviceprovider.com</i>.<br />
                     - your POP/SMTP Server name will be of the form <i>smtp.serviceprovider.com</i>.<br />
                     - the SSL Port field value is whatever your service provider specify for this purpose.<br />
                     - with the exception of gMail, your login name and password are the same as you would normally use to log on to your email account.<br /> 
                     - for gMail your login name is your usual login name and the password is a specially generated 'app password' (see below).
                    <br />
                    This information is saved on your computer and used for sending the emails that you create.<br />
                    <br />
                    Your password is saved in encrypted form to protect your privacy.<br />
                    <br />
                    You can change these settings at any time.
                </p>
                    <p>
                        <b>About gMail and the 'App Password' ..........</b><br />
                        Google require two extra steps to send emails from a gMail account.<br /> </p>
                        <ul>
                            <li>Turn on 2-Step Verification, and</li>
                            <li>Generate an App Password (to use instead of the usual password)</li>
                        </ul>
                      <p>Log in to your gMail account and click on the cog wheel for settings -
                      <ul>
                        <li>Navigate to Settings→Accounts and Import→Change Account Settings→Other Google Account settings.</li>
                        <li>Activate 2-Step Verification<br />
                            Go to Sign-in and Security→Signing in to Google→2-Step Verification</li>
                        <li>Generate an App Password<br />
                            Go to Sign-in and Security→Signing in to Google→App passwords</li>
                    </ul>
                    <p>
                        In GliderScore, use the <b>App Password</b> that was generated instead of your usual password.<br />
                        Save your settings. Send your email!
                    </p>
<br /><br />
                </div>

                <div>
                 <hr />
                    <h5>Pilot Email Addresses
                              <asp:Image ID="Image3" runat="server" ImageAlign="Right" ImageUrl="~/ImgEmail/PilotEmailAddress.jpg">
                </asp:Image>
                        </h5>
               
                    <p>
                     Click on <b>Pilots</b> on the Main Menu to access the pilot records.<br /><br />
                        This is where the email addresses are saved.<br /><br />
                       
                       When you go to Email Reports, the email form is automatically filled
                            with addresses from the Pilots file.</p>
                    
                  
              
                </div>
                
            </ContentTemplate>
        </asp:TabPanel>
       
    </asp:TabContainer>
</asp:Content>
