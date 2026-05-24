<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LearnSphere.Account.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="../CSS/style.css" rel="stylesheet" />

</head>

<body class="auth-page">

    <form id="form1" runat="server">

        <div class="auth-card">

            <h1 class="brand">LearnSphere</h1>

            <h2>Welcome Back</h2>

            <p class="subtitle">
                Login to continue learning
            </p>

            <asp:TextBox ID="txtLogin" runat="server"
                CssClass="input-box"
                placeholder="Username or Email"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input-box"
                TextMode="Password"
                placeholder="Password"></asp:TextBox>

            <div class="remember-box">

                <asp:CheckBox ID="chkRememberMe" runat="server" />

                <span>Remember Me</span>

            </div>

            <asp:Button ID="btnLogin" runat="server"
                Text="Login"
                CssClass="main-btn"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"></asp:Label>

            <p class="switch-link">

                <asp:HyperLink ID="hlForgot" runat="server"
                    NavigateUrl="~/Account/ForgotPassword.aspx"
                    Text="Forgot Password?"></asp:HyperLink>

            </p>

            <p class="switch-link">
                Don't have an account?

                <asp:HyperLink ID="hlRegister" runat="server"
                    NavigateUrl="~/Account/Register.aspx"
                    Text="Register here"></asp:HyperLink>
            </p>

        </div>

    </form>

</body>
</html>