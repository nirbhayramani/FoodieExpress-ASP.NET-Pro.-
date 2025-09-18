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
            fillDataList();
            if (Session["user"] == null)
            {
                //lnkadcart.Enabled = false;
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


    }
}