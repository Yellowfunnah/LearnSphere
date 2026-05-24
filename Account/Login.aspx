<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAPPAssignment.Account.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }

        .login-box {
            width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #28a745;
            border: none;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1e7e34;
        }

        .message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-box">

            <h2>Login</h2>

            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="input-box"
                placeholder="Email"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input-box"
                TextMode="Password"
                placeholder="Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server"
                Text="Login"
                CssClass="btn"
                OnClick="btnLogin_Click" />

            <br /><br />

            Don't have an account?
            <asp:HyperLink ID="hlRegister" runat="server"
                NavigateUrl="~/Account/Register.aspx"
                Text="Register here"></asp:HyperLink>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"></asp:Label>

        </div>
    </form>
</body>
</html>