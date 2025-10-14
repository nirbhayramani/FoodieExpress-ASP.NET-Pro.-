<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Modern Register Form Section -->
    <section class="modern-register-section">
        <div class="register-background">
            <div class="register-background-overlay">
            </div>
        </div>
        <div class="register-wrapper">
            <div class="register-container">
                <div class="register-form-card">
                    <div class="register-form-header">
                        <div class="logo-circle">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h1>Create Account</h1>
                        <p>Join our community and start your culinary adventure</p>
                    </div>
                    <form id="registerForm" class="modern-register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <asp:TextBox ID="txtfnm" runat="server" placeholder="First name" CssClass="form-input"></asp:TextBox>
                                    <div class="input-focus-border"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <asp:TextBox ID="txtlnm" runat="server" placeholder="Last name" CssClass="form-input"></asp:TextBox>
                                    <div class="input-focus-border"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <asp:TextBox ID="txteml" runat="server" placeholder="Email address" CssClass="form-input"></asp:TextBox>
                                <div class="input-focus-border"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <asp:TextBox ID="txttel" runat="server" placeholder="Phone number" CssClass="form-input"></asp:TextBox>
                                <div class="input-focus-border"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <asp:TextBox ID="txtadd" runat="server" placeholder="Delivery address" CssClass="form-input"></asp:TextBox>
                                <div class="input-focus-border"></div>
                            </div>
                        </div>

                        <!-- Password Field with Toggle -->
                        <div class="form-group">
                            <div class="input-wrapper password-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-lock"></i>
                                </div>
                                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" placeholder="Password" CssClass="form-input password-input"></asp:TextBox>
                                <button type="button" class="password-toggle" id="passwordToggle">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <div class="input-focus-border"></div>
                            </div>
                            <div class="password-strength">
                                <div class="strength-bar">
                                    <div class="strength-fill" id="strengthFill"></div>
                                </div>
                                <span class="strength-text" id="strengthText">Password strength</span>
                            </div>
                        </div>

                        <!-- Confirm Password Field with Toggle -->
                        <div class="form-group">
                            <div class="input-wrapper password-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-lock"></i>
                                </div>
                                <asp:TextBox ID="txtcon" runat="server" TextMode="Password" placeholder="Confirm password" CssClass="form-input password-input"></asp:TextBox>
                                <button type="button" class="password-toggle" id="confirmPasswordToggle">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <div class="input-focus-border"></div>
                            </div>
                        </div>

                        <div class="form-options">
                            <label class="modern-checkbox terms-checkbox" id="termsLabel">
                                <input type="checkbox" name="terms" id="terms" required>
                                <span class="checkmark"></span>
                                <span class="label-text">
                                    <strong>I agree to the <a href="#" class="terms-link">Terms & Conditions</a> and <a href="#" class="terms-link">Privacy Policy</a></strong>
                                    <span class="required-indicator">*</span>
                                </span>
                            </label>
                            <label class="modern-checkbox">
                                <input type="checkbox" name="newsletter" id="newsletter">
                                <span class="checkmark"></span>
                                <span class="label-text">Subscribe to our newsletter for updates and offers</span>
                            </label>
                        </div>

                        <asp:Button ID="btncre" runat="server" Text="Create Account" CssClass="modern-register-btn" OnClick="btncre_Click" />
                    </form>

                    <div class="divider">
                        <span>or sign up with</span>
                    </div>

                    <div class="social-register">
                        <button type="button" class="social-btn google-btn">
                            <i class="fab fa-google"></i><span>Google</span>
                        </button>
                        <button type="button" class="social-btn facebook-btn">
                            <i class="fab fa-facebook-f"></i><span>Facebook</span>
                        </button>
                    </div>

                    <div class="register-footer">
                        <p>Already have an account? <a href="login.aspx">Sign in</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="register.js"></script>
</asp:Content>
