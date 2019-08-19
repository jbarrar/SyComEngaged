<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="SyComEngaged.Content.ajax.feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Feedback form</title>
    <link rel="stylesheet" type="text/css" href="Css/ContentUrlFeedForm.css">
</head>
<body style="background-image: none;">
    <form id="MailForm" runat="server">
        <table id="FeedBackTable" class="EditorsTable" style="width: 100%; height: 100%;">
            <tr>
                 <td class="Label">
                    <dx:ASPxLabel ID="LabelMessage" runat="server" Text="Please enter Feedback below.  The content must be between 50 and 300 characters." AssociatedControlID="TextBoxMessage" />
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxMemo ID="TextBoxMessage" runat="server" Height="100%" Width="100%" Columns="40" Rows="5" EnableViewState="False" MaxLength="300">
                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" EnableCustomValidation="true" ErrorText="Must be between 50 and 300 characters.">
                            <RegularExpression ErrorText="Must be between 50 and 300 characters." ValidationExpression=".{50,300}" />
                            <RequiredField ErrorText="Message is required" IsRequired="True" />
                        </ValidationSettings>
                        <ClientSideEvents GotFocus="function(s, e) { s.SelectAll(); }" />
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dx:ASPxButton ID="ButtonSend" runat="server" Text="Send" OnClick="ButtonSend_Click" Width="61px" style="float: right; margin: 4px 0"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
