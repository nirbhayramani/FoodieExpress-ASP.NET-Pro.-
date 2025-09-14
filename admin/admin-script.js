// Admin Panel JavaScript

// Admin theme removed

document.addEventListener('DOMContentLoaded', function() {
    // Guard admin pages behind login
    enforceAdminAuth();

    // Initialize admin functionality
    initializeAdminPanel();
    
    // Initialize charts if on dashboard
    if (document.querySelector('.stats-grid')) {
        initializeDashboardCharts();
    }
    
    // Initialize tables
    initializeTables();
    
    // Initialize forms
    initializeForms();
});

function enforceAdminAuth() {
    try {
        const isAdminPath = /\badmin\//i.test(window.location.pathname);
        if (isAdminPath) {
            const fileName = window.location.pathname.split('/').pop();
            if (fileName === 'admin-login.aspx') {
                return;
            }
            const currentUser = localStorage.getItem('currentUser');
            if (!currentUser) {
                // Redirect unauthenticated users to login
                window.location.replace('admin-login.aspx');
            }
        }
    } catch (e) {
        // fail safe: do nothing
    }
}

function initializeAdminPanel() {
    // Mobile menu toggle
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');
    
    if (hamburger && navMenu) {
        hamburger.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            hamburger.classList.toggle('active');
        });
    }
    
    // Logout functionality
    const logoutBtn = document.querySelector('.nav-actions .btn-danger');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            // Logout behavior
            if (window.AdminPanel && typeof AdminPanel.showNotification === 'function') {
                AdminPanel.showNotification('Logged out successfully', 'success');
            }
            // Clear login state
            try { localStorage.removeItem('currentUser'); } catch (e) {}
            setTimeout(() => {
                window.location.href = 'admin-login.aspx';
            }, 1500);
        });
    }
    
    // Active navigation highlighting
    highlightActiveNav();
}

function initializeDashboardCharts() {
    // Simulate real-time data updates
    updateStats();
    
    // Update stats every 30 seconds
    setInterval(updateStats, 30000);
}

function updateStats() {
    // Simulate real-time data updates
    const statNumbers = document.querySelectorAll('.stat-number');
    
    statNumbers.forEach(stat => {
        const currentValue = parseInt(stat.textContent.replace(/[^\d]/g, ''));
        const newValue = currentValue + Math.floor(Math.random() * 5);
        
        // Animate number change
        animateNumber(stat, currentValue, newValue);
    });
}

function animateNumber(element, start, end) {
    const duration = 1000;
    const startTime = performance.now();
    
    function updateNumber(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        
        const current = Math.floor(start + (end - start) * progress);
        
        // Format number based on original format
        if (element.textContent.includes('$')) {
            element.textContent = '$' + current.toLocaleString();
        } else if (element.textContent.includes('.')) {
            element.textContent = (current / 10).toFixed(1);
        } else {
            element.textContent = current.toLocaleString();
        }
        
        if (progress < 1) {
            requestAnimationFrame(updateNumber);
        }
    }
    
    requestAnimationFrame(updateNumber);
}

function initializeTables() {
    // Add sorting functionality to tables
    const tables = document.querySelectorAll('.admin-table');
    
    tables.forEach(table => {
        const headers = table.querySelectorAll('th');
        
        headers.forEach((header, index) => {
            if (header.textContent.trim() !== 'Actions') {
                header.style.cursor = 'pointer';
                header.addEventListener('click', () => sortTable(table, index));
            }
        });
    });
    
    // Add search functionality
    addTableSearch();
}

