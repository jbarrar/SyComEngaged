<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="SyComEngaged._Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .div_left{
            float:left;
            width:340px;
            background:#FFF;
            border:1px solid #CCC;
        }
        .div_pager{
            border:1px solid #CCC;
            border-radius:3px;
            padding:4px;
            margin:4px;
            background:#DDD;
        }
    </style>
<%-- 
    <dx:ASPxPanel ID="aspxpanel_top" runat="server" FixedPositionOverlap="true">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <div runat="server" id="welcome" class="eng_welcome">Welcome to SyCom Engaged Version 1.3! [<a href="/content/ajax/changelog.aspx" class="ajax" style="color:#FFF;">View Changelog</a>].  As always, we encourage you to leave any feedback or recommendations using the Feedback Form in the bottom right hand corner of the page. </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
--%>
    <div class="left_container">
        <asp:SqlDataSource ID="dsNominees" runat="server"
            
             ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
             SelectCommand="Select email, CONCAT(lname, ', ', fname) as name from eng_users where is_active=1 order by lname"
            >
        </asp:SqlDataSource>

        <!-- Trigger the Modal -->
        <img id="myImg" src="/Content/Images/sycom/SyComAdvantage.png" alt="The SyCom Advantage" style="width:100%;max-width:310px;padding:10px">

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- The Close Button -->
            <span class="close">&times;</span>

            <!-- Modal Content (The Image) -->
            <img class="modal-content" id="img01">

            <!-- Modal Caption (Image Text) -->
            <div id="caption"></div>
        </div>
        <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById("myImg");
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
        </script>

        <div class="div_nom_desc" runat="server" id="div_nom_desc"></div>
        <dx:ASPxFormLayout runat="server" ID="sFormLayout" RequiredMarkDisplayMode="RequiredOnly" EnableViewState="true" EncodeHtml="false">
                        <Items>
                            <dx:LayoutGroup Caption="Nomination Form" SettingsItemHelpTexts-Position="Bottom" GroupBoxDecoration="HeadingLine">
                                <Items>

                                    <dx:LayoutItem Caption="Who?" HelpText="Please Select Nominees">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>    
                                                <dx:ASPxTokenBox runat="server" ID="token_who" Width="200" AllowCustomTokens="false" DataSourceID="dsNominees" ShowDropDownOnFocus="Auto" LoadDropDownOnDemand="true" ValueField="email" TextField="name"></dx:ASPxTokenBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>

                                    </dx:LayoutItem>



                                    <dx:LayoutItem Caption="Nomination" HelpText="Please select a nomination.">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox Width="200px" runat="server" ID="cb_what" ImageUrlField="icon" TextField="title" ValueField="id" ValueType="System.Int32" ShowImageInEditBox="true" SelectedIndex="0">
                                                    <ItemImage Height="24px" Width="23px"></ItemImage><ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="None" />
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
    </div>
    <div class="right_container">
           <div id="eng_events" runat="server">
            <asp:ListView runat="server" ID="lv_events" GroupPlaceholderID="grp1" ItemPlaceholderID="item1" OnPagePropertiesChanging="lv_events_PagePropertiesChanging">
            <LayoutTemplate>   
                <div class="div_pager">             
                    <asp:DataPager ID="DataPager2" runat="server" PagedControlID="lv_events" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Button" />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton = "false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <asp:PlaceHolder runat="server" ID="grp1"></asp:PlaceHolder>
                <div class="div_pager"> 
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_events" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Button" />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton = "false" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="item1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            
            <ItemTemplate>                
                    <%--<div class="div_item"><%#Eval("feedback") %> <br /><i><%#Eval("user") %></i></div>--%>
                <div class='news_item'>
                    <a href="/content/ajax/nominations.aspx?id=<%#Eval("nom_id")%>" class="ajax"><img style='float:left;margin:-7px 5px;border:1px solid #CCC;width:40px;height:40px;' src='<%#Eval("icon") %>' /></a>
                    <div id='ls<%#Eval("id") %>' class='likeicondiv'><%#IsLiked(Eval("id"))==false ? "<a href=\"Javascript:addLike('" + Eval("id") + "', '" + Eval("to_id") + "');\" id='like" + Eval("id") + "'><img class='likeicon' src='/content/images/icons/like.jpg' /></a>" : "<img class='likeicon' src='/content/images/icons/check.png' alt='Liked' />" %></div>
                    <a href='/directory/profile.aspx?id=<%#Eval("from_id") %>'><%#Eval("fromName") %><a> Nominated <a href='/directory/profile.aspx?id=<%#Eval("to_id") %>'><%#Eval("toName") %><a> for the <%#Eval("title") %> award.
                        <div class='news_item_details'><%#Eval("notes").ToString().Length >199 ? Eval("notes").ToString() + "..." : Eval("notes") %></div>
                        <div class='news_item_date'>Nomination date: <%#Eval("time") %> - <a class='ajax' href="/content/ajax/ViewNomination.aspx?id=<%#Eval("id") %>" title="Nomination Details">View Details</a> <%#ProcessEditLink(Eval("time"), Eval("from_id"), Eval("id")) %> : Likes: <%#GetLikeCount(Eval("id").ToString()) %></div>                        
                </div>
            </ItemTemplate>
        </asp:ListView>
           </div>
    </div>
    <div style="clear:both"></div>
     <dx:ASPxPopupControl ID="PopupControl" runat="server" CloseAction="OuterMouseClick" LoadContentViaCallback="OnPageLoad"
                         PopupElementID="ctl00$ctl00$MainPane$Content$MainContent$aspxpanel_top$btnFeedback" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
                         ShowFooter="True" Width="310px" Height="160px" HeaderText="Feedback Form" ClientInstanceName="ClientPopupControl">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                <div style="vertical-align:middle">
                        <dx:ASPxMemo ID="TextBoxMessage" runat="server" Height="100px" Width="300px" EnableViewState="False">
                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorTextPosition="Left">
                            <RequiredField ErrorText="Message is required" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxMemo>
        <dx:ASPxLabel ID="lbl_results" runat="server"></dx:ASPxLabel>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterTemplate>
                <dx:ASPxButton ID="UpdateButton" runat="server" Text="Send Feedback" OnClick="UpdateButton_Click" style="margin: 6px 6px 6px 210px" />
        </FooterTemplate>
    </dx:ASPxPopupControl>
 
</asp:Content>