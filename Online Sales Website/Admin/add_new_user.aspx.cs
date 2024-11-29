using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Online_Sales_Website
{
    public partial class add_new_user : System.Web.UI.Page
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
            Response.Redirect("~/Admin/manage_user.aspx");
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


            string Role = ddlrole.SelectedItem.ToString();
            string q = "insert into login_data (name, password,role,address,mobile_no,Email) values ('" + txtname.Text + "','" + txtpwd.Text + "','" + Role + "','" + txtadd.Text + "','" + txtmobile.Text + "','" + txtemail.Text + "')";
            cmd = new SqlCommand(q, con);
            int status = cmd.ExecuteNonQuery();
            if (status > 0)
            {
                Response.Write("<script>alert('User Entry Successfull'); </script>");
                Response.Redirect("~/Admin/manage_user.aspx");
            }
            else
            {
                Response.Write("<script>alert('User Entry Error'); </script>");

                Response.Redirect("~/Admin/manage_user.aspx");




            }
        }
    }
}