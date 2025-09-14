// cart.js

// Cart functionality
class Cart {
  constructor() {
    this.items = JSON.parse(localStorage.getItem("cart")) || [];
    this.deliveryFee = 2.99;
    this.taxRate = 0.08; // 8% tax
    this.init();
  }

  init() {
    this.updateCartDisplay();
    this.bindEvents();
  }

  bindEvents() {
    // Delivery option change
    document.querySelectorAll('input[name="delivery"]').forEach((radio) => {
      radio.addEventListener("change", (e) => {
        this.deliveryFee = e.target.value === "express" ? 4.99 : 2.99;
        this.updateOrderSummary();
      });
    });

    // Promo code
    document.getElementById("applyPromo").addEventListener("click", () => {
      this.applyPromoCode();
    });

    // Checkout button
    document.getElementById("checkoutBtn").addEventListener("click", () => {
      this.proceedToCheckout();
    });
  }

  updateCartDisplay() {
    const emptyCart = document.getElementById("emptyCart");
    const cartItemsList = document.getElementById("cartItemsList");
    const cartCount = document.querySelector(".cart-count");
    const itemCount = document.querySelector(".cart-item-count");

    if (this.items.length === 0) {
      emptyCart.style.display = "block";
      cartItemsList.style.display = "none";
      cartCount.textContent = "0";
      itemCount.textContent = "0 items";
      document.getElementById("checkoutBtn").disabled = true;
    } else {
      emptyCart.style.display = "none";
      cartItemsList.style.display = "block";
      this.renderCartItems();
      this.updateOrderSummary();
    }
  }

  renderCartItems() {
    const cartItemsList = document.getElementById("cartItemsList");
    const cartCount = document.querySelector(".cart-count");
    const itemCount = document.querySelector(".cart-item-count");

    cartItemsList.innerHTML = "";
    let totalItems = 0;

    this.items.forEach((item, index) => {
      totalItems += item.quantity;
      const cartItem = this.createCartItemElement(item, index);
      cartItemsList.appendChild(cartItem);
    });

    cartCount.textContent = totalItems;
    itemCount.textContent = `${this.items.length} item${
      this.items.length !== 1 ? "s" : ""
    }`;
  }

  createCartItemElement(item, index) {
    const cartItem = document.createElement("div");
    cartItem.className = "cart-item";
    cartItem.innerHTML = `
                    <div class="cart-item-image">
                        <img src="${item.image}" alt="${item.name}">
                    </div>
                    <div class="cart-item-details">
                        <div class="cart-item-name">${item.name}</div>
                        <div class="cart-item-description">${
                          item.description
                        }</div>
                        <div class="cart-item-price">$${(
                          item.price * item.quantity
                        ).toFixed(2)}</div>
                    </div>
                    <div class="cart-item-controls">
                        <div class="quantity-controls">
                            <button class="quantity-btn" onclick="cart.updateQuantity(${index}, -1)" ${
      item.quantity <= 1 ? "disabled" : ""
    }>-</button>
                            <span class="quantity-display">${
                              item.quantity
                            }</span>
                            <button class="quantity-btn" onclick="cart.updateQuantity(${index}, 1)">+</button>
                        </div>
                        <button class="remove-item" onclick="cart.removeItem(${index})">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                `;
    return cartItem;
  }

  updateQuantity(index, change) {
    const newQuantity = this.items[index].quantity + change;
    if (newQuantity > 0) {
      this.items[index].quantity = newQuantity;
    } else {
      this.removeItem(index);
      return;
    }
    this.saveCart();
    this.updateCartDisplay();
  }

  removeItem(index) {
    const removedItem = this.items[index];
    this.items.splice(index, 1);
    this.saveCart();
    this.updateCartDisplay();
    showNotification(`${removedItem.name} removed from cart`, "cart");
  }

  updateOrderSummary() {
    const subtotal = this.items.reduce(
      (sum, item) => sum + item.price * item.quantity,
      0
    );
    const tax = subtotal * this.taxRate;
    const total = subtotal + this.deliveryFee + tax;

    document.getElementById("subtotal").textContent = `$${subtotal.toFixed(2)}`;
    document.getElementById(
      "deliveryFee"
    ).textContent = `$${this.deliveryFee.toFixed(2)}`;
    document.getElementById("tax").textContent = `$${tax.toFixed(2)}`;
    document.getElementById("total").textContent = `$${total.toFixed(2)}`;

    // Enable checkout button if cart has items
    document.getElementById("checkoutBtn").disabled = this.items.length === 0;
  }

  applyPromoCode() {
    const promoCode = document
      .getElementById("promoCode")
      .value.trim()
      .toUpperCase();

    if (promoCode === "WELCOME10") {
      showNotification("🎉 Promo code applied! 10% discount added to your order.", "success");
      // Apply 10% discount logic here
    } else if (promoCode === "") {
      showNotification("Please enter a promo code to apply discount.", "warning");
    } else {
      showNotification("Invalid promo code. Please try again.", "error");
    }
  }

  proceedToCheckout() {
    if (this.items.length === 0) {
      showNotification("Your cart is empty. Add some delicious items first!", "warning");
      return;
    }

    showNotification("🚀 Redirecting to checkout...", "info");
    // Redirect to checkout page or show checkout modal
    setTimeout(() => {
      alert("Checkout functionality would be implemented here.");
    }, 1000);
  }

  saveCart() {
    localStorage.setItem("cart", JSON.stringify(this.items));
  }
}

// Initialize cart when page loads
let cart;
document.addEventListener("DOMContentLoaded", () => {
  // Check if user is logged in before showing cart
  const isLoggedIn = checkUserLoginStatus();

  if (!isLoggedIn) {
    showNotification("Please log in to view your cart<br><a href='login.aspx' style='color: #fff; text-decoration: underline; font-weight: bold;'>Click here to login</a>", "error");
    setTimeout(() => {
      window.location.href = "login.aspx";
    }, 3000);
    return;
  }

  cart = new Cart();
});

// Function to check if user is logged in (from script.js)
function checkUserLoginStatus() {
  const user = JSON.parse(localStorage.getItem("currentUser")) || null;
  return user !== null;
}

// Add some sample items to cart for demonstration
function addSampleItems() {
  const sampleItems = [
    {
      name: "Gourmet Burger",
      description: "Angus beef patty with aged cheddar and special sauce",
      price: 19.99,
      quantity: 1,
      image: "images/Classic Burger.jpg",
    },
    {
      name: "Margherita Pizza",
      description: "Fresh mozzarella, tomato sauce, and basil",
      price: 16.99,
      quantity: 2,
      image: "images/Margherita Pizza.jpg",
    },
    {
      name: "Classic Tiramisu",
      description: "Layers of coffee-soaked ladyfingers and mascarpone cream",
      price: 9.99,
      quantity: 1,
      image: "images/Chocolate Cake.png",
    },
  ];

  localStorage.setItem("cart", JSON.stringify(sampleItems));
  location.reload();
}

// Uncomment the line below to add sample items for testing
// addSampleItems();
