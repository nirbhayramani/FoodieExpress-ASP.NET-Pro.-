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
    public partial class edit_category : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;
        int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            select();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void select()
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            getcon();
            da = new SqlDataAdapter("SELECT * FROM cate_tbl WHERE ID='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtcnam.Text = ds.Tables[0].Rows[0]["Cat_Name"].ToString();
                txtcdesc.Text = ds.Tables[0].Rows[0]["Cat_Desc"].ToString();
                txtcslug.Text = ds.Tables[0].Rows[0]["Cat_slug"].ToString();
                ddlicon.SelectedItem.Text = ds.Tables[0].Rows[0]["Cat_Icon"].ToString();
                ddlstat.SelectedItem.Text = ds.Tables[0].Rows[0]["Cat_stat"].ToString();
            }
        }

        protected void btnupd_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("UPDATE cate_tbl SET Cat_Name='" + txtcnam.Text +
                                 "', Cat_slug='" + txtcslug.Text +
                                 "', Cat_Desc='" + txtcdesc.Text +
                                 "', Cat_Icon='" + ddlicon.SelectedItem.Text +
                                 "', Cat_stat='" + ddlstat.SelectedItem.Text +
                                 "' WHERE ID='" + id + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Category updated successfully.')</script>");
        }
    }
}