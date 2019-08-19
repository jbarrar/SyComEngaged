using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data;
using System.Data.SqlClient;

namespace SyComEngaged.Directory
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                GetCards();
        }
        protected void GetCards()
        {
            SqlParameter[] parms = new SqlParameter[0];
            string sql = "Select id, CONCAT(fname, ' ',lname) as employee, email, title, reports_to, location, department, hiredate from eng_users where is_active = 1";
            DataTable dt = Eng_Data.eng_Datatable(sql,parms);
            cv_Employees.DataSource = dt;
            cv_Employees.DataBind();
        }
    }
}