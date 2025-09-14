<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="add-category.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.add_category" %>

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
                <a href="category-management.aspx" class="sidebar-item active">
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
                <h1>Add New Category</h1>
                <p>Create a new food category for your menu</p>
                <div class="header-actions">
                    <a href="category-management.aspx" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>
                        Back to Category Management
                    </a>
                </div>
            </div>

            <!-- Add Category Form -->
            <div class="form-container">
                <form id="add-category-form" class="admin-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="category-name">Category Name *</label>
                            <%--<input type="text" id="category-name" name="categoryName" required placeholder="e.g., Main Course, Appetizer">--%>
                            <asp:TextBox ID="txtname" runat="server" placeholder="e.g., Main Course, Appetizer"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="category-slug">Category Slug *</label>
                            <%--<input type="text" id="category-slug" name="categorySlug" required placeholder="e.g., main-course, appetizer">--%>
                            <asp:TextBox ID="txtslug" runat="server" placeholder="e.g., main-course, appetizer"></asp:TextBox>
                            <small class="form-help">URL-friendly version of the category name</small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="category-description">Description *</label>
                        <%--<textarea id="txt" name="description" rows="3" required placeholder="Brief description of this category"></textarea>--%>
                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Rows="3" placeholder="Brief description of this category"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="category-icon">Icon</label>
                            <%--<select id="category-icon" name="icon"><option value="fas fa-hamburger">🍔 Hamburger</option><option value="fas fa-pizza-slice">🍕 Pizza</option><option value="fas fa-leaf">🥗 Salad</option><option value="fas fa-ice-cream">🍦 Dessert</option><option value="fas fa-coffee">☕ Beverage</option><option value="fas fa-seedling">🌱 Healthy</option><option value="fas fa-fish">🐟 Seafood</option><option value="fas fa-drumstick-bite">🍗 Chicken</option><option value="fas fa-bread-slice">🍞 Bread</option><option value="fas fa-apple-alt">🍎 Fruit</option><option value="fas fa-utensils">🍽️ General</option><option value="fas fa-fire">🌶️ Spicy</option></select>--%>
                            <asp:DropDownList ID="ddlicon" runat="server" AutoPostBack="True">
                                <asp:ListItem>-- Select Icon --</asp:ListItem>
                                <asp:ListItem>Hamburger</asp:ListItem>
                                <asp:ListItem>Pizza</asp:ListItem>
                                <asp:ListItem>Salad</asp:ListItem>
                                <asp:ListItem>Dessert</asp:ListItem>
                                <asp:ListItem>Beverage</asp:ListItem>
                                <asp:ListItem>Healthy</asp:ListItem>
                                <asp:ListItem>Seafood</asp:ListItem>
                                <asp:ListItem>Chicken</asp:ListItem>
                                <asp:ListItem>Bread</asp:ListItem>
                                <asp:ListItem>Fruit</asp:ListItem>
                                <asp:ListItem>General</asp:ListItem>
                                <asp:ListItem>Spicy</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="category-status">Status</label>
                                <%--<select id="category-status" name="status">
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>--%>
                                <asp:DropDownList ID="ddlstat" runat="server" AutoPostBack="True">
                                    <asp:ListItem>-- Select Status --</asp:ListItem>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="is-featured" name="isFeatured">
                                <span class="checkmark"></span>
                                Featured Category
                            </label>
                            <small class="form-help">Featured categories appear prominently on the website</small>
                        </div>

                        <div class="form-group">
                            <label class="checkbox-label">
                                <input type="checkbox" id="show-on-menu" name="showOnMenu" checked>
                                <span class="checkmark"></span>
                                Show on Menu
                            </label>
                            <small class="form-help">Display this category on the public menu</small>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='category-management.aspx'">
                                Cancel
                            </button>
                            <%--<button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i>
                                Add Category
                            </button>--%>
                            <asp:Button ID="btnadd" runat="server" Text="Add Category" CssClass="btn btn-primary" OnClick="btnadd_Click" />

                        </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Success!</h3>
                <button class="modal-close" onclick="closeModal('successModal')">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <p>Category has been added successfully!</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="window.location.href='category-management.aspx'">
                    View Category Management
                </button>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>
    <script>
        // Auto-generate slug from category name
        document.getElementById('category-name').addEventListener('input', function () {
            const name = this.value;
            const slug = name.toLowerCase()
                .replace(/[^a-z0-9\s-]/g, '')
                .replace(/\s+/g, '-')
                .replace(/-+/g, '-')
                .trim();
            document.getElementById('category-slug').value = slug;
        });

        // Handle form submission
        document.getElementById('add-category-form').addEventListener('submit', function (e) {
            e.preventDefault();

            const formData = new FormData(this);
            const newCategory = {
                id: categories.length + 1,
                name: formData.get('categoryName'),
                slug: formData.get('categorySlug'),
                description: formData.get('description'),
                icon: formData.get('icon'),
                color: formData.get('color'),
                status: formData.get('status'),
                sortOrder: parseInt(formData.get('sortOrder')) || 0,
                isFeatured: formData.get('isFeatured') === 'on',
                showOnMenu: formData.get('showOnMenu') === 'on',
                foodCount: 0
            };

            // Add image if uploaded
            const imageFile = formData.get('image');
            if (imageFile && imageFile.size > 0) {
                newCategory.image = URL.createObjectURL(imageFile);
            }

            categories.push(newCategory);

            // Show success modal
            showModal('successModal');

            // Reset form
            this.reset();
            removeImage();
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
