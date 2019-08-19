<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SyComEngaged.Leaderboard._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .div_Leaderboard{
            float:left;
            border:1px solid #CCC;
            padding:2px;
            margin:2px;
            border-radius:3px;
        }
    
    </style>
    <dx:ASPxPageControl runat="server" ID="Leaderboards">
        <TabPages>
                    <dx:TabPage Text="This Month">
                        <ContentCollection>
                              <dx:ContentControl>
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
                              </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <TabPages>
                    <dx:TabPage Text="All Time">
                        <ContentCollection>
                              <dx:ContentControl>
                                                                   <div id="div1" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_1" runat="server" Settings-ShowTitlePanel="true" KeyFieldName="user_id" SettingsPager-Mode="ShowPager" >
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
    <div id="div2" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_2" runat="server" Settings-ShowTitlePanel="true">
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
        <div id="div3" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_3" runat="server" Settings-ShowTitlePanel="true">
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
    <div id="div4" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_4" runat="server" Settings-ShowTitlePanel="true">
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
    <div id="div5_AT" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_5" runat="server" Settings-ShowTitlePanel="true">
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
    <div id="div6_AT" runat="server" class="div_Leaderboard">
        <dx:ASPxGridView ID="at_6" runat="server" Settings-ShowTitlePanel="true">
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
                              </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                
        
                <TabPages>
                    <dx:TabPage Text="Trophy Winners" Enabled="false">
                        <ContentCollection>
                              <dx:ContentControl>
                              </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
        </dx:ASPxPageControl>
</asp:Content>
