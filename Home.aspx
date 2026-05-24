<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>LearnSphere</title>
<link href="CSS/style.css" rel="stylesheet" />
<script>
function setTheme(t){localStorage.setItem('theme',t);document.body.className=t;}
window.onload=function(){document.body.className=localStorage.getItem('theme')||'theme-blue';}
let score=0;
function clickBook(){score++;document.getElementById('score').innerText=score;}
</script>
</head>
<body class="theme-blue">
<form runat="server">
<div class="hero">
<h1>LearnSphere</h1>
<p>Start Learning Today</p>
<div class="theme-buttons">
<button type="button" onclick="setTheme('theme-blue')">Blue</button>
<button type="button" onclick="setTheme('theme-purple')">Purple</button>
<button type="button" onclick="setTheme('theme-green')">Green</button>
<button type="button" onclick="setTheme('theme-dark')">Dark</button>
</div>
<a href="Account/Login.aspx" class="main-btn">Login</a>
<a href="Account/Register.aspx" class="main-btn">Register</a>
</div>
<div class="section">
<h2>Why LearnSphere?</h2>
<div class="cards">
<div class="card">Interactive Learning</div>
<div class="card">Track Progress</div>
<div class="card">Modern Experience</div>
</div>
</div>
<div class="section">
<h2>Mini Game</h2>
<p>Catch Knowledge Points!</p>
<button type="button" class="main-btn" onclick="clickBook()">📘 Study Click</button>
<h3>Score: <span id="score">0</span></h3>
</div>
</form>
</body>
</html>