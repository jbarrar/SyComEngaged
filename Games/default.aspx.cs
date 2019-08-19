using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SyComEngaged.App_Code;
using System.Data;
using System.Data.SqlClient;

namespace SyComEngaged.Games
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetGames();
            }
        }
        protected void GetGames()
        {
            string sql = "Select id, title, embed from eng_games";
            SqlParameter[] parms = new SqlParameter[0];
            ddl_games.DataSource=Eng_Data.eng_Datatable(sql, parms);
            ddl_games.DataBind();
        }
    }
}