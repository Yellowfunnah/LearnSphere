<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LearnSphere.Account.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>

<asp:Label ID="lblMessage" runat="server"></asp:Label>

<br /><br />

Email:
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

<br /><br />

Password:
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

<br /><br />

<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
