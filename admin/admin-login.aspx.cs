using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FoodieExpress___ASP.NET_Pro.__.admin
{
    public partial class login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            if (con == null)
            {
                con = new SqlConnection(s);
                con.Open();
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            getcon();
            if (txteml.Text != null && txtpwd.Text != null)
            {
                cmd = new SqlCommand("SELECT count(*) FROM admin_tbl WHERE Email='" + txteml.Text + "' AND Password='" + txtpwd.Text + "'", con);
                cmd.ExecuteNonQuery();
                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["admin"] = txteml.Text;
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Invalid Username or Password";
                }
            }
        }
    }
}