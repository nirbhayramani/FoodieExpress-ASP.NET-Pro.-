using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FoodieExpress___ASP.NET_Pro.__
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
            if (txteml.Text != null && txtpass.Text != null)
            {
                da = new SqlDataAdapter("SELECT * FROM users_tbl WHERE Email='" + txteml.Text + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows[0]["Email"].ToString()==txteml.Text && ds.Tables[0].Rows[0]["Password"].ToString() == txtpass.Text)
                {
                    if (ds.Tables[0].Rows[0]["Role"].ToString() == "admin")
                    {
                        Session["admin"] = txteml.Text;
                        Response.Redirect("admin/dashboard.aspx");
                    }
                    else
                    {
                        Session["username"] = txteml.Text;
                        Response.Redirect("index.aspx");
                    }
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
