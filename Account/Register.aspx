<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LearnSphere.Account.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <link href="../CSS/style.css" rel="stylesheet" />
</head>

<body class="auth-page">

    <form id="form1" runat="server">

        <div class="auth-card">

            <h1 class="brand">LearnSphere</h1>

            <h2>Create Account</h2>

            <p class="subtitle">Start your online learning journey</p>

            <asp:TextBox ID="txtFullName" runat="server"
                CssClass="input-box"
                placeholder="Full Name"></asp:TextBox>

            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="input-box"
                placeholder="Email"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input-box"
                TextMode="Password"
                placeholder="Password"></asp:TextBox>

            <asp:TextBox ID="txtConfirmPassword" runat="server"
                CssClass="input-box"
                TextMode="Password"
                placeholder="Confirm Password"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server"
                Text="Register"
                CssClass="main-btn"
                OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"></asp:Label>

            <p class="switch-link">
                Already have an account?

                <asp:HyperLink ID="hlLogin" runat="server"
                    NavigateUrl="~/Account/Login.aspx"
                    Text="Login here"></asp:HyperLink>
            </p>

        </div>

    </form>

</body>
</html>