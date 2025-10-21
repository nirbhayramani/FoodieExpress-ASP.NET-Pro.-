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
    public partial class user_management : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con= new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgrid();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM users_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            grdvuUsr.DataSource = ds;
            grdvuUsr.DataBind();
        }
    }
}