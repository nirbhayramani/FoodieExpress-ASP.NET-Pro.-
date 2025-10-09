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
    public partial class cart : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        PagedDataSource pg = new PagedDataSource();
        string fnm;
        int p, row;

        void getcon()
        {
            con = new SqlConnection(str);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            int userid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            cmd = new SqlCommand("SELECT count(*) FROM Cart_tbl WHERE User_Cart_Id='" + userid + "'", con);
            cmd.ExecuteNonQuery();
            int crt = Convert.ToInt32(cmd.ExecuteScalar());
            lblCrt.Text = crt.ToString();
            fillDatalist();

            TotalPri();
        }

        protected void DtLsCrt_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_rem")
            {
                int cartid = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("Delete from Cart_tbl where Cart_Id='" + cartid + "'", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("cart.aspx");
            }
            else if (e.CommandName == "cmd_decre")
            {
                int cartid = Convert.ToInt32(e.CommandArgument);
                getcon();
                da = new SqlDataAdapter("Select * from Cart_tbl where Cart_Id='" + cartid + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int quant = Convert.ToInt32(ds.Tables[0].Rows[0]["C_Fod_Quantity"]);
                double price = Convert.ToDouble(ds.Tables[0].Rows[0]["C_Fod_Price"]);
                if (quant > 1)
                {
                    quant--;
                    double tot = quant * price;
                    cmd = new SqlCommand("Update Cart_tbl set C_Fod_Quantity='" + quant + "', C_Fod_Total='" + tot + "' where Cart_Id='" + cartid + "'", con);
                    cmd.ExecuteNonQuery();
                    fillDatalist();
                }
            }
            else if (e.CommandName == "cmd_incre")
            {
                int cartid = Convert.ToInt32(e.CommandArgument);
                getcon();
                da = new SqlDataAdapter("Select * from Cart_tbl where Cart_Id='" + cartid + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int quant = Convert.ToInt32(ds.Tables[0].Rows[0]["C_Fod_Quantity"]);
                double price = Convert.ToDouble(ds.Tables[0].Rows[0]["C_Fod_Price"]);
                quant++;
                double tot = quant * price;
                cmd = new SqlCommand("Update Cart_tbl set C_Fod_Quantity='" + quant + "', C_Fod_Total='" + tot + "' where Cart_Id='" + cartid + "'", con);
                cmd.ExecuteNonQuery();
                if (quant > 1)
                {

                }
                fillDatalist();
            }
        }

        void fillDatalist()
        {
            getcon();
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);


            int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            da = new SqlDataAdapter("Select * from Cart_tbl where User_Cart_Id='" + userid + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DtLsCrt.DataSource = ds;
            DtLsCrt.DataBind();
        }

        protected void lnkChkOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkout.aspx");
        }

        void TotalPri()
        {
            da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            da = new SqlDataAdapter("Select sum(C_Fod_Total) from Cart_tbl where User_Cart_Id='" + userid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            lblSubTot.Text = "$" + ds.Tables[0].Rows[0][0].ToString();
            double finalTotal = Convert.ToDouble(ds.Tables[0].Rows[0][0])+2.99;
            lblFnlTot.Text = "$" + finalTotal.ToString();
        }
    }
}