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
    public partial class Nominate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropDowns();
                FillDesc();
            }
        }
        protected void FillDesc()
        {
            DataTable dt = Eng_Data.eng_Datatable("Select icon, title, description from eng_nominations where isactive=1 and isnom=1", new SqlParameter[0]);
            string format = "<p><img src=\"{0}\" alt=\"{1}\" /> {1} <br />{2}</p>";
            foreach (DataRow dr in dt.Rows)
            {
                div_nom_desc.InnerHtml += string.Format(format, dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString(), dr.ItemArray[2].ToString());
            }
        }
        protected void FillDropDowns()
        {
            FillDDL_What();
            FillDDL_Who();
        }
        protected void FillDDL_What()
        {
            string sql = "Select id, title, icon from eng_nominations where isactive=1";
            SqlParameter[] parms = new SqlParameter[0];
            cb_what.DataSource = Eng_Data.eng_Datatable(sql, parms);
            cb_what.DataBind();
        }
        protected void FillDDL_Who()
        {
            string sql = "Select email, CONCAT(lname, ', ', fname) as name from eng_users where is_active=1 order by lname";
            SqlParameter[] parms = new SqlParameter[0];
            DataTable dt = Eng_Data.eng_Datatable(sql, parms);
            cb_who.DataSource = dt;
            cb_who.DataBind();
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            string user = User.Identity.Name.ToString();
            string result = Eng_Data.SubmitNomination(user, cb_who.Value.ToString(), cb_what.Value.ToString(), description.Value.ToString());
            if (result == "")
            {
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(result);
            }
        }
        

    }
}