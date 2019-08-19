<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="SyComEngaged.TownHall.Questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        .div_item{
            border:1px solid #CCC;
            padding:2px;
            margin:10px 4px;
            box-shadow:2px 2px 2px #CCC;
        }
    </style>
      <asp:ListView runat="server" ID="lv_thq" GroupPlaceholderID="grp1" ItemPlaceholderID="item1" OnPagePropertiesChanging="lv_feedback_PagePropertiesChanging">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="grp1"></asp:PlaceHolder>
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_thq" PageSize="15">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                            ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="item1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            
            <ItemTemplate>                
                    <div class="div_item"><b><i><%#Eval("user") %></i> [Time: <%#Eval("time") %>]</b><br /><%#Eval("question") %></div>
            </ItemTemplate>
        </asp:ListView>
</asp:Content>
