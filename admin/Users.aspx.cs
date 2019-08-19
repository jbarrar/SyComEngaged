using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SyComEngaged.admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Byte x = App_Code.Eng_Data.IsAdmin(User.Identity.Name.ToString());
            if(x!=1)
            {
                Response.Redirect("/");
                //Response.Write(x + " " + User.Identity.Name.ToString());
            }
            
        }
    }
}