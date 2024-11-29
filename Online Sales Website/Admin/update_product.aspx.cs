using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Sales_Website
{
    public partial class update_product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["nm"] != null)
                {
                    string id = Request.QueryString["nm"].ToString();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string q = "select * from main_product where P_ID = '" + id + "'  ";

                    cmd = new SqlCommand(q, con);
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    int st = cmd.ExecuteNonQuery();
                    da.Fill(ds, "main_product");
                    if (ds.Tables["main_product"].Rows.Count > 0)
                    {
                        txtname.Text = ds.Tables["main_product"].Rows[0][1].ToString();
                        txtmrp.Text = ds.Tables["main_product"].Rows[0][2].ToString();
                        txtprice.Text = ds.Tables["main_product"].Rows[0][3].ToString();
                        txtdiscount.Text = ds.Tables["main_product"].Rows[0][4].ToString();
                        txtbrand.Text = ds.Tables["main_product"].Rows[0][5].ToString();
                        txtdetail.Text = ds.Tables["main_product"].Rows[0][12].ToString();
                        txtstock.Text = ds.Tables["main_product"].Rows[0][13].ToString();
                        txttype.Text = ds.Tables["main_product"].Rows[0][7].ToString();

                    }


                }
            }
        }
        protected void SearchBar_TextChanged(object sender, EventArgs e)
        {
            // Handle text changed event for the SearchBar
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/manage_product.aspx");
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string id = Request.QueryString["nm"].ToString();

            string q = "update main_product set Product_name = '" + txtname.Text + "',MRP = '" + txtmrp.Text + "',Our_Prize = '" + txtprice.Text + "',Discount = '" + txtdiscount.Text + "',Brand = '" + txtbrand.Text + "',Type_of_product = '" + txttype.Text + "' ,Detail = '" +txtdetail.Text+"',stock='"+txtstock.Text+ "'where P_ID = '" + id + "'";

            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            int st = cmd.ExecuteNonQuery();
            if ((st > 0))
            {
                Response.Write("<script>alert('Update Successfull'); </script>");
                Response.Redirect("~/Admin/manage_product.aspx");
            }
            else
            {
                Response.Write("<script>alert('Update error')</script>");

            }

            
            
        }
    }

    
}