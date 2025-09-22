<%@ Page Title="" Language="VB" MasterPageFile="MasterPage1.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:TabContainer ID="TabContainer1" runat="server">
        <asp:TabPanel runat="server" ID="ContactHome" HeaderText="Contact" TabIndex="0">
            <ContentTemplate>
                <%-- <asp:Image ID="Image3" runat="server" AlternateText="Post Office Bay - Galapagos Islands"
                        ImageAlign="Right" ImageUrl="~/ImgContact/PostOfficeBox.JPG" ToolTip='Post Office Bay - Galapagos Islands - July 2009' />--%>
                <%-- <asp:Image ID="Image1" runat="server" AlternateText="Diggers Rest Sept 2011"
                        ImageAlign="Right" ImageUrl="~/ImgContact/DiggersRestSep2011.JPG" ToolTip='Diggers Rest Sept 2011' />--%>
                <asp:Image ID="Image2" runat="server" ImageAlign="Right" ToolTip='Mildura 2013, Gerry Carter photo'
                    ImageUrl="~/ImgContact/GliderLaunching2.JPG" AlternateText="Mildura 2013" />
                <h5>Contact
                </h5>
                <p>
                    Suggestions
                </p>
                <p>
                    Please email any suggestions to improve GliderScore.
                </p>
                <p>
                    Having problems with the program?
                </p>
                <ul>
                    <li>Try clicking the information buttons within the program and read carefully.</li>
                    <li>Send me an email if the information that you need isn't there.</li>
                    <li>It often helps if you send me your database.<br />
                        Before you do, rename it from GliderScoreData.mdb to GliderScoreData.bmp.<br />
                        This will prevent the file from being blocked by my email server.
                    </li>
                </ul>
                <p>

                    <%--My email address is&nbsp;<b><a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#103;&#101;&#114;&#114;&#121;&#46;&#99;&#97;&#114;&#116;&#101;&#114;&#64;&#103;&#108;&#105;&#100;&#101;&#114;&#115;&#99;&#111;&#114;&#101;&#46;&#99;&#111;&#109;'>&#103;&#101;&#114;&#114;&#121;&#46;&#99;&#97;&#114;&#116;&#101;&#114;&#64;&#103;&#108;&#105;&#100;&#101;&#114;&#115;&#99;&#111;&#114;&#101;&#46;&#99;&#111;&#109;</a>
</b>--%>
My email address is &nbsp;<b>&#103;&#101;&#114;&#114;&#121;&#46;&#99;&#97;&#114;&#116;&#101;&#114;&#64;&#103;&#108;&#105;&#100;&#101;&#114;&#115;&#99;&#111;&#114;&#101;&#46;&#99;&#111;&#109;</b>
                </p>
                <%--                <br />
                <p style ="color :red">I will not have regular internet access for several months (starting June 23, 2017) so please be patient if waiting for a reply. I will respond as soon as I can.<br />
                    If you are having issues then it is helpful to send images of the screens so that I can see what is happening.<br />
                    It is also often helpful to have your database so please follow the instructions above and send it to me.<br />
                    This will save time and enable me to quickly help you with your issue.
                </p>--%>
            </ContentTemplate>
        </asp:TabPanel>
       

    </asp:TabContainer>
</asp:Content>
