using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodieExpress___ASP.NET_Pro.__
{
    public partial class WebSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                btnlog.Text = "Logout";
            }
        }

        protected void btnlog_Click(object sender, EventArgs e)
        {
            if (btnlog.Text == "Login")
            {
                Response.Redirect("login.aspx");
            }
            else if(btnlog.Text == "Logout")
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }
        }
    }
}