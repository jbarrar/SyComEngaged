<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SyComEngaged.Directory._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <dx:ASPxCardView ID="cv_Employees" runat="server" KeyFieldName="id" width="800px" Styles-Card-Height="20" >
                <Columns>
                    <dx:CardViewColumn FieldName="employee" Caption="Employee" Settings-AllowFilterBySearchPanel="true" Settings-AllowHeaderFilter="false" Settings-FilterMode="DisplayText" />
                <dx:CardViewColumn FieldName="department" Settings-AllowFilterBySearchPanel="true" Settings-AllowHeaderFilter="true" />
                <dx:CardViewColumn FieldName="title" Settings-AllowFilterBySearchPanel="true" Settings-AllowHeaderFilter="true" />
                <dx:CardViewHyperLinkColumn FieldName="email" Caption="Profile" ReadOnly="True" VisibleIndex="0">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:document.location.href='/directory/profile.aspx?id={0}';"
                        Text="View Profile">
                    </PropertiesHyperLinkEdit>
                </dx:CardViewHyperLinkColumn>
        </Columns>
            <CardLayoutProperties ColCount="2">
                <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
            </CardLayoutProperties>
            <Settings LayoutMode="Table" />
            <Styles>
                <Card Width="200px" Height="200px"></Card>
            </Styles>
        <SettingsBehavior AllowSelectByCardClick="true" SortMode="Value"  />
        <TotalSummary>
            <dx:ASPxCardViewSummaryItem FieldName="id" SummaryType="Count" ValueDisplayFormat="Total Employees: {0}" />
        </TotalSummary>
        <SettingsSearchPanel Visible="true" />
        <SettingsPopup>
            <HeaderFilter Height="200" />
        </SettingsPopup>

    </dx:ASPxCardView>
</asp:Content>
