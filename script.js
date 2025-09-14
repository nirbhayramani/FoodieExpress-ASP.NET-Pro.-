// DOM Elements
const hamburger = document.querySelector('.hamburger');
const navMenu = document.querySelector('.nav-menu');
const navLinks = document.querySelectorAll('.nav-menu a');
const filterBtns = document.querySelectorAll('.filter-btn');
const menuItems = document.querySelectorAll('.menu-item');
const contactForm = document.getElementById('contactForm');
const newsletterForm = document.querySelector('.newsletter-form');

// Mobile Navigation Toggle
if (hamburger) {
    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        navMenu.classList.toggle('active');
        document.body.classList.toggle('no-scroll');
    });
}

// Close mobile menu when clicking on a link
navLinks.forEach(link => {
    link.addEventListener('click', () => {
        if (hamburger) {
            hamburger.classList.remove('active');
            navMenu.classList.remove('active');
            document.body.classList.remove('no-scroll');
        }
    });
});

// Menu filtering functionality (for menu page)
if (filterBtns.length > 0) {
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all buttons
            filterBtns.forEach(b => b.classList.remove('active'));
            // Add active class to clicked button
            btn.classList.add('active');
            
            const filterValue = btn.getAttribute('data-filter');
            
            menuItems.forEach(item => {
                const category = item.getAttribute('data-category');
                
                if (filterValue === 'all' || category === filterValue) {
                    item.style.display = 'block';
                    item.style.animation = 'fadeInUp 0.6s ease forwards';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    });
}

// Add to cart functionality
const addToCartBtns = document.querySelectorAll('.btn-primary');
addToCartBtns.forEach(btn => {
    if (btn.textContent.includes('Add to Cart')) {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            
            // Check if user is logged in
            const isLoggedIn = checkUserLoginStatus();
            
            if (!isLoggedIn) {
                showLoginModal();
                return;
            }
            
            const menuItem = btn.closest('.menu-item, .popular-item');
            if (menuItem) {
                const itemName = menuItem.querySelector('h3').textContent;
                const itemDescription = menuItem.querySelector('p').textContent;
                const itemPrice = parseFloat(menuItem.querySelector('.price').textContent.replace('$', ''));
                const itemImage = menuItem.querySelector('img').src;
                
                // Get or create cart from localStorage
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                
                // Check if item already exists in cart
                const existingItemIndex = cart.findIndex(item => item.name === itemName);
                
                if (existingItemIndex !== -1) {
                    // Increment quantity if item already exists
                    cart[existingItemIndex].quantity += 1;
                } else {
                    // Add new item to cart
                    cart.push({
                        name: itemName,
                        description: itemDescription,
                        price: itemPrice,
                        quantity: 1,
                        image: itemImage
                    });
                }
                
                // Save cart to localStorage
                localStorage.setItem('cart', JSON.stringify(cart));
                
                // Animation for button click
                btn.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    btn.style.transform = 'scale(1)';
                }, 150);
                
                // Update cart count
                const cartCount = document.querySelector('.cart-count');
                if (cartCount) {
                    const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
                    cartCount.textContent = totalItems;
                }
                
                // Show notification with cart info
                showNotification(`${itemName} added to cart! <br><small>Cart now has ${totalItems} item${totalItems !== 1 ? 's' : ''}</small>`, 'cart');
            }
        });
    }
});

// Function to check if user is logged in
function checkUserLoginStatus() {
    const user = JSON.parse(localStorage.getItem('currentUser')) || null;
    return user !== null;
}

