using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SyComEngaged.App_Code;

namespace SyComEngaged {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Eng_Data.error);
            if (!Page.IsPostBack)
            {
                FillDropDowns();
                FillDesc();
                BindNews();
            }
        }
        public string ProcessEditLink(object posttime, object postauthor, object id)
        {
            string link = "";
            if (Convert.ToDateTime(posttime).AddHours(+1) > DateTime.Now.AddHours(-4) && User.Identity.Name.ToString() == postauthor.ToString())
            {
                link = "<br /><a href='/EditNomination.aspx?id=" + id + "'>Edit</a> - Link valid until " + Convert.ToDateTime(posttime).AddHours(+1) + "";
            }
            return link;
        }
        public int GetLikeCount(string id)
        {
            int i = Eng_Data.eng_Count("Select count(id) from eng_likes where ns_id=" + id, new SqlParameter[0]);
            if (i == -1) { i = 0; }
            return i;
        }
        public bool IsLiked(object ns_id)
        {
            string u = User.Identity.Name.ToString();
            //string u = "dbowen@sycomtech.com";
            //welcome.InnerHtml = user;
            //Select user from eng_points where ns_id = ns_id
            //Return a list of users
            bool l = Eng_Data.eng_Exists("Select id from eng_likes where [user]='" + u + "' AND ns_id=" + ns_id + "");
            return l;
        }
        //public string IsLiked(object ns_id)
        //{
        //    string user = User.Identity.Name.ToString();
        //    List<string> users = new List<string>();
        //    //Select user from eng_points where ns_id = ns_id
        //    //Return a list of users
        //    bool l = true;
        //    Eng_Data.eng_ListOfStrings("Select user_id from eng_points where nom_id = " + ns_id + "", new SqlParameter[0]).Any;
        //    foreach(string u in users.)
        //    return l;
        //}
        protected void BindNews()
        {
            //string UName = "dbowen@sycomtech.com";
            string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -4, ns.time) as time, left(ns.notes, 200) as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id, (Select count(id) from eng_likes where ns_id = ns.id) as liked from eng_nom_submissions as ns where MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, GETDATE())) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, GETDATE())) order by ns.time desc";
            //Response.Write(sql);
            SqlParameter[] parms = new SqlParameter[0];
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            lv_events.DataSource = dt;
            lv_events.DataBind();
        }
        //protected void FillNews()
        //{
        //    eng_events.InnerHtml = "";
        //    //string sql = "Select ns.id as id, (Select CONCAT(fname, ' ', lname) from org_structure where id=ns.to_id) as toName,(Select CONCAT(fname, ' ', lname) from org_structure where id=ns.from_id) as fromName,  n.title as title, ns.time as time, ns.notes as notes, n.icon as icon from eng_nom_submissions as ns, eng_nominations as n where eng_nom_submissions.nom_id = eng_nominations.id order by ns.time desc";
        //    string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -5, ns.time) as time, ns.notes as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id from eng_nom_submissions as ns where MONTH(time) = MONTH(GetDate()) AND YEAR(time) = YEAR(GETDATE()) order by ns.time desc";
        //    SqlParameter[] parms = new SqlParameter[0];
        //    DataTable dt = Eng_Data.eng_Datatable(sql, parms);
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        string id = dr.ItemArray[0].ToString();
        //        string to_id = dr.ItemArray[1].ToString();
        //        string toname = dr.ItemArray[2].ToString();
        //        string from_id = dr.ItemArray[3].ToString();
        //        string fromname = dr.ItemArray[4].ToString();
        //        string title = dr.ItemArray[5].ToString();
        //        string time = dr.ItemArray[6].ToString();
        //        string notes = dr.ItemArray[7].ToString();
        //        string icon = dr.ItemArray[8].ToString();
        //        string nom_id = dr.ItemArray[9].ToString();

        //        string format = "<div class='news_item'><a href='/nominations.aspx?id={8}'><img style='float:left;margin:-7px 5px;border:1px solid #CCC;' src='{7}' /></a><a href='/directory/profile.aspx?id={0}'>{1}<a> Nominated <a href='/directory/profile.aspx?id={2}'>{3}<a> for the {4} award.<div class='news_item_details'>{6}</div><div class='news_item_date'>Nomination date: {5}</div></div>";
        //        eng_events.InnerHtml += string.Format(format, from_id, fromname, to_id, toname, title, time, notes, icon, nom_id);
        //    }

        //}
        protected void FillDesc()
        {
            DataTable dt = Eng_Data.eng_Datatable("Select icon, title, description from eng_nominations where isactive=1", new SqlParameter[0]);
            string format = "<p><img src=\"{0}\" alt=\"{1}\" /> <b>{1}</b> <br />{2}</p>";
            foreach (DataRow dr in dt.Rows)
            {
                div_nom_desc.InnerHtml += string.Format(format, dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString(), dr.ItemArray[2].ToString());
            }
        }
        protected void FillDropDowns()
        {
            FillDDL_What();
        }
        protected void FillDDL_What()
        {
            string sql = "Select id, title, icon from eng_nominations where isactive=1 and isnom=1";
            SqlParameter[] parms = new SqlParameter[0];
            cb_what.DataSource = Eng_Data.eng_Datatable(sql, parms);
            cb_what.DataBind();
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string user = User.Identity.Name.ToString();
            string nominees = token_who.Value.ToString();
            string[] noms = nominees.Split(',');
            foreach(string nom in noms)
            {
                string result = Eng_Data.SubmitNomination(user, nom, cb_what.Value.ToString(), description.Value.ToString());
            }

            Response.Redirect(Request.RawUrl);
            //Response.Write(nominees);
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string sql = "Insert into eng_feedback (feedback, user, time) VALUES (@feedback, @user, NOW())";
            SqlParameter[] parms = new SqlParameter[2];
            parms[0] = new SqlParameter("@feedback", TextBoxMessage.Text);
            parms[1] = new SqlParameter("@user", User.Identity.Name.ToString());

            Eng_Data.eng_Update(sql, parms);
            lbl_results.Text = "Feedback Sent.  Thank you for your help!";
        }

        protected void lv_events_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lv_events.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindNews();
        }
    }
}