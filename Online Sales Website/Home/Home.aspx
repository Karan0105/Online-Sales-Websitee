<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Online_Sales_Website.Home.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mobilewala
        
    
    </title>
    <style>
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 10px;
        }

        .card {
            width: 300px;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            flex-shrink: 0;
        }

        .card:hover {
            background-color: #f0f0f0;
            transform: scale(1.05);
        }

        .card img {
            width: 100%;
            height: auto;
        }

        .search-bar {
            margin-bottom: 20px;
            text-align: center;
        }
    </style>

    <link rel="stylesheet" href="~/css/sites.css"/>


</head>
<body>
   <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar">
    <div class="navbar-left">
        
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home/Home.aspx">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Product/logo12.png" Height="90" Width="150"/>
    </asp:LinkButton>
       <!-- <asp:TextBox ID="SearchBar" CssClass="search-bar" runat="server" Placeholder="Search..."
            OnTextChanged="SearchBar_TextChanged" AutoPostBack="True"></asp:TextBox> -->
        
    </div>
    <div class="navbar-right">
        <asp:Button ID="btnlogin" CssClass="nav-button" runat="server" Text="Login" OnClick="Button1_Click" />
        <asp:Button ID="btnaccount" CssClass="nav-button" runat="server" Text="Account" OnClick="ProfileButton_Click" />
        <asp:Button ID="btncart" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="🛒Cart" />
        <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
</nav>


        <!-- Image Links -->
        <!--<section class="image-links">
            <a href="#" class="image-link">
                <asp:Image ID="Image1"  AlternateText="Image 1" runat="server" height="250"/>
                <asp:Label ID="LinkText1" runat="server" Text="Link Text 1"></asp:Label>
            </a>
            <a href="#" class="image-link">
                <asp:Image ID="Image2" ImageUrl="image2.jpg" AlternateText="Image 2" runat="server" />
                <asp:Label ID="LinkText2" runat="server" Text="Link Text 2"></asp:Label>
            </a>
            <a href="#" class="image-link">
                <asp:Image ID="Image3" ImageUrl="image3.jpg" AlternateText="Image 3" runat="server" />
                <asp:Label ID="LinkText3" runat="server" Text="Link Text 3"></asp:Label>
            </a>
        </section>-->

        <!-- Cards Section -->
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
        <!-- About Us -->
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


        






