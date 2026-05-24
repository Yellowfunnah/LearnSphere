<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAPPAssignment.Account.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }

        .register-box {
            width: 400px;
            margin: 80px auto;
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
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
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

        <div class="register-box">

            <h2>Register</h2>

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
                CssClass="btn"
                OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message"></asp:Label>
            <br /><br />

            Already have an account?
            <asp:HyperLink ID="hlLogin" runat="server"
                NavigateUrl="~/Account/Login.aspx"
                Text="Login here"></asp:HyperLink>
                    </div>

    </form>
</body>
</html>