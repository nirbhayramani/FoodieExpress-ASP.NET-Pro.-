// Admin Panel JavaScript Functions

// Global variables
let currentFoodId = null;
let currentUserId = null;
let currentCategoryId = null;
let foods = [];
let users = [];
let categories = [];

// Initialize admin panel
document.addEventListener('DOMContentLoaded', function() {
    initializeAdminPanel();
    loadSampleData();
    setupEventListeners();
});

// Initialize admin panel functionality
function initializeAdminPanel() {
    // Update dashboard stats
    updateDashboardStats();
    
    // Setup file upload preview
    setupFileUpload();
    
    // Setup form validation
    setupFormValidation();
    
    // Setup search functionality
    setupSearch();
    
    // Setup filters
    setupFilters();
    
    // Setup category search
    setupCategorySearch();
}

// Load sample data for demonstration
function loadSampleData() {
    // Sample foods data
    foods = [
        {
            id: 1,
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
        },
        {
            id: 2,
            name: "Burger Deluxe",
            category: "main-course",
            price: 9.99,
            status: "active",
            description: "Juicy beef patty with fresh vegetables and special sauce",
            ingredients: "Beef patty, lettuce, tomato, onion, cheese, special sauce, bun",
            image: "../images/burger.jpg",
            prepTime: 15,
            calories: 450,
            isFeatured: false,
            isVegetarian: false,
            isVegan: false,
            isGlutenFree: false
        },
        {
            id: 3,
            name: "Spaghetti Carbonara",
            category: "main-course",
            price: 11.99,
            status: "inactive",
            description: "Creamy pasta with bacon, eggs, and parmesan cheese",
            ingredients: "Spaghetti, bacon, eggs, parmesan cheese, black pepper",
            image: "../images/pasta.jpg",
            prepTime: 25,
            calories: 380,
            isFeatured: false,
            isVegetarian: false,
            isVegan: false,
            isGlutenFree: false
        }
    ];

    // Sample users data
    users = [
        {
            id: 1,
            firstName: "John",
            lastName: "Doe",
            email: "john.doe@email.com",
            phone: "+1 (555) 123-4567",
            role: "customer",
            status: "active",
            joinDate: "2024-01-15",
            lastLogin: "2024-01-20 14:30",
            address: "123 Main Street, City, State 12345",
            totalOrders: 15,
            totalSpent: 245.50
        },
        {
            id: 2,
            firstName: "Jane",
            lastName: "Smith",
            email: "jane.smith@email.com",
            phone: "+1 (555) 987-6543",
            role: "customer",
            status: "active",
            joinDate: "2024-01-10",
            lastLogin: "2024-01-19 09:15",
            address: "456 Oak Avenue, City, State 12345",
            totalOrders: 8,
            totalSpent: 156.75
        },
        {
            id: 3,
            firstName: "Mike",
            lastName: "Johnson",
            email: "mike.johnson@email.com",
            phone: "+1 (555) 456-7890",
            role: "admin",
            status: "active",
            joinDate: "2024-01-05",
            lastLogin: "2024-01-20 16:45",
            address: "789 Pine Road, City, State 12345",
            totalOrders: 25,
            totalSpent: 389.20
        },
        {
            id: 4,
            firstName: "Sarah",
            lastName: "Wilson",
            email: "sarah.wilson@email.com",
            phone: "+1 (555) 321-0987",
            role: "customer",
            status: "inactive",
            joinDate: "2024-01-12",
            lastLogin: "2024-01-18 11:20",
            address: "321 Elm Street, City, State 12345",
            totalOrders: 3,
            totalSpent: 45.99
        }
    ];

    // Sample categories data
    categories = [
        {
            id: 1,
            name: "Main Course",
            slug: "main-course",
            description: "Hearty main dishes and entrees",
            icon: "fas fa-pizza-slice",
            color: "#FF6B35",
            status: "active",
            sortOrder: 1,
            isFeatured: true,
            showOnMenu: true,
            foodCount: 12,
            image: "https://via.placeholder.com/300x200"
        },
        {
            id: 2,
            name: "Appetizer",
            slug: "appetizer",
            description: "Light starters and small plates",
            icon: "fas fa-leaf",
            color: "#F7931E",
            status: "active",
            sortOrder: 2,
            isFeatured: false,
            showOnMenu: true,
            foodCount: 8,
            image: "https://via.placeholder.com/300x200"
        },
        {
            id: 3,
            name: "Dessert",
            slug: "dessert",
            description: "Sweet treats and desserts",
            icon: "fas fa-ice-cream",
            color: "#E55A2B",
            status: "active",
            sortOrder: 3,
            isFeatured: false,
            showOnMenu: true,
            foodCount: 6,
            image: "https://via.placeholder.com/300x200"
        },
        {
            id: 4,
            name: "Beverage",
            slug: "beverage",
            description: "Drinks, juices, and beverages",
            icon: "fas fa-coffee",
            color: "#7FB069",
            status: "active",
            sortOrder: 4,
            isFeatured: false,
            showOnMenu: true,
            foodCount: 10,
            image: "https://via.placeholder.com/300x200"
        },
        {
            id: 5,
            name: "Salad",
            slug: "salad",
            description: "Fresh salads and healthy options",
            icon: "fas fa-seedling",
            color: "#FF8C42",
            status: "inactive",
            sortOrder: 5,
            isFeatured: false,
            showOnMenu: false,
            foodCount: 5,
            image: "https://via.placeholder.com/300x200"
        }
    ];
}

