<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit-food.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.edit_food" %>

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
            <div class="admin-header" style="padding-top:3rem;">
                <h1>Edit Food Item</h1>
                <p>Update the food item details</p>
                <div class="header-actions">
                    <a href="food-management.aspx" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>
                        Back to Food Management
                    </a>
                </div>
            </div>

            <!-- Edit Food Form -->
            <div class="form-container">
                <form id="edit-food-form" class="admin-form">
                    <input type="hidden" id="food-id" name="foodId">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="food-name">Food Name *</label>
                            <%--<input type="text" id="food-name" name="foodName" required>--%>
                            <asp:TextBox ID="txtfnam" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="food-category">Category *</label>
                            <%--<select id="food-category" name="category" required>
                                <option value="">Select Category</option>
                                <!-- Categories will be populated by JavaScript -->
                            </select>--%>
                            <asp:DropDownList ID="ddlcat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="food-price">Price *</label>
                            <%--<input type="number" id="food-price" name="price" step="0.01" min="0" required>--%>
                            <asp:TextBox ID="txtprc" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="food-status">Status</label>
                            <%--<select id="food-status" name="status">
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
                        <label for="food-description">Description *</label>
                        <%--<textarea id="food-description" name="description" rows="4" required></textarea>--%>
                        <asp:TextBox ID="txtfdesc" runat="server" Rows="4"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="food-ingredients">Ingredients</label>
                        <%--<textarea id="food-ingredients" name="ingredients" rows="3" placeholder="List ingredients separated by commas"></textarea>--%>
                        <asp:TextBox ID="txtfingr" runat="server" Rows="3" placeholder="List ingredients separated by commas"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="calories">Calories</label>
                            <%--<input type="number" id="calories" name="calories" min="0">--%>
                            <asp:TextBox ID="txtcalr" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="is-featured" name="isFeatured">
                            <span class="checkmark"></span>
                            Featured Item
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="is-vegetarian" name="isVegetarian">
                            <span class="checkmark"></span>
                            Vegetarian
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="is-vegan" name="isVegan">
                            <span class="checkmark"></span>
                            Vegan
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="is-gluten-free" name="isGlutenFree">
                            <span class="checkmark"></span>
                            Gluten Free
                        </label>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='food-management.aspx'">
                            Cancel
                        </button>
                        <%--<button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            Update Food Item
                        </button>--%>
                        <asp:Button ID="btnupd" runat="server" Text="Update Food Item" class="btn btn-primary" OnClick="btnupd_Click" />
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
                <p>Food item has been updated successfully!</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="window.location.href='food-management.aspx'">
                    View Food Management
                </button>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>
    <script>
        // Load food data when page loads
        document.addEventListener('DOMContentLoaded', function () {
            populateCategories();
            loadFoodData();
        });

        function populateCategories() {
            const categorySelect = document.getElementById('food-category');
            if (categorySelect && categories) {
                // Clear existing options except the first one
                categorySelect.innerHTML = '<option value="">Select Category</option>';

                // Add active categories
                categories
                    .filter(cat => cat.status === 'active')
                    .sort((a, b) => a.sortOrder - b.sortOrder)
                    .forEach(category => {
                        const option = document.createElement('option');
                        option.value = category.slug;
                        option.textContent = category.name;
                        categorySelect.appendChild(option);
                    });
            }
        }

        function loadFoodData() {
            // Get food ID from URL parameters
            const urlParams = new URLSearchParams(window.location.search);
            const foodId = urlParams.get('id');

            if (foodId) {
                // In a real application, you would fetch the food data from your backend
                // For demo purposes, we'll use sample data
                const sampleFood = {
                    id: foodId,
                    name: "Pizza Margherita",
                    category: "main-course",
                    price: 12.99,
                    status: "active",
                    description: "Classic Italian pizza with fresh mozzarella and basil",
                    ingredients: "Pizza dough, tomato sauce, mozzarella cheese, fresh basil, olive oil",
                    image: "../images/pizza.jpg",
                    prepTime: 20,
                    calories: 350,
                    isFeatured: true,
                    isVegetarian: true,
                    isVegan: false,
                    isGlutenFree: false
                };

                // Populate form with sample data
                document.getElementById('food-id').value = sampleFood.id;
                document.getElementById('food-name').value = sampleFood.name;
                document.getElementById('food-category').value = sampleFood.category;
                document.getElementById('food-price').value = sampleFood.price;
                document.getElementById('food-status').value = sampleFood.status;
                document.getElementById('food-description').value = sampleFood.description;
                document.getElementById('food-ingredients').value = sampleFood.ingredients;
                document.getElementById('prep-time').value = sampleFood.prepTime;
                document.getElementById('calories').value = sampleFood.calories;
                document.getElementById('is-featured').checked = sampleFood.isFeatured;
                document.getElementById('is-vegetarian').checked = sampleFood.isVegetarian;
                document.getElementById('is-vegan').checked = sampleFood.isVegan;
                document.getElementById('is-gluten-free').checked = sampleFood.isGlutenFree;

                // Set current image
                if (sampleFood.image) {
                    document.getElementById('current-img').src = sampleFood.image;
                    document.getElementById('current-image').style.display = 'block';
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
