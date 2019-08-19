using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SyComEngaged.App_Code;

namespace SyComEngaged.Content.ajax
{
    public partial class ViewNomination : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                BuildNom(Request.QueryString["id"]);
                GetLikes(Request.QueryString["id"]);
            }
            else
            {
                //Response.Redirect(Request.UrlReferrer.AbsoluteUri);
            }
        }
        protected void GetLikes(string id)
        {
            string sql = "Select [user] from eng_likes where ns_id = " + id + "";
            DataTable dt = new DataTable();
            dt = Eng_Data.eng_Datatable(sql, new SqlParameter[0]);

            foreach(DataRow dr in dt.Rows)
            {
                foreach(string i in dr.ItemArray)
                {
                    Tuple<string, string> t = Eng_Data.getUserFullName(i);
                    string pic = "unknown";
                    if (System.IO.File.Exists(HttpContext.Current.Server.MapPath("/content/images/sycom/employees/icons/" + t.Item1 + t.Item2.Replace("'", "") + ".jpg")))
                    {
                        pic = t.Item1 + t.Item2.Replace("'", "");
                    }
                    else
                    {
                        pic = "unknown";
                    }
                    nom_likes.InnerHtml += "<a href='/directory/profile.aspx?id=" + i + "'><img src='/content/images/sycom/employees/icons/" + pic + ".jpg' height='20px' width='20px' />" + t.Item1 + " " + t.Item2 + "</a><br />";
                }
            }
        }
        protected void BuildNom(string id)
        {
            nom_details.InnerHtml = "";
            //string sql = "Select ns.id as id, (Select CONCAT(fname, ' ', lname) from org_structure where id=ns.to_id) as toName,(Select CONCAT(fname, ' ', lname) from org_structure where id=ns.from_id) as fromName,  n.title as title, ns.time as time, ns.notes as notes, n.icon as icon from eng_nom_submissions as ns, eng_nominations as n where eng_nom_submissions.nom_id = eng_nominations.id order by ns.time desc";
            string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -5, ns.time) as time, ns.notes as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id from eng_nom_submissions as ns where ns.id = @nom_id order by ns.time desc";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@nom_id", id);

            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                string nid = dr.ItemArray[0].ToString();
                string to_id = dr.ItemArray[1].ToString();
                string toname = dr.ItemArray[2].ToString();
                string from_id = dr.ItemArray[3].ToString();
                string fromname = dr.ItemArray[4].ToString();
                string title = dr.ItemArray[5].ToString();
                string time = dr.ItemArray[6].ToString();
                string notes = dr.ItemArray[7].ToString().Replace("\n", "<br />");
                string icon = dr.ItemArray[8].ToString();
                string nom_id = dr.ItemArray[9].ToString();

                string format = "<div class='news_item'><a href='/nominations.aspx?id={9}'><img style='float:left;margin:-7px 5px;border:1px solid #CCC;' src='{7}' /></a><a href='/directory/profile.aspx?id={0}'>{1}<a> Nominated <a href='/directory/profile.aspx?id={2}'>{3}<a> for the {4} award on {5}<br /><br /><br />{6}</div>";
                nom_details.InnerHtml += string.Format(format, from_id, fromname, to_id, toname, title, time, notes, icon, nid, nom_id);
            }
        }
    }
}