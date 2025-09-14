using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodieExpress___ASP.NET_Pro.__.admin
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Session.Clear();
                Response.Redirect("admin-login.aspx");
            }
        }
    }
}