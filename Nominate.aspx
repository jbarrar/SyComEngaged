<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Nominate.aspx.cs" Inherits="SyComEngaged.Nominate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <dx:ASPxPanel ID="aspxpanel_left" runat="server" Width="200px" Collapsible="true">
        <SettingsAdaptivity CollapseAtWindowInnerWidth="600" />
            <Styles>
                <Panel CssClass="panel"></Panel>
                <ExpandedPanel CssClass="expandedPanel"></ExpandedPanel>
                <ExpandBar CssClass="bar"></ExpandBar>
            </Styles>
        <PanelCollection>
            <dx:PanelContent runat="server">
                    <dx:ASPxFormLayout runat="server" ID="sFormLayout" RequiredMarkDisplayMode="RequiredOnly" EnableViewState="false" EncodeHtml="false">
                        <Items>
                            <dx:LayoutGroup Caption="Nomination Form" SettingsItemHelpTexts-Position="Bottom" GroupBoxDecoration="HeadingLine">
                                <Items>
                                    <dx:LayoutItem Caption="Who?" HelpText="Please, select who you are nominating.">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox runat="server" ID="cb_who" TextField="name" ValueField="email" ValueType="System.String">
                                                    <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nomination" HelpText="Please select a nomination.">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox runat="server" ID="cb_what" ImageUrlField="icon" TextField="title" ValueField="id" ValueType="System.Int32" ShowImageInEditBox="true" SelectedIndex="0">
                                                    <ItemImage Height="24px" Width="23px"></ItemImage><ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Description" HelpText="Details of Nomination">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxMemo runat="server" ID="description" Width="200" Height="200" HelpText="This is required, please give a brief explanation of the nomination.">
                                                    <HelpTextSettings DisplayMode="Popup" /><ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                                </dx:ASPxMemo>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="false" RequiredMarkDisplayMode="Hidden" HorizontalAlign="Right" Width="100">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxButton runat="server" ID="submitButton" Text="Submit" OnClick="submitButton_Click" Width="100" />
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup> 
                        </Items>
                    </dx:ASPxFormLayout>
               <dx:ASPxPanel Width="200px" runat="server">
                   <PanelCollection>
                       <dx:PanelContent>
                           <div class="div_nom_desc" runat="server" id="div_nom_desc"></div>
                       </dx:PanelContent>
                   </PanelCollection>
               </dx:ASPxPanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
</asp:Content>
