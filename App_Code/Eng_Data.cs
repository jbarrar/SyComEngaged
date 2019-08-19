using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.SignalR;

namespace SyComEngaged.App_Code
{
    public static class Eng_Data
    {
        public static string error = "";
        public static string conn = ConfigurationManager.ConnectionStrings["cn_Engaged"].ConnectionString;
        public static DataTable eng_Datatable(string sql, SqlParameter[] pr)
        {
            DataTable dt = new DataTable();
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            foreach (SqlParameter p in pr)
            {
                cmd.Parameters.Add(p);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
            }
            catch (Exception ex) {
                logError("[Eng_datatable]" + ex.Message + "(" + sql + ")");
            }
            finally { }
            return dt;
        }

        public static List<string> eng_ListOfStrings(string sql, SqlParameter[] pr)
        {
            List<string> l = new List<string>();
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        l.Add(rdr.GetString(0));
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[engListOfStrings]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return l;
        }
        public static string getUserFullNameString(string id)
        {
            string sql = "Select fname, lname from eng_users where email='" + id + "'";
            string nm = "";
            
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        nm = rdr.GetString(0) + " " + rdr.GetString(1);
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[engUserFullName]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return nm;
        }
        public static Tuple<string, string> getUserFullName(string id)
        {
            string fn = "";
            string ln = "";
            string sql = "Select fname, lname from eng_users where email='" + id + "'";


            Tuple<string, string> tu = new Tuple<string, string>("", "");
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        fn = rdr.GetString(0);
                        ln = rdr.GetString(1);
                        tu = new Tuple<string, string>(fn, ln);
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[engUserFullName]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return tu;
        }
        //public static string AddLike(string user, int ns_id)
        //{
        //    string x = "0";
        //    string sql = "Insert into eng_likes (user, ns_id) VALUES (@user, @ns_id)";
        //    SqlParameter[] p = new SqlParameter[2];
        //    p[0] = new SqlParameter("@user",user);
        //    p[1] = new SqlParameter("@ns_id", ns_id);
        //    //eng_Update(sql, p);

        //    //Check for nominee based on ns_id.   If your own post, no points, else +1 point to nominee.
        //    object us = GetSingle("eng_nom_submissions", "to_id", "id=" + ns_id);
        //    if (us != null)
        //    {
        //        x = us.ToString();
        //    }
        //    return x;
        //}
        public static string SubmitNomination(string user_id, string to_id, string nom_id, string notes, int multinom=0)
        {

            string result = "";
            int PostCount = 0;

            //Check for Recent Submissions
            SqlParameter[] parmsPost = new SqlParameter[1];
            parmsPost[0] = new SqlParameter("@from_id", user_id);
            if (multinom != 0)
            {
                PostCount = eng_Count("Select count(id) from eng_nom_submissions where [from_id] = @from_id AND time >= DateADD(mi, -1, GetDate())", parmsPost);
            }
                //Check for Duplicate Submissions
            SqlParameter[] parmsDup = new SqlParameter[3];
            parmsDup[0] = new SqlParameter("@from_id", user_id);
            parmsDup[1] = new SqlParameter("@to_id", to_id);
            parmsDup[2] = new SqlParameter("@notes", notes);
            int CheckDup = eng_Count("Select count(id) from eng_nom_submissions where [from_id] = @from_id AND to_id = @to_id AND notes = @notes", parmsDup);
            // If no recent posts or duplicates, add nomination
            if (PostCount <= 0 && CheckDup <= 0)
            {

                //Add Nomination Submission
                int nominationid = eng_AddNomination(nom_id, to_id, notes);
                var hubContext = GlobalHost.ConnectionManager.GetHubContext<SignalRDemo.NotificationHub>();
                hubContext.Clients.All.receiveNotification(getUserFullNameString(user_id) + " has nominated " + getUserFullNameString(to_id) + " for the " + GetSingle("eng_Nominations", "title", "id=" + nom_id) + " award. <a class='ajax' href=\"/content/ajax/ViewNomination.aspx?id=" + nom_id + "\" title=\"Nomination Details\">View Details</a>");

                //Check to see if this is a self nomination, and if so add 2 points to user
                if (user_id == to_id)
                {
                    eng_AddPoints(user_id, 2, "Nom:" + nom_id + ": Self Nomination");
                }
                else
                {
                    //IF not a self nomination, give nominee 20 points and nominator 5 points.
                    eng_AddPoints(user_id, 5, "Nom:" + nom_id + ": Nominated " + to_id);
                    eng_AddPoints(to_id, 20, "Nom:" + nom_id + ": Nominated by " + user_id);
                    //Template for Nomination Email
                    string body = @"
                        <html>
                        <head></head>
                        <body>
                            <span style='font-size:1.3em;font-family:calibri;'>SyCom <i>=</i> Engaged</span>
                            <div style='font-size:1.0em;font-family:calibri;border:1px solid #CCC;border-radius:3px;background:#EEE;padding:5px;'>
                                Congratulations!  You have been nominated for the <b>{0}</b> award by <a href='https://engaged.sycomtech.com/directory/profile.aspx?id={1}'>{2}</a>.  <br />
                                <br />
                                Sign in and check it out! [<a href='https://engaged.sycomtech.com/directory/profile.aspx?id={3}'>View your profile</a>]
                            </div>
                        </body>
                        </html>
                    ";
                    body = string.Format(body, GetSingle("eng_nominations", "title", "id=" + nom_id), user_id, GetSingle("eng_users", "CONCAT(fname, ' ', lname) as name", "email='" + user_id + "'"), to_id);
                    EngMail.Email(to_id, body);

                }
                if (!HasNomination(to_id))
                {
                    //If nominating a person that does not have a nomination, add 5 points to nominators points.
                    eng_AddPoints(user_id, 5, "Nom:" + nom_id + ": First to Nominate " + to_id);
                }
                //Response.Redirect(Request.RawUrl);
            }
            else
            {
                result = "Warning:  Rate limit of 1 submission per minute, or a duplicate nomination was found.";
            }

            return result;
        }
        public static int eng_Update(string sql, SqlParameter[] parms)
        {
            int i = 0;
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            foreach (SqlParameter p in parms)
            {
                cmd.Parameters.Add(p);
            }
            try
            {
                cn.Open();
                i = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                logError("[Eng_Update]" + ex.Message + "(" + sql + ")");
            }
            finally
            {
                cn.Close();
            }
            return i;
        }

