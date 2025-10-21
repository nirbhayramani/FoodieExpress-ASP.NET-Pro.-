<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="food-management.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.food_management" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
                <a href="food-management.aspx" class="sidebar-item active">
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
            <div class="admin-header" style="padding-top:3.5rem;">
                <h1>Food Management</h1>
                <p>Manage your food items, add new dishes, and update existing ones</p>
                <div class="header-actions">
                    <asp:Button ID="btnRep" runat="server" Text="Export Report" class="btn btn-primary" OnClick="btnRep_Click" />
                    <a href="add-food.aspx" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add New Food
                    </a>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-filter-bar">
                <%--<div class="search-box">--%>
                <i class="fas fa-search"></i>
                <input type="text" id="search-food" placeholder="Search foods..." class="search-box">
                <%--</div>--%>
                <div class="filter-options">
                    <select id="category-filter">
                        <option value="">All Categories</option>
                        <!-- Categories will be populated by JavaScript -->
                    </select>
                    <select id="status-filter">
                        <option value="">All Status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
            </div>

            <!-- Food Items Table -->
            <%--<div class="table-container">
                <table class="admin-table" id="food-table">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="food-table-body">
                        <!-- Sample data - will be populated by JavaScript -->
                        <tr>
                            <td>
                                <div class="food-image">
                                    <img src="../images/pizza.jpg" alt="Pizza Margherita" onerror="this.src='https://via.placeholder.com/60x60'">
                                </div>
                            </td>
                            <td>
                                <div class="food-info">
                                    <h4>Pizza Margherita</h4>
                                    <p>Classic Italian pizza with fresh mozzarella and basil</p>
                                </div>
                            </td>
                            <td>
                                <span class="category-badge main-course">Main Course</span>
                            </td>
                            <td>$12.99</td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editFood(1)">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteFood(1)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="food-image">
                                    <img src="../images/burger.jpg" alt="Burger Deluxe" onerror="this.src='https://via.placeholder.com/60x60'">
                                </div>
                            </td>
                            <td>
                                <div class="food-info">
                                    <h4>Burger Deluxe</h4>
                                    <p>Juicy beef patty with fresh vegetables and special sauce</p>
                                </div>
                            </td>
                            <td>
                                <span class="category-badge main-course">Main Course</span>
                            </td>
                            <td>$9.99</td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editFood(2)">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteFood(2)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="food-image">
                                    <img src="../images/pasta.jpg" alt="Spaghetti Carbonara" onerror="this.src='https://via.placeholder.com/60x60'">
                                </div>
                            </td>
                            <td>
                                <div class="food-info">
                                    <h4>Spaghetti Carbonara</h4>
                                    <p>Creamy pasta with bacon, eggs, and parmesan cheese</p>
                                </div>
                            </td>
                            <td>
                                <span class="category-badge main-course">Main Course</span>
                            </td>
                            <td>$11.99</td>
                            <td>
                                <span class="status-badge inactive">Inactive</span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editFood(3)">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteFood(3)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>--%>
            <%--<asp:GridView ID="gridvufod" runat="server" AutoGenerateColumns="False" OnRowCommand="gridvufod_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="60px" Width="60px" ImageUrl='<%# Eval("Fo_Img") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name &amp; Description">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Fo_Name") %>'></asp:Label><br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Fo_desc") %>' Font-Size="8pt"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Fo_Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Calories">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Fo_Calr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_edt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnk_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
            <div class="grid-container">
                <asp:GridView ID="gridvufod" runat="server" CssClass="food-grid" AutoGenerateColumns="False" OnRowCommand="gridvufod_RowCommand" AllowPaging="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="60px" Width="60px" ImageUrl='<%# Eval("Fo_Img") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name &amp; Description">
                            <ItemTemplate>
                                <div class="food-name"><%# Eval("Fo_Name") %></div>
                                <div class="food-desc"><%# Eval("Fo_desc") %></div>
                                <div class="food-desc"><%# Eval("Fo_Ingr") %></div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <span class="badge-category"><%# Eval("Cat_Name") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                ₹<%# Eval("Fo_Price") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Calories">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("Fo_Calr") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_edt" runat="server" CssClass="btn-edit" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">
                        <i class="fas fa-edit"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnk_dlt" runat="server" CssClass="btn-delete" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">
                        <i class="fas fa-trash-alt"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <!-- Pagination -->
            <div class="pagination">
                <%--<button class="btn btn-sm" onclick="previousPage()">
                    <i class="fas fa-chevron-left"></i>
                    Previous</button>
                <button class="btn btn-sm" onclick="nextPage()">
                    Next
                   <i class="fas fa-chevron-right"></i>
                </button>--%>
                <asp:LinkButton ID="lnkbtnprev" runat="server" CssClass="btn btn-sm" OnClick="lnkbtnprev_Click"><i class="fas fa-chevron-left"></i>Previous</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnnxt" runat="server" CssClass="btn btn-sm" OnClick="lnkbtnnxt_Click">Next<i class="fas fa-chevron-right"></i></asp:LinkButton>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Confirm Delete</h3>
                <button class="modal-close" onclick="closeModal('deleteModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this food item? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('deleteModal')">Cancel</button>
                <button class="btn btn-danger" onclick="confirmDelete()">Delete</button>
            </div>
        </div>
    </div>
    <%--    <style>
        /* GridView wrapper styling */
        .food-grid {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            margin-top: 20px;
        }

            /* Header styling */
            .food-grid th {
                background-color: #ff6f61; /* Food-related warm tone */
                color: white;
                padding: 12px;
                text-align: left;
                font-size: 16px;
            }

            /* Row styling */
            .food-grid td {
                padding: 10px 12px;
                border-bottom: 0px solid #ddd;
                vertical-align: top;
            }

            /* Zebra striping for alternate row colors */
            .food-grid tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            /* Image styling */
            .food-grid img {
                border-radius: 8px;
                object-fit: cover;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            /* Label styling (Name, Description) */
            .food-grid label {
                display: block;
            }

                /* Description label styling */
                .food-grid label#Label2 {
                    color: #555;
                    font-size: 12px;
                    margin-top: 4px;
                }

            /* Action buttons (Edit/Delete) */
            .food-grid .btn-edit, .food-grid .btn-delete {
                text-decoration: none;
                padding: 6px 12px;
                margin: 2px;
                color: white;
                border-radius: 4px;
                font-size: 13px;
                display: inline-block;
                transition: background-color 0.2s ease-in-out;
            }

            /* Edit button style */
            .food-grid .btn-edit {
                background-color: #4CAF50; /* Green */
            }

            /* Delete button style */
            .food-grid .btn-delete {
                background-color: #f44336; /* Red */
            }

                /* Hover effect for buttons */
                .food-grid .btn-edit:hover, .food-grid .btn-delete:hover {
                    opacity: 0.85;
                }

        /* Responsive tweaks (optional) */
        @media screen and (max-width: 768px) {
            .food-grid th, .food-grid td {
                font-size: 13px;
                padding: 8px;
            }

            .food-grid img {
                width: 50px;
                height: 50px;
            }
        }

        /* Wrapper for responsive GridView (optional) */
        .grid-container {
            overflow-x: auto;
            margin-top: 20px;
        }
    </style>--%>
    <style>
        .grid-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        .food-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            background-color: transparent;
        }

            .food-grid th {
                color: #333;
                font-size: 15px;
                text-align: left;
                padding: 10px 12px;
                background-color: transparent;
                border-bottom: 1px solid #ddd;
            }

            .food-grid tr {
                background-color: #ffffff;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                border-radius: 8px;
                transition: box-shadow 0.2s ease;
            }

                .food-grid tr:hover {
                    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
                }

            .food-grid td {
                padding: 16px 12px;
                vertical-align: top;
                background-color: #ffffff;
                color: #333;
            }

            .food-grid tr td:first-child {
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
            }

            .food-grid tr td:last-child {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
            }

            .food-grid img {
                width: 60px;
                height: 60px;
                border-radius: 8px;
                object-fit: cover;
                box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
            }

        .food-name {
            font-weight: 600;
            font-size: 15px;
            color: #1e1e1e;
        }

        .food-desc {
            font-size: 13px;
            color: #666;
            margin-top: 4px;
            line-height: 1.4;
        }

        .badge-category,
        .badge-status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .badge-category {
            background-color: #ffe5d0;
            color: #ff6f00;
        }

        .badge-status.active {
            background-color: #e0f8d8;
            color: #2e7d32;
        }

        .badge-status.inactive {
            background-color: #fce4ec;
            color: #c2185b;
        }

        .food-grid .btn-edit,
        .food-grid .btn-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            text-decoration: none;
        }

        .food-grid .btn-edit {
            background-color: #ff9800;
        }

            .food-grid .btn-edit:hover {
                background-color: #fb8c00;
            }

        .food-grid .btn-delete {
            background-color: #f44336;
            margin-left: 8px;
        }

            .food-grid .btn-delete:hover {
                background-color: #e53935;
            }

        @media screen and (max-width: 768px) {
            .food-grid th,
            .food-grid td {
                font-size: 13px;
                padding: 10px;
            }

            .food-grid img {
                width: 50px;
                height: 50px;
            }
        }
    </style>

    <script src="admin-scripts.js"></script>

    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
