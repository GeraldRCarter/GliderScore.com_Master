<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GliderScore</title>
    <link rel="stylesheet" type="text/css" href="Styles.css" />
    <link rel="shortcut icon" href="~/ImgIcon/GliderScore_Icon1.ico" />

    <style type="text/css">
        body {
            max-width: 1200px;
            margin: auto;
            background-color: black;
        }

        pre {
            z-index: 1;
            position: relative;
            top: -23px;
            left: -0px;
            text-indent: 50px;
            width: 1026px;
        }

        h1 {
            z-index: 1;
            text-indent: 140px;
        }

        #GSImage {
            z-index: 3;
            position: relative;
            top: -73px;
            left: 10px;
            width: 100px;
        }

        #menu2 {
            position: relative;
            top: -63px;
        }

        .container {
            position: relative;
            top: -60px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <div class="header">
            <div>
                <div id="menu1">
                    <a href="Contact.aspx">Contact</a> <a href="Download.aspx">Download</a> <a href="Donate.aspx">Donate</a> <a href="Default.aspx">Home</a>
                </div>
                <h1>GliderScore
                </h1>

                <div id="GSImage">
                    <a href="default.aspx">
                        <asp:Image ID="Image2" runat="server" Height="65px" Width="65px" ImageAlign="left"
                            Style="padding-right: 50px; margin: 2px; padding-top: 0;" ImageUrl="~/ImgHomePage/Icon1.jpg" alt="" />
                    </a>

                </div>
                <pre>for all RC Glider Competitions        <a href="CompF3B.aspx">F3B</a>        <a
                href="CompF3F.aspx">F3F</a>        <a href="CompF3J.aspx">F3J</a>        <a href="CompF3K.aspx">F3K</a>        <a href="CompF3L.aspx">F3L</a>        <a href="CompF3Q.aspx">F3Q</a>        <a
                    href="CompF5B.aspx">F5B</a>        <a href="CompF5J.aspx">F5J</a>        <a href="CompF5L.aspx">F5L</a>        <a href="CompThermal.aspx">Thermal</a>        <a
                        href="CompElectric.aspx">Electric</a>        <a href="CompALES.aspx">ALES</a> </pre>
            </div>
            <div id="menu2">
                <a href="Default.aspx">Home</a>
                <a href="MainMenu.aspx">Main Menu</a>
                <a href="Setup.aspx">Comp Setup</a>
                <a href="DrawRounds.aspx">Draw Rounds</a>
                <a href="Audio.aspx">Display/Timer/Audio</a>
                <a href="Scoring.aspx">Scoring</a>
                <%--            <a href="ScoreCheck.aspx">ScoreCheck</a>--%>
                <a href="Reports.aspx">Reports</a>
                <%--            <a href="EmailReports.aspx">Email Reports</a>--%>
                <a href="Donate.aspx">Donate</a>
                <a href="Translate.aspx">Translate</a>
                <a href="FAQ.aspx">FAQ</a>
                <a href="OnLineScores.aspx">OnLine Scores</a>
                <%-- <a href="Contact.aspx">Contact</a>--%>
            </div>
        </div>
        <div style="position: relative; top: -60px; width: 1030px; height: 840px; background-color: lightgray">
            <div style="width: 1000px; height: 500px; top: 20px; position: relative;">
                <asp:Image ID="Image1" runat="server" ImageAlign="Right" ToolTip='Mildura 2013, Gerry Carter photo'
                    ImageUrl="~/ImgDonate/GliderLaunching2.jpg" Style="width: 600px" />
                <h5 style="position: relative; left: 10px;">Donate</h5>
                <br />
                <p style="position: relative; left: 10px;">
                    Click the Donate button to help with the costs of past and future development.
                </p>
                <br />
                <%-- <div style="left: 50px; float: left; position: relative; top: -200px;">--%>
                <div style="position: absolute; left: 140px; top: 150px">
                    <input type="hidden" name="cmd" value="_s-xclick" />
                    <input type="hidden" name="hosted_button_id" value="84Z5H2PD8LBD6" />
                    <input type="image" src="https://www.paypalobjects.com/en_AU/i/btn/btn_donateCC_LG.gif"
                        name="submit" alt="PayPal — The safer, easier way to pay online." />
                    <img alt="" style="border: 0px" src="https://www.paypalobjects.com/en_AU/i/scr/pixel.gif"
                        width="1" height="1" />
                </div>

                <%-- <div class="footer" style="position: absolute; top: 380px">--%>
                <div class="footer" style="position: absolute; top: 680px">
                    <hr />
                    <h3>GliderScore software and this web site Copyright © </h3>
                    <h4>Comments and suggestions welcomed. Send to gerry.carter(at)gliderscore.com</h4>
                    <h4>Software downloaded from this site is provided free and carries no warranty whatsoever.</h4>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
