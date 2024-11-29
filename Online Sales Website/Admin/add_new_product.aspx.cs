using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Online_Sales_Website
{
    public partial class add_new_product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {


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

            FileUpload1.SaveAs(Server.MapPath("~/Product/") + FileUpload1.FileName);
            string ext = Path.GetExtension(FileUpload1.FileName);
            string p_img_path = "~/Product/" + FileUpload1.FileName;
            string Role = ddlrole.SelectedItem.ToString();
            string q = "insert into main_product (Product_name,MRP,Our_Prize,Discount,Brand,Brand_image,Type_of_product,Detail,stock) values ('" + txtname.Text + "','" + txtmrp.Text + "','" + txtprice.Text + "','" + txtdiscount.Text + "','" + txtbrand.Text + "','" + p_img_path + "','" + Role + "','" + txtdetail.Text + "','" + txtstock.Text + "')";
            cmd = new SqlCommand(q, con);
            int status = cmd.ExecuteNonQuery();
            if (status > 0)
            {
                Response.Write("<script>alert('Product Entry Successfull'); </script>");
                Response.Redirect("~/Admin/manage_product.aspx");
            }
            else
            {
                Response.Write("<script>alert('Product Entry Error'); </script>");

                Response.Redirect("~/Admin/manage_product.aspx");




            }
        }
    }
}