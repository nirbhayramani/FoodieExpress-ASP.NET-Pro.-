<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="change-password.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Hero -->
    <section class="password-hero">
        <div class="container">
            <h1 class="password-title">Change Password</h1>
        </div>
    </section>

    <!-- Change Password Form -->
    <section class="password-section">
        <div class="container" style="display: grid; grid-template-columns: 260px 1fr; gap: 20px; align-items: start;">
            <aside class="review-card" style="position: sticky; top: 90px; padding: 0; overflow: hidden;">
                <div style="padding: 14px 16px; border-bottom: 1px solid var(--border-color-light); font-weight: 700; color: var(--text-color);">My Panel</div>
                <nav style="display: flex; flex-direction: column;">
                    <a href="my-profile.aspx" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">My Profile</a>
                    <a href="order-history.aspx" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">Order History</a>
                    <a href="my-reviews.aspx" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">My Reviews</a>
                    <a href="reviews.aspx" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">Write a Review</a>
                </nav>
            </aside>
            <div class="password-card">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <i class="fas fa-key"></i>
                    </div>
                    <%--<div class="logo-circle">
                        <i class="fas fa-key"></i>
                    </div>--%>
                    <div class="profile-info">
                        <h2>Change Password</h2>
                        <p>Update your password to keep your account secure</p>
                    </div>
                </div>
                <form id="changePasswordForm">
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <%--<input type="password" id="currentPassword" required>--%>
                        <asp:TextBox ID="txtCurrPwd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RVCurrPwd" runat="server" ErrorMessage="Please enter your current password." Style="color: red;" ControlToValidate="txtCurrPwd"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <%--<input type="password" id="newPassword" required>--%>
                        <asp:TextBox ID="txtNewPwd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RVNewPwd" runat="server" ErrorMessage="Please enter a valid password." Style="color: red;" ControlToValidate="txtNewPwd"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <%--<input type="password" id="confirmPassword" required>--%>
                        <asp:TextBox ID="txtConfirmPwd" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RVConfirmPwd" runat="server" ErrorMessage="Please confirm your new password." Style="color: red;" ControlToValidate="txtConfirmPwd"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="CVPwd" runat="server" ErrorMessage="Password don't match." Style="color: red;" ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
                    </div>
                    <div class="password-requirements">
                        <h4>Password Requirements</h4>
                        <ul>
                            <li>At least 8 characters long</li>
                            <li>Include at least one uppercase letter</li>
                            <li>Include at least one lowercase letter</li>
                            <li>Include at least one number</li>
                            <li>Include at least one special character</li>
                        </ul>
                    </div>
                    <div class="form-group" style="margin-top: 50px;">
                        <%--<button type="button" id="savePasswordBtn" class="btn-save">Update Password</button>--%>
                        <%--<asp:Button ID="btnSavePwd" runat="server" Text="Update Password" CssClass="btn-save" OnClick="btnSavePwd_Click" />--%>
                        <asp:LinkButton ID="lnkSvPwd" runat="server" CssClass="btn-save" OnClick="btnSavePwd_Click">Update Password</asp:LinkButton>
                        <a href="profile.html" class="btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <style>
        .password-hero {
            padding: 70px 0;
            background: linear-gradient(135deg, #ff8c42 0%, #ff6b35 50%, #e74c3c 100%);
            color: #fff;
        }

            .password-hero .container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding-top: 90px;
            }

        .password-title {
            font-size: 2rem;
            font-weight: 700;
        }

        .password-section {
            padding: 60px 0;
            background: var(--bg-secondary);
        }

        .review-card {
            background: var(--bg-card);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 16px;
            margin-bottom: 16px;
        }

        .password-card {
            background: var(--bg-card);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            margin-bottom: 20px;
            max-width: 700px;
/*            margin: 0 auto;*/
        }

        .form-group {
            margin-bottom: 16px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
                color: var(--text-color);
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid var(--border-color);
                border-radius: 6px;
            }

        .btn-save {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-cancel {
            background: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            margin-left: 10px;
        }

        .password-requirements {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 6px;
            border-left: 4px solid #4a6fa5;
        }

            .password-requirements h4 {
                margin-top: 0;
                color: var(--text-color);
            }

            .password-requirements ul {
                padding-left: 20px;
                margin-bottom: 0;
            }

            .password-requirements li {
                margin-bottom: 5px;
                color: var(--text-color-light);
            }

        /* Profile Header */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ff6b35, #f7931e);
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .profile-avatar i {
                font-size: 40px;
                color: white;
            }

        .profile-info h2 {
            margin: 0 0 5px 0;
            color: var(--text-color);
        }

        .profile-info p {
            margin: 0;
            color: var(--text-color-light);
        }
    </style>
    <style>
        .logo-circle {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #ff6b35, #f7931e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            box-shadow: 0 8px 32px rgba(255, 107, 53, 0.3);
        }
    </style>
</asp:Content>

