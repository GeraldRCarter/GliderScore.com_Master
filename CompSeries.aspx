<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage1.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">


    <br />     
  <h5>Competition Series<asp:ImageMap ID="ImageMap1" runat="server" 
          ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesSelections.jpg" 
          Width="600px">
      <asp:RectangleHotSpot AlternateText="Report" Bottom="166" 
          HotSpotMode="Navigate" Left="284" NavigateUrl="#report" Right="339" Top="143" />
      </asp:ImageMap>
</h5><br />
  
  You can construct a competition series from your competitions.<br />
    <br />
    Useful where you run a series of (say) thermal comps over a season and need to 
    work out the series winner.<br />
    <br />
    As the competitions are run, they can be added to the series and a progressive 
    report produced.<br />
    <br />
    Scores from the selected competitions are normalized to 1000 points (for each 
    winner).<br /><br />
    See the sample <a href="#report">report</a> below.
    
    
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <div ><a href="#" style="font-size: 10px;" >Back to top</a></div>
    <hr />
    <asp:Image ID="Image4" runat="server" ImageAlign="Right" ImageUrl="~/ImgCompSeries/CompSeriesReport.jpg" />
 <br /> 
 <a name="report"></a>    
  <h5>Competition Series Report</h5><br /><br />
  
  This example shows a competition series where four events have been flown, and the 
    three best results of each pilot are counted.<br />
        
    
    
    
</asp:Content>
