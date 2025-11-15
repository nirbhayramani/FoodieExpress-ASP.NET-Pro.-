<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Modern Login Form Section -->
    <section class="modern-login-section">
        <div class="login-background">
            <div class="login-background-overlay">
            </div>
        </div>
        <div class="login-wrapper">
            <div class="login-container">
                <div class="login-form-card">
                    <div class="login-form-header">
                        <div class="logo-circle">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <h1>Welcome Back</h1>
                        <p>
                            Sign in to continue your culinary journey
                        </p>
                    </div>
                    <form id="loginForm" class="modern-login-form">
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <%--<input type="email" id="email" name="email" placeholder="Email address" required>--%>
                                <asp:TextBox ID="txteml" runat="server" placeholder="Email address"></asp:TextBox>
                                <div class="input-focus-border">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-lock"></i>
                                </div>
                                <%--<input type="password" id="password" name="password" placeholder="Password" required>--%>
                                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <%--<button type="button" class="password-toggle" onclick="togglePassword('password')">
                                <i class="fas fa-eye"></i>
                            </button>--%>
                                <div class="input-focus-border">
                                </div>
                            </div>
                        </div>
                        <center>
                            <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="False" style="color:red"></asp:Label>
                        </center>
                        <div class="form-options">
                            <label class="modern-checkbox">
                                <input type="checkbox" name="remember" id="remember">
                                <span class="checkmark"></span><span class="label-text">Remember me</span>
                            </label>
                            &nbsp;<a href="#" class="forgot-link">Forgot password?</a>

                        </div>
                        <%--<button type="submit" class="modern-login-btn">
                        <span class="btn-text">Sign In</span>
                        <div class="btn-icon">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </button>--%>
                        <asp:Button ID="btnlogin" runat="server" Text="Sign In" CssClass="modern-login-btn btn-text" OnClick="btnlogin_Click" />
                    </form>
                    <%--<div class="divider">
                        <span>or continue with</span>
                    </div>--%>
                    <%--<div class="social-login">
                        <button class="social-btn google-btn">
                            <i class="fab fa-google"></i><span>Google</span>
                        </button>
                        <button class="social-btn facebook-btn">
                            <i class="fab fa-facebook-f"></i><span>Facebook</span>
                        </button>
                    </div>--%>
                    <div class="login-footer">
                        <p>
                            Don't have an account? <a href="register.aspx">Sign up</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="login.js"></script>
</asp:Content>

