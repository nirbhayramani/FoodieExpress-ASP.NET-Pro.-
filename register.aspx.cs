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
    public partial class register : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void clear()
        {
            txtfnm.Text = "";
            txtlnm.Text = "";
            txteml.Text = "";
            txttel.Text = "";
            txtadd.Text = "";
            txtpass.Text = "";
            txtcon.Text = "";
        }

        protected void btncre_Click(object sender, EventArgs e)
        {
            if (btncre.Text == "Create Account")
            {
                
                getcon();

                cmd = new SqlCommand("insert into users_tbl(First_Name,Last_Name,Email,Phone_Number,Delivery_Address,Password,Prof_Image,Role) values('" + txtfnm.Text + "','" + txtlnm.Text + "','" + txteml.Text + "','" + txttel.Text + "','" + txtadd.Text + "','" + txtpass.Text + "','data/userProf_pics/user-icon.jpg','user')", con);
                cmd.ExecuteNonQuery();
                clear();
                
            }
        }
    }
}