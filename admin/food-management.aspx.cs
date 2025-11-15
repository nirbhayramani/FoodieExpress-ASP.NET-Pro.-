using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;

namespace FoodieExpress___ASP.NET_Pro.__.admin
{
    public partial class food_management : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        PagedDataSource pg = new PagedDataSource();
        string fnm;
        int row;

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
        static string Crypath = "";
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
            da = new SqlDataAdapter("SELECT * FROM food_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;

            pg.AllowPaging = true;
            pg.PageSize = 7;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);

            pg.DataSource = ds.Tables[0].DefaultView;

            lnkbtnprev.Enabled = !pg.IsFirstPage;
            lnkbtnnxt.Enabled = !pg.IsLastPage;


            gridvufod.DataSource = pg;
            gridvufod.DataBind();
        }

        protected void gridvufod_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM stud_tbl WHERE ID='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
            else
            {
                Response.Redirect("edit-food.aspx?id=" + id);
            }
        }

        protected void lnkbtnnxt_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            currentPage++;
            ViewState["pid"] = currentPage;
            fillgrid();
        }

        protected void lnkbtnprev_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["pid"]);
            currentPage--;
            ViewState["pid"] = currentPage;
            fillgrid();
        }

        protected void btnRep_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from food_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/admin/Report Files/xmls/food_report.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/admin/Report Files/rpts/food_report.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Food Report");
        }
    }
}