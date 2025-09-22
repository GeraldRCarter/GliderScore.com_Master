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
        <asp:TabPanel runat="server" ID="DownloadTab" HeaderText="GliderScore - Other Audio Downloads" TabIndex="0">
            <ContentTemplate>
                <h5>
                     Audio Timer Files Contributed by Others
                </h5>
                
                <p>
                    This page has audio files created by others. <br />
                    If you have done the same, and are prepared to share them,<br />
                    please send them to me and I will add them to this page.</p>

                <div>
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="12 Minute Working Time 5 Second Start.zip   (1178KB)"
                        onclick="window.open('zipaudio/12_Minute_Working_Time_5_second_start.zip', 'download'); return false;" />
                    <p style="padding-left: 40px">
                        <b>5 second countdown to a 12 minute working time.</b><br />
                        Flying can begin with very little delay.<br />
                        Contributed by Jack Murphy.
                    </p>
                </div>

                <div>
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="ALES 5m 10m.zip   (693KB)"
                        onclick="window.open('zipaudio/ALES-5m-10m.zip', 'download'); return false;" />
                    <p style="padding-left: 40px">
                        <b>This file is for ALES competitions.</b><br />
                        5 minute prep-time and 10 minute working time.<br />
                        Contributed by Dan Vester.
                    </p>
                </div>

                <div>
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="0.5m-Silence.mp3   (30KB)"
                        onclick="window.open('zipaudio/0.5m-Silence.mp3', 'download'); return false;" />
                    <p style="padding-left: 40px">
                        <b>Silence of up to 2.5 minutes can be set</b> by using this '0.5 minutes of silence' file
                         in place of the '1 minute of silence' file.<br />
                        Contributed by Gerry Carter.
                    </p>
                     <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="1.0m-12m.zip   (624KB)"
                        onclick="window.open('zipaudio/1.0m-12m.zip', 'download'); return false;" />
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="1.5m-12m.zip   (627KB)"
                        onclick="window.open('zipaudio/1.5m-12m.zip', 'download'); return false;" />
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="2.0m-12m.zip   (678KB)"
                        onclick="window.open('zipaudio/2.0m-12m.zip', 'download'); return false;" />
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="2.5m-12m.zip   (683KB)"
                        onclick="window.open('zipaudio/2.5m-12m.zip', 'download'); return false;" />
                    <p style="padding-left: 40px">
                        <b>These files are all for a 12 minute working time with various lead in times.</b><br />
                           The 1.5m and 2.5m lead in is simply 30 seconds of silence before the count down begins.<br />
                           Voice generated courtesy of 'AT&T Natural Voices'.<br />
                           Files constructed using WavePad Sound Editor software.<br />
                        Contributed by Gerry Carter.
                    </p>
                </div>

                <div>
                    <input type="button" name="Button" style="color: blue; font-size: 16px; position: relative; top: 5px; float: right; width: 440px; margin-top: 0px;"
                        value="5.0m-11m.zip   (12,725KB)"
                        onclick="window.open('zipaudio/5.0m-11m.zip', 'download'); return false;" />
                    <p style="padding-left: 40px">
                        <b>This file meets the requirements of UK eSoaring Rules 2015.</b><br />
                        5 minute prep-time and 11 minute working time.<br />
                        Contributed by Martin Bell.
                    </p>
                </div>



            </ContentTemplate>
        </asp:TabPanel>

    </asp:TabContainer>
</asp:Content>

