<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="EditNomination.aspx.cs" Inherits="SyComEngaged.EditNomination" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="text-align:center;margin:10px auto;"><asp:TextBox runat="server" ID="txt_Edit" TextMode="MultiLine" Columns="100" Rows="30"></asp:TextBox><br />
        <asp:Button ID="btn_Edit" runat="server" Text="Submit Edit" OnClick="btn_Edit_Click" />
    </div>
</asp:Content>
