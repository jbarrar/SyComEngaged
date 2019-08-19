<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Campaign.aspx.cs" Inherits="SyComEngaged.Campaign.Campaign" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxButton runat="server" ID="btn_join_campaign" OnClick="btn_join_campaign_Click" Text="Join Campaign!"></dx:ASPxButton>
    <div runat="server" id="camp_container">
    </div>
    <div runat="server" id="camp_members"></div>
</asp:Content>
