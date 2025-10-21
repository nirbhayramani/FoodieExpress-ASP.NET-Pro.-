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
    public partial class edit_food : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;
        int id,catId;
            void getcon()
            {
                con = new SqlConnection(s);
                con.Open();
            }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                getcon();
                id = Convert.ToInt32(Request.QueryString["id"]);
                if (!IsPostBack)
                {
                    fillCategory();
                    select();
                }
            }
        }

        void fillCategory()
        {
            getcon();
            da = new SqlDataAdapter("Select * from cate_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlcat.Items.Add("-- Select Category --");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlcat.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }

        void select()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM food_tbl WHERE Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtfnam.Text = ds.Tables[0].Rows[0]["Fo_Name"].ToString();
                txtprc.Text = ds.Tables[0].Rows[0]["Fo_Price"].ToString();
                txtfdesc.Text = ds.Tables[0].Rows[0]["Fo_desc"].ToString();
                txtcalr.Text = ds.Tables[0].Rows[0]["Fo_Calr"].ToString();
                txtfingr.Text = ds.Tables[0].Rows[0]["Fo_ingr"].ToString();
                txtprc.Text = ds.Tables[0].Rows[0]["Fo_Price"].ToString();
                ddlcat.SelectedValue = ds.Tables[0].Rows[0]["Cat_Name"].ToString();

            }
        }
        protected void btnupd_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("UPDATE food_tbl SET Fo_Name='" + txtfnam.Text +
                                 "', Cat_Name='" + ddlcat.SelectedItem.Text +
                                 "', Fo_Price='" + txtprc.Text +
                                 "', Fo_desc='" + txtfdesc.Text+
                                 "', Fo_Calr='" + txtcalr.Text +
                                 "', Fo_ingr='" + txtfingr.Text +
                                 "' WHERE ID='" + id + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Food dish updated successfully.')</script>");
        }

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            //da = new SqlDataAdapter("Select * from cat_tbl where Cat_Name='" + ddlcat.SelectedItem.ToString() + "'", con);
            //ds = new DataSet();
            //da.Fill(ds);

            //ViewState["cid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        }
    }
}