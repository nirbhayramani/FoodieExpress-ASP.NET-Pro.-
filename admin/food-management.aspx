<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="food-management.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.food_management" %>

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
                <a href="../index.aspx" class="sidebar-item">
                    <i class="fas fa-external-link-alt"></i>
                    <span>View Website</span>
                </a>
            </div>
        </div>

        <div class="admin-main-content">
            <div class="admin-header">
                <h1>Food Management</h1>
                <p>Manage your food items, add new dishes, and update existing ones</p>
                <div class="header-actions">
                    <a href="add-food.aspx" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add New Food
                    </a>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-filter-bar">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" id="search-food" placeholder="Search foods...">
                </div>
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
            <asp:GridView ID="gridvufod" runat="server" AutoGenerateColumns="False"
                OnRowCommand="gridvufod_RowCommand"
                CssClass="gridview-style">

                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="60px" Width="60px"
                                ImageUrl='<%# Eval("Fo_Img") %>' />
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
                            <asp:Label ID="lblcatId" runat="server" Text='<%# Eval("Cat_ID") %>'></asp:Label>
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
                            <asp:LinkButton ID="lnk_edt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">
                    Edit
                            </asp:LinkButton>
                            &nbsp;
                <asp:LinkButton ID="lnk_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">
                    Delete
                </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Pagination -->
            <div class="pagination">
                <button class="btn btn-sm" onclick="previousPage()">
                    <i class="fas fa-chevron-left"></i>
                    Previous btn-sm" onclick="nextPage()">
                    Next
                    on-right"></i>
                </button>
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
    <style>
        /* GridView Table Styling */
        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            margin-top: 20px;
        }

            /* Header Styling */
            .gridview-style th {
                background-color: #f8f8f8;
                color: #333;
                padding: 12px 10px;
                text-align: left;
                border-bottom: 2px solid #ddd;
                font-weight: 600;
            }

            /* Row Styling */
            .gridview-style td {
                padding: 10px;
                border-bottom: 1px solid #eee;
                vertical-align: top;
            }

                /* Image Column */
                .gridview-style td img {
                    border-radius: 8px;
                    object-fit: cover;
                }

            /* Alternate Row Coloring (Optional) */
            .gridview-style tr:nth-child(even) {
                background-color: #fcfcfc;
            }

            /* Hover Effect */
            .gridview-style tr:hover {
                background-color: #f1f1f1;
            }

            /* Action Buttons */
            .gridview-style a {
                color: #ff5722;
                text-decoration: none;
                font-weight: 500;
            }

                .gridview-style a:hover {
                    text-decoration: underline;
                }
    </style>
    <script src="admin-scripts.js"></script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
