using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace SyComEngaged.Content.ajax
{
    public partial class like : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddLike(Request.Form["id"].ToString(), Request.Form["nid"].ToString());
        }
        protected void AddLike(string id, string nominee_id)
        {
            string u = User.Identity.Name.ToString();
            //string u = "dbowen@sycomtech.com";
            string sql = "Insert into eng_likes ([ns_id], [user]) VALUES (@nsid, @usr) ;";
            SqlParameter[] parms = new SqlParameter[2];
            parms[0] = new SqlParameter("@nsid", id);
            parms[1] = new SqlParameter("@usr", u);
            SyComEngaged.App_Code.Eng_Data.eng_Update(sql, parms);
            SyComEngaged.App_Code.Eng_Data.eng_AddPoints(nominee_id, 1, "Like from " + u + " for ns_id=" + id);
        }
    }
}