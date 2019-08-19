<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Leaderboards.aspx.cs" Inherits="SyComEngaged.Leaderboards" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Height="400px" Width="700px">

    </dxchartsui:WebChartControl>

    
    <dxchartsui:WebChartControl ID="ch_TotalPoints" runat="server" Height="400px" Width="700px">

    </dxchartsui:WebChartControl>--%>
    <style>
        .div_Leaderboard{
            float:left;
            border:1px solid #CCC;
            padding:2px;
            margin:2px;
            border-radius:3px;
            width:350px;
        }
    </style>
    <div id="div_l1" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l1" runat="server" Settings-ShowTitlePanel="true" KeyFieldName="user_id" SettingsPager-Mode="ShowPager" >
            <SettingsText Title="Points Leaders" />
            <SettingsPager PageSize="15" EnableAdaptivity="true" Mode="ShowPager" >
                <PageSizeItemSettings ShowAllItem="false" Items="5, 10, 20" />
            </SettingsPager>
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="points" Caption="Points"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>    
    <div id="div_l2" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l2" runat="server" Settings-ShowTitlePanel="true">
            <SettingsText Title="Promoting Growth" />
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Visible="false" FieldName="nom_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="count" Caption="Nominations"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
        <div id="div_l3" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l3" runat="server" Settings-ShowTitlePanel="true">
            <SettingsText Title="Teamwork" />
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="count" Caption="Nominations"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>        
    <div id="div_l4" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l4" runat="server" Settings-ShowTitlePanel="true">
            <SettingsText Title="Responsiveness" />
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="count" Caption="Nominations"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div id="div_l5" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l5" runat="server" Settings-ShowTitlePanel="true">
            <SettingsText Title="Leadership Award" />
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="count" Caption="Nominations"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div id="div_l6" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="gv_l6" runat="server" Settings-ShowTitlePanel="true">
            <SettingsText Title="Whatever it takes" />
            <Columns>
                <dx:GridViewDataColumn Visible="false" FieldName="user_id"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="rank" Caption="Rank"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="name" Caption="Name">
                    <DataItemTemplate>
                        <a href="/Directory/Profile.aspx?id=<%#Eval("user_id") %>"><%#Eval("name") %></a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="count" Caption="Nominations"></dx:GridViewDataColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
