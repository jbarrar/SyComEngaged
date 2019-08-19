<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Winners.aspx.cs" Inherits="SyComEngaged.admin.Winners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="ds_Winners" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select id, month, year, nom_id, winner_id from eng_winners"
        UpdateCommand="Update eng_winners set [month] = @month, [year] = @year, [nom_id]=@nom_id, [winner_id] = @winner_id where id=@id"
        InsertCommand="Insert into eng_winners ([month], [year], [nom_id], [winner_id]) VALUES (@month, @year, @nom_id, @winner_id)"
        >
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="month" type="Int32" />
            <asp:Parameter Name="year" type="Int32" />
            <asp:Parameter Name="nom_id" type="Int32" />
            <asp:Parameter Name="winner_id" type="Int32" />
        </UpdateParameters>
        <InsertParameters>            
            <asp:Parameter Name="month" type="Int32" />
            <asp:Parameter Name="year" type="Int32" />
            <asp:Parameter Name="nom_id" type="Int32" />
            <asp:Parameter Name="winner_id" type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_Nominations" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select id, title from eng_nominations">   

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_Users" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select id, CONCAT(fname, ' ', lname) as name from eng_users order by lname">   

    </asp:SqlDataSource>

    <dx:ASPxGridView runat="server" ID="gv_Winners" DataSourceID="ds_Winners" KeyFieldName="id" SettingsBehavior-AllowGroup="true" SettingsBehavior-AllowSort="true" SettingsDataSecurity-AllowEdit="true">
        
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            <dx:GridViewDataColumn FieldName="year" Caption="year"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="month" Caption="month"></dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn FieldName="nom_id" Caption="Nomination">
                <PropertiesComboBox TextField="title" ValueField="id" DataSourceID="ds_Nominations"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="winner_id" Caption="Winner">
                <PropertiesComboBox TextField="name" ValueField="id" DataSourceID="ds_Users"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Settings ShowFilterBar="Auto" ShowFooter="true" ShowGroupedColumns="true" ShowGroupPanel="true" />
        <SettingsEditing Mode="Batch"></SettingsEditing>
        <SettingsBehavior AllowSort="true" AllowGroup="true" />
        <SettingsContextMenu Enabled="true"></SettingsContextMenu>
        <SettingsPager Mode="ShowPager" PageSize="30"></SettingsPager>


    </dx:ASPxGridView>
</asp:Content>
