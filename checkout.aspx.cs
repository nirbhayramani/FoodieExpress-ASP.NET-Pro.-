////checkout.aspx.cs

//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.SqlClient;
//using System.Drawing;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//using System.Configuration;

//namespace FoodieExpress___ASP.NET_Pro.__
//{
//    public partial class checkout : System.Web.UI.Page
//    {
//        string str = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
//        SqlConnection con;
//        SqlDataAdapter da;
//        DataSet ds;
//        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
//        PagedDataSource pg = new PagedDataSource();
//        string fnm;
//        int p, row;

//        void getcon()
//        {
//            con = new SqlConnection(str);
//            con.Open();
//        }
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            getcon();
//            if (Session["username"] == null)
//            {
//                Response.Redirect("login.aspx");
//            }
//            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
//            ds = new DataSet();
//            da.Fill(ds);
//            fillDatalist();
//        }

//        //void fillDatalist()   // without css
//        //{
//        //    getcon();
//        //    da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
//        //    ds = new DataSet();
//        //    da.Fill(ds);


//        //    int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
//        //    da = new SqlDataAdapter("Select * from Cart_tbl where User_Cart_Id='" + userid + "'", con);
//        //    ds = new DataSet();
//        //    da.Fill(ds);
//        //    DtLsOrdSum.DataSource = ds;
//        //    DtLsOrdSum.DataBind();
//        //}

//        //void fillDatalist()  // with css working
//        //{
//        //    getcon();
//        //    da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
//        //    ds = new DataSet();
//        //    da.Fill(ds);

//        //    if (ds.Tables[0].Rows.Count > 0)
//        //    {
//        //        int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
//        //        da = new SqlDataAdapter("Select * from Cart_tbl where User_Cart_Id='" + userid + "'", con);
//        //        ds = new DataSet();
//        //        da.Fill(ds);

//        //        if (ds.Tables[0].Rows.Count > 0)
//        //        {
//        //            DtLsOrdSum.DataSource = ds;
//        //            DtLsOrdSum.DataBind();
//        //            lblEmptyCart.Visible = false;
//        //        }
//        //        else
//        //        {
//        //            DtLsOrdSum.DataSource = null;
//        //            DtLsOrdSum.DataBind();
//        //            lblEmptyCart.Visible = true;
//        //        }
//        //    }
//        //}

//        //void fillDatalist()      // with css working
//        {
//            getcon();
//            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
//            ds = new DataSet();
//            da.Fill(ds);

//            if (ds.Tables[0].Rows.Count > 0)
//            {
//                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
//                da = new SqlDataAdapter("Select * from Cart_tbl where User_Cart_Id='" + userid + "'", con);
//                ds = new DataSet();
//                da.Fill(ds);

//                if (ds.Tables[0].Rows.Count > 0)
//                {
//                    DtLsOrdSum.DataSource = ds;
//                    DtLsOrdSum.DataBind();
//                    lblEmptyCart.Visible = false;
//                }
//                else
//                {
//                    DtLsOrdSum.DataSource = null;
//                    DtLsOrdSum.DataBind();
//                    lblEmptyCart.Visible = true;
//                }
//            }
//        }
//    }
//}






using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace FoodieExpress___ASP.NET_Pro.__
{
    public partial class checkout : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con = new SqlConnection(str);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                if (Session["username"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                fillDatalist();
                CalculateTotals();
            }
        }

        void fillDatalist()
        {
            getcon();

            // Get user ID
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                // Get cart items
                da = new SqlDataAdapter("Select * from Cart_tbl where User_Cart_Id='" + userid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DtLsOrdSum.DataSource = ds;
                    DtLsOrdSum.DataBind();
                    lblEmptyCart.Visible = false;
                }
                else
                {
                    DtLsOrdSum.DataSource = null;
                    DtLsOrdSum.DataBind();
                    lblEmptyCart.Visible = true;
                }
            }
        }

        void CalculateTotals()
        {
            getcon();

            // Get user ID
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                // Calculate subtotal
                string subtotalQuery = "SELECT SUM(CAST(C_Fod_Price AS FLOAT) * CAST(C_Fod_Quantity AS INT)) FROM Cart_tbl WHERE User_Cart_Id = '" + userid + "'";
                SqlCommand cmd = new SqlCommand(subtotalQuery, con);
                object subtotalObj = cmd.ExecuteScalar();

                decimal subtotal = 0;
                if (subtotalObj != DBNull.Value && subtotalObj != null)
                {
                    subtotal = Convert.ToDecimal(subtotalObj);
                }

                decimal deliveryFee = 2.99m;
                decimal tax = Math.Round(subtotal * 0.08m, 2); // 8% tax
                decimal total = subtotal + deliveryFee + tax;

                // Update the summary display
                UpdateSummaryDisplay(subtotal, deliveryFee, tax, total);
            }
        }

        void UpdateSummaryDisplay(decimal subtotal, decimal deliveryFee, decimal tax, decimal total)
        {
            // Register startup script to update the values
            string script = @"
                <script>
                    document.getElementById('subtotal').textContent = '₹{subtotal:F2}';
                    document.getElementById('deliveryFee').textContent = '₹{deliveryFee:F2}';
                    document.getElementById('tax').textContent = '₹{tax:F2}';
                    document.getElementById('total').textContent = '₹{total:F2}';
                </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "UpdateSummary", script);
        }
    }
}