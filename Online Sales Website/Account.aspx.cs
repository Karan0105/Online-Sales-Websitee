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
    public partial class Account : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["name"] != null)
                {
                    string name = Session["name"].ToString();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    string q = "select * from login_data where name = '" + name + "'  ";

                    cmd = new SqlCommand(q, con);
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    int st = cmd.ExecuteNonQuery();
                    da.Fill(ds, "login_data");
                    if (ds.Tables["login_data"].Rows.Count > 0)
                    {
                        string Role = ds.Tables["login_data"].Rows[0][3].ToString();
                        txtname.Text = ds.Tables["login_data"].Rows[0][1].ToString();
                        txtpwd.Text = ds.Tables["login_data"].Rows[0][2].ToString();
                        txtemail.Text = ds.Tables["login_data"].Rows[0][6].ToString();
                        txtmobile.Text = ds.Tables["login_data"].Rows[0][5].ToString();
                        txtadd.Text = ds.Tables["login_data"].Rows[0][4].ToString();
                        
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/orderhistory.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session.Clear();
            Response.Redirect("~/login/Login.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string name = Session["name"].ToString();

            string q = "update login_data set name = '" + txtname.Text + "',password = '" + txtpwd.Text + "',address = '" + txtadd.Text + "',mobile_no = '" + txtmobile.Text + "',Email = '" + txtemail.Text + "' where name = '" + name + "'";

            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            int st = cmd.ExecuteNonQuery();
            if ((st > 0))
            {
                //lblupdate.Text = "Update Successfull Kindly Relogin to continue";
                //Response.Write("<script>alert('Update Successfull Kindly Relogin to continue'); </script>");
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Update error')</script>");

            }
        }

        protected void SearchBar_TextChanged(object sender, EventArgs e)
        {

        }



    }
}