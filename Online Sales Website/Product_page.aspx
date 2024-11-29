<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product_page.aspx.cs" Inherits="Online_Sales_Website.Product_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Product Page</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            justify-content: space-between;
            margin: 50px auto;
            max-width: 1200px;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .product-image img {
            max-width: 80%;
            height: auto;
            margin-bottom: 20px;
        }
        .product-buttons {
            margin-top: 20px;
        }
        .product-buttons button {
            padding: 10px 20px;
            font-size: 1em;
            margin-right: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        .product-buttons button:hover {
            background-color: #0056b3;
        }
        .product-description {
            width: 50%;
            padding: 20px;
        }
        .product-description h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        .product-description p {
            font-size: 1.2em;
            color: #555;
        }
        .product-options {
            margin-top: 20px;
        }
        .product-options select {
            padding: 10px;
            font-size: 1em;
            margin-right: 20px;
        }
        .product-price {
            font-size: 1.5em;
            color: #333;
            margin-top: 10px;
        }
    </style>
    <link rel="stylesheet" href="~/css/sites.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    <!-- Navbar -->
        <nav class="navbar">
    <div class="navbar-left">
        
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home/Home.aspx">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Product/logo12.png" Height="90" Width="150"/>
    </asp:LinkButton>
       
    </div>
    <div class="navbar-right">
        <asp:Button ID="btnlogin" CssClass="nav-button" runat="server" Text="Login" OnClick="Button1_Click" />
        <asp:Button ID="btnaccount" CssClass="nav-button" runat="server" Text="Account" OnClick="ProfileButton_Click" />
        <asp:Button ID="btncart" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="🛒Cart" />
        <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
</nav>
        </div>
        <div class="container">
            <!-- Left side: Product image and buttons -->
            <div class="product-image">
                <asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("Brand_image") %>'  />
                    <div class="product-buttons">
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click1" />
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary" />
                </div>
            </div>

            <!-- Right side: Product description, quantity, and price -->
            <div class="product-description">
                <h1>Product Title</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi.</p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </p>
                <div class="product-options">
                    <label for="quantity">Quantity:</label>
                    <asp:DropDownList ID="ddlQuantity" runat="server" AutoPostBack="True">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="product-price">
                    Price: $<asp:Label ID="lblPrice" runat="server" ></asp:Label>
                </div>
            </div>
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
