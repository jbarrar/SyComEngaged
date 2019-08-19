using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using DevExpress.Utils;
using System.Data;
using System.Data.SqlClient;
using SyComEngaged.App_Code;

namespace SyComEngaged
{
    public partial class Leaderboards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                FillLeaderBoards(Request.QueryString["date"].ToString());
            }
            else
            {
                FillLeaderBoards("NoDate");
            }
        }
        //protected void FillTotalPoints()
        //{
        //    //Top 10 Total Points
        //    string sql = "Select SUM(p.points) as points, (Select u.lname from eng_users as u where email=p.user_id) as name, p.user_id from eng_points as p group by p.user_id order by points";
        //    SqlParameter[] parms = new SqlParameter[0];
        //    DataTable dt = Eng_Data.eng_Datatable(sql, parms);
        //    try
        //    {
        //        ch_TotalPoints.DataSource = dt;
        //        ch_TotalPoints.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }
        //    Series s1 = new Series("Count", ViewType.Bar);
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        s1.Points.Add(new SeriesPoint("" + dr.ItemArray[1].ToString() + "", dr.ItemArray[0].ToString()));
        //    }
        //    s1.LegendText = "Points";
        //    s1.ShowInLegend = true;
        //    ch_TotalPoints.Series.Add(s1);
        //}
        protected void FillLeaderBoards(string rdate)
        {

            string sql = string.Empty;
            string sql_2 = string.Empty;
            string sql_3 = string.Empty;
            string sql_4 = string.Empty;
            string sql_5 = string.Empty;
            string sql_6 = string.Empty;
            DateTime d = DateTime.Now;
            if (rdate != "NoDate")
            {
                //rdate = rdate + " 00:00:01 AM";
                d = DateTime.Parse(rdate);
                //Response.Write(d);
                sql = "SELECT DENSE_RANK() OVER (ORDER BY SUM(p.points) DESC) AS rank, SUM(p.points) as points, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.user_id) as name, p.user_id as user_id FROM eng_points as p WHERE MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY user_id";
                sql_6 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =5 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_5 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =6 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_4 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =3 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_3 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =2 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_2 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =1 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
            }
            else
            {
                //Response.Write(d);
                sql = "SELECT DENSE_RANK() OVER (ORDER BY SUM(p.points) DESC) AS rank, SUM(p.points) as points, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.user_id) as name, p.user_id as user_id FROM eng_points as p WHERE MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY user_id";
                sql_6 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =5 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_5 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =6 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_4 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =3 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_3 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =2 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
                sql_2 = "SELECT DENSE_RANK() OVER (ORDER BY COUNT(id) DESC) AS rank, count(id) as count, (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.to_id) as name, p.to_id as user_id FROM eng_nom_submissions as p where nom_id =1 AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, @d)) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, @d)) Group BY to_id";
            }

            //Response.Write(sql);
            
            //string sql = "Select TOP 10 SUM(p.points) as points, (SELECT DENSE_RANK() OVER (ORDER BY points DESC) AS rank FROM (SELECT CustomerID, COUNT(*) AS TotCnt as rank), (Select CONCAT(u.fname, ' ',u.lname) from eng_users as u where email=p.user_id) as name, p.user_id as user_id from eng_points as p group by p.user_id order by points desc";
            SqlParameter[] parms = new SqlParameter[1];
            parms[0] = new SqlParameter("@d", d);
            gv_l1.DataSource = Eng_Data.eng_Datatable(sql, parms);
            gv_l1.DataBind();
            SqlParameter[] parms2 = new SqlParameter[1];
            parms2[0] = new SqlParameter("@d", d);
            gv_l2.DataSource = Eng_Data.eng_Datatable(sql_2, parms2);
            gv_l2.DataBind();
            SqlParameter[] parms3 = new SqlParameter[1];
            parms3[0] = new SqlParameter("@d", d);
            gv_l3.DataSource = Eng_Data.eng_Datatable(sql_3, parms3);
            gv_l3.DataBind();
            SqlParameter[] parms4 = new SqlParameter[1];
            parms4[0] = new SqlParameter("@d", d);
            gv_l4.DataSource = Eng_Data.eng_Datatable(sql_4, parms4);
            gv_l4.DataBind();
            SqlParameter[] parms5 = new SqlParameter[1];
            parms5[0] = new SqlParameter("@d", d);
            gv_l5.DataSource = Eng_Data.eng_Datatable(sql_5, parms5);
            gv_l5.DataBind();
            SqlParameter[] parms6 = new SqlParameter[1];
            parms6[0] = new SqlParameter("@d", d);
            gv_l6.DataSource = Eng_Data.eng_Datatable(sql_6, parms6);
            gv_l6.DataBind();


        }

    }
}