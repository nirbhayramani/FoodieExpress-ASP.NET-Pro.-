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
    public partial class menu : System.Web.UI.Page
    {
        string str = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;

        void getcon()
        {
            con = new SqlConnection(str);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                fillCatList();
                fillDataList();
            }
        }

        void fillDataList()
        {
            getcon();
            da = new SqlDataAdapter("select * from food_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            DtLsFod.DataSource = ds;
            DtLsFod.DataBind();
        }

        void fillCatList()
        {
            getcon();
            da = new SqlDataAdapter("select * from cate_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            DtLsCat.DataSource = ds;
            DtLsCat.DataBind();
        }

        protected void lnkadcart_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void DtLsCat_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string name = e.CommandArgument.ToString();

            if (e.CommandName == "cmd_cat")
            {
                getcon();
                da = new SqlDataAdapter("select * from food_tbl where Cat_Name='" + name + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                DtLsFod.DataSource = ds;
                DtLsFod.DataBind();
            }
        }

        protected void btnAllCat_Click(object sender, EventArgs e)
        {
            getcon();
            fillDataList();
        }

        protected void DtLsFod_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cart")
            {
                da = new SqlDataAdapter("Select * from users_tbl where Email='" + Session["username"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"]);

                int fodid = Convert.ToInt32(e.CommandArgument);
                da = new SqlDataAdapter("Select * from food_tbl where Id='" + fodid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                string fodnm = ds.Tables[0].Rows[0]["Fo_Name"].ToString();
                string fodesc = ds.Tables[0].Rows[0]["Fo_desc"].ToString();
                string fodpri = ds.Tables[0].Rows[0]["Fo_Price"].ToString();
                int quant = 1;
                double tot = Convert.ToDouble(fodpri) * quant;
                string fodimg = ds.Tables[0].Rows[0]["Fo_Img"].ToString();

                cmd = new SqlCommand("Insert into Cart_tbl (User_Cart_ID,Fod_Cart_ID,C_Fod_Name,C_Fod_Desc,C_Fod_Quantity,C_Fod_Price,C_Fod_Total,C_Fod_Img)values('" + userid + "','" + fodid + "','" + fodnm + "','" + fodesc + "','" + quant + "','" + fodpri + "','" + tot + "','" + fodimg + "')", con);
                cmd.ExecuteNonQuery();
            }
        }
    }
}