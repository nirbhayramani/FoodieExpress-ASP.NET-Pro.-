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
    public partial class order_management : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        PagedDataSource pg = new PagedDataSource();
        string fnm;
        int row;

        void getcon()
        {
            con = new SqlConnection(s);
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
            da = new SqlDataAdapter("SELECT O.Or_Order_Id, U.First_Name, U.Last_Name, U.Email, O.Or_Order_date, O.Or_Grand_Total, O.Or_Ord_Stat, O.Or_Pay_Stat FROM Order_tbl O JOIN users_tbl U ON O.Or_User_Id = U.Id", con);
            ds = new DataSet();
            da.Fill(ds);

            //row = ds.Tables[0].Rows.Count;

            //pg.AllowPaging = true;
            //pg.PageSize = 2;
            //pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);

            //pg.DataSource = ds.Tables[0].DefaultView;

            //lnkbtnprev.Enabled = !pg.IsFirstPage;
            //lnkbtnnxt.Enabled = !pg.IsLastPage;


            grdVuOrd.DataSource = ds;
            grdVuOrd.DataBind();
        }

        protected void grdVuOrd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "cmd_edt")
            {
                    Response.Redirect("edit-order.aspx?id=" + id);
            }
        }
    }
}