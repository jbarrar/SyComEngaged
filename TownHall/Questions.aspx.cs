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
    public partial class Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string us = User.Identity.Name.ToString().ToLower();
                Response.Write(us);
                if (us == "jbarrar@sycomtech.com" || us == "tcricchi@sycomtech.com")
                {
                    this.BindData();
                }
                else
                {
                    Response.Redirect("/townhall/");
                }
            }
        }

        protected void lv_feedback_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lv_thq.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindData();
        }
        protected void BindData()
        {

            string sql = "Select * from eng_townhall order by time desc";

            lv_thq.DataSource = Eng_Data.eng_Datatable(sql, new SqlParameter[0]);
            lv_thq.DataBind();
        }
    }
}