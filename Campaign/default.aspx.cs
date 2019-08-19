using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data.SqlClient;
using System.Data;

namespace SyComEngaged.Volunteer
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div_MyCampaigns.InnerHtml = GetMyCampaigns();
        }

        protected string GetMyCampaigns()
        {
            string x = "";
            string sql = "Select id, title from eng_campaigns where owner_id='" + User.Identity.Name.ToString() + "'";
            DataTable dt = Eng_Data.eng_Datatable(sql, new SqlParameter[0]);
            foreach(DataRow dr in dt.Rows)
            {
                x += "<a href='/campaign/campaign.aspx?id=" + dr.ItemArray[0].ToString() + "'>" + dr.ItemArray[1].ToString() + "</a><br />";
            }
            //Select from eng_campaigns where owner_id = Current User Email ID
            //Select from eng_campaigns_members where member_id = Current Email ID
            return x;
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            //Create New Campaign
            // SQL = 
            SqlParameter[] parms = new SqlParameter[5];
            parms[0] = new SqlParameter("@title", txtTitle.Text);
            parms[1] = new SqlParameter("@description", ASPxHtmlEditor1.Html.ToString() );
            parms[2] = new SqlParameter("@owner_id", User.Identity.Name.ToString());
            parms[3] = new SqlParameter("@status", "Open");
            parms[4] = new SqlParameter("@keywords", tb_Keywords.Value.ToString());
            string sql = "Insert into eng_campaigns (title, description, owner_id, status, keywords) VALUES(@title, @description, @owner_id, @status, @keywords)";
            Eng_Data.eng_Update(sql, parms);
        }
    }
}