<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AboutUser.ascx.cs" Inherits="SyComEngaged.UserControls.AboutUser" %>
<asp:SqlDataSource runat="server" ID="ds_Certifications"
    SelectCommand="Select Distinct Certification from "></asp:SqlDataSource>
What do I do for SyCom?<dx:ASPxMemo ID="q1" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
What is your favorite thing about working for SyCom?<dx:ASPxMemo ID="q2" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
What talent or skill are you most proud of?<dx:ASPxMemo ID="q3" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
Tell us a little about your professional self.<dx:ASPxMemo ID="q4" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
Tell us one thing about yourself that you've done in your life that no one might ever guess.<dx:ASPxMemo ID="q5" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
Name one thing on your bucket list. <dx:ASPxTextBox ID="q6" runat="server" Width="600" Rows="5"></dx:ASPxTextBox><br />
Name one of your biggest pet peeves or dislikes. <dx:ASPxMemo ID="q7" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
Tell us about your family.<dx:ASPxMemo ID="q8" runat="server" Width="600" Rows="5"></dx:ASPxMemo><br />
<dx:ASPxDropDownEdit runat="server" ID="q9"></dx:ASPxDropDownEdit><br />
How many Kids: <dx:ASPxDropDownEdit runat="server" ID="q10"></dx:ASPxDropDownEdit><br />
Favorite Color:<dx:ASPxColorEdit ID="q11" runat="server"></dx:ASPxColorEdit><br />
Favorite Number:<dx:ASPxTextBox ID="q12" runat="server"></dx:ASPxTextBox><br />
Birthday : <dx:ASPxCalendar runat="server" ID="q13" /> Ok with displaying age? <dx:ASPxCheckBox ID="q14" runat="server" /><br />
What city were you born in?<dx:ASPxTextBox ID="ASPxTextBox2" runat="server"></dx:ASPxTextBox><br />
Certifications:<dx:ASPxTokenBox runat="server" ID="q16" Width="600" DataSourceID="ds_Certifications" />
<dx:ASPxButton runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CausesValidation="false" Text="Submit"></dx:ASPxButton>
    
