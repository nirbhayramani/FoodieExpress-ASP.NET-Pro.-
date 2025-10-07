// Wishlist Functionality
document.addEventListener('DOMContentLoaded', function() {
    // Initialize wishlist from localStorage
    let wishlist = JSON.parse(localStorage.getItem('wishlist')) || [];
    updateWishlistCount();

    // Add event listeners to wishlist buttons
    const wishlistBtns = document.querySelectorAll('.wishlist-btn');
    wishlistBtns.forEach(btn => {
        // Set initial state
        const itemId = btn.dataset.id;
        if (isInWishlist(itemId)) {
            btn.classList.add('active');
        }

        // Add click event
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const itemId = this.dataset.id;
            const itemName = this.dataset.name;
            const itemPrice = this.dataset.price;
            const itemImg = this.dataset.img;
            
            if (isInWishlist(itemId)) {
                // Remove from wishlist
                this.classList.add('removing');
                setTimeout(() => {
                    this.classList.remove('active', 'removing');
                    removeFromWishlist(itemId);
                }, 800);
            } else {
                // Add to wishlist
                this.classList.add('active');
                addToWishlist({
                    id: itemId,
                    name: itemName,
                    price: itemPrice,
                    img: itemImg
                });
            }
        });
    });

    // Check if an item is in wishlist
    function isInWishlist(id) {
        return wishlist.some(item => item.id === id);
    }

    // Add item to wishlist
    function addToWishlist(item) {
        if (!isInWishlist(item.id)) {
            wishlist.push(item);
            saveWishlist();
            updateWishlistCount();
        }
    }

    // Remove item from wishlist
    function removeFromWishlist(id) {
        wishlist = wishlist.filter(item => item.id !== id);
        saveWishlist();
        updateWishlistCount();
        
        // If on wishlist page, remove the item from display with animation
        if (window.location.pathname.includes('wishlist.html')) {
            const itemElement = document.querySelector(`.wishlist-item[data-id="${id}"]`);
            if (itemElement) {
                itemElement.classList.add('removing');
                setTimeout(() => {
                    itemElement.remove();
                    checkEmptyWishlist();
                }, 800); // Match animation duration in CSS
            }
        }
    }

    // Save wishlist to localStorage
    function saveWishlist() {
        localStorage.setItem('wishlist', JSON.stringify(wishlist));
    }

    // Update wishlist count in navigation
    function updateWishlistCount() {
        const wishlistCount = document.querySelector('.wishlist-count');
        if (wishlistCount) {
            wishlistCount.textContent = wishlist.length;
        }
    }

    // Function removed

    // Check if wishlist is empty (for wishlist page)
    function checkEmptyWishlist() {
        if (window.location.pathname.includes('wishlist.html')) {
            const wishlistGrid = document.querySelector('.wishlist-grid');
            if (wishlistGrid && wishlistGrid.children.length === 0) {
                const emptyWishlist = document.createElement('div');
                emptyWishlist.className = 'empty-wishlist';
                emptyWishlist.innerHTML = `
                    <i class="fas fa-heart-broken"></i>
                    <h2>Your wishlist is empty</h2>
                    <p>Add items to your wishlist to save them for later</p>
                    <a href="menu.html" class="btn btn-primary">Browse Menu</a>
                `;
                wishlistGrid.parentNode.replaceChild(emptyWishlist, wishlistGrid);
            }
        }
    }

    // Initialize wishlist page if we're on it
    if (window.location.pathname.includes('wishlist.html')) {
        renderWishlistItems();
    }

    // Render wishlist items on wishlist page
    function renderWishlistItems() {
        const wishlistGrid = document.querySelector('.wishlist-grid');
        if (!wishlistGrid) return;

        if (wishlist.length === 0) {
            checkEmptyWishlist();
            return;
        }

        wishlist.forEach(item => {
            const wishlistItem = document.createElement('div');
            wishlistItem.className = 'wishlist-item';
            wishlistItem.dataset.id = item.id;
            
            wishlistItem.innerHTML = `
                <div class="wishlist-item-image">
                    <img src="${item.img}" alt="${item.name}">
                    <button class="wishlist-btn active" data-id="${item.id}" data-name="${item.name}">
                        <i class="fas fa-heart"></i>
                    </button>
                </div>
                <div class="wishlist-item-content">
                    <h3>${item.name}</h3>
                    <div class="wishlist-item-footer">
                        <span class="price">$${item.price}</span>
                        <button class="btn btn-primary add-to-cart-btn" data-id="${item.id}">Add to Cart</button>
                    </div>
                </div>
            `;
            
            wishlistGrid.appendChild(wishlistItem);
            
            // Add event listener to the newly created wishlist button
            const wishlistBtn = wishlistItem.querySelector('.wishlist-btn');
            wishlistBtn.addEventListener('click', function() {
                const itemId = this.dataset.id;
                const itemName = this.dataset.name;
                
                this.classList.add('removing');
                setTimeout(() => {
                    removeFromWishlist(itemId);
                }, 800);
            });
        });
    }
});