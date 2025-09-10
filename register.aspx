<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <p>
                            Join our community and start your culinary adventure
                        </p>
                    </div>
                    <form id="registerForm" class="modern-register-form">
                        <div class="form-row">
                            <div class="form-group">
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <%--<input type="text" id="firstName" name="firstName" placeholder="First name" required>--%>
                                    <asp:TextBox ID="txtfnm" runat="server" placeholder="First name"></asp:TextBox>
                                    <div class="input-focus-border">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <%--<input type="text" id="lastName" name="lastName" placeholder="Last name" required>--%>
                                    <asp:TextBox ID="txtlnm" runat="server" placeholder="Last name"></asp:TextBox>
                                    <div class="input-focus-border">
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                    <i class="fas fa-phone"></i>
                                </div>
                                <%--<input type="tel" id="phone" name="phone" placeholder="Phone number" required>--%>
                                <asp:TextBox ID="txttel" runat="server" placeholder="Phone number"></asp:TextBox>
                                <div class="input-focus-border">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-wrapper">
                                <div class="input-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <%--<input type="text" id="address" name="address" placeholder="Delivery address" required>--%>
                                <asp:TextBox ID="txtadd" runat="server" placeholder="Delivery address"></asp:TextBox>
                                <div class="input-focus-border">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <i class="fas fa-lock"></i>
                                    </div>
                                    <%--<input type="password" id="password" name="password" placeholder="Password" required>--%>
                                    <asp:TextBox ID="txtpass" runat="server" placeholder="Password" Style="width: 365px;"></asp:TextBox>
                                    <%--<button type="button" class="password-toggle" onclick="togglePassword('password')">
                                    <i class="fas fa-eye"></i>
                                </button>--%>
                                    <div class="input-focus-border">
                                    </div>
                                </div>
                                <%--<div class="password-strength">
                                <div class="strength-bar">
                                    <div class="strength-fill" id="strengthFill">
                                    </div>
                                </div>
                                <span class="strength-text" id="strengthText">Password strength</span>
                            </div>
                        </div>--%>
                                <div class="form-group">
                                    <div class="input-wrapper">
                                        <div class="input-icon">
                                            <i class="fas fa-lock"></i>
                                        </div>
                                        <%--<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm password" required>--%>
                                        <asp:TextBox ID="txtcon" runat="server" placeholder="Confirm password" Style="width: 365px;"></asp:TextBox>
                                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword')">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <div class="input-focus-border">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--                                    <div class="form-group">
                        <label class="preferences-label">
                        Food Preferences</label>
                        <div class="preferences-grid">
                            <label class="modern-checkbox">
                            <input type="checkbox" name="vegetarian" value="vegetarian"> <span class="checkmark"></span><span class="label-text">Vegetarian</span>
                            </label>
                            &nbsp;<label class="modern-checkbox"><input type="checkbox" name="vegan" value="vegan"> <span class="checkmark"></span><span class="label-text">Vegan</span>
                            </label>
                            &nbsp;<label class="modern-checkbox"><input type="checkbox" name="glutenFree" value="gluten-free"> <span class="checkmark"></span><span class="label-text">Gluten-Free</span>
                            </label>
                            &nbsp;<label class="modern-checkbox"><input type="checkbox" name="spicy" value="spicy"> <span class="checkmark"></span><span class="label-text">Spicy Food Lover</span>
                            </label>
                            &nbsp;</div>
                    </div>--%>
                            <br />
                            <div class="form-options">
                                <label class="modern-checkbox terms-checkbox" id="termsLabel">
                                    <input type="checkbox" name="terms" id="terms" required>
                                    <span class="checkmark"></span><span class="label-text"><strong>I agree to the <a href="#" class="terms-link">Terms & Conditions</a> and <a href="#" class="terms-link">Privacy Policy</a></strong> <span class="required-indicator">*</span> </span>
                                </label>
                                &nbsp;&nbsp;<label class="modern-checkbox"><input type="checkbox" name="newsletter" id="newsletter">
                                    <span class="checkmark"></span><span class="label-text">Subscribe to our newsletter for updates and offers</span>
                                </label>
                                &nbsp;&nbsp;
                            </div>
                            <br />
                            <%--<button type="submit" class="modern-register-btn">
                            <span class="btn-text">Create Account</span>
                            <div class="btn-icon">
                                <i class="fas fa-arrow-right"></i>
                            </div>
                        </button>--%>
                            <asp:Button ID="btncre" runat="server" Text="Create Account" CssClass="modern-register-btn btn-text" OnClick="btncre_Click" />
                    </form>
                    <br />
                    <div class="divider">
                        <span>or sign up with</span>
                    </div>
                    <br />
                    <div class="social-register">
                        <button class="social-btn google-btn">
                            <i class="fab fa-google"></i><span>Google</span>
                        </button>
                        <button class="social-btn facebook-btn">
                            <i class="fab fa-facebook-f"></i><span>Facebook</span>
                        </button>
                    </div>
                    <br />
                    <div class="register-footer">
                        <p>
                            Already have an account? <a href="login.aspx">Sign in</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <link href="register.css" rel="stylesheet" />
    <script src="register.js"></script>
</asp:Content>

