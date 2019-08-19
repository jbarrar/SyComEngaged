using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SyComEngaged.Content.ajax
{
    public partial class admin_newUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fn = txtFName.Text;
            string ln = txtLName.Text;
            string rpt = txtReportsTo.Text;
            string email = txtEmail.Text;
            string title = txtTitle.Text;
            string dept = txtDept.Text;
            string loc = txtLocation.Text;
            DateTime hd = calHireDate.SelectedDate;
            DateTime bd = calBirthDate.SelectedDate;


            string imgPath = Server.MapPath("/content/images/sycom/employees/icons/");
            if (uplPicture.UploadedFiles.Count() > 0)
            {

                foreach (UploadedFile f in uplPicture.UploadedFiles)
                {
                    f.SaveAs(imgPath + fn + ln + ".jpg");
                }
            }
            else
            {
                Response.Write("No File Selected");
            }
            string sql = "Insert into eng_users ( fname, lname, reports_to, email, title, department, location, birthday, hiredate) VALUES (@fn, @ln, @rpt, @email, @title, @dept, @loc, @bd, @hd)";
            System.Data.SqlClient.SqlParameter[] p = new System.Data.SqlClient.SqlParameter[9];
            p[0] = new System.Data.SqlClient.SqlParameter("@fn", fn);
            p[1] = new System.Data.SqlClient.SqlParameter("@ln", ln);
            p[2] = new System.Data.SqlClient.SqlParameter("@rpt", rpt);
            p[3] = new System.Data.SqlClient.SqlParameter("@email", email);
            p[4] = new System.Data.SqlClient.SqlParameter("@title", title);
            p[5] = new System.Data.SqlClient.SqlParameter("@dept", dept);
            p[6] = new System.Data.SqlClient.SqlParameter("@loc", loc);
            p[7] = new System.Data.SqlClient.SqlParameter("@hd", hd);
            p[8] = new System.Data.SqlClient.SqlParameter("@bd", bd);

            SyComEngaged.App_Code.Eng_Data.eng_Update(sql, p);


        }
    }
}