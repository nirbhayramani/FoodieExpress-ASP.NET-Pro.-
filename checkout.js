// checkout.js

// Checkout functionality
class Checkout {
    constructor() {
        this.cart = JSON.parse(localStorage.getItem("cart")) || [];
        this.deliveryFee = 2.99;
        this.taxRate = 0.08; // 8% tax
        this.discount = 0;
        this.init();
    }

    init() {
        this.updateOrderSummary();
        this.displayCartItems();
        this.bindEvents();
    }

    bindEvents() {
        // Form submission
        document.getElementById("checkoutForm").addEventListener("submit", (e) => {
            e.preventDefault();
            if (this.validateCheckoutInfo()) {
                this.placeOrder();
            }
        });

        // Modal close button
        document.querySelector(".close-modal").addEventListener("click", () => {
            document.getElementById("confirmationModal").classList.remove("active");
        });

        // Generate Bill button
        document.getElementById("generateBill").addEventListener("click", (e) => {
            e.preventDefault();
            this.generateBill();
        });
    }

    // Removed showSection method as we now have a single-page checkout

    validateCheckoutInfo() {
        const requiredFields = [
            "address",
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

        return isValid;
    }

    // Removed email and card validation methods as they're no longer needed

    displayCartItems() {
        const checkoutItems = document.getElementById("checkout-items");

        if (this.cart.length === 0) {
            checkoutItems.innerHTML = "<p>Your cart is empty</p>";
            window.location.href = "cart.aspx"; // Redirect back to cart if empty
            return;
        }

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
            document.getElementById("subtotal").textContent = "$0.00";
            document.getElementById("tax").textContent = "$0.00";
            document.getElementById("total").textContent = "$0.00";
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

        // Get payment method
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
        let paymentMethodText = "";
        if (paymentMethod === "cod") {
            paymentMethodText = "Cash on Delivery";
        } else if (paymentMethod === "upi") {
            paymentMethodText = "UPI Payment";
        } else if (paymentMethod === "card") {
            paymentMethodText = "Card Payment";
        }

        // Set payment method in confirmation
        document.getElementById("paymentMethod").textContent = paymentMethodText;

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
            status: "Processing",
            address: document.getElementById("address").value,
            zipCode: document.getElementById("zipCode").value,
            paymentMethod: paymentMethodText
        };

        // Save current order for bill generation
        localStorage.setItem("currentOrder", JSON.stringify(order));

        const orderHistory = JSON.parse(localStorage.getItem("orderHistory")) || [];
        orderHistory.push(order);
        localStorage.setItem("orderHistory", JSON.stringify(orderHistory));
    }

    generateBill() {
        // Get the current order from localStorage
        const order = JSON.parse(localStorage.getItem("currentOrder"));

        if (!order) {
            alert("Order information not found!");
            return;
        }

        // Create a new window for the bill
        const billWindow = window.open('', '_blank', 'width=800,height=600');

        // Generate bill HTML
        const billHTML = `
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Invoice - ${order.id}</title>
        <style>
          body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
          }
          .invoice-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
          }
          .invoice-title {
            font-size: 24px;
            color: #764ba2;
            margin-bottom: 5px;
          }
          .invoice-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
          }
          .invoice-details div {
            flex: 1;
          }
          .invoice-to {
            margin-bottom: 20px;
          }
          .invoice-items {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
          }
          .invoice-items th, .invoice-items td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            text-align: left;
          }
          .invoice-items th {
            background-color: #f8f9fa;
            font-weight: 600;
          }
          .invoice-total {
            text-align: right;
            margin-top: 20px;
            font-size: 18px;
            font-weight: 700;
          }
          .print-button {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
          }
          @media print {
            .print-button {
              display: none;
            }
          }
        </style>
      </head>
      <body>
        <div class="invoice-header">
          <h1 class="invoice-title">INVOICE</h1>
          <p>FoodieExpress</p>
        </div>
        
        <div class="invoice-details">
          <div>
            <h3>Invoice To:</h3>
            <div class="invoice-to">
              <p><strong>Address:</strong> ${order.shippingAddress}</p>
               <p><strong>Zip Code:</strong> ${order.zipCode}</p>
            </div>
          </div>
          <div>
            <h3>Invoice Details:</h3>
            <p><strong>Invoice Number:</strong> INV-${order.id.substring(4)}</p>
            <p><strong>Date:</strong> ${new Date(order.date).toLocaleDateString()}</p>
            <p><strong>Payment Method:</strong> ${this.getPaymentMethodText(order.paymentMethod)}</p>
          </div>
        </div>
        
        <table class="invoice-items">
          <thead>
            <tr>
              <th>Item</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            ${order.items.map(item => `
              <tr>
                <td>${item.name}</td>
                <td>${item.quantity}</td>
                <td>$${item.price.toFixed(2)}</td>
                <td>$${(item.price * item.quantity).toFixed(2)}</td>
              </tr>
            `).join('')}
          </tbody>
        </table>
        
        <div class="invoice-total">
          <p>Subtotal: $${(order.total / 1.08).toFixed(2)}</p>
          <p>Tax (8%): $${(order.total - (order.total / 1.08)).toFixed(2)}</p>
          <p>Total: $${order.total.toFixed(2)}</p>
        </div>
        <button class="print-button" onclick="window.print()">Print Invoice</button>
      </body>
      </html>
    `;

        // Write the bill HTML to the new window
        billWindow.document.open();
        billWindow.document.write(billHTML);
        billWindow.document.close();
    }
}

// Initialize checkout
document.addEventListener("DOMContentLoaded", () => {
    new Checkout();
});