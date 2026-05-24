<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="LearnSphere.Account.ForgotPassword" %>
<!DOCTYPE html><html><head runat="server"><title>Forgot Password</title><link href="../CSS/style.css" rel="stylesheet" /></head>
<body><form runat="server"><div class="auth-card">
<h2>Reset Password</h2>
<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Email"></asp:TextBox>
<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="New Password"></asp:TextBox>
<asp:Button ID="btnReset" runat="server" Text="Reset Password" CssClass="main-btn" OnClick="btnReset_Click"/>
<asp:Label ID="lblMessage" runat="server"></asp:Label>
</div></form></body></html>