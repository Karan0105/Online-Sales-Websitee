﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Sales_Website
{
    public partial class manage_order : System.Web.UI.Page
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
                //string category = ddlcategory.SelectedValue.ToString();
                string q = "select * from main_order ";
                cmd = new SqlCommand(q, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                int status = cmd.ExecuteNonQuery();

                da.Fill(ds, "main_order");
                if (ds.Tables["main_order"].Rows.Count > 0)
                {

                    GridView1.DataSource = ds.Tables["main_order"];
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
            Response.Redirect("~/Admin/manage_user.aspx");
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

       

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn;
            imgbtn = (ImageButton)sender;

            string id = imgbtn.CommandArgument.ToString();
            string q = "delete from main_order where order_id = '" + id + "'";
            if (con.State == ConnectionState.Closed)
                con.Open();

            cmd = new SqlCommand(q, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("~/Admin/manage_order.aspx");



            }
        }

        protected void ProfileButton_Clickadmin(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Admin.aspx");
        }
    }
}