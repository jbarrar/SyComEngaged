using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using SyComEngaged.App_Code;

namespace SyComEngaged.Org
{
    public partial class _default : System.Web.UI.Page
    {
        //public static int iteration = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string outstring = "";
            string template = "<div class=\"stiff-chart-level\" data-level=\"0{0}\"><div class=\"stiff-main-parent\"><ul><li data-parent=\"{1}\"><div class=\"the-chart\"><img src = \"/content/images/sycom/employees/icons/{2}{3}.jpg\" alt=\"\"><p>{2} {3}</p>{4}</div></li></ul></div></div>";
            string sql = "Select id, email, fname, lname, title from eng_users where is_active=1 and email='dbowen@sycomtech.com'";
            SqlParameter[] p = new SqlParameter[0];
            DataTable d = Eng_Data.eng_Datatable(sql, p);
            foreach(DataRow dr in d.Rows)
            {
                outstring = string.Format(template, 1, dr.ItemArray[0].ToString(), dr.ItemArray[2].ToString(), dr.ItemArray[3].ToString(), dr.ItemArray[4].ToString());
                outstring += GetSubordinates(dr.ItemArray[1].ToString(), Convert.ToInt32(dr.ItemArray[0]),1);
            }
            //output.InnerHtml = outstring;
            cinner.InnerHtml = outstring + cinner.InnerHtml;
            
        }

        protected string GetSubordinates(string email, int id, int iteration)
        {
            iteration++;
            string parenttemplate = "<div class=\"stiff-chart-level\" data-level=\"0{0}\"><div class=\"stiff-child\" data-child-from=\"{1}\"><ul>{2}</ul></div></div>";
            string sql = "Select id, email, fname, lname, title from eng_users where is_active=1 and reports_to='" + email + "'";
            SqlParameter[] p = new SqlParameter[0];
            DataTable d = Eng_Data.eng_Datatable(sql, p);
            string par = string.Format(parenttemplate, iteration+1, id, getChildren(d, id, iteration));
            return par;
        }

        protected string getChildren(DataTable d, int id, int iteration)
        {
            string childtemplate = "<li data-parent=\"{0}\"><div class=\"the-chart\"><img src=\"/content/images/sycom/employees/icons/{1}{2}.jpg\" alt=\"\"><p>[{4}] {1} {2}</p>{3}</div></li>";
            string o = "";
            foreach (DataRow dr in d.Rows)
            {
                string par = string.Format(childtemplate, dr.ItemArray[0].ToString(), dr.ItemArray[2].ToString(), dr.ItemArray[3].ToString(), dr.ItemArray[4].ToString(), iteration);
                o += par;
                cinner.InnerHtml += GetSubordinates(dr.ItemArray[1].ToString(), Convert.ToInt32(dr.ItemArray[0].ToString()), iteration);                
            }
            return o;
        }
    }
}