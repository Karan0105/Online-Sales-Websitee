using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Sales_Website
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchBar_TextChanged(object sender, EventArgs e)
        {
            // Handle text changed event for the SearchBar
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Handle click event for the SearchButton
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/manage_user.aspx");
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

    }
}