// Function to show login modal
function showLoginModal() {
    // Create modal HTML
    const modalHTML = `
        <div id="loginModal" class="login-modal">
            <div class="login-modal-content">
                <div class="login-modal-header">
                    <h2>Login Required</h2>
                    <button class="close-modal" onclick="closeLoginModal()">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="login-modal-body">
                    <p>You need to be logged in to add items to your cart.</p>
                    <div class="login-modal-buttons">
                        <a href="login.aspx" class="btn btn-primary">Login</a>
                        <a href="register.aspx" class="btn btn-primary">Register</a>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    // Add modal to page
    document.body.insertAdjacentHTML('beforeend', modalHTML);
    
    // Add modal styles if not already present
    if (!document.getElementById('loginModalStyles')) {
        const modalStyles = document.createElement('style');
        modalStyles.id = 'loginModalStyles';
        modalStyles.textContent = `
            .login-modal {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 10000;
                animation: fadeIn 0.3s ease;
            }
            
            .login-modal-content {
                background: white;
                border-radius: 15px;
                padding: 0;
                max-width: 400px;
                width: 90%;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
                animation: slideIn 0.3s ease;
            }
            
            .login-modal-header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 20px 25px;
                border-radius: 15px 15px 0 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .login-modal-header h2 {
                margin: 0;
                font-size: 1.5rem;
                font-weight: 600;
            }
            
            .close-modal {
                background: none;
                height: 30px;
                width: 30px;
                border: none;
                color: white;
                font-size: 1.2rem;
                cursor: pointer;
                padding: 5px;
                border-radius: 50%;
                transition: background 0.3s ease;
            }
            
            .close-modal:hover {
                background: rgba(255, 255, 255, 0.2);
            }
            
            .login-modal-body {
                padding: 30px 25px;
                text-align: center;
            }
            
            .login-modal-body p {
                color: #666;
                margin-bottom: 25px;
                font-size: 1.1rem;
            }
            
            .login-modal-buttons {
                display: flex;
                gap: 15px;
                justify-content: center;
            }
            
            .login-modal-buttons .btn {
                padding: 12px 25px;
                font-weight: 600;
                text-decoration: none;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
            
            @keyframes slideIn {
                from { 
                    opacity: 0;
                    transform: translateY(-50px) scale(0.9);
                }
                to { 
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }
            
            @media (max-width: 480px) {
                .login-modal-buttons {
                    flex-direction: column;
                }
                
                .login-modal-content {
                    width: 95%;
                }
            }
            
            /* Logged in user styles */
            .user-logged-in {
                display: flex !important;
                align-items: center;
                gap: 10px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
                color: white !important;
                border: none !important;
                padding: 8px 15px !important;
                border-radius: 25px !important;
                font-weight: 500 !important;
            }
            
            .logout-btn {
                background: rgba(255, 255, 255, 0.2);
                border: none;
                color: white;
                padding: 5px 8px;
                border-radius: 50%;
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 0.9rem;
            }
            
            .logout-btn:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: scale(1.1);
            }
        `;
        document.head.appendChild(modalStyles);
    }
    
    // Close modal when clicking outside
    document.getElementById('loginModal').addEventListener('click', (e) => {
        if (e.target.id === 'loginModal') {
            closeLoginModal();
        }
    });
    
    // Close modal with Escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeLoginModal();
        }
    });
}

// Function to close login modal
function closeLoginModal() {
    const modal = document.getElementById('loginModal');
    if (modal) {
        modal.style.animation = 'fadeOut 0.3s ease';
        setTimeout(() => {
            modal.remove();
        }, 300);
    }
}

// Function to logout user
function logoutUser() {
    localStorage.removeItem('currentUser');
    localStorage.removeItem('cart'); // Clear cart on logout
    updateCartCount(); // Reset cart count in nav
    showNotification('Logged out successfully', 'success');
    setTimeout(() => {
        window.location.reload();
    }, 600); // Slightly longer delay to allow DOM update
}

// Function to update navigation based on login status
function updateNavigation() {
    const loginBtn = document.querySelector('.nav-actions .btn-sm');
    const isLoggedIn = checkUserLoginStatus();
    
    if (isLoggedIn) {
        const user = JSON.parse(localStorage.getItem('currentUser'));
        const userName = user.firstName || user.email.split('@')[0];
        
        if (loginBtn) {
            loginBtn.innerHTML = `
                <span>Hi, ${userName}</span>
                <button onclick="logoutUser()" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                </button>
            `;
            loginBtn.href = '#';
            loginBtn.classList.add('user-logged-in');
        }
    } else {
        if (loginBtn) {
            loginBtn.innerHTML = 'Login';
            loginBtn.href = 'login.aspx';
            loginBtn.classList.remove('user-logged-in');
        }
    }
}

// Contact form submission
if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const formData = new FormData(contactForm);
        const name = formData.get('name');
        const email = formData.get('email');
        const message = formData.get('message');
        
        if (name && email && message) {
            showNotification('Message sent successfully.');
            contactForm.reset();
        } else {
            showNotification('Please fill in all fields.', 'error');
        }
    });
}

// Newsletter form submission
if (newsletterForm) {
    newsletterForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const email = newsletterForm.querySelector('input[type="email"]').value;
        
        if (email) {
            showNotification('Thank you for subscribing!');
            newsletterForm.reset();
        } else {
            showNotification('Please enter a valid email.', 'error');
        }
    });
}

// Enhanced Notification function
function showNotification(message, type = 'success') {
    // Remove any existing notifications to prevent stacking
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notification => {
        notification.classList.add('hide');
        setTimeout(() => notification.remove(), 300);
    });

    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    
    // Get icon based on type
    const getIcon = (type) => {
        switch(type) {
            case 'success':
                return '<i class="fas fa-check"></i>';
            case 'error':
                return '<i class="fas fa-exclamation-triangle"></i>';
            case 'warning':
                return '<i class="fas fa-exclamation-circle"></i>';
            case 'info':
                return '<i class="fas fa-info-circle"></i>';
            case 'cart':
                return '<i class="fas fa-shopping-cart"></i>';
            default:
                return '<i class="fas fa-bell"></i>';
        }
    };

    // Create notification structure
    notification.innerHTML = `
        <div class="notification-icon">
            ${getIcon(type)}
        </div>
        <div class="notification-content">
            ${message}
        </div>
        <button class="notification-close" onclick="this.parentElement.remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
    
    // Add to page
    document.body.appendChild(notification);
    
    // Trigger animation
    setTimeout(() => {
        notification.classList.add('show');
    }, 10);
    
    // Auto remove after 4 seconds (unless it's an error, then 6 seconds)
    const duration = type === 'error' ? 6000 : 4000;
    setTimeout(() => {
        if (notification.parentElement) {
            notification.classList.add('hide');
            setTimeout(() => {
                if (notification.parentElement) {
                    notification.remove();
                }
            }, 300);
        }
    }, duration);
    
    // Add click to dismiss functionality
    notification.addEventListener('click', (e) => {
        if (!e.target.closest('.notification-close')) {
            notification.classList.add('hide');
            setTimeout(() => {
                if (notification.parentElement) {
                    notification.remove();
                }
            }, 300);
        }
    });
}

// Animations for scroll
document.addEventListener('DOMContentLoaded', () => {
    // Add animation classes to elements
    const animatedElements = document.querySelectorAll('.feature-card, .popular-item, .menu-item, .team-member, .value-card, .offer-card');
    
    if (animatedElements.length > 0) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = 1;
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.1 });
        
        animatedElements.forEach(element => {
            element.style.opacity = 0;
            element.style.transform = 'translateY(20px)';
            element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(element);
        });
    }
    
    // Set active nav link based on current page
    const currentPage = window.location.pathname.split('/').pop();
    navLinks.forEach(link => {
        const linkPage = link.getAttribute('href');
        if (linkPage === currentPage || (currentPage === '' && linkPage === 'index.aspx')) {
            link.classList.add('active');
        }
    });
    
    // Update cart count on page load
    updateCartCount();
    
    // Update navigation based on login status
    updateNavigation();
});

// Function to update cart count
function updateCartCount() {
    const cartCount = document.querySelector('.cart-count');
    if (cartCount) {
        const cart = JSON.parse(localStorage.getItem('cart')) || [];
        const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
        cartCount.textContent = totalItems;
    }
}

// Define animations
document.head.insertAdjacentHTML('beforeend', `
<style>
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    @keyframes fadeInLeft {
        from {
            opacity: 0;
            transform: translateX(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }
    
    @keyframes fadeInRight {
        from {
            opacity: 0;
            transform: translateX(20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }
    
    @keyframes fadeOut {
        from {
            opacity: 1;
            transform: translateY(0);
        }
        to {
            opacity: 0;
            transform: translateY(-20px);
        }
    }
    
    .no-scroll {
        overflow: hidden;
    }
</style>
`);