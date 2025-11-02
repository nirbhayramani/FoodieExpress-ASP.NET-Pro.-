<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin-login.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Login - FoodieExpress</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="admin-styles.css">
        <link rel="stylesheet" href="login-styles.css">
    </head>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <body>
        <section class="admin-login-hero">
            <div class="admin-login-card">
                <div class="admin-login-header">
                    <div class="brand"><i class="fas fa-utensils"></i>FoodieExpress Admin</div>
                    <h1>Sign in to Dashboard</h1>
                    <small class="muted">Use your registered admin credentials</small>
                </div>
                <div class="admin-login-body">
                    <form id="adminLoginForm">
                        <div class="field">
                            <label>Email</label>
                            <%--<input type="email" id="adminEmail" required>--%>
                            <asp:TextBox ID="txteml" runat="server" Style="width: 100%; padding: 12px 14px; border: 2px solid var(--admin-border); border-radius: var(--admin-border-radius-sm); background: var(--admin-white); color: var(--admin-text-color); font-size: 0.95rem; outline: none; transition: var(--admin-transition);"></asp:TextBox>
                        </div>
                        <div class="field">
                            <label>Password</label>
                            <%--<input type="password" id="adminPassword" required>--%>
                            <asp:TextBox ID="txtpwd" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                        <div class="actions">
                            <%--<button type="submit" class="btn btn-primary">Login</button>--%>
                            <asp:Button ID="btnlogin" runat="server" Text="Login" class="btn btn-primary" OnClick="btnlogin_Click" />
                            <a href="../login.aspx" class="btn btn-outline btn-sm">User Login</a>
                        </div>
                    </form>
                    <asp:Label ID="lblmsg" runat="server" Text="Label" style="color:red;" Visible="False"></asp:Label>
                </div>
                <div class="admin-login-footer">
                    <small class="muted">If you forgot your password. Please contact your system administrator.</small>
                </div>
            </div>
        </section>

        <script src="admin-script.js"></script>
    </body>
    </html>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>

