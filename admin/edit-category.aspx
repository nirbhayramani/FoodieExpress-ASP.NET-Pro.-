<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit-category.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.edit_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Admin Content -->
    <div class="admin-container">
        <div class="admin-sidebar">
            <div class="sidebar-menu">
                <a href="dashboard.aspx" class="sidebar-item active">
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
                <h1>Edit Category</h1>
                <p>Update the category details</p>
                <div class="header-actions">
                    <a href="category-management.aspx" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>
                        Back to Category Management
                    </a>
                </div>
            </div>

            <!-- Edit Category Form -->
            <div class="form-container">
                <form id="edit-category-form" class="admin-form">
                    <input type="hidden" id="category-id" name="categoryId">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="category-name">Category Name *</label>
                            <%--<input type="text" id="category-name" name="categoryName" required placeholder="e.g., Main Course, Appetizer">--%>
                            <asp:TextBox ID="txtcnam" runat="server" placeholder="e.g., Main Course, Appetizer"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="category-slug">Category Slug *</label>
                            <%--<input type="text" id="category-slug" name="categorySlug" required placeholder="e.g., main-course, appetizer">--%>
                            <asp:TextBox ID="txtcslug" runat="server"></asp:TextBox>
                            <small class="form-help">URL-friendly version of the category name</small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="category-description">Description *</label>
                        <%--<textarea id="category-description" name="description" rows="3" required placeholder="Brief description of this category"></textarea>--%>
                        <asp:TextBox ID="txtcdesc" runat="server" TextMode="MultiLine" Rows="3" placeholder="Brief description of this category"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="category-icon">Icon</label>
                            <%--<select id="category-icon" name="icon">
                                <option value="fas fa-hamburger">🍔 Hamburger</option>
                                <option value="fas fa-pizza-slice">🍕 Pizza</option>
                                <option value="fas fa-leaf">🥗 Salad</option>
                                <option value="fas fa-ice-cream">🍦 Dessert</option>
                                <option value="fas fa-coffee">☕ Beverage</option>
                                <option value="fas fa-seedling">🌱 Healthy</option>
                                <option value="fas fa-fish">🐟 Seafood</option>
                                <option value="fas fa-drumstick-bite">🍗 Chicken</option>
                                <option value="fas fa-bread-slice">🍞 Bread</option>
                                <option value="fas fa-apple-alt">🍎 Fruit</option>
                                <option value="fas fa-utensils">🍽️ General</option>
                                <option value="fas fa-fire">🌶️ Spicy</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlicon" runat="server">
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
                        <%--                        <div class="form-group">
                            <label for="category-color">Color Theme</label>
                            <select id="category-color" name="color">
                                <option value="#FF6B35">Primary Orange</option>
                                <option value="#F7931E">Golden Orange</option>
                                <option value="#E55A2B">Dark Orange</option>
                                <option value="#7FB069">Green</option>
                                <option value="#5A8A4A">Dark Green</option>
                                <option value="#D44A1B">Red Orange</option>
                                <option value="#FF8C42">Light Orange</option>
                                <option value="#FFA500">Pure Orange</option>
                                <option value="#FF7F50">Coral</option>
                                <option value="#FF6347">Tomato</option>
                            </select>
                        </div>--%>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="category-status">Status</label>
                            <%--<select id="category-status" name="status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlstat" runat="server">
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
                        &nbsp;<small class="form-help">Featured categories appear prominently on the website</small>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="show-on-menu" name="showOnMenu">
                            <span class="checkmark"></span>
                            Show on Menu
                        </label>
                        &nbsp;<small class="form-help">Display this category on the public menu</small>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='category-management.aspx'">
                            Cancel
                        </button>
                        <%--<button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            Update Category
                        </button>--%>
                        <asp:Button ID="btnupd" runat="server" CssClass="btn btn-primary" Text="Update Category" OnClick="btnupd_Click" />
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
                <p>Category has been updated successfully!</p>
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
        // Load category data when page loads
        document.addEventListener('DOMContentLoaded', function () {
            loadCategoryData();
        });

        function loadCategoryData() {
            // Get category ID from URL parameters
            const urlParams = new URLSearchParams(window.location.search);
            const categoryId = urlParams.get('id');

            if (categoryId) {
                // In a real application, you would fetch the category data from your backend
                // For demo purposes, we'll use sample data
                const sampleCategory = {
                    id: categoryId,
                    name: "Main Course",
                    slug: "main-course",
                    description: "Hearty main dishes and entrees",
                    icon: "fas fa-pizza-slice",
                    color: "#667eea",
                    status: "active",
                    sortOrder: 1,
                    isFeatured: true,
                    showOnMenu: true,
                    image: "https://via.placeholder.com/300x200"
                };

                // Populate form with sample data
                document.getElementById('category-id').value = sampleCategory.id;
                document.getElementById('category-name').value = sampleCategory.name;
                document.getElementById('category-slug').value = sampleCategory.slug;
                document.getElementById('category-description').value = sampleCategory.description;
                document.getElementById('category-icon').value = sampleCategory.icon;
                document.getElementById('category-color').value = sampleCategory.color;
                document.getElementById('category-status').value = sampleCategory.status;
                document.getElementById('sort-order').value = sampleCategory.sortOrder;
                //document.getElementById('is-featured').checked = sampleCategory.isFeatured;
                document.getElementById('show-on-menu').checked = sampleCategory.showOnMenu;

                // Set current image
                if (sampleCategory.image) {
                    document.getElementById('current-img').src = sampleCategory.image;
                    document.getElementById('current-image').style.display = 'block';
                }
            }
        }

        // Auto-generate slug from category name
        document.getElementById('category-name').addEventListener('input', function () {
            const name = this.value;
            const slug = name.toLowerCase()
                .replace(/[^a-z0-9\s-]/g, '')
                .replace(/\s+/g, '-')
                .replace(/-+/g, '-')
                .trim();
            //document.getElementById('category-slug').value = slug;
        });

        // Handle form submission
        document.getElementById('edit-category-form').addEventListener('submit', function (e) {
            e.preventDefault();

            const formData = new FormData(this);
            const categoryId = parseInt(formData.get('categoryId'));

            const categoryIndex = categories.findIndex(cat => cat.id === categoryId);
            if (categoryIndex !== -1) {
                categories[categoryIndex] = {
                    ...categories[categoryIndex],
                    name: formData.get('categoryName'),
                    slug: formData.get('categorySlug'),
                    description: formData.get('description'),
                    icon: formData.get('icon'),
                    color: formData.get('color'),
                    status: formData.get('status'),
                    sortOrder: parseInt(formData.get('sortOrder')) || 0,
                    isFeatured: formData.get('isFeatured') === 'on',
                    showOnMenu: formData.get('showOnMenu') === 'on'
                };

                // Update image if new one uploaded
                const imageFile = formData.get('image');
                if (imageFile && imageFile.size > 0) {
                    categories[categoryIndex].image = URL.createObjectURL(imageFile);
                }
            }

            // Show success modal
            showModal('successModal');
        });
    </script>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
