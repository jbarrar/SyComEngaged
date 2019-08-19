
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace SignalRDemo
{
    public class NotificationHub : Hub
    {
        public void Send(string message)
        {
            Clients.All.receiveNotification(message);
        }

        public void SendNotifications(string message)
        {
            Clients.All.receiveNotification(message);
        }

    }
}
