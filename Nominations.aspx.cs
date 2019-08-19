using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SyComEngaged.App_Code;

namespace SyComEngaged
{
    public partial class Nominations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Eng_Data.error);
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"];
                FillNoms(id);
                GetTitle(id);

            }
            else
            {
                Response.Write("No ID Specified");
            }
        }
        protected void GetTitle(string nid)
        {
            string sql = "Select title, description, icon from eng_nominations where id=@id";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@id", nid);
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                string title = dr.ItemArray[0].ToString();
                string description = dr.ItemArray[1].ToString();
                string icon = dr.ItemArray[2].ToString();

                string format = "<img style='float:left;margin:-7px 5px;border:1px solid #CCC;' src='{2}' /><h1>{0}</h1><h4>{1}</h4>";
                div_title.InnerHtml += string.Format(format, title, description, icon);
            }
        }
        protected void FillNoms(string n_id)
        {
            div_nom.InnerHtml = "";
            //string sql = "Select ns.id as id, (Select CONCAT(fname, ' ', lname) from org_structure where id=ns.to_id) as toName,(Select CONCAT(fname, ' ', lname) from org_structure where id=ns.from_id) as fromName,  n.title as title, ns.time as time, ns.notes as notes, n.icon as icon from eng_nom_submissions as ns, eng_nominations as n where eng_nom_submissions.nom_id = eng_nominations.id order by ns.time desc";
            string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -5, ns.time) as time, ns.notes as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id from eng_nom_submissions as ns where ns.nom_id = @nom_id AND (MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, GetDate())) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, GetDate()))) order by ns.time desc";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@nom_id", n_id);
            DataTable dt =  Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                string id = dr.ItemArray[0].ToString();
                string to_id = dr.ItemArray[1].ToString();
                string toname = dr.ItemArray[2].ToString();
                string from_id = dr.ItemArray[3].ToString();
                string fromname = dr.ItemArray[4].ToString();
                string title = dr.ItemArray[5].ToString();
                string time = dr.ItemArray[6].ToString();
                string notes = dr.ItemArray[7].ToString();
                string icon = dr.ItemArray[8].ToString();
                string nom_id = dr.ItemArray[9].ToString();

                string format = "<div class='news_item'><a href='/nominations.aspx?id={8}'><img style='float:left;margin:-7px 5px;border:1px solid #CCC;' src='{7}' /></a><a href='/directory/profile.aspx?id={0}'>{1}<a> Nominated <a href='/directory/profile.aspx?id={2}'>{3}<a> for the {4} award on {5}<br /><i>{6}</i></div>";
                div_nom.InnerHtml += string.Format(format, from_id, fromname, to_id, toname, title, time, notes, icon, nom_id);
            }

        }
    }
}