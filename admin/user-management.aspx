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
                <a href="user-management.aspx" class="sidebar-item active">
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
            <div class="admin-header" style="padding-top:4rem;">
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
            <%--<div class="table-container">
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
            </div>--%>

            <%--<div class="table-container admin-table">--%>
            <%--<asp:GridView ID="grdvuUsr" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="User Id">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email ID">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Phone_Number") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Address">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Delivery_Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
            <%--</div>--%>

            <%--<div class="gridview-container">
                <asp:GridView ID="grdvuUsr" runat="server" AutoGenerateColumns="False" CssClass="gridview-table">
                    <Columns>
                        <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <div class="user-info-cell">
                                    <div class="user-details">
                                        <span class="user-id"><%# Eval("Id") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <div class="user-info-cell">
                                    <div class="user-details">
                                        <span class="user-name"><%# Eval("First_Name") %> <%# Eval("Last_Name") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Phone_Number") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Address">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Delivery_Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>--%>


            <asp:GridView ID="grdvuUsr" runat="server" AutoGenerateColumns="False" CssClass="admin-table">
                <Columns>
                    <asp:TemplateField HeaderText="User Id">
                        <ItemTemplate>
                            <asp:Label ID="lblUserId" runat="server" Text='<%# "#" + Eval("Id") %>' CssClass="user-id"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("First_Name") %>' CssClass="user-first-name"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("Last_Name") %>' CssClass="user-last-name"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email ID">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="user-email"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone_Number") %>' CssClass="user-phone"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivery Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Delivery_Address") %>' CssClass="user-address" Style="background: #FFF9F2; padding: 0.5rem;"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <!-- Pagination -->
            <%--<div class="pagination">
                <button class="btn btn-sm" onclick="previousPage()">
                    <i class="fas fa-chevron-left"></i>
                    Previous
                </button>
                <span class="page-info">Page 1 of 1</span>
                <button class="btn btn-sm" onclick="nextPage()">
                    Next
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>--%>
        </div>
    </div>

    <!-- User Details Modal -->
    <%--<div id="userDetailsModal" class="modal">
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
    </div>--%>

    <!-- Edit User Modal -->
    <%--<div id="editUserModal" class="modal">
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
    </div>--%>

    <!-- Delete Confirmation Modal -->
    <%--<div id="deleteUserModal" class="modal">
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
    </div>--%>

    <script src="admin-scripts.js"></script>

    <%--<style>
        /* GridView Styling */
        .gridview-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin-top: 20px;
            animation: fadeIn 0.5s ease-out;
        }

        .gridview-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

            .gridview-table th {
                /*background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);*/
                background: linear-gradient(135deg, #FF6B35 0%, #F7931E 100%);
                color: white;
                font-weight: 600;
                text-align: left;
                padding: 16px 20px;
                border-bottom: none;
                position: relative;
                overflow: hidden;
            }

                .gridview-table th:after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 3px;
                    background: rgba(255, 255, 255, 0.3);
                }

            .gridview-table td {
                padding: 16px 20px;
                border-bottom: 1px solid #f0f0f0;
                transition: all 0.3s ease;
            }

            .gridview-table tr {
                transition: all 0.3s ease;
            }

                .gridview-table tr:hover {
                    background-color: #f8f9ff;
                    transform: translateY(-2px);
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                }

                    .gridview-table tr:hover td {
                        border-color: #e1e5ff;
                    }

                /* Alternating row colors */
                .gridview-table tr:nth-child(even) {
                    background-color: #f9fafc;
                }

                    .gridview-table tr:nth-child(even):hover {
                        background-color: #f0f3ff;
                    }

        /* User info styling */
        .user-info-cell {
            display: flex;
            align-items: center;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            color: white;
            font-weight: bold;
            font-size: 16px;
        }

        .user-details {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 2px;
        }

        .user-id {
            font-size: 12px;
            color: #718096;
        }

        /* Badge styling */
        .role-badge, .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: capitalize;
            display: inline-block;
        }

            .role-badge.customer {
                background-color: #e1f5fe;
                color: #0288d1;
            }

            .role-badge.admin {
                background-color: #f3e5f5;
                color: #7b1fa2;
            }

            .role-badge.moderator {
                background-color: #e8f5e9;
                color: #388e3c;
            }

            .status-badge.active {
                background-color: #e8f5e9;
                color: #2e7d32;
            }

            .status-badge.inactive {
                background-color: #fff3e0;
                color: #ef6c00;
            }

            .status-badge.banned {
                background-color: #ffebee;
                color: #c62828;
            }

        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .btn-sm {
            padding: 6px 10px;
            font-size: 11px;
        }

        .btn-primary {
            background-color: #4361ee;
            color: white;
        }

            .btn-primary:hover {
                background-color: #3a56d4;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(67, 97, 238, 0.3);
            }

        .btn-danger {
            background-color: #f72585;
            color: white;
        }

            .btn-danger:hover {
                background-color: #e11575;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(247, 37, 133, 0.3);
            }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .gridview-table tr {
            animation: slideIn 0.5s ease-out;
            animation-fill-mode: both;
        }

            .gridview-table tr:nth-child(1) {
                animation-delay: 0.1s;
            }

            .gridview-table tr:nth-child(2) {
                animation-delay: 0.2s;
            }

            .gridview-table tr:nth-child(3) {
                animation-delay: 0.3s;
            }

            .gridview-table tr:nth-child(4) {
                animation-delay: 0.4s;
            }

            .gridview-table tr:nth-child(5) {
                animation-delay: 0.5s;
            }

            .gridview-table tr:nth-child(6) {
                animation-delay: 0.6s;
            }

        /* Responsive design */
        @media (max-width: 768px) {
            .gridview-container {
                overflow-x: auto;
            }

            .gridview-table {
                min-width: 800px;
            }

                .gridview-table th,
                .gridview-table td {
                    padding: 12px 15px;
                }
        }
    </style>--%>        <%--with css--%>

    <style>
        /* GridView Styling */
        .admin-main-content {
            padding: 20px;
            background: #f8f9fa;
        }

        #ContentPlaceHolder2_grdvuUsr {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

            #ContentPlaceHolder2_grdvuUsr th {
                background: #f8f9fa;
                padding: 15px 12px;
                text-align: left;
                font-weight: 600;
                color: #333;
                border-bottom: 1px solid #dee2e6;
                font-size: 0.9rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            #ContentPlaceHolder2_grdvuUsr td {
                padding: 15px 12px;
                border-bottom: 1px solid #dee2e6;
                color: #555;
                font-size: 0.9rem;
            }

            #ContentPlaceHolder2_grdvuUsr tr:last-child td {
                border-bottom: none;
            }

            #ContentPlaceHolder2_grdvuUsr tr:hover {
                background-color: #f8f9fa;
            }

            /* User Info Styling */
            #ContentPlaceHolder2_grdvuUsr td:nth-child(1) {
                font-weight: 600;
                color: #FF6B35;
            }

            /* Name Styling */
            #ContentPlaceHolder2_grdvuUsr td:nth-child(2),
            #ContentPlaceHolder2_grdvuUsr td:nth-child(3) {
                font-weight: 500;
                color: #333;
            }

            /* Email Styling */
            #ContentPlaceHolder2_grdvuUsr td:nth-child(4) {
                color: #666;
                font-style: italic;
            }

            /* Phone Number Styling */
            #ContentPlaceHolder2_grdvuUsr td:nth-child(5) {
                color: #555;
                font-family: monospace;
            }

            /* Address Styling */
            #ContentPlaceHolder2_grdvuUsr td:nth-child(6) {
                /* color: #666;
                max-width: 200px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;*/
                color: #7FB069;
            }

        /* Header Actions */
        .header-actions {
            margin: 20px 0;
        }

        /* Search and Filter Section */
        .search-filter-bar {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }

        .search-box {
            position: relative;
            flex: 1;
            min-width: 250px;
        }

            .search-box i {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: #666;
            }

            .search-box input {
                width: 100%;
                padding: 10px 10px 10px 35px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 0.9rem;
            }

        .filter-options {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

            .filter-options select {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 0.9rem;
                background: white;
                min-width: 120px;
            }

        /* Responsive */
        @media (max-width: 768px) {
            #ContentPlaceHolder2_grdvuUsr {
                font-size: 0.8rem;
            }

                #ContentPlaceHolder2_grdvuUsr th,
                #ContentPlaceHolder2_grdvuUsr td {
                    padding: 10px 8px;
                }

            .search-filter-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                min-width: auto;
            }

            .filter-options {
                justify-content: space-between;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
