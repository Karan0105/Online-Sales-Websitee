using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Online_Sales_Website.Home
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                // Assuming you have an Image control with ID 'ImageControl'
                //ImageControl.ImageUrl = ResolveUrl(imagePath);
                string imagepath = "~/Product/-original-imahyuhfg2z4fvyh.png";
                //Image1.ImageUrl = ResolveUrl(imagepath);
                if (Session["name"] != null)
                {
                    
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string na = Session["name"].ToString();
                    string q = "select * from login_data where name = '" + Session["name"].ToString() + "' ";
                    btnlogin.Text = na;
                    cmd = new SqlCommand(q, con);
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    int status = cmd.ExecuteNonQuery();

                    da.Fill(ds, "login_data");

                    if (ds.Tables["login_data"].Rows.Count > 0)
                    {
                        // login success

                        string Role = ds.Tables["login_data"].Rows[0][3].ToString();
                        
                        if (Role != null)
                        {
                            if (Role == "admin" || Role == "Admin" || Role == "ADMIN")
                            {

                                btnlogin.Visible = true;
                                btnlogin.Text = "Admin";
                            }
                            else
                            {
                                btnlogin.Visible = false;
                            }
                        }
                    }



                }
                else
                {
                    btnaccount.Visible = false;
                    btncart.Visible = false;
                    btnlogout.Visible = false;  
                }

                BindData();
            }
        }
        private void BindData(string search = "", string filter = "")
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string query = "SELECT Brand_image, Product_name, MRP FROM main_product WHERE 1=1";
            if (!string.IsNullOrEmpty(search))
            {
                query += " AND (Product_name LIKE @Search OR MRP LIKE @Search)";
            }
            if (!string.IsNullOrEmpty(filter))
            {
                query += " AND Type_of_product = @Filter";
            }
            cmd = new SqlCommand(query, con);
            if (!string.IsNullOrEmpty(search))
            {
                cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
            }

            if (!string.IsNullOrEmpty(filter))
            {
                cmd.Parameters.AddWithValue("@Filter", filter);
            }
            DataTable dt = new DataTable();
            SqlDataAdapter daa;
            daa = new SqlDataAdapter(cmd);
            //con.Open();
            daa.Fill(dt);
            
            ds = new DataSet();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            int status = cmd.ExecuteNonQuery();

           

        }
        protected void SearchBar_TextChanged(object sender, EventArgs e)
        {
            // Handle text changed event for the SearchBar
            //BindData(txtSearch.Text, ddlFilter.SelectedValue);
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Handle click event for the SearchButton
            //BindData(txtSearch.Text, ddlFilter.SelectedValue);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Handle click event for Button1
            if (Session["name"] != null)
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                Response.Redirect("~/Admin/Admin.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void NotificationButton_Click(object sender, EventArgs e)
        {
            // Handle click event for NotificationButton
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {
            // Handle click event for ProfileButton
            Response.Redirect("~/Account.aspx");
        }

        protected void btncart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindData(txtSearch.Text, ddlFilter.SelectedValue);
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData(txtSearch.Text, ddlFilter.SelectedValue);
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void Product1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Product_page.aspx?nm=" );
        }
    }
}