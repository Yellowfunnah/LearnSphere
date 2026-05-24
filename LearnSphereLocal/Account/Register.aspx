<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LearnSphereLocal.Account.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - LearnSphere</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
    <style type="text/css">
        .register-link { text-align: center; margin-top: 15px; font-size: 0.9rem; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="ls-navbar navbar navbar-expand-sm">
            <div class="container">
                <a class="navbar-brand" href="../Default.aspx">LearnSphere</a>
            </div>
        </nav>

        <main>
            <div class="auth-container">
                <div class="auth-logo">LearnSphere</div>
                <h2>Create Account</h2>

                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert d-block mb-3" />

                <div class="mb-3">
                    <label class="form-label">Full Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name" />
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Name is required." ValidationGroup="RegForm" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Email <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                        TextMode="Email" placeholder="Enter your email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Email is required." ValidationGroup="RegForm" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Password <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                        TextMode="Password" placeholder="Enter your password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Password is required." ValidationGroup="RegForm" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Role <span class="text-danger">*</span></label>
                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                        <asp:ListItem Value="Student">Student</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register"
                    CssClass="btn btn-dark w-100" OnClick="btnRegister_Click"
                    ValidationGroup="RegForm" OnClientClick="return validateRegister();" />

                <div class="register-link">
                    Already have an account? <a href="Login.aspx">Login here</a>
                </div>
            </div>
        </main>

        <footer class="ls-footer">
            <p style="margin:0;">&copy; <%= DateTime.Now.Year %> LearnSphere &mdash; Asia Pacific University</p>
        </footer>

    </form>

    <script type="text/javascript">
        function validateRegister() {
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
            if (password.length < 6) {
                alert('Password must be at least 6 characters.');
                return false;
            }
            return true;
        }
    </script>

    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
