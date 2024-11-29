<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_order.aspx.cs" Inherits="Online_Sales_Website.manage_order" %>

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
                    <asp:Button ID="btnproduct" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="Manage Product" CausesValidation="False" />
                    <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
            </nav>
        </div>

        <br />
        <div class="grid-container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="order_id" HeaderText="Order ID" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" />
                    <asp:BoundField DataField="user_name" HeaderText="Name" />
                    <asp:BoundField DataField="product_id" HeaderText="Product ID" />
                    <asp:BoundField DataField="email_address" HeaderText="Email" />
                    <asp:BoundField DataField="mobile_no" HeaderText="Contact" />
                    <asp:BoundField DataField="payment_type" HeaderText="Payment Type" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("order_id", "{0}") %>' Height="40px" ImageUrl="~/Product/deletefile.png" OnClick="ImageButton2_Click" />
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
