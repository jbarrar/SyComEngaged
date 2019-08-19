using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DevExpress.Web;
using SyComEngaged.App_Code;
using System.Data.SqlClient;

namespace SyComEngaged.Content.ajax
{
    public partial class feedback : System.Web.UI.Page
    {
        public string SuccessText = "Your feedback has been submitted.";

        protected void ButtonSend_Click(object sender, EventArgs e)
        {
            string sql = "Insert into eng_feedback (feedback, [user], url) VALUES (@feedback, @user, @url)";
            SqlParameter[] parms = new SqlParameter[3];
            parms[0] = new SqlParameter("@feedback", TextBoxMessage.Text);
            parms[1] = new SqlParameter("@user", User.Identity.Name.ToString());
            parms[2] = new SqlParameter("@url", Request.UrlReferrer.AbsolutePath.ToString());
            int TotalFeedback = Eng_Data.eng_Count("Select count(id) from eng_feedback where [user] = '" + User.Identity.Name.ToString() + "' AND time >= CAST(CURRENT_TIMESTAMP AS DATE) and time < DATEADD(DD, 1, CAST(CURRENT_TIMESTAMP AS DATE)) ", new SqlParameter[0]);
            if (TotalFeedback < 5)
            {
                Eng_Data.eng_Update(sql, parms);
                SuccessText += " You have earned 5 points for submitting today! (" + (TotalFeedback+1) + " submission(s))";
                Eng_Data.eng_AddPoints(User.Identity.Name.ToString(), 5, "Submitting Feedback.");
            }else if (TotalFeedback > 4)
            {
                Eng_Data.eng_Update(sql, parms);
                SuccessText += " You have earned your maximum feedback points for the day.";
            }
            HtmlForm form = Page.FindControl("MailForm") as HtmlForm;
            if (form != null)
            {
                form.Controls.Clear();
                WebControl textControl = CreateCentredText();
                textControl.ForeColor = Color.FromArgb(0, 51, 51);
                if (textControl != null)
                    form.Controls.Add(textControl);
            }
        }

        protected virtual WebControl CreateCentredText()
        {
            Table table = new Table();
            TableRow row = new TableRow();
            TableCell cell = new TableCell();

            table.Rows.Add(row);
            row.Cells.Add(cell);
            cell.Controls.Add(new LiteralControl(string.Format("<div id=\"SuccessText\">{0}</div>", SuccessText)));

            cell.Controls.Add(new LiteralControl("&nbsp;"));

            ASPxButton buttonSendNewMsg = new ASPxButton();
            buttonSendNewMsg.ID = "ButtonSendNewMsg";
            buttonSendNewMsg.RenderMode = ButtonRenderMode.Link;
            buttonSendNewMsg.Text = "More Feedback";

            cell.Controls.Add(buttonSendNewMsg);

            table.Height = Unit.Percentage(100);
            table.Width = Unit.Percentage(100);
            table.BorderWidth = Unit.Pixel(0);

            cell.VerticalAlign = VerticalAlign.Middle;
            cell.HorizontalAlign = HorizontalAlign.Center;

            return table;
        }
    }
}