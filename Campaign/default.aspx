<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SyComEngaged.Volunteer._default" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxPageControl runat="server" ID="pgCampaign" Width="600">
        <TabPages>            
            <dx:TabPage Name="My Campaigns" Text="My Campaign(s)">
                <ContentCollection>
                    <dx:ContentControl>
                        <div runat="server" id="div_MyCampaigns"></div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="NewCampaign" Text="Create Campaign">
                <ContentCollection>
                    <dx:ContentControl>
                        Title: <dx:ASPxTextBox runat="server" ID="txtTitle"></dx:ASPxTextBox>
                        Description: <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" >
                            
        <SettingsHtmlEditing EnablePasteOptions="true" />
        <Toolbars>
            <dx:HtmlEditorToolbar Name="Toolbar">
                <Items>
                    <dx:ToolbarUndoButton>
                    </dx:ToolbarUndoButton>
                    <dx:ToolbarRedoButton>
                    </dx:ToolbarRedoButton>
                    <dx:ToolbarInsertOrderedListButton BeginGroup="true"></dx:ToolbarInsertOrderedListButton>
                    <dx:ToolbarInsertUnorderedListButton></dx:ToolbarInsertUnorderedListButton>
                    <dx:ToolbarFontNameEdit BeginGroup="true">
                        <Items>
                            <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                            <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                            <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                            <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                            <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                            <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                        </Items>
                    </dx:ToolbarFontNameEdit>
                    <dx:ToolbarFontSizeEdit>
                        <Items>
                            <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                            <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                            <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                            <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                            <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                            <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                            <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                        </Items>
                    </dx:ToolbarFontSizeEdit>
                    <dx:ToolbarBoldButton BeginGroup="true">
                    </dx:ToolbarBoldButton>
                    <dx:ToolbarItalicButton>
                    </dx:ToolbarItalicButton>
                    <dx:ToolbarUnderlineButton>
                    </dx:ToolbarUnderlineButton>
                    <dx:ToolbarStrikethroughButton>
                    </dx:ToolbarStrikethroughButton>
                    <dx:ToolbarJustifyLeftButton BeginGroup="true">
                    </dx:ToolbarJustifyLeftButton>
                    <dx:ToolbarJustifyCenterButton>
                    </dx:ToolbarJustifyCenterButton>
                    <dx:ToolbarJustifyRightButton>
                    </dx:ToolbarJustifyRightButton>
                    <dx:ToolbarInsertImageDialogButton BeginGroup="True">
                    </dx:ToolbarInsertImageDialogButton>
                </Items>
            </dx:HtmlEditorToolbar>
        </Toolbars>
                                     </dx:ASPxHtmlEditor>
                        Keywords [ Tab to Save ]: <dx:ASPxTokenBox runat="server" ID="tb_Keywords"></dx:ASPxTokenBox>
                        <dx:ASPxButton runat="server" ID="btn_Submit" Text="Create Campaign!" OnClick="btn_Submit_Click"></dx:ASPxButton>
                        
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="FindCampaign" Text="Find Campaign">
                <ContentCollection>
                    <dx:ContentControl>
                        <div runat="server" id="div1"></div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
