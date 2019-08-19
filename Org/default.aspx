<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SyComEngaged.Org._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

		<link href="/css/reset-html5.css" rel="stylesheet" media="screen" />
		<link href="/css/micro-clearfix.css" rel="stylesheet" media="screen" />
		<link href="/css/stiff-chart.css" rel="stylesheet" media="screen" />
		<link href="/css/custom.css" rel="stylesheet" media="screen" />

    <style>
body { background-color:#fafafa; font-family:'Roboto';}
</style>
    <div class="jquery-script-clear"></div>
		<!--[if lt IE 8]>
		    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
		<![endif]-->
		
		<div class="chart-container">
			<div id="SyComChart">
			  <div class="stiff-chart-inner" id="cinner" runat="server">	      
			    


			  </div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

		
		<script src="/scripts/stiffChart.js"></script>
		<script>
			$(document).ready(function() {
			  $('#SyComChart').stiffChart({
			    
			  });
			});
		</script>
		



</asp:Content>
