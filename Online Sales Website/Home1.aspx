<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="Home1.aspx.cs" Inherits="Online_Sales_Website.Home11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-bar">
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
    <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
        <asp:ListItem Value="">All</asp:ListItem>
        <asp:ListItem Value="Mobiles">Category 1</asp:ListItem>
        <asp:ListItem Value="Category2">Category 2</asp:ListItem>
        
    </asp:DropDownList>
</div>
    <div class="cards-container">
 <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

     <ItemTemplate>
         <div class="card">
             <asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("Brand_image") %>' OnClick="Product1_Click" />
             <h3><asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label></h3>
             <p><asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label></p>
         </div>
     </ItemTemplate>
 </asp:Repeater>
    </div>
</asp:Content>
