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
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        int ord_id, userid;
        string pay_Stat;
        decimal subTot, tax, finalTotal, totAmt;
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
                CalcTots();
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
                userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

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

        void CalcTots()
        {
            getcon();

            // Get user ID
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                // Calculate subtotal and grand total
                da = new SqlDataAdapter("Select Cast(Sum(C_Fod_Quantity * C_Fod_Price) AS DECIMAL(10, 2)) from Cart_tbl where User_Cart_Id='" + userid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                lblSubTot.Text = "₹" + ds.Tables[0].Rows[0][0].ToString();
                subTot = Convert.ToDecimal(ds.Tables[0].Rows[0][0]);
                tax = Math.Round(subTot * 0.05m, 2); // 5% tax
                lblTax.Text = "₹" + tax.ToString();
                finalTotal = Convert.ToDecimal(ds.Tables[0].Rows[0][0]) + 100 + tax;
                lblTot.Text = "₹" + finalTotal.ToString();
            }
        }

        protected void btnPlcOrd_Click(object sender, EventArgs e)
        {
            getcon();

            //1. Get User ID from stud_tbl
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //lblOrdMsg.Text = "User not found.";
                //con.close();
                return;
            }
            userid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            //2. Get cart items from user's cart
            da = new SqlDataAdapter("Select *,(C_Fod_Price * C_Fod_Quantity) as Total from Cart_tbl where User_Cart_Id='" + userid + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataTable CartItems = ds.Tables[0];
            if (CartItems.Rows.Count == 0)
            {
                //lblOrdMsg.Text = "Your cart is empty.";
                //con.close();
                return;
            }

            //3. Calculate Total Amount
            subTot = 0;
            foreach (DataRow dr in CartItems.Rows)
            {
                if (dr["Total"] != DBNull.Value)
                    subTot += Convert.ToDecimal(dr["Total"]);
            }
            tax = Math.Round(subTot * 0.05m, 2); // 5% tax
            finalTotal = Math.Round(Convert.ToDecimal(subTot + 100 + tax),2);

            //4. Insert Order_tbl
            string shipAdd = txtShipAdd.Text.Trim();
            string payMeth = rblPayMeth.SelectedValue;

            if (payMeth == "UPI (GPay/PhonePe/PayTm)" || payMeth == "Card (Visa/MasterCard)")
            {
                pay_Stat = "Paid";
            }
            else
            {
                pay_Stat = "Pending";
            }

            cmd = new SqlCommand("Insert into Order_tbl(Or_User_Id,Or_Order_date,Or_SubTotal,Or_Deli_Fee,Or_Tax,Or_Grand_Total,Or_Ord_Stat,Or_Pay_Stat,Or_Ship_Add,Or_Pay_Meth) values('" + userid + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + subTot + "','" + "100.00" + "','" + tax + "','" + finalTotal + "','Pending','" + pay_Stat + "','" + shipAdd + "','" + payMeth + "');" + "SELECT SCOPE_IDENTITY();", con);
            ord_id = Convert.ToInt32(cmd.ExecuteScalar());
            ViewState["OrderID"] = ord_id;

            //5.Insert order_items_tbl for each cart item
            foreach (DataRow dr in CartItems.Rows)
            {
                cmd = new SqlCommand("Insert into Order_Item_tbl(OI_Order_Id,OI_Fod_Id,OI_Fod_Name,OI_Fod_Price,OI_Fod_Quant,OI_Fod_Image) values('" + ord_id + "','" + dr["Fod_Cart_Id"] + "','" + dr["C_Fod_Name"] + "','" + dr["C_Fod_Price"] + "','" + dr["C_Fod_Quantity"] + "','" + dr["C_Fod_Img"] + "')", con);
                cmd.ExecuteNonQuery();
            }

            //6.Clear user's cart
            cmd = new SqlCommand("Delete from Cart_tbl where User_Cart_Id='" + userid + "'", con);
            cmd.ExecuteNonQuery();

            //lblOrdMsg.Text = "Order placed successfully!";
            DtLsOrdSum.DataSource = null;
            DtLsOrdSum.DataBind();
            lblSubTot.Text = "₹0.00";
            lblTax.Text = "₹0.00";
            lblTot.Text = "₹0.00";

            //Response.Redirect("checkout.aspx");
        }
    }
}