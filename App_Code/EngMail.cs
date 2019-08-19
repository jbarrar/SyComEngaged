using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace SyComEngaged.App_Code
{
    public class EngMail
    {
        public static string Email(string to, string htmlbody)
        {
            string result = "";
            MailMessage mail = new MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress("engaged@sycomtech.com", "SyCom Engaged", System.Text.Encoding.UTF8);
            mail.Subject = "SyCom Engaged = You have been nominated!";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = htmlbody;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.Low;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("dbowen@sycomtech.com", "The14me!");
            client.Port = 587;
            client.Host = "outlook.office365.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
            }
            return result;
        }
    }
}