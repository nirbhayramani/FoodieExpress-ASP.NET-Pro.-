<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Admin Content -->
    <div class="admin-container">
        <div class="admin-sidebar">
            <div class="sidebar-menu">
                <a href="index.aspx" class="sidebar-item active">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                <a href="profile.aspx" class="sidebar-item">
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
                <h1>Admin Dashboard</h1>
                <p>Welcome to FoodieExpress Admin Panel</p>
            </div>

            <!-- Dashboard Stats -->
            <div class="dashboard-stats">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-hamburger"></i>
                    </div>
                    <div class="stat-content">
                        <%--<h3 id="total-foods">0</h3>--%>
                        <asp:Label ID="lbltfo" runat="server" Text="Label" Style="font-size: 2rem; font-weight: 600; color: #333; margin-bottom: 0.25rem;"></asp:Label>
                        <p>Total Foods</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-content">
                        <%--<h3 id="total-users">0</h3>--%>
                        <asp:Label ID="lbltuser" runat="server" Text="Label" Style="font-size: 2rem; font-weight: 600; color: #333; margin-bottom: 0.25rem;"></asp:Label>
                        <p>Total Users</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <div class="stat-content">
                        <h3 id="total-orders">0</h3>
                        <p>Total Orders</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-content">
                        <h3 id="total-revenue">$0</h3>
                        <p>Total Revenue</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="quick-actions">
                <table>
                    <tr>
                        <td>
                            <h2>Quick Actions</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="action-buttons">
                                <a href="add-food.aspx" class="action-btn">
                                    <i class="fas fa-plus"></i>
                                    <span>Add New Food</span>
                                </a>
                                <a href="food-management.aspx" class="action-btn">
                                    <i class="fas fa-edit"></i>
                                    <span>Manage Foods</span>
                                </a>
                                <a href="user-management.aspx" class="action-btn">
                                    <i class="fas fa-user-cog"></i>
                                    <span>Manage Users</span>
                                </a>
                                <a href="#" class="action-btn" onclick="exportData()">
                                    <i class="fas fa-download"></i>
                                    <span>Export Data</span>
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Recent Activity -->
            <div class="recent-activity">
                <h2>Recent Activity</h2>
                <div class="activity-list" id="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-plus text-success"></i>
                        </div>
                        <div class="activity-content">
                            <p>New food item "Pizza Margherita" added</p>
                            <span class="activity-time">2 hours ago</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user text-info"></i>
                        </div>
                        <div class="activity-content">
                            <p>New user "john_doe" registered</p>
                            <span class="activity-time">4 hours ago</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-edit text-warning"></i>
                        </div>
                        <div class="activity-content">
                            <p>Food item "Burger Deluxe" updated</p>
                            <span class="activity-time">6 hours ago</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
