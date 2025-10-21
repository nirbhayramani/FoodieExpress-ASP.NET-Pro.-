<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="category-management.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.category_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
                <a href="category-management.aspx" class="sidebar-item active">
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
            <div class="admin-header" style="padding-top:3rem;">
                <h1>Category Management</h1>
                <p>Manage food categories, add new categories, and organize your menu</p>
                <div class="header-actions">
                    <asp:Button ID="btnRep" runat="server" Text="Export Report" class="btn btn-primary" />
                    <a href="add-category.aspx" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add New Category
                    </a>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-filter-bar">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="search-category" placeholder="Search categories...">
                </div>
                <div class="filter-options">
                    <select id="status-filter">
                        <option value="">All Status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
            </div>

            <!-- Categories Table -->
            <%--<div class="table-container">
                <table class="admin-table" id="categories-table">
                    <thead>
                        <tr>
                            <th>CATEGORY ID</th>
                            <th>CATEGORY NAME</th>
                            <th>DESCRIPTION</th>
                            <th>ITEMS</th>
                            <th>STATUS</th>
                            <th>ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample categories - will be populated by JavaScript -->
                        <tr>
                            <td>#1</td>
                            <td>
                                <div class="category-info">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fas fa-pizza-slice" style="margin-right: 10px; color: #FF6B35;"></i>
                                        <h4>Main Course</h4>
                                    </div>
                                </div>
                            </td>
                            <td>Hearty main dishes and entrees</td>
                            <td>12 items</td>
                            <td><span class="status-badge active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editCategory(1)" title="Edit Category">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCategory(1)" title="Delete Category">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>#2</td>
                            <td>
                                <div class="category-info">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fas fa-leaf" style="margin-right: 10px; color: #7FB069;"></i>
                                        <h4>Appetizer</h4>
                                    </div>
                                </div>
                            </td>
                            <td>Light starters and small plates</td>
                            <td>8 items</td>
                            <td><span class="status-badge active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editCategory(2)" title="Edit Category">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCategory(2)" title="Delete Category">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>#3</td>
                            <td>
                                <div class="category-info">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fas fa-ice-cream" style="margin-right: 10px; color: #E55A2B;"></i>
                                        <h4>Dessert</h4>
                                    </div>
                                </div>
                            </td>
                            <td>Sweet treats and desserts</td>
                            <td>6 items</td>
                            <td><span class="status-badge active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editCategory(3)" title="Edit Category">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCategory(3)" title="Delete Category">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>#4</td>
                            <td>
                                <div class="category-info">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fas fa-coffee" style="margin-right: 10px; color: #F7931E;"></i>
                                        <h4>Beverage</h4>
                                    </div>
                                </div>
                            </td>
                            <td>Drinks, juices, and beverages</td>
                            <td>10 items</td>
                            <td><span class="status-badge active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editCategory(4)" title="Edit Category">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCategory(4)" title="Delete Category">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>#5</td>
                            <td>
                                <div class="category-info">
                                    <div style="display: flex; align-items: center;">
                                        <i class="fas fa-seedling" style="margin-right: 10px; color: #7FB069;"></i>
                                        <h4>Salad</h4>
                                    </div>
                                </div>
                            </td>
                            <td>Fresh salads and healthy options</td>
                            <td>5 items</td>
                            <td><span class="status-badge inactive">Inactive</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-sm btn-primary" onclick="editCategory(5)" title="Edit Category">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteCategory(5)" title="Delete Category">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>--%>
            <%--            <asp:GridView ID="gridvu_cat" runat="server" AutoGenerateColumns="False" OnRowCommand="girdvu_cat_RowCommand" Style="background: white; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); overflow: hidden; margin-bottom: 2rem; width: 100%; border-collapse: collapse;">
                <Columns>
                    <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cat_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Cat_Desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Icon">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Cat_Icon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Cat_stat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk_edt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="lnk_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
            <asp:GridView ID="gridvu_cat" runat="server" AutoGenerateColumns="False" OnRowCommand="girdvu_cat_RowCommand" CssClass="custom-gridview">
                <Columns>
                    <asp:TemplateField HeaderText="Category ID">
                        <ItemTemplate>
                            #<asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category Name">
                        <ItemTemplate>
                            <div class="category-name">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cat_Name") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Cat_Desc") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Icon">
                        <ItemTemplate>
                            <asp:Label ID="LabelIcon" runat="server" Text='<%# "<i class=\"" + Eval("Cat_icon") + "\"></i>" %>' EnableViewState="false" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# Eval("Cat_stat").ToString() == "Active" ? "status-badge active" : "status-badge inactive" %>'>
                                <%# Eval("Cat_stat") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:LinkButton ID="lnk_edt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt" CssClass="action-btn edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnk_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt" CssClass="action-btn delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <!-- Empty State -->
            <div class="empty-state" id="empty-state" style="display: none;">
                <div class="empty-icon">
                    <i class="fas fa-tags"></i>
                </div>
                <h3>No Categories Found</h3>
                <p>No categories match your search criteria. Try adjusting your filters or add a new category.</p>
                <a href="add-category.aspx" class="btn btn-primary">
                    <i class="fas fa-plus"></i>
                    Add First Category
                </a>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteCategoryModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Confirm Delete</h3>
                <button class="modal-close" onclick="closeModal('deleteCategoryModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this category? This action cannot be undone.</p>
                <div class="warning-box">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>Warning: Deleting this category will affect all food items in this category.</span>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal('deleteCategoryModal')">Cancel</button>
                <button class="btn btn-danger" onclick="confirmDeleteCategory()">Delete Category</button>
            </div>
        </div>
    </div>
    <style>
        .custom-gridview {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            overflow: hidden;
        }

            .custom-gridview th, .custom-gridview td {
                padding: 16px 12px;
                text-align: left;
                border-bottom: 1px solid #f0f0f0;
                font-family: 'Segoe UI', sans-serif;
                font-size: 14px;
            }

            .custom-gridview th {
                background: #fafafa;
                font-weight: 600;
                color: #333;
            }

        .category-name {
            display: flex;
            align-items: center;
            gap: 8px;
        }

            .category-name i {
                font-size: 18px;
            }

        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            font-size: 12px;
            border-radius: 20px;
            font-weight: 600;
        }

            .status-badge.active {
                background-color: #e6f4ea;
                color: #34a853;
            }

            .status-badge.inactive {
                background-color: #fff4e5;
                color: #fb8c00;
            }

        .action-btn {
            padding: 6px 8px;
            border: none;
            border-radius: 6px;
            margin-right: 5px;
            font-size: 14px;
            text-decoration: none;
            cursor: pointer;
        }

            .action-btn i {
                pointer-events: none;
            }

            .action-btn.edit {
                background-color: #fcae3b;
                color: white;
            }

            .action-btn.delete {
                background-color: #e63946;
                color: white;
            }

            .action-btn:hover {
                opacity: 0.9;
            }
    </style>
    <script src="admin-scripts.js"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
