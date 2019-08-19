using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SyComEngaged.App_Code;

namespace SyComEngaged.Directory
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["cuser"] = User.Identity.Name.ToString().ToLower();
            //Response.Write(Eng_Data.error);
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string id = Request.QueryString["id"];
                    BuildProfile(id);
                    GetTrophies(id);
                    if (User.Identity.Name.ToString().ToLower() == id.ToLower())
                    {
                        //gv_Questions.Visible=true;
                        FillCertifications();
                    }
                    else
                    {
                        //gv_Questions.Visible = false;
                    }
                    FillDropDowns();
                }
                else
                {
                    BuildProfile(User.Identity.Name.ToString());
                    //gv_Questions.Visible = true;
                    FillCertifications();
                    GetTrophies(User.Identity.Name.ToString());
                    FillDropDowns();
                }
            }
        }

        protected void FillCertifications()
        {
            Object x = Eng_Data.GetSingle("eng_users_profile", "certifications", "userid='" + User.Identity.Name.ToString() + "'");
            foreach(string y in x.ToString().Split(','))
            {
                tk_Certifications.Tokens.Add(y);
            }
        }
        protected void FillProfile()
        {

        }
        protected void GetTrophies(string user)
        {
            object uid = Eng_Data.GetSingleInt("eng_users", "id", "email='" + user + "'");
            string sql = "Select n.icon as Icon from eng_nominations as n, eng_winners as w where n.id=w.nom_id and w.winner_id = '" + uid.ToString() + "' ";
            SqlParameter[] parms = new SqlParameter[0];
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                trophy.InnerHtml += "<img class='img_trophy' src='" + dr.ItemArray[0].ToString() + "' />";
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
        public string ProcessEditLink(object posttime, object postauthor, object id)
        {
            string link = "";
            if (Convert.ToDateTime(posttime).AddHours(+1) > DateTime.Now.AddHours(-4) && User.Identity.Name.ToString() == postauthor.ToString())
            {
                link = "<br /><a href='/EditNomination.aspx?id=" + id + "'>Edit</a> - Link valid until " + Convert.ToDateTime(posttime).AddHours(+1) + "";
            }
            return link;
        }
        protected void BindNews(string uid)
        {


            //string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -5, ns.time) as time, left(ns.notes, 200) as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id from eng_nom_submissions as ns where (to_id = @uid OR from_id = @uid) AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, GETDATE())) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, GETDATE())) order by ns.time desc";
            string sql = "Select ns.id as id, ns.to_id as to_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.to_id) as toName, ns.from_id as from_id, (Select CONCAT(fname, ' ', lname) from eng_users where email=ns.from_id) as fromName,  (Select title from eng_nominations where id=ns.nom_id) as title, DATEADD(hour, -5, ns.time) as time, left(ns.notes, 200) as notes, (Select icon from eng_nominations where id=ns.nom_id) as icon, ns.nom_id as nom_id from eng_nom_submissions as ns where (to_id = @uid) order by ns.time desc";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@uid", uid);
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            lv_events.DataSource = dt;
            lv_events.DataBind();
            if (dt.Rows.Count == 0)
            {
                eng_no_nom.Visible = true;
                eng_no_nom.InnerHtml += "<div class='news_item'>This person has not been nominated or nominated anyone else.  Lets get them engaged.  Be the first to nominate this person and receive bonus points!</div>";
            }
        }
        protected void lv_events_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lv_events.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindNews(Request.QueryString["id"]);
        }
        protected void BuildProfile(string id)
        {
            BindNews(id);
            string sql = "Select u.email, u.fname, u.lname, u.title, u.hiredate, (select SUM(points) from eng_points where [user_id] = u.email) as TotalPoints from eng_users as u where u.email=@id";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@id", id);
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                string uid = dr.ItemArray[0].ToString();
                string fname = dr.ItemArray[1].ToString();
                string lname = dr.ItemArray[2].ToString();
                string title = dr.ItemArray[3].ToString();
                string Totalpoints = dr.ItemArray[5].ToString();
                DateTime hiredate = (DateTime)(Convert.ToDateTime(dr.ItemArray[4]));
                int svc = Years(hiredate, DateTime.Now);
                string rc = "";
                if (svc > 19) { rc = "style='background: linear-gradient(#F79E05 0%, #8F5408 100%)'"; }
                else if (svc > 14) { rc = "style='background: linear-gradient(#2989d8 0%, #1e5799 100%)'"; }
                else if (svc > 9) { rc = "style='background: linear-gradient(#F70505 0%, #8F0808 100%)'"; }
                else if (svc > 4) { rc = "style='background: linear-gradient(#9BC90D 0%, #79A70A 100%)'"; }
                else if (svc > 0) { rc = "style='background: linear-gradient(#B6BAC9 0%, #808080 100%)'"; }
                else if (svc == 0) { rc = "style='visibility:hidden'"; };
                /*Gold - 20 Years background: linear-gradient(#F79E05 0%, #8F5408 100%);*/
                /*Blue - 15 Years background: linear-gradient(#2989d8 0%, #1e5799 100%);*/
                /*Red - 10 Years  background: linear-gradient(#F70505 0%, #8F0808 100%);*/
                /*Green - 5 Years  background: linear-gradient(#9BC90D 0%, #79A70A 100%);*/
                /*Grey - 1 Year  background: linear-gradient(#B6BAC9 0%, #808080 100%);*/
                string ribbonFormat = "<div class=\"ribbon\"><span {7}>{6}</span></div>";
                string m = "";
                if (svc > 1)
                {
                    m = "s";
                }
                string pic = "";
                if (System.IO.File.Exists(HttpContext.Current.Server.MapPath("/content/images/sycom/employees/icons/" + fname + lname.Replace("'", "") + ".jpg")))
                {
                    pic = fname + lname.Replace("'", "");
                }
                else
                {
                    pic = "unknown";
                }
                string format = "<div class='profile_box'>" + ribbonFormat + "<p class=p_image><img src=\"/content/images/sycom/employees/icons/{9}.jpg\" width='90' height='90' /></p><p class=p_name>{1} {2}</p><p class=p_title>{3}</p></div><div class='profile_points'>Current Points: {4}<br />Lifetime Points: {10}</div>DOH:{8}";
                profile.InnerHtml += string.Format(format, uid, fname, lname, title, Eng_Data.GetPoints(uid), ribbonFormat, svc + " Year" + m, rc, hiredate.ToLongDateString(), pic, Totalpoints);
            }
        }
        protected int Years(DateTime start, DateTime end)
        {
            return (end.Year - start.Year - 1) +
                (((end.Month > start.Month) ||
                ((end.Month == start.Month) && (end.Day >= start.Day))) ? 1 : 0);
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string user = User.Identity.Name.ToString();
            string result = Eng_Data.SubmitNomination(user, Request.QueryString["id"].ToString(), cb_what.Value.ToString(), description.Value.ToString());
            if (result == "")
            {
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(result);
            }
        }

        protected void tk_Certifications_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            
            ds_Certifications.UpdateCommand = "Update eng_users_profile Set certifications='" + tk_Certifications.Value.ToString() + "' where userid='" + User.Identity.Name.ToString() + "' IF @@ROWCOUNT=0 Insert into eng_users_profile (userid, certifications) values ('" + User.Identity.Name.ToString() + "', '" + tk_Certifications.Value.ToString() + "')";
            ds_Certifications.Update();
            tk_Certifications.DataBind();
        }
    }
}