using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Xml.Linq;

namespace FoodieExpress___ASP.NET_Pro.__.admin
{
    public partial class category_management : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgrid();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM cat_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            gridvu_cat.DataSource = ds;
            gridvu_cat.DataBind();
        }
        protected void girdvu_cat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM cat_tbl WHERE ID='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
            else
            {
                Response.Redirect("edit-category.aspx?id=" + id);
            }
        }
    }
}