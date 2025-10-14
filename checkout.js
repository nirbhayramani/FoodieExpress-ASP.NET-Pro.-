// checkout.js

// Checkout functionality
class Checkout {
  constructor() {
    this.cart = JSON.parse(localStorage.getItem("cart")) || [];
    this.deliveryFee = 2.99;
    this.taxRate = 0.08; // 8% tax
    this.discount = 0;
    this.currentSection = "shipping";
    this.init();
  }

  init() {
    this.updateOrderSummary();
    this.displayCartItems();
    this.bindEvents();
  }

  bindEvents() {
    // Navigation between sections
    document.getElementById("toPaymentBtn").addEventListener("click", () => {
      this.validateShippingInfo() && this.showSection("payment");
    });

    document.getElementById("backToShippingBtn").addEventListener("click", () => {
      this.showSection("shipping");
    });

    document.getElementById("toReviewBtn").addEventListener("click", () => {
      this.validatePaymentInfo() && this.showSection("review");
    });

    document.getElementById("backToPaymentBtn").addEventListener("click", () => {
      this.showSection("payment");
    });

    // Card number formatting (groups of 4 digits)
    const cardNumberInput = document.getElementById("cardNumber");
    if (cardNumberInput) {
      cardNumberInput.addEventListener("input", (e) => {
        let value = e.target.value.replace(/\D/g, '');
        let formattedValue = '';
        
        for (let i = 0; i < value.length; i++) {
          if (i > 0 && i % 4 === 0) {
            formattedValue += ' ';
          }
          formattedValue += value[i];
        }
        
        // Limit to 16 digits (19 characters with spaces)
        if (formattedValue.length > 19) {
          formattedValue = formattedValue.substring(0, 19);
        }
        
        e.target.value = formattedValue;
      });
    }
    
    // Expiry date validation (must be future date)
    const expiryInput = document.getElementById("expiry");
    if (expiryInput) {
      expiryInput.addEventListener("input", (e) => {
        let value = e.target.value.replace(/\D/g, '');
        
        // Format as MM/YY
        if (value.length > 0) {
          let month = value.substring(0, 2);
          let year = value.substring(2, 4);
          
          // Validate month (01-12)
          if (month.length === 1 && parseInt(month) > 1) {
            month = '0' + month;
          } else if (parseInt(month) > 12) {
            month = '12';
          } else if (parseInt(month) === 0) {
            month = '01';
          }
          
          if (value.length > 2) {
            e.target.value = month + '/' + year;
          } else {
            e.target.value = month;
          }
          
          // Validate expiry date is in the future
          if (month.length === 2 && year.length === 2) {
            const currentDate = new Date();
            const currentYear = currentDate.getFullYear() % 100; // Get last 2 digits
            const currentMonth = currentDate.getMonth() + 1; // 1-12
            
            const expMonth = parseInt(month);
            const expYear = parseInt(year);
            
            // Check if date is in the past
            if (expYear < currentYear || (expYear === currentYear && expMonth < currentMonth)) {
              expiryInput.setCustomValidity('Expiry date must be in the future');
            } else {
              expiryInput.setCustomValidity('');
            }
          }
        }
      });
      
      // Format on blur to ensure MM/YY format
      expiryInput.addEventListener("blur", (e) => {
        const value = e.target.value.replace(/\D/g, '');
        if (value.length === 3) {
          e.target.value = '0' + value[0] + '/' + value.substring(1);
        } else if (value.length === 4) {
          e.target.value = value.substring(0, 2) + '/' + value.substring(2);
        }
      });
    }

    // Payment method toggle
    document.querySelectorAll('input[name="paymentMethod"]').forEach((radio) => {
      radio.addEventListener("change", (e) => {
        const creditCardForm = document.getElementById("creditCardForm");
        const paypalForm = document.getElementById("paypalForm");
        
        if (e.target.value === "creditCard") {
          creditCardForm.style.display = "block";
          paypalForm.style.display = "none";
        } else {
          creditCardForm.style.display = "none";
          paypalForm.style.display = "block";
        }
      });
    });

    // Edit buttons in review section
    document.querySelectorAll(".edit-btn").forEach((btn) => {
      btn.addEventListener("click", (e) => {
        const section = e.target.dataset.section;
        this.showSection(section);
      });
    });

    // Form submission
    //document.getElementById("checkoutForm").addEventListener("submit", () => {
    //  e.preventDefault();
    //  this.placeOrder();
    //});

    // Modal close button
    document.querySelector(".close-modal").addEventListener("click", () => {
      document.getElementById("confirmationModal").classList.remove("active");
    });
  }

