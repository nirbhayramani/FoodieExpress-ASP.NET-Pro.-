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
    public partial class edit_order : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        int id,user_id;

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
                    selectOrd();
                    selectCust();
                }
            }
        }

        void selectOrd()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Order_tbl WHERE Or_Order_Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtOrdId.Text = ds.Tables[0].Rows[0]["Or_Order_Id"].ToString();
                user_id = Convert.ToInt32(ds.Tables[0].Rows[0]["Or_User_Id"].ToString());
                txtOrdDt.Text = ds.Tables[0].Rows[0]["Or_Order_date"].ToString();
                ddlOrdStat.SelectedValue = ds.Tables[0].Rows[0]["Or_Ord_Stat"].ToString();
                ddlPayStat.SelectedValue = ds.Tables[0].Rows[0]["Or_Pay_Stat"].ToString();
                txtShipAdd.Text = ds.Tables[0].Rows[0]["Or_Ship_Add"].ToString();
                txtPayMeth.Text = ds.Tables[0].Rows[0]["Or_Pay_Meth"].ToString();
                lblSubTot.Text = "₹"+ds.Tables[0].Rows[0]["Or_SubTotal"].ToString();
                lblTax.Text = "₹"+ds.Tables[0].Rows[0]["Or_Tax"].ToString();
                lblGrdTot.Text = "₹"+ds.Tables[0].Rows[0]["Or_Grand_Total"].ToString();
            }
        }

        void selectCust()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM users_tbl WHERE Id='" + user_id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtCustNm.Text = ds.Tables[0].Rows[0]["First_Name"].ToString()+" "+ ds.Tables[0].Rows[0]["Last_Name"].ToString();
                txtCustEml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtCustPhn.Text = ds.Tables[0].Rows[0]["Phone_Number"].ToString();
            }
        }

        protected void lnkSvChg_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("UPDATE Order_tbl SET Or_Ord_Stat='" + ddlOrdStat.SelectedItem.Text +
                                 "', Or_Pay_Stat='" + ddlPayStat.SelectedItem.Text + "' WHERE Or_Order_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Order Details updated successfully.')</script>");
            Response.Redirect("order-management.aspx");
        }
    }
}