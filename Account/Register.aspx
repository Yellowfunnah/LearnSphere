<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LearnSphere.Account.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Register</h2>

<asp:Label ID="lblMessage" runat="server"></asp:Label>

<br /><br />

Username:
<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

<br /><br />

Email:
<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

<br /><br />

Password:
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

<br /><br />

Role:
<asp:DropDownList ID="ddlRole" runat="server">
    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
    <asp:ListItem Text="Guest" Value="Guest"></asp:ListItem>
</asp:DropDownList>

<br /><br />

<asp:Button ID="btnRegister"
    runat="server"
    Text="Register"
    OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