  showSection(section) {
    // Update progress steps
    const steps = document.querySelectorAll(".progress-step");
    const lines = document.querySelectorAll(".progress-line");
    
    steps.forEach((step, index) => {
      step.classList.remove("active");
      if (lines[index]) lines[index].classList.remove("active");
    });
    
    let activeIndex = 0;
    if (section === "payment") activeIndex = 1;
    if (section === "review") activeIndex = 2;
    
    for (let i = 0; i <= activeIndex; i++) {
      steps[i].classList.add("active");
      if (i < activeIndex && lines[i]) lines[i].classList.add("active");
    }
    
    // Hide all sections and show the active one
    document.querySelectorAll(".form-section").forEach((section) => {
      section.classList.remove("active");
    });
    
    document.getElementById(`${section}Section`).classList.add("active");
    this.currentSection = section;
    
    // If showing review section, populate review data
    if (section === "review") {
      this.populateReviewData();
    }
  }

  validateShippingInfo() {
    const requiredFields = [
      "fullName",
      "email",
      "phone",
      "address",
      "city",
      "state",
      "zipCode"
    ];
    
    let isValid = true;
    
    requiredFields.forEach((field) => {
      const input = document.getElementById(field);
      if (!input.value.trim()) {
        input.style.borderColor = "#ff3860";
        isValid = false;
      } else {
        input.style.borderColor = "#ddd";
      }
    });
    
    // Basic email validation
    const email = document.getElementById("email");
    if (email.value && !this.isValidEmail(email.value)) {
      email.style.borderColor = "#ff3860";
      isValid = false;
    }
    
    return isValid;
  }

  validatePaymentInfo() {
    const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    
    if (paymentMethod === "paypal") {
      return true; // PayPal will handle validation
    }
    
    const requiredFields = ["cardName", "cardNumber", "expiryDate", "cvv"];
    let isValid = true;
    
    requiredFields.forEach((field) => {
      const input = document.getElementById(field);
      if (!input.value.trim()) {
        input.style.borderColor = "#ff3860";
        isValid = false;
      } else {
        input.style.borderColor = "#ddd";
      }
    });
    
    // Basic card validation (simplified for demo)
    const cardNumber = document.getElementById("cardNumber");
    if (cardNumber.value && !this.isValidCardNumber(cardNumber.value)) {
      cardNumber.style.borderColor = "#ff3860";
      isValid = false;
    }
    
    return isValid;
  }

  isValidEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
  }

  isValidCardNumber(cardNumber) {
    // Simple validation for demo purposes
    const cleaned = cardNumber.replace(/\s+/g, "");
    return cleaned.length >= 13 && cleaned.length <= 19 && !isNaN(cleaned);
  }

  populateReviewData() {
    // Shipping info
    const shippingReview = document.getElementById("shippingReview");
    shippingReview.innerHTML = `
      <p>${document.getElementById("fullName").value}</p>
      <p>${document.getElementById("email").value} | ${document.getElementById("phone").value}</p>
      <p>${document.getElementById("address").value}</p>
      <p>${document.getElementById("city").value}, ${document.getElementById("state").value} ${document.getElementById("zipCode").value}</p>
    `;
    
    // Payment info
    const paymentReview = document.getElementById("paymentReview");
    const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    
    if (paymentMethod === "creditCard") {
      const cardNumber = document.getElementById("cardNumber").value;
      const last4 = cardNumber.slice(-4);
      paymentReview.innerHTML = `
        <p>Credit Card</p>
        <p>Card ending in ${last4}</p>
      `;
    } else {
      paymentReview.innerHTML = `<p>PayPal</p>`;
    }
    
    // Order items
    //const orderItemsReview = document.getElementById("orderItemsReview");
    //if (this.cart.length === 0) {
    //  orderItemsReview.innerHTML = "<p>Your cart is empty</p>";
    //} else {
    //  let itemsHtml = "";
    //  this.cart.forEach((item) => {
    //    itemsHtml += `
    //      <div class="review-item">
    //        <p>${item.quantity} x ${item.name} - $${(item.price * item.quantity).toFixed(2)}</p>
    //      </div>
    //    `;
    //  });
    //  orderItemsReview.innerHTML = itemsHtml;
    //}
  }

  displayCartItems() {
    const checkoutItems = document.getElementById("checkout-items");
    
    //if (this.cart.length === 0) {
    //  checkoutItems.innerHTML = "<p>Your cart is empty</p>";
    //  //window.location.href = "cart.aspx"; // Redirect back to cart if empty
    //  return;
    //}
    
    let itemsHtml = "";
    this.cart.forEach((item) => {
      itemsHtml += `
        <div class="checkout-item">
          <div class="checkout-item-image">
            <img src="${item.image}" alt="${item.name}">
          </div>
          <div class="checkout-item-details">
            <div class="checkout-item-name">${item.name}</div>
            <div class="checkout-item-price">$${item.price.toFixed(2)}</div>
            <div class="checkout-item-quantity">Qty: ${item.quantity}</div>
          </div>
        </div>
      `;
    });
    
    checkoutItems.innerHTML = itemsHtml;
    
    // Update cart count in navbar
    const cartCount = document.querySelector(".cart-count");
    if (cartCount) {
      const totalItems = this.cart.reduce((total, item) => total + item.quantity, 0);
      cartCount.textContent = totalItems;
    }
  }

  updateOrderSummary() {
    if (this.cart.length === 0) {
      //document.getElementById("subtotal").textContent = "$0.00";
      //document.getElementById("tax").textContent = "$0.00";
      //document.getElementById("total").textContent = "$0.00";
      return;
    }
    
    const subtotal = this.cart.reduce((total, item) => total + item.price * item.quantity, 0);
    const tax = subtotal * this.taxRate;
    const total = subtotal + tax + this.deliveryFee - this.discount;
    
    document.getElementById("subtotal").textContent = `$${subtotal.toFixed(2)}`;
    document.getElementById("deliveryFee").textContent = `$${this.deliveryFee.toFixed(2)}`;
    document.getElementById("tax").textContent = `$${tax.toFixed(2)}`;
    
    if (this.discount > 0) {
      document.getElementById("discountRow").style.display = "flex";
      document.getElementById("discount").textContent = `-$${this.discount.toFixed(2)}`;
    } else {
      document.getElementById("discountRow").style.display = "none";
    }
    
    document.getElementById("total").textContent = `$${total.toFixed(2)}`;
  }

  placeOrder() {
    // Generate order number
    const orderNumber = "ORD-" + Math.floor(100000 + Math.random() * 900000);
    
    // Calculate estimated delivery time (30-45 minutes from now)
    const now = new Date();
    const deliveryTime = new Date(now.getTime() + (30 + Math.floor(Math.random() * 15)) * 60000);
    const formattedDeliveryTime = deliveryTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    
    // Set confirmation details
    document.getElementById("orderNumber").textContent = orderNumber;
    document.getElementById("estimatedDelivery").textContent = `Today, ${formattedDeliveryTime}`;
    document.getElementById("confirmationEmail").textContent = document.getElementById("email").value;
    
    // Show confirmation modal
    document.getElementById("confirmationModal").classList.add("active");
    
    // Clear cart
    localStorage.removeItem("cart");
    
    // Save order to order history (simplified)
    const order = {
      id: orderNumber,
      date: new Date().toISOString(),
      items: this.cart,
      total: parseFloat(document.getElementById("total").textContent.replace("$", "")),
      status: "Processing"
    };
    
    const orderHistory = JSON.parse(localStorage.getItem("orderHistory")) || [];
    orderHistory.push(order);
    localStorage.setItem("orderHistory", JSON.stringify(orderHistory));
  }
}

// Initialize checkout
document.addEventListener("DOMContentLoaded", () => {
  new Checkout();
});