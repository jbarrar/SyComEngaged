<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SyComEngaged.Directory.Profile" %>

<%@ Register Src="~/UserControls/AboutUser.ascx" TagPrefix="au1" TagName="AboutUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        body{
            background:#EEE;
        }
        .div_trophy{
            border:1px solid #CCC;
            border-radius:3px;
            padding:10px;
            margin:5px;
            background:#FFF;
            color:#555;
        }
        .div_nom{
            border:1px solid #CCC;
            border-radius:3px;
            padding:10px;
            margin:5px;
            background:#FFF;
            color:#222;
        }
        .p_name{
            font-size:1.4em;
            padding:3px;
            margin:0px;
            border-color:#CCC;
            border-width: 1px 1px 0px 1px;
            border-style:solid;
            font-family:Calibri;
        }
        .p_title{
            font-size:1.0em;
            background:#EEE;
            padding:2px;
            margin:0px;
            border:1px solid #CCC;
            border-top-left-radius:2px;
            font-family:Arial, Helvetica, sans-serif;
        }
        .p_image{
            border:1px solid #CCC;
            padding:2px;
            margin:2px;
            float:left;
            background:#FFF;
        }
        .profile{
            background:#FFF;border:1px solid #CCC;border-radius:4px;padding:4px;margin:5px;
            font-family:Calibri;font-size:1.2em;
            text-align:center;
        }
        .profile_points{
            font-size:1.5em;
            border:1px double #CCC;
        }
        .nomination{
            visibility:hidden;
            background:#FFF;border:1px solid #CCC;border-radius:4px;padding:4px;margin:5px;
            font-family:Calibri;font-size:1.2em;
        }
        .left_container{
            width:350px;
            float:left;
        }
        .right_container{
            float:left;
        }
        .news_item{
            background:#FFF;border:1px solid #CCC;border-radius:4px;padding:4px;margin:5px;
            font-family:Calibri;font-size:1.2em;
        }
        .profile_box {
  width: 100%;
  position: relative;
  border: 1px solid #BBB;
  background: #EEE;
}
        .ribbon {
  position: absolute;
  right: -5px; top: -5px;
  z-index: 1;
  overflow: hidden;
  width: 75px; height: 75px;
  text-align: right;
}
.ribbon span {
  font-size: 10px;
  font-weight: bold;
  color: #FFF;
  text-transform: uppercase;
  text-align: center;
  line-height: 20px;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  width: 100px;
  display: block;
background: #79A70A;
  background: linear-gradient(#F70505 0%, #8F0808 100%);
  /*Gold - 20 Years background: linear-gradient(#F79E05 0%, #8F5408 100%);*/
  /*Blue - 15 Years background: linear-gradient(#2989d8 0%, #1e5799 100%);*/
  /*Red - 10 Years  background: linear-gradient(#F70505 0%, #8F0808 100%);*/
  /*Green - 5 Years  background: linear-gradient(#9BC90D 0%, #79A70A 100%);*/
  /*Grey - 1 Year  background: linear-gradient(#B6BAC9 0%, #808080 100%);*/
  box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
  position: absolute;
  top: 19px; right: -21px;
}
.ribbon span::before {
  content: "";
  position: absolute; left: 0px; top: 100%;
  z-index: -1;
  border-left: 3px solid #8F5408;
  border-right: 3px solid transparent;
  border-bottom: 3px solid transparent;
  border-top: 3px solid #8F5408;
}
.ribbon span::after {
  content: "";
  position: absolute; right: 0px; top: 100%;
  z-index: -1;
  border-left: 3px solid transparent;
  border-right: 3px solid #8F5408;
  border-bottom: 3px solid transparent;
  border-top: 3px solid #8F5408;
}

.img_trophy{
    height:40px;
    width:40px;
    border:1px solid #CCC;
    box-shadow:#79A70A, 4,4, unset;
    margin:3px;
}

    </style>
    <asp:SqlDataSource ID="ds_Questions" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select a.id as id, q.id as qid, q.question as question, a.answer as answer from eng_questions as q FULL OUTER JOIN eng_answers as a on q.id=a.question_id "
        
        >
        <SelectParameters>
            <asp:SessionParameter SessionField="cuser" Name="cuser" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="qid" Type="Int32" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:SessionParameter SessionField="cuser" Name="cuser" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_Certifications" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select distinct certifications from eng_users_profile"
        UpdateCommand="Update eng_users_profile Set certifications=@certifications where userid=@cuser IF @@ROWCOUNT=0 Insert into eng_users_profile (userid, certifications) values (@cuser, @certifications)"
        >
        <SelectParameters>
            <asp:SessionParameter SessionField="cuser" Name="cuser" />
        </SelectParameters>
        <UpdateParameters>            
            <asp:SessionParameter Name="cuser" SessionField="cuser" Type="String" />
            <asp:Parameter Name="certifications" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_profile" runat="server" ConnectionString="<%$ ConnectionStrings:cn_Engaged %>"
        SelectCommand="Select [certifications], [interests] from eng_users_profile where userid=@cuser"
        UpdateCommand="Update eng_users_profile set [certifications]=@certifications, [interests]=@interests where userid=@cuser;IF @@ROWCOUNT=0 INSERT INTO eng_users_profile(userid, certifications, interests) VALUES (@cuser, @certifications, @interests)"
        >
        <SelectParameters>
            <asp:SessionParameter SessionField="cuser" Name="cuser" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="cuser" SessionField="cuser" Type="String" />
            <asp:Parameter Name="certifications" Type="String" />
            <asp:Parameter Name="interests" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="left_container">
        <div runat="server" id="profile" class="profile">

        </div>
        <div id="trophy" runat="server" class="div_trophy">
            <b>Trophies</b><br />
           
        </div>
        <div id="nomination" class="div_nom">
            
                    <dx:ASPxFormLayout runat="server" ID="sFormLayout" RequiredMarkDisplayMode="RequiredOnly" EnableViewState="false" EncodeHtml="false">
                        <Items>
                            <dx:LayoutGroup Caption="Nomination Form" SettingsItemHelpTexts-Position="Bottom" GroupBoxDecoration="HeadingLine">
                                <Items>
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
        </div>
        </div>
        <div class="right_container">
            <dx:ASPxPageControl runat="server" ID="pgc_Profile">
                <TabPages>
                    <dx:TabPage Text="Nominations">
                        <ContentCollection>
                              <dx:ContentControl>
                                  <div id="eng_no_nom" runat="server" visible="false"></div>
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
                                                <a href='/content/ajax/nominations.aspx?id=<%#Eval("nom_id") %>' class="ajax"><img style='float:left;margin:-7px 5px;border:1px solid #CCC;width:40px;height:40px;' src='<%#Eval("icon") %>' /></a>
                                                <div id='ls<%#Eval("id") %>' class='likeicondiv'><%#IsLiked(Eval("id"))==false ? "<a href=\"Javascript:addLike('" + Eval("id") + "', '" + Eval("to_id") + "');\" id='like" + Eval("id") + "'><img class='likeicon' src='/content/images/icons/like.jpg' /></a>" : "<img class='likeicon' src='/content/images/icons/check.png' alt='Liked' />" %></div>
                                                <a href='/directory/profile.aspx?id=<%#Eval("from_id") %>'><%#Eval("fromName") %><a> Nominated <a href='/directory/profile.aspx?id=<%#Eval("to_id") %>'><%#Eval("toName") %><a> for the <%#Eval("title") %> award.
                                                <div class='news_item_details'><%#Eval("notes").ToString().Length >199 ? Eval("notes").ToString() + "..." : Eval("notes") %></div>
                                                <div class='news_item_date'>Nomination date: <%#Eval("time") %> - <a class='ajax' href="/content/ajax/ViewNomination.aspx?id=<%#Eval("id") %>" title="Nomination Details">View Details</a> <%#ProcessEditLink(Eval("time"), Eval("from_id"), Eval("id")) %> : Likes: <%#GetLikeCount(Eval("id").ToString()) %></div>                        
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="About Me" Enabled="true">
                        <ContentCollection>
                            <dx:ContentControl>
                                <div runat="server" id="div_About">
                                    Certifications: <dx:ASPxTokenBox AutoPostBack="true" OnCallback="tk_Certifications_Callback" runat="server" ID="tk_Certifications" DataSourceID="ds_Certifications" TextField="Certifications"></dx:ASPxTokenBox>                           
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
         </div>
</asp:Content>
