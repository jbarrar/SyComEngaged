using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data.SqlClient;

namespace SyComEngaged.TownHall
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SubmitQuestion();
        }
        protected void SubmitQuestion()
        {
            string question = mem_question.Text;
            string user = "";
            if (cb_anon.Checked)
            {
                user = "Anonymous";
            }
            else
            {
                user = User.Identity.Name.ToString();
            }
            SqlParameter[] parms = new SqlParameter[2];
            parms[0] = new SqlParameter("@user", user);
            parms[1] = new SqlParameter("@question", question);
            string sql = "Insert into eng_townhall ([user], question) VALUES (@user, @question)";
            Eng_Data.eng_Update(sql, parms);
            Eng_Data.eng_AddPoints(User.Identity.Name.ToString(), 5, "TownHall Question Submission");
            mem_question.Text = "";
            div_results.InnerHtml += "Thanks for your question!<br />";
        }
    }
}