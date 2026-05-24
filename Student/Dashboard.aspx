<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LearnSphere.Studnet.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }

        .dashboard-box {
            width: 500px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .info {
            margin-top: 20px;
            font-size: 18px;
        }

        .btn {
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #dc3545;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #b02a37;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="dashboard-box">

            <h2>Student Dashboard</h2>

            <div class="info">
                Welcome,
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </div>

            <div class="info">
                Role:
                <asp:Label ID="lblRole" runat="server"></asp:Label>
            </div>
            <br />

            <asp:Button ID="btnCourses" runat="server"
            Text="View Courses"
            CssClass="course-btn"
            PostBackUrl="~/Student/Courses.aspx" />

            <br /><br />

            <asp:Button ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="btn"
                PostBackUrl="~/Account/Logout.aspx" />

        </div>

    </form>
</body>
</html>