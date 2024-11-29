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
    public partial class Product_page : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialization or database fetches can be done here.
                if (Request.QueryString["nm"] != null)
                {
                    string id = Request.QueryString["nm"].ToString();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT * FROM main_product WHERE Brand_image = '"+id+"'";
                    Label1.Text = id;

                }
                string amount = ddlQuantity.SelectedItem.ToString();
                int total = 100 * (Convert.ToInt32(Convert.ToString( amount)));
                lblPrice.Text = total.ToString();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddToCart_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {

        }

        protected void btncart_Click(object sender, EventArgs e)
        {

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {

        }
    }
}