function sortTable(table, columnIndex) {
    const tbody = table.querySelector('tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));
    
    const isAscending = table.getAttribute('data-sort-direction') !== 'asc';
    
    rows.sort((a, b) => {
        const aValue = a.cells[columnIndex].textContent.trim();
        const bValue = b.cells[columnIndex].textContent.trim();
        
        // Try to parse as numbers
        const aNum = parseFloat(aValue.replace(/[^\d.-]/g, ''));
        const bNum = parseFloat(bValue.replace(/[^\d.-]/g, ''));
        
        if (!isNaN(aNum) && !isNaN(bNum)) {
            return isAscending ? aNum - bNum : bNum - aNum;
        } else {
            return isAscending ? aValue.localeCompare(bValue) : bValue.localeCompare(aValue);
        }
    });
    
    // Clear tbody and append sorted rows
    tbody.innerHTML = '';
    rows.forEach(row => tbody.appendChild(row));
    
    // Update sort direction
    table.setAttribute('data-sort-direction', isAscending ? 'asc' : 'desc');
}

function addTableSearch() {
    const tables = document.querySelectorAll('.admin-table');
    
    tables.forEach(table => {
        const container = table.closest('.dashboard-card');
        if (container) {
            const header = container.querySelector('.card-header');
            if (header && !header.querySelector('.table-search')) {
                const searchBox = document.createElement('div');
                searchBox.className = 'table-search-container';
                searchBox.innerHTML = `
                    <input type="text" placeholder="Search..." class="table-search">
                `;
                header.appendChild(searchBox);
                
                const searchInput = searchBox.querySelector('.table-search');
                searchInput.addEventListener('input', (e) => {
                    filterTable(table, e.target.value);
                });
            }
        }
    });
}

function filterTable(table, searchTerm) {
    const tbody = table.querySelector('tbody');
    const rows = tbody.querySelectorAll('tr');
    
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        const matches = text.includes(searchTerm.toLowerCase());
        row.style.display = matches ? '' : 'none';
    });
}

function initializeForms() {
    // Form validation
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
            }
        });
    });
    
    // Real-time form validation
    const inputs = document.querySelectorAll('input, select, textarea');
    inputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateField(this);
        });
    });
}

function validateForm(form) {
    const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
    let isValid = true;
    
    inputs.forEach(input => {
        if (!validateField(input)) {
            isValid = false;
        }
    });
    
    return isValid;
}

function validateField(field) {
    const value = field.value.trim();
    const type = field.type;
    let isValid = true;
    let message = '';
    
    // Remove existing error
    removeFieldError(field);
    
    // Required field validation
    if (field.hasAttribute('required') && !value) {
        isValid = false;
        message = 'This field is required';
    }
    
    // Email validation
    if (type === 'email' && value) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(value)) {
            isValid = false;
            message = 'Please enter a valid email address';
        }
    }
    
    // Phone validation
    if (type === 'tel' && value) {
        const phoneRegex = /^[\+]?[^0-]\d{6,15}$/;
        if (!phoneRegex.test(value.replace(/[\s\-\(\)]/g, ''))) {
            isValid = false;
            message = 'Please enter a valid phone number';
        }
    }
    
    // Show error if invalid
    if (!isValid) {
        showFieldError(field, message);
    }
    
    return isValid;
}

function showFieldError(field, message) {
    field.classList.add('error');
    
    const errorDiv = document.createElement('div');
    errorDiv.className = 'field-error';
    errorDiv.textContent = message;
    
    field.parentNode.appendChild(errorDiv);
}

function removeFieldError(field) {
    field.classList.remove('error');
    
    const existingError = field.parentNode.querySelector('.field-error');
    if (existingError) {
        existingError.remove();
    }
}

function highlightActiveNav() {
    const currentPage = window.location.pathname.split('/').pop();
    const navLinks = document.querySelectorAll('.nav-menu a');
    
    navLinks.forEach(link => {
        link.classList.remove('active');
        const href = link.getAttribute('href');
        if (href === currentPage || (currentPage === '' && href === 'dashboard.aspx')) {
            link.classList.add('active');
        }
    });
}

// Utility functions
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <i class="fas fa-${getNotificationIcon(type)}"></i>
            <span>${message}</span>
            <button class="notification-close">&times;</button>
        </div>
    `;

    document.body.appendChild(notification);

    // Trigger enter animation
    requestAnimationFrame(() => {
        notification.classList.add('notification-show');
    });

    const animateExitAndRemove = () => {
        if (!notification.parentElement) return;
        notification.classList.remove('notification-show');
        notification.classList.add('notification-exit');
        const removeAfter = () => notification.parentElement && notification.remove();
        notification.addEventListener('transitionend', removeAfter, { once: true });
        // Fallback in case transitionend doesn't fire
        setTimeout(removeAfter, 400);
    };

    // Auto remove after 5 seconds with exit animation
    const autoTimer = setTimeout(animateExitAndRemove, 5000);

    // Manual close
    notification.querySelector('.notification-close').addEventListener('click', () => {
        clearTimeout(autoTimer);
        animateExitAndRemove();
    });
}

function getNotificationIcon(type) {
    const icons = {
        success: 'check-circle',
        error: 'exclamation-circle',
        warning: 'exclamation-triangle',
        info: 'info-circle'
    };
    return icons[type] || 'info-circle';
}

// Export functions for use in other admin pages
window.AdminPanel = {
    showNotification,
    validateForm,
    sortTable,
    filterTable
};