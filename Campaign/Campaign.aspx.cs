using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data;
using DevExpress.Web;

namespace SyComEngaged.Campaign
{
    public partial class Campaign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            GetCampaign(id);
            
        }
        protected void GetCampaign(string id)
        {
            
            string sql = "Select id, title, description, owner_id, status, keywords from eng_campaigns where id=" + id;
            DataTable dt = Eng_Data.eng_Datatable(sql, new System.Data.SqlClient.SqlParameter[0]);
            foreach(DataRow dr in dt.Rows)
            {
                //for(int i = 0; i < dr.ItemArray.Count(); i++)
                //{
                //    camp_container.InnerHtml +=dr.ItemArray[i].ToString() + "<br />--------------<br />";
                //}
                camp_container.InnerHtml += "<span style='camp_header'>Campaign for " + dr.ItemArray[1].ToString() + "</span>";
                camp_container.InnerHtml += "<br /> Created by <i>" + dr.ItemArray[3].ToString() + "</i><br />";
                camp_container.InnerHtml += "<div class='campaignContent'><pre>" + dr.ItemArray[2].ToString() + "</pre></div>";
                camp_container.InnerHtml += "Status: <i>" + dr.ItemArray[4].ToString() + "</i><br />";
                string[] keys = dr.ItemArray[5].ToString().Split(',');
                foreach(string k in keys)
                {
                    camp_container.InnerHtml += "<a href=CampaignSearch.aspx?key=" + k + ">" + k + "</a>";
                }
            }

            GetMembers(id);

        }
        protected void GetMembers(string id)
        {
            string sql = "Select member_id from eng_camp_members where camp_id=" + id;
            DataTable dt = Eng_Data.eng_Datatable(sql, new System.Data.SqlClient.SqlParameter[0]);
            foreach (DataRow dr in dt.Rows)
            {
                camp_members.InnerHtml += "<a href='/Directory/Profile.aspx?id=" + dr.ItemArray[0].ToString() + "'>" + dr.ItemArray[0].ToString() + "</a>";
            }
        }

        protected void btn_join_campaign_Click(object sender, EventArgs e)
        {
            string sql = "Insert into eng_camp_members (camp_id, member_id) VALUES (" + Request.QueryString["id"].ToString() + ", '" + User.Identity.Name.ToString() + "'";
            Response.Write(Eng_Data.eng_Update(sql, new System.Data.SqlClient.SqlParameter[0]));
        }
    }
}