// Setup event listeners
function setupEventListeners() {
    // Add food form submission
    const addFoodForm = document.getElementById('add-food-form');
    if (addFoodForm) {
        addFoodForm.addEventListener('submit', handleAddFood);
    }

    // Edit food form submission
    const editFoodForm = document.getElementById('edit-food-form');
    if (editFoodForm) {
        editFoodForm.addEventListener('submit', handleEditFood);
    }

    // Edit user form submission
    const editUserForm = document.getElementById('edit-user-form');
    if (editUserForm) {
        editUserForm.addEventListener('submit', handleEditUser);
    }

    // File upload change
    const fileInput = document.getElementById('food-image');
    if (fileInput) {
        fileInput.addEventListener('change', handleFileUpload);
    }
}

// Update dashboard statistics
function updateDashboardStats() {
    const totalFoodsElement = document.getElementById('total-foods');
    const totalUsersElement = document.getElementById('total-users');
    const totalOrdersElement = document.getElementById('total-orders');
    const totalRevenueElement = document.getElementById('total-revenue');

    if (totalFoodsElement) {
        totalFoodsElement.textContent = foods.length;
    }
    if (totalUsersElement) {
        totalUsersElement.textContent = users.length;
    }
    if (totalOrdersElement) {
        const totalOrders = users.reduce((sum, user) => sum + user.totalOrders, 0);
        totalOrdersElement.textContent = totalOrders;
    }
    if (totalRevenueElement) {
        const totalRevenue = users.reduce((sum, user) => sum + user.totalSpent, 0);
        totalRevenueElement.textContent = `$${totalRevenue.toFixed(2)}`;
    }
}

// Setup file upload functionality
function setupFileUpload() {
    const fileInput = document.getElementById('food-image');
    if (fileInput) {
        fileInput.addEventListener('change', handleFileUpload);
    }
}

// Handle file upload
function handleFileUpload(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = document.getElementById('image-preview');
            const previewImg = document.getElementById('preview-img');
            const fileUpload = document.getElementById('file-upload');
            
            if (preview && previewImg) {
                previewImg.src = e.target.result;
                preview.style.display = 'block';
                if (fileUpload) {
                    fileUpload.style.display = 'none';
                }
            }
        };
        reader.readAsDataURL(file);
    }
}

// Remove image preview
function removeImage() {
    const preview = document.getElementById('image-preview');
    const fileUpload = document.getElementById('file-upload');
    const fileInput = document.getElementById('food-image');
    
    if (preview) {
        preview.style.display = 'none';
    }
    if (fileUpload) {
        fileUpload.style.display = 'block';
    }
    if (fileInput) {
        fileInput.value = '';
    }
}

// Setup form validation
function setupFormValidation() {
    const forms = document.querySelectorAll('.admin-form');
    forms.forEach(form => {
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    });
}

// Setup search functionality
function setupSearch() {
    const searchInput = document.getElementById('search-food');
    if (searchInput) {
        searchInput.addEventListener('input', filterFoods);
    }

    const userSearchInput = document.getElementById('search-user');
    if (userSearchInput) {
        userSearchInput.addEventListener('input', filterUsers);
    }
}

