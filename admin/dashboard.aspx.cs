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
    public partial class dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;
        int totfod,totuse;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]== null)
            {
                Response.Redirect("admin-login.aspx");
            }
            lbltotfod();
            lbltotuser();
        }
        void getcon()
        {
            if (con == null)
            {
                con = new SqlConnection(s);
                con.Open();
            }
        }

        void lbltotfod()
        {
            getcon();
            cmd = new SqlCommand("SELECT count(Id) FROM food_tbl", con);
            cmd.ExecuteNonQuery();
            totfod = Convert.ToInt32(cmd.ExecuteScalar());

            lbltfo.Text = totfod.ToString();
        }

        void lbltotuser()
        {
            cmd = new SqlCommand("SELECT count(Id) FROM users_tbl", con);
            cmd.ExecuteNonQuery();
            totuse = Convert.ToInt32(cmd.ExecuteScalar());

            lbltuser.Text = totuse.ToString();
        }
    }
}