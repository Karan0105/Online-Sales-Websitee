using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Sales_Website
{
    public partial class add_cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string name = Session["name"].ToString();
                //string category = ddlcategory.SelectedValue.ToString();
                string q = "select * from cart_product where user_name = '" + name + "' ";
                cmd = new SqlCommand(q, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                int status = cmd.ExecuteNonQuery();

                da.Fill(ds, "cart_product");
                if (ds.Tables["cart_product"].Rows.Count > 0)
                {

                    GridView1.DataSource = ds.Tables["cart_product"];
                    GridView1.DataBind();

                }
            }
        }
        protected void SearchBar_TextChanged(object sender, EventArgs e)
        {
            // Handle text changed event for the SearchBar
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Handle click event for the SearchButton
        }


        protected void NotificationButton_Click(object sender, EventArgs e)
        {
            // Handle click event for NotificationButton
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {
            // Handle click event for ProfileButton
            Response.Redirect("~/Admin/manage_order.aspx");
        }

        protected void btncart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/manage_product.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnbuy_Click(object sender, EventArgs e)
        {

        }
    }
}