// Setup filters
function setupFilters() {
    const categoryFilter = document.getElementById('category-filter');
    const statusFilter = document.getElementById('status-filter');
    const roleFilter = document.getElementById('role-filter');
    const userStatusFilter = document.getElementById('status-filter');

    if (categoryFilter) {
        categoryFilter.addEventListener('change', filterFoods);
    }
    if (statusFilter && document.getElementById('food-table')) {
        statusFilter.addEventListener('change', filterFoods);
    }
    if (roleFilter) {
        roleFilter.addEventListener('change', filterUsers);
    }
    if (userStatusFilter && document.getElementById('user-table')) {
        userStatusFilter.addEventListener('change', filterUsers);
    }
}

// Filter foods
function filterFoods() {
    const searchTerm = document.getElementById('search-food')?.value.toLowerCase() || '';
    const categoryFilter = document.getElementById('category-filter')?.value || '';
    const statusFilter = document.getElementById('status-filter')?.value || '';
    
    const tableBody = document.getElementById('food-table-body');
    if (!tableBody) return;

    const rows = tableBody.querySelectorAll('tr');
    
    rows.forEach(row => {
        const name = row.querySelector('.food-info h4')?.textContent.toLowerCase() || '';
        const category = row.querySelector('.category-badge')?.textContent.toLowerCase() || '';
        const status = row.querySelector('.status-badge')?.textContent.toLowerCase() || '';
        
        const matchesSearch = name.includes(searchTerm);
        const matchesCategory = !categoryFilter || category.includes(categoryFilter);
        const matchesStatus = !statusFilter || status.includes(statusFilter);
        
        if (matchesSearch && matchesCategory && matchesStatus) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Filter users
function filterUsers() {
    const searchTerm = document.getElementById('search-user')?.value.toLowerCase() || '';
    const roleFilter = document.getElementById('role-filter')?.value || '';
    const statusFilter = document.getElementById('status-filter')?.value || '';
    
    const tableBody = document.getElementById('user-table-body');
    if (!tableBody) return;

    const rows = tableBody.querySelectorAll('tr');
    
    rows.forEach(row => {
        const name = row.querySelector('.user-details h4')?.textContent.toLowerCase() || '';
        const email = row.querySelector('td:nth-child(2)')?.textContent.toLowerCase() || '';
        const role = row.querySelector('.role-badge')?.textContent.toLowerCase() || '';
        const status = row.querySelector('.status-badge')?.textContent.toLowerCase() || '';
        
        const matchesSearch = name.includes(searchTerm) || email.includes(searchTerm);
        const matchesRole = !roleFilter || role.includes(roleFilter);
        const matchesStatus = !statusFilter || status.includes(statusFilter);
        
        if (matchesSearch && matchesRole && matchesStatus) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// Handle add food form submission
function handleAddFood(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const newFood = {
        id: foods.length + 1,
        name: formData.get('foodName'),
        category: formData.get('category'),
        price: parseFloat(formData.get('price')),
        status: formData.get('status'),
        description: formData.get('description'),
        ingredients: formData.get('ingredients'),
        prepTime: parseInt(formData.get('prepTime')) || 0,
        calories: parseInt(formData.get('calories')) || 0,
        isFeatured: formData.get('isFeatured') === 'on',
        isVegetarian: formData.get('isVegetarian') === 'on',
        isVegan: formData.get('isVegan') === 'on',
        isGlutenFree: formData.get('isGlutenFree') === 'on'
    };

    // Add image if uploaded
    const imageFile = formData.get('image');
    if (imageFile && imageFile.size > 0) {
        newFood.image = URL.createObjectURL(imageFile);
    } else {
        newFood.image = 'https://via.placeholder.com/200x200';
    }

    foods.push(newFood);
    updateDashboardStats();
    
    // Show success modal
    showModal('successModal');
    
    // Reset form
    event.target.reset();
    removeImage();
}

// Handle edit food form submission
function handleEditFood(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const foodId = parseInt(formData.get('foodId'));
    
    const foodIndex = foods.findIndex(food => food.id === foodId);
    if (foodIndex !== -1) {
        foods[foodIndex] = {
            ...foods[foodIndex],
            name: formData.get('foodName'),
            category: formData.get('category'),
            price: parseFloat(formData.get('price')),
            status: formData.get('status'),
            description: formData.get('description'),
            ingredients: formData.get('ingredients'),
            prepTime: parseInt(formData.get('prepTime')) || 0,
            calories: parseInt(formData.get('calories')) || 0,
            isFeatured: formData.get('isFeatured') === 'on',
            isVegetarian: formData.get('isVegetarian') === 'on',
            isVegan: formData.get('isVegan') === 'on',
            isGlutenFree: formData.get('isGlutenFree') === 'on'
        };

        // Update image if new one uploaded
        const imageFile = formData.get('image');
        if (imageFile && imageFile.size > 0) {
            foods[foodIndex].image = URL.createObjectURL(imageFile);
        }
    }
    
    // Show success modal
    showModal('successModal');
}

// Handle edit user form submission
function handleEditUser(event) {
    event.preventDefault();
    
    const formData = new FormData(event.target);
    const userId = parseInt(formData.get('userId'));
    
    const userIndex = users.findIndex(user => user.id === userId);
    if (userIndex !== -1) {
        users[userIndex] = {
            ...users[userIndex],
            firstName: formData.get('firstName'),
            lastName: formData.get('lastName'),
            email: formData.get('email'),
            phone: formData.get('phone'),
            role: formData.get('role'),
            status: formData.get('status'),
            address: formData.get('address')
        };
    }
    
    // Close modal and refresh table
    closeModal('editUserModal');
    // In a real application, you would refresh the user table here
}

// Edit food function
function editFood(foodId) {
    window.location.href = `edit-food.aspx?id=${foodId}`;
}

// Delete food function
function deleteFood(foodId) {
    currentFoodId = foodId;
    showModal('deleteModal');
}

// Confirm delete food
function confirmDelete() {
    if (currentFoodId) {
        const foodIndex = foods.findIndex(food => food.id === currentFoodId);
        if (foodIndex !== -1) {
            foods.splice(foodIndex, 1);
            updateDashboardStats();
            
            // Remove row from table
            const tableBody = document.getElementById('food-table-body');
            if (tableBody) {
                const rows = tableBody.querySelectorAll('tr');
                rows.forEach(row => {
                    const editBtn = row.querySelector('button[onclick*="editFood(' + currentFoodId + ')"]');
                    if (editBtn) {
                        row.remove();
                    }
                });
            }
        }
    }
    closeModal('deleteModal');
    currentFoodId = null;
}

// View user function
function viewUser(userId) {
    const user = users.find(u => u.id === userId);
    if (user) {
        // Populate modal with user data
        document.getElementById('modal-user-name').textContent = `${user.firstName} ${user.lastName}`;
        document.getElementById('modal-user-email').textContent = user.email;
        document.getElementById('modal-user-id').textContent = `#${user.id.toString().padStart(4, '0')}`;
        document.getElementById('modal-user-phone').textContent = user.phone;
        document.getElementById('modal-user-join-date').textContent = user.joinDate;
        document.getElementById('modal-user-last-login').textContent = user.lastLogin;
        document.getElementById('modal-user-orders').textContent = user.totalOrders;
        document.getElementById('modal-user-spent').textContent = `$${user.totalSpent.toFixed(2)}`;
        document.getElementById('modal-user-address').textContent = user.address;
        
        // Update role and status badges
        const roleBadge = document.getElementById('modal-user-role');
        const statusBadge = document.getElementById('modal-user-status');
        
        roleBadge.textContent = user.role.charAt(0).toUpperCase() + user.role.slice(1);
        roleBadge.className = `role-badge ${user.role}`;
        
        statusBadge.textContent = user.status.charAt(0).toUpperCase() + user.status.slice(1);
        statusBadge.className = `status-badge ${user.status}`;
        
        showModal('userDetailsModal');
    }
}

// Edit user function
function editUser(userId) {
    const user = users.find(u => u.id === userId);
    if (user) {
        // Populate edit form with user data
        document.getElementById('edit-user-id').value = user.id;
        document.getElementById('edit-first-name').value = user.firstName;
        document.getElementById('edit-last-name').value = user.lastName;
        document.getElementById('edit-email').value = user.email;
        document.getElementById('edit-phone').value = user.phone;
        document.getElementById('edit-role').value = user.role;
        document.getElementById('edit-status').value = user.status;
        document.getElementById('edit-address').value = user.address;
        
        showModal('editUserModal');
    }
}

// Edit user from modal
function editUserFromModal() {
    const userId = parseInt(document.getElementById('modal-user-id').textContent.replace('#', ''));
    editUser(userId);
    closeModal('userDetailsModal');
}

// Toggle user status
function toggleUserStatus(userId) {
    const user = users.find(u => u.id === userId);
    if (user) {
        user.status = user.status === 'active' ? 'inactive' : 'active';
        
        // Update status badge in table
        const tableBody = document.getElementById('user-table-body');
        if (tableBody) {
            const rows = tableBody.querySelectorAll('tr');
            rows.forEach(row => {
                const editBtn = row.querySelector('button[onclick*="editUser(' + userId + ')"]');
                if (editBtn) {
                    const statusBadge = row.querySelector('.status-badge');
                    if (statusBadge) {
                        statusBadge.textContent = user.status.charAt(0).toUpperCase() + user.status.slice(1);
                        statusBadge.className = `status-badge ${user.status}`;
                    }
                }
            });
        }
    }
}

// Delete user function
function deleteUser(userId) {
    currentUserId = userId;
    showModal('deleteUserModal');
}

// Confirm delete user
function confirmDeleteUser() {
    if (currentUserId) {
        const userIndex = users.findIndex(user => user.id === currentUserId);
        if (userIndex !== -1) {
            users.splice(userIndex, 1);
            updateDashboardStats();
            
            // Remove row from table
            const tableBody = document.getElementById('user-table-body');
            if (tableBody) {
                const rows = tableBody.querySelectorAll('tr');
                rows.forEach(row => {
                    const editBtn = row.querySelector('button[onclick*="editUser(' + currentUserId + ')"]');
                    if (editBtn) {
                        row.remove();
                    }
                });
            }
        }
    }
    closeModal('deleteUserModal');
    currentUserId = null;
}

// Export users function
function exportUsers() {
    const csvContent = "data:text/csv;charset=utf-8," + 
        "ID,First Name,Last Name,Email,Phone,Role,Status,Join Date,Last Login,Total Orders,Total Spent\n" +
        users.map(user => 
            `${user.id},${user.firstName},${user.lastName},${user.email},${user.phone},${user.role},${user.status},${user.joinDate},${user.lastLogin},${user.totalOrders},${user.totalSpent}`
        ).join("\n");
    
    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", "users_export.csv");
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

// Export data function
function exportData() {
    const data = {
        foods: foods,
        users: users,
        categories: categories,
        exportDate: new Date().toISOString()
    };
    
    const dataStr = JSON.stringify(data, null, 2);
    const dataBlob = new Blob([dataStr], {type: 'application/json'});
    const url = URL.createObjectURL(dataBlob);
    
    const link = document.createElement("a");
    link.href = url;
    link.download = `foodieexpress_data_${new Date().toISOString().split('T')[0]}.json`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
}

// Category Management Functions

// Edit category function
function editCategory(categoryId) {
    window.location.href = `edit-category.aspx?id=${categoryId}`;
}

// Delete category function
function deleteCategory(categoryId) {
    currentCategoryId = categoryId;
    showModal('deleteCategoryModal');
}

// Confirm delete category
function confirmDeleteCategory() {
    if (currentCategoryId) {
        const categoryIndex = categories.findIndex(cat => cat.id === currentCategoryId);
        if (categoryIndex !== -1) {
            // Check if category has food items
            const categoryFoods = foods.filter(food => food.category === categories[categoryIndex].slug);
            if (categoryFoods.length > 0) {
                showNotification('Cannot delete category with existing food items. Please move or delete the food items first.', 'error');
                closeModal('deleteCategoryModal');
                return;
            }
            
            categories.splice(categoryIndex, 1);
            
            // Remove category card from grid
            const categoryCard = document.querySelector(`[onclick*="editCategory(${currentCategoryId})"]`)?.closest('.category-card');
            if (categoryCard) {
                categoryCard.remove();
            }
            
            showNotification('Category deleted successfully!', 'success');
        }
    }
    closeModal('deleteCategoryModal');
    currentCategoryId = null;
}

// Filter categories
function filterCategories() {
    const searchTerm = document.getElementById('search-category')?.value.toLowerCase() || '';
    const statusFilter = document.getElementById('status-filter')?.value || '';
    
    const categoriesGrid = document.getElementById('categories-grid');
    const emptyState = document.getElementById('empty-state');
    if (!categoriesGrid) return;

    const cards = categoriesGrid.querySelectorAll('.category-card');
    let visibleCount = 0;
    
    cards.forEach(card => {
        const name = card.querySelector('.category-info h3')?.textContent.toLowerCase() || '';
        const description = card.querySelector('.category-info p')?.textContent.toLowerCase() || '';
        const status = card.querySelector('.status-badge')?.textContent.toLowerCase() || '';
        
        const matchesSearch = name.includes(searchTerm) || description.includes(searchTerm);
        const matchesStatus = !statusFilter || status.includes(statusFilter);
        
        if (matchesSearch && matchesStatus) {
            card.style.display = '';
            visibleCount++;
        } else {
            card.style.display = 'none';
        }
    });
    
    // Show/hide empty state
    if (emptyState) {
        if (visibleCount === 0) {
            emptyState.style.display = 'block';
            categoriesGrid.style.display = 'none';
        } else {
            emptyState.style.display = 'none';
            categoriesGrid.style.display = 'grid';
        }
    }
}

// Setup category search
function setupCategorySearch() {
    const searchInput = document.getElementById('search-category');
    if (searchInput) {
        searchInput.addEventListener('input', filterCategories);
    }

    const statusFilter = document.getElementById('status-filter');
    if (statusFilter && document.getElementById('categories-grid')) {
        statusFilter.addEventListener('change', filterCategories);
    }
}

// Update category food counts
function updateCategoryFoodCounts() {
    categories.forEach(category => {
        const foodCount = foods.filter(food => food.category === category.slug).length;
        category.foodCount = foodCount;
    });
}

// Get category by ID
function getCategoryById(id) {
    return categories.find(cat => cat.id === id);
}

// Get category by slug
function getCategoryBySlug(slug) {
    return categories.find(cat => cat.slug === slug);
}

// Validate category slug uniqueness
function isCategorySlugUnique(slug, excludeId = null) {
    return !categories.some(cat => cat.slug === slug && cat.id !== excludeId);
}

// Generate unique category slug
function generateUniqueCategorySlug(name, excludeId = null) {
    let baseSlug = name.toLowerCase()
        .replace(/[^a-z0-9\s-]/g, '')
        .replace(/\s+/g, '-')
        .replace(/-+/g, '-')
        .trim();
    
    let slug = baseSlug;
    let counter = 1;
    
    while (!isCategorySlugUnique(slug, excludeId)) {
        slug = `${baseSlug}-${counter}`;
        counter++;
    }
    
    return slug;
}

// Modal functions
function showModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'flex';
        modal.classList.add('show');
        document.body.style.overflow = 'hidden';
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'none';
        modal.classList.remove('show');
        document.body.style.overflow = 'auto';
    }
}

// Pagination functions
function previousPage() {
    // Implement pagination logic here
    console.log('Previous page');
}

function nextPage() {
    // Implement pagination logic here
    console.log('Next page');
}

// Close modals when clicking outside
document.addEventListener('click', function(event) {
    if (event.target.classList.contains('modal')) {
        closeModal(event.target.id);
    }
});

// Close modals with Escape key
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        const openModals = document.querySelectorAll('.modal.show');
        openModals.forEach(modal => {
            closeModal(modal.id);
        });
    }
});

// Utility functions
function formatCurrency(amount) {
    return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD'
    }).format(amount);
}

