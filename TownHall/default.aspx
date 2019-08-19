<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SyComEngaged.TownHall._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dv_Container{
            margin:20px auto;
            width:400px;
            padding:10px;
            border:1px solid #777;
            border-radius:4px;
            text-align:center;
        }
    </style>
    <div class="eng_welcome"><b>TownHall Questions!</b><br /> Have a question that you'd like to see answered in the Town Hall meeting?  Submit that question here to be reviewed! Oh, and if thats not enough, you'll also earn 5 Engaged Points for submitting your question! </div>
    <div class="dv_Container">
        <dx:ASPxMemo runat="server" ID="mem_question" Width="400" Height="300" AutoResizeWithContainer="true"></dx:ASPxMemo><br />
        Post Anonymously: <dx:ASPxCheckBox ID="cb_anon" runat="server"></dx:ASPxCheckBox>
        <dx:ASPxButton runat="server" ID="btn_submit" OnClick="btn_submit_Click" Text="Submit" HorizontalAlign="Right"></dx:ASPxButton>
        <div runat="server" id="div_results"></div>
    </div>
</asp:Content>
