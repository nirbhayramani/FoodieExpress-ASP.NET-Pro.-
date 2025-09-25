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
            fillDatalist();
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


    }
}