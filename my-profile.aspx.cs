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
    public partial class my_profile : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;
        int i;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            fillFlds();
        }

        void fillFlds()
        {
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            imgProf.ImageUrl = ds.Tables[0].Rows[0]["Prof_Image"].ToString();
            lblNm.Text = ds.Tables[0].Rows[0]["First_Name"].ToString() + " " + ds.Tables[0].Rows[0]["Last_Name"].ToString();
            lblEml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtFnm.Text = ds.Tables[0].Rows[0]["First_Name"].ToString();
            txtLnm.Text = ds.Tables[0].Rows[0]["Last_Name"].ToString();
            txtEml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtAdd.Text = ds.Tables[0].Rows[0]["Delivery_Address"].ToString();
            txtTel.Text = ds.Tables[0].Rows[0]["Phone_Number"].ToString();
        }
    }
}