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
    public partial class add_food : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;     //SQL Operations: Insert, Update, Delete
        string fnm;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
            else
            {
                getcon();
                if (!IsPostBack)
                {
                    fillCategory();
                }
            }
        }

        void clear()
        {
            txtfnam.Text = "";
            ddlcat.SelectedIndex=-1;
            txtprc.Text = "";
            txtfdesc.Text = "";
            txtcalr.Text = "";
        }

        void imgUpload()
        {
            if (fldimg.HasFile)
            {
                fnm = "../data/prodPics/" + fldimg.FileName;
                fldimg.SaveAs(Server.MapPath(fnm));
            }
        }
        void fillCategory()
        {
            getcon();
            da = new SqlDataAdapter("Select * from cate_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlcat.Items.Add("-- Select Category --");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlcat.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }

        protected void btnadddi_Click(object sender, EventArgs e)
        {
            getcon();
            imgUpload();

            cmd = new SqlCommand("Insert into food_tbl (Fo_Name,Cat_Name,Fo_Price,Fo_Desc,Fo_Img,Fo_Calr,Fo_ingr)values('" + txtfnam.Text + "','" + ddlcat.SelectedItem.Text + "','" + txtprc.Text + "','" + txtfdesc.Text + "','"+fnm+"','"+txtcalr.Text+"','"+txtfing.Text+"')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Food dish added successfully.')</script>");
            clear();
        }

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            //da = new SqlDataAdapter("Select * from cate_tbl where Cat_Name='" + ddlcat.SelectedItem.ToString() + "'", con);
            //ds = new DataSet();
            //da.Fill(ds);

            //ViewState["cid"] = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        }
    }
}