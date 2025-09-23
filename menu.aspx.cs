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
            da = new SqlDataAdapter("select * from cat_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            DtLsCat.DataSource = ds;
            DtLsCat.DataBind();
        }

        protected void lnkadcart_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
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
    }
}