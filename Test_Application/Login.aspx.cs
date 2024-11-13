using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_Application
{
    public partial class Login : System.Web.UI.Page
    {
        Dataaccess db = new Dataaccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = db.GetUserAuthentication(txtusername.Text, txtpassword.Text);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblMessage.Visible = true;
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}