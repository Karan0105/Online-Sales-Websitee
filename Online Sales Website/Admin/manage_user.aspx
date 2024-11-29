<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_user.aspx.cs" Inherits="Online_Sales_Website.manage_user" %>


<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
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
                    <asp:Button ID="btnorder" CssClass="nav-button" runat="server" Text="Manage Order" OnClick="ProfileButton_Click" />
                    <asp:Button ID="btnproduct" CssClass="nav-button" runat="server" OnClick="btncart_Click" Text="Manage Product" CausesValidation="False" />
                    <asp:Button ID="btnlogout" CssClass="nav-button" runat="server" OnClick="btnlogout_Click" Text="Logout" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [cart_product]"></asp:SqlDataSource>
            </nav>
        </div>

        <div class="button-container"><asp:Button ID="btnadduser" runat="server" CssClass="majestic-button" Text="Add New User" OnClick="Button1_Click" />
        </div><br />
        <div class="grid-container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="password" HeaderText="Password" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="role" HeaderText="Role" />
                    <asp:BoundField DataField="mobile_no" HeaderText="mobile_no" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id", "{0}") %>' Height="40px" ImageUrl="~/Product/edit.png" OnClick="ImageButton1_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("id", "{0}") %>' Height="40px" ImageUrl="~/Product/deletefile.png" OnClick="ImageButton2_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        &nbsp;<div>
            <!--    <div class="content">
            <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome Admin" CssClass="welcome-label" />
        </div>-->
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
