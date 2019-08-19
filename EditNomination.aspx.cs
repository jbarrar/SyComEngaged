using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SyComEngaged
{
    public partial class EditNomination : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string sid = Request.QueryString["id"].ToString();
                txt_Edit.Text = SyComEngaged.App_Code.Eng_Data.GetSingle("eng_nom_submissions", "notes", "id=" + sid).ToString();
            }
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            string sql = "Update eng_nom_submissions set notes = @notes where id = @id";
            System.Data.SqlClient.SqlParameter[] parms = new System.Data.SqlClient.SqlParameter[2];
            parms[0] = new System.Data.SqlClient.SqlParameter("@notes", txt_Edit.Text);
            parms[1] = new System.Data.SqlClient.SqlParameter("@id", Request.QueryString["id"].ToString());
            SyComEngaged.App_Code.Eng_Data.eng_Update(sql, parms);
            //Response.Write(txt_Edit.Text);
            Response.Redirect("/");
        }
    }
}