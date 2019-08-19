using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SyComEngaged
{
    public partial class EmailTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string body = @"
                <html>
                <head></head>
                <body>
                    <span style='font-size:1.3em;font-family:calibri;'>SyCom <i>=</i> Engaged</span>
                    <div style='font-size:1.0em;font-family:calibri;border:1px solid #CCC;border-radius:3px;background:#EEE;padding:5px;'>
                        Congratulations!  You have been nominated for the ___ Award.  <br />
                        Sign in and check it out! [<a href='https://sycomengaged.azurewebsites.net/ViewNomination.aspx?id={nomid}'>SyCom <i>=</i> Engaged</a>]
                    </div>
                </body>
                </html>
            ";
            SyComEngaged.App_Code.EngMail.Email("dbowen@sycomtech.com", body);
        }
    }
}