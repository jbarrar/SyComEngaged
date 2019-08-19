using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using SyComEngaged.App_Code;
using System.Data;
using System.Data.SqlClient;    

namespace SyComEngaged {
    public partial class RootMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; SyCom Technologies");
            div_login.InnerHtml = BuildProfile(HttpContext.Current.User.Identity.Name.ToString());
            string user = HttpContext.Current.User.Identity.Name.ToString();
            if(App_Code.Eng_Data.IsAdmin(user)==1){
                HeaderMenu.Items.FindByName("Admin").Visible = true;
            }
        }
        public static string BuildProfile(string id)
        {
            string profile = "";
            string sql = "Select email, fname, lname, title, hiredate from eng_users where email=@id";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@id", id);
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            foreach (DataRow dr in dt.Rows)
            {
                string uid = dr.ItemArray[0].ToString();
                string fname = dr.ItemArray[1].ToString();
                string lname = dr.ItemArray[2].ToString();
                string title = dr.ItemArray[3].ToString();
                DateTime hiredate = (DateTime)(Convert.ToDateTime(dr.ItemArray[4]));
                int svc = YearCalc(hiredate, DateTime.Now);
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
                if(System.IO.File.Exists(HttpContext.Current.Server.MapPath("/content/images/sycom/employees/icons/" + fname + lname.Replace("'", "") + ".jpg"))){
                    pic = fname + lname.Replace("'", "");
                }else{
                    pic = "unknown";
                }
                string format = "<div class='profile_box_main' onclick=\"document.location.href='/directory/profile.aspx?id={0}'\">" + ribbonFormat + "<p class=p_image><img src=\"/content/images/sycom/employees/icons/{9}.jpg\" width='45' height='45' /></p><p class=p_name>{1} {2}</p> Points: {4}</div>";
                profile += string.Format(format, uid, fname, lname, title, Eng_Data.GetPoints(uid), ribbonFormat, svc + " Year" + m, rc, hiredate.ToLongDateString(), pic);

            }
            return profile;
        }
        public static int YearCalc(DateTime start, DateTime end)
        {
            return (end.Year - start.Year - 1) +
                (((end.Month > start.Month) ||
                ((end.Month == start.Month) && (end.Day >= start.Day))) ? 1 : 0);
        }

    }
}