function formatDate(dateString) {
    return new Date(dateString).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
    });
}

function formatDateTime(dateTimeString) {
    return new Date(dateTimeString).toLocaleString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

// Initialize tooltips (if using a tooltip library)
function initializeTooltips() {
    const tooltipElements = document.querySelectorAll('[title]');
    tooltipElements.forEach(element => {
        element.addEventListener('mouseenter', function() {
            // Tooltip implementation would go here
        });
    });
}

// Form validation helpers
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validatePhone(phone) {
    const re = /^[\+]?[1-9][\d]{0,15}$/;
    return re.test(phone.replace(/[\s\-\(\)]/g, ''));
}

function validatePrice(price) {
    return !isNaN(price) && price > 0;
}

// Notification system
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 1rem 1.5rem;
        border-radius: 5px;
        color: white;
        font-weight: 500;
        z-index: 3000;
        animation: slideInRight 0.3s ease;
    `;
    
    switch (type) {
        case 'success':
            notification.style.backgroundColor = '#28a745';
            break;
        case 'error':
            notification.style.backgroundColor = '#dc3545';
            break;
        case 'warning':
            notification.style.backgroundColor = '#ffc107';
            notification.style.color = '#212529';
            break;
        default:
            notification.style.backgroundColor = '#17a2b8';
    }
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Add CSS animations for notifications
const style = document.createElement('style');
style.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(100%);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);