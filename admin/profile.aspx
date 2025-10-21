<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="admin-container">
        <div class="admin-sidebar">
            <div class="sidebar-menu">
                <a href="index.aspx" class="sidebar-item">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                <a href="profile.aspx" class="sidebar-item active">
                    <i class="fas fa-user-cog"></i>
                    <span>My Profile</span>
                </a>
                <a href="food-management.aspx" class="sidebar-item">
                    <i class="fas fa-hamburger"></i>
                    <span>Food Management</span>
                </a>
                <a href="category-management.aspx" class="sidebar-item">
                    <i class="fas fa-tags"></i>
                    <span>Category Management</span>
                </a>
                <a href="user-management.aspx" class="sidebar-item">
                    <i class="fas fa-users"></i>
                    <span>User Management</span>
                </a>
                <a href="order-management.aspx" class="sidebar-item">
                    <i class="fas fa-shopping-bag"></i>
                    <span>Order Management</span>
                </a>
                <a href="../index.aspx" class="sidebar-item">
                    <i class="fas fa-external-link-alt"></i>
                    <span>View Website</span>
                </a>
            </div>
        </div>

        <div class="admin-main-content">
            <div class="admin-header">
                <div>
                    <h1>My Profile</h1>
                    <p>View and update your admin account details</p>
                </div>
                <div class="header-actions">
                    <button class="btn btn-primary" form="profile-form">
                        <i class="fas fa-save"></i>
                        Save Changes
                    </button>
                </div>
            </div>

            <div class="form-container">
                <form id="profile-form" class="admin-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="first-name">First Name *</label>
                            <input type="text" id="first-name" name="firstName" required>
                        </div>
                        <div class="form-group">
                            <label for="last-name">Last Name *</label>
                            <input type="text" id="last-name" name="lastName" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" disabled>
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <input type="text" id="role" name="role" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3"></textarea>
                    </div>

                    <div class="admin-header" style="margin-top: 1rem; padding-top: 1rem; border-top: 1px solid #e9ecef;">
                        <h2 style="font-size: 1.25rem;">Security</h2>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="current-password">Current Password</label>
                            <input type="password" id="current-password" name="currentPassword">
                        </div>
                        <div class="form-group">
                            <label for="new-password">New Password</label>
                            <input type="password" id="new-password" name="newPassword">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="confirm-password">Confirm New Password</label>
                            <input type="password" id="confirm-password" name="confirmPassword">
                        </div>
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <button type="button" class="btn btn-secondary" onclick="resetPasswordFields()">Clear</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
