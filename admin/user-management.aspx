<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="user-management.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.user_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Admin Content -->
    <div class="admin-container">
        <div class="admin-sidebar">
            <div class="sidebar-menu">
                <a href="index.aspx" class="sidebar-item">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                <a href="food-management.aspx" class="sidebar-item">
                    <i class="fas fa-hamburger"></i>
                    <span>Food Management</span>
                </a>
                <a href="category-management.aspx" class="sidebar-item">
                    <i class="fas fa-tags"></i>
                    <span>Category Management</span>
                </a>
                <a href="user-management.aspx" class="sidebar-item active">
                    <i class="fas fa-users"></i>
                    <span>User Management</span>
                </a>
                <a href="profile.aspx" class="sidebar-item">
                    <i class="fas fa-user-cog"></i>
                    <span>My Profile</span>
                </a>
                <a href="../index.aspx" class="sidebar-item">
                    <i class="fas fa-external-link-alt"></i>
                    <span>View Website</span>
                </a>
            </div>
        </div>

        <div class="admin-main-content">
            <div class="admin-header">
                <h1>User Management</h1>
                <p>Manage your users, view user details, and handle user accounts</p>
                <div class="header-actions">
                    <button class="btn btn-primary" onclick="exportUsers()">
                        <i class="fas fa-download"></i>
                        Export Users
                    </button>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-filter-bar">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="search-user" placeholder="Search users...">
                </div>
                <div class="filter-options">
                    <select id="role-filter">
                        <option value="">All Roles</option>
                        <option value="customer">Customer</option>
                        <option value="admin">Admin</option>
                        <option value="moderator">Moderator</option>
                    </select>
                    <select id="status-filter">
                        <option value="">All Status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                        <option value="banned">Banned</option>
                    </select>
                    <select id="date-filter">
                        <option value="">All Time</option>
                        <option value="today">Today</option>
                        <option value="week">This Week</option>
                        <option value="month">This Month</option>
                    </select>
                </div>
            </div>

            <!-- Users Table -->
            <div class="table-container">
                <table class="admin-table" id="user-table">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Join Date</th>
                            <th>Last Login</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="user-table-body">
                        <!-- Sample data - will be populated by JavaScript -->
                        <tr>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar">
                                        <img src="https://via.placeholder.com/40x40" alt="John Doe">
                                    </div>
                                    <div class="user-details">
                                        <h4>John Doe</h4>
                                        <p>ID: #1001</p>
                                    </div>
                                </div>
                            </td>
                            <td>john.doe@email.com</td>
                            <td>
                                <span class="role-badge customer">Customer</span>
                            </td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td>2024-01-15</td>
                            <td>2024-01-20 14:30</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editUser(1)" title="Edit User">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteUser(1)" title="Delete User">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar">
                                        <img src="https://via.placeholder.com/40x40" alt="Jane Smith">
                                    </div>
                                    <div class="user-details">
                                        <h4>Jane Smith</h4>
                                        <p>ID: #1002</p>
                                    </div>
                                </div>
                            </td>
                            <td>jane.smith@email.com</td>
                            <td>
                                <span class="role-badge customer">Customer</span>
                            </td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td>2024-01-10</td>
                            <td>2024-01-19 09:15</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editUser(2)" title="Edit User">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteUser(2)" title="Delete User">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar">
                                        <img src="https://via.placeholder.com/40x40" alt="Mike Johnson">
                                    </div>
                                    <div class="user-details">
                                        <h4>Mike Johnson</h4>
                                        <p>ID: #1003</p>
                                    </div>
                                </div>
                            </td>
                            <td>mike.johnson@email.com</td>
                            <td>
                                <span class="role-badge admin">Admin</span>
                            </td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td>2024-01-05</td>
                            <td>2024-01-20 16:45</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editUser(3)" title="Edit User">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteUser(3)" title="Delete User">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar">
                                        <img src="https://via.placeholder.com/40x40" alt="Sarah Wilson">
                                    </div>
                                    <div class="user-details">
                                        <h4>Sarah Wilson</h4>
                                        <p>ID: #1004</p>
                                    </div>
                                </div>
                            </td>
                            <td>sarah.wilson@email.com</td>
                            <td>
                                <span class="role-badge customer">Customer</span>
                            </td>
                            <td>
                                <span class="status-badge inactive">Inactive</span>
                            </td>
                            <td>2024-01-12</td>
                            <td>2024-01-18 11:20</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editUser(4)" title="Edit User">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteUser(4)" title="Delete User">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button class="btn btn-sm" onclick="previousPage()">
                    <i class="fas fa-chevron-left"></i>
                    Previous
                </button>
                <span class="page-info">Page 1 of 1</span>
                <button class="btn btn-sm" onclick="nextPage()">
                    Next
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- User Details Modal -->
    <div id="userDetailsModal" class="modal">
        <div class="modal-content modal-large">
            <div class="modal-header">
                <h3>User Details</h3>
                <button class="modal-close" onclick="closeModal('userDetailsModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="user-profile">
                    <div class="user-profile-header">
                        <div class="user-avatar-large">
                            <img id="modal-user-avatar" src="https://via.placeholder.com/100x100" alt="User Avatar">
                        </div>
                        <div class="user-profile-info">
                            <h2 id="modal-user-name">John Doe</h2>
                            <p id="modal-user-email">john.doe@email.com</p>
                            <div class="user-badges">
                                <span id="modal-user-role" class="role-badge customer">Customer</span>
                                <span id="modal-user-status" class="status-badge active">Active</span>
                            </div>
                        </div>
                    </div>

                    <div class="user-details-grid">
                        <div class="detail-item">
                            <label>User ID:</label>
                            <span id="modal-user-id">#1001</span>
                        </div>
                        <div class="detail-item">
                            <label>Phone:</label>
                            <span id="modal-user-phone">+1 (555) 123-4567</span>
                        </div>
                        <div class="detail-item">
                            <label>Join Date:</label>
                            <span id="modal-user-join-date">2024-01-15</span>
                        </div>
                        <div class="detail-item">
                            <label>Last Login:</label>
                            <span id="modal-user-last-login">2024-01-20 14:30</span>
                        </div>
                        <div class="detail-item">
                            <label>Total Orders:</label>
                            <span id="modal-user-orders">15</span>
                        </div>
                        <div class="detail-item">
                            <label>Total Spent:</label>
                            <span id="modal-user-spent">$245.50</span>
                        </div>
                    </div>

                    <div class="user-address">
                        <h4>Address</h4>
                        <p id="modal-user-address">123 Main Street, City, State 12345</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('userDetailsModal')">Close</button>
                <button class="btn btn-primary" onclick="editUserFromModal()">Edit User</button>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div id="editUserModal" class="modal">
        <div class="modal-content modal-large">
            <div class="modal-header">
                <h3>Edit User</h3>
                <button class="modal-close" onclick="closeModal('editUserModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <form id="edit-user-form" class="admin-form">
                    <input type="hidden" id="edit-user-id" name="userId">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="edit-first-name">First Name *</label>
                            <input type="text" id="edit-first-name" name="firstName" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-last-name">Last Name *</label>
                            <input type="text" id="edit-last-name" name="lastName" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="edit-email">Email *</label>
                            <input type="email" id="edit-email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-phone">Phone</label>
                            <input type="tel" id="edit-phone" name="phone">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="edit-role">Role *</label>
                            <select id="edit-role" name="role" required>
                                <option value="customer">Customer</option>
                                <option value="admin">Admin</option>
                                <option value="moderator">Moderator</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="edit-status">Status *</label>
                            <select id="edit-status" name="status" required>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                                <option value="banned">Banned</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-address">Address</label>
                        <textarea id="edit-address" name="address" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('editUserModal')">Cancel</button>
                <button class="btn btn-primary" onclick="saveUserChanges()">Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteUserModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Confirm Delete</h3>
                <button class="modal-close" onclick="closeModal('deleteUserModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this user? This action cannot be undone and will remove all user data.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('deleteUserModal')">Cancel</button>
                <button class="btn btn-danger" onclick="confirmDeleteUser()">Delete User</button>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
