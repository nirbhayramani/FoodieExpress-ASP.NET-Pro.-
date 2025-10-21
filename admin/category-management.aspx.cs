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

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;

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

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
        static string Crypath = "";

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
            da = new SqlDataAdapter("SELECT * FROM cate_tbl", con);
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
                cmd = new SqlCommand("DELETE FROM cate_tbl WHERE ID='" + id + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
            else
            {
                Response.Redirect("edit-category.aspx?id=" + id);
            }
        }

        protected void btnRep_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from cate_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/admin/Report Files/xmls/cate_report.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/admin/Report Files/rpts/cate_report.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Categories Report");
        }
    }
}