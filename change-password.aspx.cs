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
    public partial class change_password : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;

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
        }

        protected void btnSavePwd_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (txtCurrPwd.Text == ds.Tables[0].Rows[0]["Password"].ToString())
            {
                cmd = new SqlCommand("Update users_tbl set Password='" + txtNewPwd.Text + "' where Email='" + Session["username"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                //lblMsg.Visible = true;
                //lblMsg.Text = "Password changed successfully.";
            }
            else
            {
                //lblMsg.Visible = true;
                RVCurrPwd.IsValid = false;
                RVCurrPwd.ErrorMessage = "Old password is incorrect.";
                //lblMsg.Text = "Old password is incorrect.";
            }
        }
    }
}