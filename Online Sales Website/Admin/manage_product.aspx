<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_product.aspx.cs" Inherits="Online_Sales_Website.manage_product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mobilewala</title>
    <link rel="stylesheet" href="~/css/sites2.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Navbar -->
            <nav class="navbar">
                <div class="navbar-left">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home/Home.aspx">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Product/logo12.png" Height="90" Width="150" />
                </asp:LinkButton>
                
        </div>
        <div class="navbar-right">
                    <asp:Button ID="btnadmin" CssClass="nav-button" runat="server" Text="Admin" OnClick="ProfileButton_Clickadmin" />
            <asp:Button ID="btnorder" CssClass="nav-button" runat="server" Text="Manage User" OnClick="ProfileButton_Click" />
            <asp:Button ID="btnproduct" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="Manage Order" CausesValidation="False" />
            <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
        </div>
                </nav>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
        
        </div>

        <div class="button-container"><asp:Button ID="btnadduser" CssClass="majestic-button" runat="server" Text="Add New Product" OnClick="Button1_Click" /></div>
        <br />
        <div class="grid-container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="P_ID" HeaderText="id" />
                    <asp:BoundField DataField="Product_name" HeaderText="Name" />
                    <asp:BoundField DataField="MRP" HeaderText="MRP" />
                    <asp:BoundField DataField="Our_Prize" HeaderText="Our_Price" />
                    <asp:BoundField DataField="Discount" HeaderText="Discount%" />
                    <asp:BoundField DataField="Brand" HeaderText="Brand" />
                    <asp:TemplateField HeaderText="Brand Image">
                        <ItemTemplate>
                            <asp:Image ID="Image6" runat="server" Height="40" ImageUrl='<%# Eval("Brand_image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Type_of_product" HeaderText="Type_of_product" />
                    <asp:BoundField DataField="Detail" HeaderText="Detail" />
                    <asp:BoundField DataField="stock" HeaderText="Stock" />
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("P_ID", "{0}") %>' Height="40px" ImageUrl="~/Product/edit.png" OnClick="ImageButton1_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("P_ID", "{0}") %>' Height="40px" ImageUrl="~/Product/deletefile.png" OnClick="ImageButton2_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        &nbsp;<div>
        </div>
        <footer class="about-us">
            <h2>About Us</h2>
            <p>We are a team of passionate individuals committed to delivering the best services. Contact us via:</p>
            <ul>
                <li><a href="#">📧 Email</a></li>
                <li><a href="#">📞 Phone</a></li>
                <li><a href="#">🌐 Website</a></li>
            </ul>
        </footer>
    </form>
</body>
</html>
