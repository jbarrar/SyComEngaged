<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="SyComEngaged.admin.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .adminEditdiv{
            border:1px solid #CCC;padding:5px;margin:5px;
        }
        .divEditLeft {
            display:inline-block;
            vertical-align:top;
            margin-right:10px;
        }
        .divEditRight{            
            display:inline-block;
            vertical-align:top;
        }
    </style>
    <asp:DropDownList runat="server" ID="ddlUser"></asp:DropDownList>
    <div class="adminEditdiv" id="divfrm" runat="server">
        <div class="divEditLeft">
            <dx:ASPxLabel runat="server" ID="lblFName" AssociatedControlID="txtFName" Text="First Name: " ></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtFName"></dx:ASPxTextBox><br />
            <dx:ASPxLabel runat="server" ID="lblLName" AssociatedControlID="txtLName" Text="Last Name: "></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtLName"></dx:ASPxTextBox><br />
            
            <dx:ASPxLabel runat="server" ID="lblReportsTo" AssociatedControlID="txtReportsTo" Text="Reports To (email): "></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtReportsTo"></dx:ASPxTextBox><br />  
            <dx:ASPxLabel runat="server" ID="lblEmail" AssociatedControlID="txtEmail" Text="Email: "></dx:ASPxLabel>
            <dx:ASPxTextBox runat="server" ID="txtEmail">
                <ValidationSettings EnableCustomValidation="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="true">
                    <ErrorFrameStyle Font-Size="Smaller" />
                    <RegularExpression ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ErrorText="Invalid Email" />
                    <RequiredField IsRequired="true" ErrorText="EMail is Required" />
                </ValidationSettings>
                <NullTextStyle Font-Size="Small"></NullTextStyle>
            </dx:ASPxTextBox><br />
            <dx:ASPxLabel runat="server" ID="lblTitle" AssociatedControlID="txtTitle" Text="Title: "></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtTitle"></dx:ASPxTextBox><br />
            <dx:ASPxLabel runat="server" ID="lblDept" AssociatedControlID="txtDept" Text="Department: "></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtDept"></dx:ASPxTextBox><br />
            <dx:ASPxLabel runat="server" ID="lblLocation" AssociatedControlID="txtLocation" Text="Location: "></dx:ASPxLabel><dx:ASPxTextBox runat="server" ID="txtLocation"></dx:ASPxTextBox><br />
        </div>
        <div class="divEditRight">
            <dx:ASPxLabel runat="server" ID="lblHireDate" AssociatedControlID="calHireDate" Text="Hire Date: "></dx:ASPxLabel>
            <dx:ASPxCalendar ID="calHireDate" runat="server">
                <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" RequiredField-IsRequired="true" ErrorText="Hire Date is Required." SetFocusOnError="true"></ValidationSettings>
            </dx:ASPxCalendar><br />
            <dx:ASPxLabel runat="server" ID="lblBirthday" AssociatedControlID="calBirthDate" Text="Birth Date: "></dx:ASPxLabel><dx:ASPxCalendar ID="calBirthDate" runat="server">
                <ValidationSettings ErrorDisplayMode="Text" ErrorTextPosition="Bottom" RequiredField-IsRequired="true" ErrorText="Birth Date is Required." SetFocusOnError="true"></ValidationSettings>
                                                                                                                                </dx:ASPxCalendar><br />
            <dx:ASPxLabel runat="server" ID="lblPicture" AssociatedControlID="uplPicture" Text="Picture (96x96): "></dx:ASPxLabel><dx:ASPxUploadControl runat="server" ID="uplPicture" UploadMode="Standard" ShowProgressPanel="true" ValidationSettings-AllowedFileExtensions=".jpg"></dx:ASPxUploadControl><br />

        </div> 
        <div style="clear:both"></div>
        <dx:ASPxButton runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Add User"></dx:ASPxButton>
    </div>
</asp:Content>
