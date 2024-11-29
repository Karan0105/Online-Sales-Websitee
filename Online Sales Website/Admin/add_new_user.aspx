<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_new_user.aspx.cs" Inherits="Online_Sales_Website.add_new_user" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mobilewala
        
    
    </title>
    <link rel="stylesheet" href="~/css/sites2.css"/>


    <style type="text/css">
        .nav-button {
            height: 29px;
        }
    </style>


</head>
<body>
   <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar">
    <div class="navbar-left">
       
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home/Home.aspx">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Product/logo12.png" Height="90" Width="150"/>
    </asp:LinkButton>
        
    </div>
    <div class="navbar-right">
        <asp:Button ID="btnlogin" CssClass="nav-button" runat="server" Text="Manage User" OnClick="Button1_Click" CausesValidation="False" />
        <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
</nav>


        

        <!-- Cards Section -->
        <div class="card-container">
            <div class="card">
                <label for="textbox1" class="card-label">Name</label>
                <asp:TextBox ID="txtname" runat="server" CssClass="card-textbox" />
            </div>
            <div class="card">
                <label for="textbox2" class="card-label">Password</label>
                <asp:TextBox ID="txtpwd" runat="server" CssClass="card-textbox" />
            </div>
            <div class="card">
                <label for="textbox3" class="card-label">Role</label>
                <asp:DropDownList ID="ddlrole" runat="server" AutoPostBack="True" CssClass="card-textbox">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>User</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="card">
                <label for="textbox4" class="card-label">Address</label>
                <asp:TextBox ID="txtadd" runat="server" CssClass="card-textbox" />
            </div>
            <div class="card">
                <label for="textbox5" class="card-label">Mobile NO</label>
                <asp:TextBox ID="txtmobile" runat="server" CssClass="card-textbox" />
            </div>
            <div class="card">
                <label for="textbox5" class="card-label">Email</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="card-textbox" />
</div>
        </div>
       <div class="button-container">
            <asp:Button ID="submitButton" runat="server" CssClass="majestic-button" Text="Submit" OnClick="submitButton_Click" />
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


        






