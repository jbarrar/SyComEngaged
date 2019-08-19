using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data.SqlClient;
using System.Data;

namespace SyComEngaged.admin
{
    public partial class LastMonthWinners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime lm = DateTime.Today.AddMonths(-1);
            div_results.InnerHtml += lm.Year + " " + lm.Month;

        }

        protected void GetWinners()
        {
            string sql = "Select u.fname, u.lname, n.name from eng_users, ";
            SqlParameter[] parms = new SqlParameter[0];
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                foreach (object item in dr.ItemArray)
                {
                    div_results.InnerHtml += item.ToString();
                }
                div_results.InnerHtml += "<br />";
            }
        }
    }
}