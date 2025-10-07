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
    public partial class add_category : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }

            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtname.Text = "";
            txtslug.Text = "";
            txtdesc.Text = "";
        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("Insert into cate_tbl(Cat_Name,Cat_slug,Cat_Desc,Cat_Icon,Cat_stat)values('" +txtname.Text+ "','"+txtslug.Text+"','"+txtdesc.Text+"','"+ddlicon.SelectedItem.Text+"','"+ddlstat.SelectedItem.Text+"')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Category added successfully.')</script>");
            clear();
            
        }
    }
}