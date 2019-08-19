<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="SyComEngaged.admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource runat="server" ID="ds_Managers" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select lower(email) as email, CONCAT(fname, ' ', lname) as name from eng_users where is_active=1 order by name"
        
        ></asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="ds_Users" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select id, email, lname, fname, reports_to, title, department, location, birthday, hiredate, is_active, is_admin from eng_users"
        UpdateCommand="Update [eng_users] set [email]=@email, [lname]=@lname, [fname]=@fname, [reports_to]=@reports_to, [title]=@title, [department]=@department, [location]=@location, [birthday]=@birthday, [hiredate]=@hiredate, [is_active]=@is_active, [is_admin]=@is_admin where id=@id"
        InsertCommand="Insert into [eng_users] ([email], [lname], [fname], [reports_to], [title], [department], [location], , [birthday], [hiredate], [is_active], [is_admin]) VALUES (@email, @lname, @fname, @reports_to, @title, @department, @location, @birthday, @hiredate, @is_active, @is_admin)"
        DeleteCommand="Update [eng_users] set [is_active]=0 where id=@id"
        >
        <InsertParameters>            
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="email" type="String" />
            <asp:Parameter Name="fname" type="String" />
            <asp:Parameter Name="lname" type="String" />
            <asp:Parameter Name="reports_to" type="String" />
            <asp:Parameter Name="title" type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="birthday" Type="DateTime" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hiredate" Type="DateTime" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="is_active" Type="Boolean" />
            <asp:Parameter Name="is_admin" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="email" type="String" />
            <asp:Parameter Name="fname" type="String" />
            <asp:Parameter Name="lname" type="String" />
            <asp:Parameter Name="reports_to" type="String" />
            <asp:Parameter Name="title" type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="birthday" Type="DateTime" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hiredate" Type="DateTime" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="is_active" Type="Boolean" />
            <asp:Parameter Name="is_admin" Type="Boolean" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <dx:ASPxGridView runat="server" ID="gv_UserAdmin" KeyFieldName="id" DataSourceID="ds_Users">
        <Columns>
            <dx:GridViewDataColumn FieldName="email" Caption="Email"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="fname" Caption="First"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="lname" Caption="Last"></dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn FieldName="reports_to" Caption="Reports To">
                <PropertiesComboBox DataSourceID="ds_Managers" TextField="name" ValueField="email" IncrementalFilteringMode="StartsWith" EnableSynchronization="False"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn FieldName="title" Caption="Title"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="department" Caption="Dept"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="location" Caption="Location"></dx:GridViewDataColumn>
            <dx:GridViewDataDateColumn FieldName="birthday" Caption="Birthday" PropertiesDateEdit-AllowNull="true"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="hiredate" Caption="Hire Date" PropertiesDateEdit-AllowNull="true"></dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="is_active" Caption="Active"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="is_admin" Caption="Admin"></dx:GridViewDataCheckColumn>
        </Columns>
        <Settings ShowFilterBar="Auto" ShowFooter="true" ShowGroupedColumns="true" />
        <SettingsEditing Mode="Batch"></SettingsEditing>
        <SettingsBehavior AllowSort="true" AllowGroup="true" />
        <SettingsContextMenu Enabled="true"></SettingsContextMenu>
        <SettingsPager Mode="ShowPager" PageSize="30"></SettingsPager>
    </dx:ASPxGridView>
</asp:Content>
