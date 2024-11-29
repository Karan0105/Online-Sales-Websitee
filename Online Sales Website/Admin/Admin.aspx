<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Online_Sales_Website.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Mobilewala</title>
    <link rel="stylesheet" href="~/css/sites.css" />
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
                    <!--<asp:TextBox ID="SearchBar" CssClass="search-bar" runat="server" Placeholder="Search..."
                        OnTextChanged="SearchBar_TextChanged" AutoPostBack="True"></asp:TextBox>-->
                </div>
                <div class="navbar-right">
                    <asp:Button ID="btnuser" CssClass="nav-button" runat="server" Text="Manage User" OnClick="Button1_Click" />
                    <asp:Button ID="btnorder" CssClass="nav-button" runat="server" Text="Manage Order" OnClick="ProfileButton_Click" />
                    <asp:Button ID="btnproduct" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="Manage Product" />
                    <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
            </nav>
        </div>
        <div>
            <div class="content">
                <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome Admin" CssClass="welcome-label" />
            </div>
        </div>
        <footer class="about-us">
            <h2>About Us</h2>
            <p>MobileWala | Vadodara
Mobile Phone Shop
Just The Right Place To Shop 👇
▪️Multiple Brand Mobile Store & HomeAppliances
▪️Best Deals On Smartphones | Gadgets
▪️0 Downpayment & Easy EMI
www.mobilewalavadodara.com
                We are a team of passionate individuals committed to delivering the best services. Contact us via:</p>
            <ul>
                <li><a href="#">📧 Email</a></li>
                <li><a href="#">📞 Phone</a></li>
                <li><a href="#">🌐 Website</a></li>
            </ul>
        </footer>
    </form>
</body>
</html>
