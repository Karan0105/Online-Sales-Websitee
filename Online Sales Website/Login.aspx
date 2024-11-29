<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Sales_Website.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login Page</title>
<link rel="stylesheet" href="~/css/StyleSheet Login.css"/>
    
</head>
<body>
    <div class="container">
        <div class="login-section">
            <div class="login-form">
                <h1>Login</h1>

                <form id="form1" runat="server">

                    <div class="input-group">
                        <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername">Username</asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" />
                    </div>
                    <div class="input-group">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" />
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="submit-button" OnClick="Submit_Click" />


                    <div class="forgot-password">
                        <a href="#">Forgot your password?</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="oauth-section">
                <h2>Or login with:</h2>
                <!-- OAuth Button, typically handled with client-side integration -->
                <a href="https://accounts.google.com/o/oauth2/auth" class="google-oauth-button">
                    <img src="Product//channels4_profile.jpg" alt="Google Logo" height="50" class="google-logo"/>
                    Google
                </a>
            </div>
    </div>
    
<p>
    &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    
</body>
</html>


<p>
    &nbsp;</p>


</>
<p>
    &nbsp;</p>
