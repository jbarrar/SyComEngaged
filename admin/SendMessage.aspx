<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="SyComEngaged.admin.SendMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery-1.8.2.min.js" ></script>
    <script src="/Scripts/jquery.signalR-1.0.0.js"></script>
    <script src="/signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {
            var proxy = $.connection.notificationHub;

            $("#button1").click(function () {
                proxy.server.sendNotifications($("#text1").val());
            });

            $.connection.hub.start();
        });
    </script>
    <input id="text1" type="text" />
    <input id="button1" type="button" value="Send" />

</asp:Content>
