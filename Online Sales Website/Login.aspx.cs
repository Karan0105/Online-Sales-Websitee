using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Online_Sales_Website
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string q = "select * from login_data where name = '" + txtUsername.Text + "' and password='" + txtPassword.Text + "'";

            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            int status = cmd.ExecuteNonQuery();

            da.Fill(ds, "login_data");

            if (ds.Tables["login_data"].Rows.Count > 0)
            {
                // login success
                Session["name"] = ds.Tables["login_data"].Rows[0][1].ToString();

                Response.Write("<script>alert('Login Successfull'); </script>");
                Response.Redirect("~/home/home.aspx");
                //Label1.Text = txtUsername.Text;
                //Label2.Text = txtPassword.Text;
            }
            else
            {
                Response.Write("<script>alert('Login Error'); window.location = 'Login.aspx';</script>");

            }

        }

    }
}