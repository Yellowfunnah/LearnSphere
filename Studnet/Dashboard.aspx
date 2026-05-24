<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LearnSphere.Studnet.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Dashboard</h2>

Welcome,
<asp:Label ID="lblName" runat="server"></asp:Label>

<br /><br />

Role:
<asp:Label ID="lblRole" runat="server"></asp:Label>

<br /><br />

<asp:Button ID="btnLogout"
    runat="server"
    Text="Logout"
    OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
