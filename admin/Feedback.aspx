<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SyComEngaged.admin.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .div_item{
            border:1px solid #CCC;
            padding:2px;
            margin:2px;
        }
    </style>
    <div>
        <asp:SqlDataSource runat="server" ID="ds_Feedback" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
            SelectCommand="Select * from eng_Feedback"
            >
            <UpdateParameters>
                <asp:Parameter Name="status" Type="String" />
            </UpdateParameters>

        </asp:SqlDataSource>
        <dx:ASPxGridView runat="server" ID="gv_Feedback" DataSourceID="ds_Feedback" KeyFieldName="id">
            <SettingsContextMenu Enabled="true" RowMenuItemVisibility-DeleteRow="true" RowMenuItemVisibility-NewRow="false" RowMenuItemVisibility-EditRow="true"></SettingsContextMenu>
            <SettingsEditing Mode="Inline"></SettingsEditing>
        </dx:ASPxGridView>
    </div>
</asp:Content>