        public static int eng_AddNomination(string nom_id, string to_id, string notes)
        {
            int id = 0;
            string user = HttpContext.Current.User.Identity.Name.ToString();
            string sql = "Insert into eng_nom_submissions (nom_id, from_id, to_id, notes) VALUES (@nom_id, @from_id, @to_id, @notes ); SELECT CAST(scope_identity() as int)";
            SqlParameter[] parms = new SqlParameter[4];
            parms[0] = new SqlParameter("@nom_id", nom_id);
            parms[1] = new SqlParameter("@to_id", to_id);
            parms[2] = new SqlParameter("@notes", notes);
            parms[3] = new SqlParameter("@from_id", user);
            int res = eng_Update(sql, parms);
            if(res>0) { return res; }
            return id;
        }
        public static void eng_AddPoints(string who, int amt, string reason)
        {
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("insert into eng_points (user_id, points, reason) VALUES ('" + who + "', " + amt + ", '" + reason + "')", cn);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                logError("[Eng_AddPoints]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        public static bool HasNomination(string who)
        {
            bool x = eng_Exists("Select count(1) from eng_nom_submissions where to_id = '" + who + "' AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, GetDate())) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, GetDate()))");
            return x;
        }
        public static bool eng_Exists(string sql)
        {
            bool x = false;

            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        x = true;
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[engExists]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return x;
        }
        public static int eng_Count(string sql, SqlParameter[] parms)
        {
            int x = -1;

            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(sql, cn);
            foreach (SqlParameter p in parms)
            {
                cmd.Parameters.Add(p);
            }
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        x = rdr.GetInt32(0);
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[engCount]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return x;
        }
        public static Int32 GetSingleInt(string table, string field, string where)
        {
            int x = 0;
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select " + field + " from " + table + " where " + where, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        x = rdr.GetInt32(0);
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[GetSingleInt]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return x;
        }
        public static object GetSingle(string table, string field, string where)
        {
            object x = 0;
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select " + field + " from " + table + " where " + where, cn);
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        x = rdr.GetString(0);
                    }
                }
            }
            catch (Exception ex)
            {
                logError("[GetSingle]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return x;
        }
        public static Byte IsAdmin(string user)
        {
            Byte p = 0;
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select is_admin from eng_users where email = '" + user + "'", cn);

            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    p = rdr.GetByte(0);
                }
            }
            catch (Exception ex)
            {
                logError("[IsAdmin]" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return p;
        }
        public static int GetPoints(string user)
        {
            int p = 0; 
            SqlConnection cn = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select SUM(points) from eng_points where user_id = '" + user + "' AND MONTH(DATEADD(hour, -5, time)) = MONTH(DATEADD(hour, -5, GetDate())) AND YEAR(DATEADD(hour, -5, time)) = YEAR(DATEADD(hour, -5, GetDate()))", cn);
 
            try
            {
                cn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(0))
                    {
                        p = rdr.GetInt32(0);
                    }
                }
            }
            catch (Exception ex)
            {

                logError("[GetPoints]" + ex.Message);
            }
            finally{
                cn.Close();
            }
            return p;
        }
        public static void logError(string error){
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@error", error);
            eng_Update("Insert into eng_log (error) VALUES (@error)", p);
        }

    }


}