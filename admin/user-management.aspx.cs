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
    public partial class user_management : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

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
            da = new SqlDataAdapter("SELECT * FROM users_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            grdvuUsr.DataSource = ds;
            grdvuUsr.DataBind();
        }

        protected void btnRep_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from users_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            string s = Server.MapPath("~/admin/Report Files/xmls/users_report.xml");
            ds.WriteXmlSchema(s);

            string path = Server.MapPath("~/admin/Report Files/rpts/users_report.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Users Report");
        }
    }
}