<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Checkout Hero Section -->
    <section class="checkout-hero">
        <div class="container">
            <div class="checkout-hero-content">
                <h1 class="checkout-hero-title">Checkout</h1>
                <p class="checkout-hero-subtitle">Complete your order</p>
            </div>
        </div>
    </section>

    <!-- Checkout Section -->
    <section class="checkout-section">
        <div class="container">
            <div class="checkout-progress">
                <div class="progress-step active">
                    <div class="step-number">1</div>
                    <div class="step-label">Shipping</div>
                </div>
                <div class="progress-line"></div>
                <div class="progress-step">
                    <div class="step-number">2</div>
                    <div class="step-label">Payment</div>
                </div>
                <div class="progress-line"></div>
                <div class="progress-step">
                    <div class="step-number">3</div>
                    <div class="step-label">Confirmation</div>
                </div>
            </div>

            <div class="checkout-layout">
                <!-- Checkout Form -->
                <div class="checkout-form-container">
                    <form id="checkoutForm">
                        <!-- Shipping Information -->
                        <div id="shippingSection" class="form-section active">
                            <h2>Shipping Information</h2>

                            <div class="form-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" id="fullName" name="fullName" required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="tel" id="phone" name="phone" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required>
                                </div>
                                <div class="form-group">
                                    <label for="state">State</label>
                                    <input type="text" id="state" name="state" required>
                                </div>
                                <div class="form-group">
                                    <label for="zipCode">Zip Code</label>
                                    <input type="text" id="zipCode" name="zipCode" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="deliveryInstructions">Delivery Instructions (Optional)</label>
                                <textarea id="deliveryInstructions" name="deliveryInstructions" rows="3"></textarea>
                            </div>

                            <div class="form-actions">
                                <a href="cart.aspx" class="btn btn-secondary">Back to Cart</a>
                                <button type="button" id="toPaymentBtn" class="btn btn-primary">Continue to Payment</button>
                            </div>
                        </div>

                        <!-- Payment Information -->
                        <div id="paymentSection" class="form-section">
                            <h2>Payment Information</h2>

                            <div class="payment-methods">
                                <div class="payment-method">
                                    <input type="radio" id="creditCard" name="paymentMethod" value="creditCard" checked>
                                    <label for="creditCard">Credit Card</label>
                                </div>
                                <div class="payment-method">
                                    <input type="radio" id="paypal" name="paymentMethod" value="paypal">
                                    <label for="paypal">PayPal</label>
                                </div>
                            </div>

                            <div id="creditCardForm">
                                <div class="form-group">
                                    <label for="cardName">Name on Card</label>
                                    <input type="text" id="cardName" name="cardName" required>
                                </div>

                                <div class="form-group">
                                    <label for="cardNumber">Card Number</label>
                                    <input type="text" id="cardNumber" name="cardNumber" placeholder="XXXX XXXX XXXX XXXX" required>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="expiryDate">Expiry Date</label>
                                        <input type="date" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" name="cvv" placeholder="XXX" required>
                                    </div>
                                </div>
                            </div>

                            <div id="paypalForm" style="display: none;">
                                <p>You will be redirected to PayPal to complete your payment after reviewing your order.</p>
                            </div>

                            <div class="form-actions">
                                <button type="button" id="backToShippingBtn" class="btn btn-secondary">Back to Shipping</button>
                                <button type="button" id="toReviewBtn" class="btn btn-primary">Review Order</button>
                            </div>
                        </div>

                        <!-- Order Review -->
                        <div id="reviewSection" class="form-section">
                            <h2>Review Your Order</h2>

                            <div class="review-section">
                                <h3>Shipping Information</h3>
                                <div id="shippingReview" class="review-details"></div>
                                <button type="button" class="edit-btn" data-section="shipping">Edit</button>
                            </div>

                            <div class="review-section">
                                <h3>Payment Method</h3>
                                <div id="paymentReview" class="review-details"></div>
                                <button type="button" class="edit-btn" data-section="payment">Edit</button>
                            </div>

                            <div class="review-section">
                                <h3>Order Items</h3>
                                <div id="orderItemsReview" class="review-details"></div>
                            </div>

                            <div class="form-actions">
                                <button type="button" id="backToPaymentBtn" class="btn btn-secondary">Back to Payment</button>
                                <button type="submit" id="placeOrderBtn" class="btn btn-primary">Place Order</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Order Summary without css-->
                <%--<div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>
                        <h1>Nirbhay</h1>
                        <div id="checkout-items" class="checkout-items">
                            <!-- Order items will be dynamically added here -->
                            <asp:DataList ID="DtLsOrdSum" runat="server">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' Height="25px" Width="25px" />
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("C_Fod_Price") %>'></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>

                        <div class="summary-divider"></div>

                        <div class="summary-items">
                            <div class="summary-item">
                                <span>Subtotal</span>
                                <span id="subtotal">$0.00</span>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span>
                                <span id="deliveryFee">$2.99</span>
                            </div>
                            <div class="summary-item">
                                <span>Tax</span>
                                <span id="tax">$0.00</span>
                            </div>
                            <div class="summary-item discount" id="discountRow" style="display: none;">
                                <span>Discount</span>
                                <span id="discount">-$0.00</span>
                            </div>
                            <div class="summary-divider"></div>
                            <div class="summary-item total">
                                <span>Total</span>
                                <span id="total">$0.00</span>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <!-- Order Summary with css-->
                <%--<div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>
                        <div id="checkout-items" class="checkout-items">
                            <asp:DataList ID="DtLsOrdSum" runat="server" CssClass="cart-items-list" RepeatLayout="Flow">
                                <ItemTemplate>
                                    <div class="cart-item">
                                        <div class="item-image">
                                            <asp:Image ID="Image1" runat="server"
                                                ImageUrl='<%# Eval("C_Fod_Img") %>'
                                                CssClass="item-img"
                                                AlternateText="Food Image" />
                                        </div>
                                        <div class="item-details">
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("C_Fod_Name") %>'
                                                CssClass="item-name"></asp:Label>
                                            <div class="item-price-quantity">
                                                <asp:Label ID="Label2" runat="server"
                                                    Text='<%# "₹" + Eval("C_Fod_Price") %>'
                                                    CssClass="item-price"></asp:Label>
                                                <span class="quantity">Qty: 
                                    <asp:Label ID="Label3" runat="server"
                                        Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <div class="item-separator"></div>
                                </SeparatorTemplate>
                            </asp:DataList>

                            <!-- Fallback message if cart is empty -->
                            <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty"
                                CssClass="empty-cart-message" Visible="false"></asp:Label>
                        </div>

                        <!-- Rest of your summary code remains the same -->
                        <div class="summary-divider"></div>
                        <!-- ... existing summary items code ... -->
                    </div>
                </div>--%>
                <!-- Order Summary with updated css-->
                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>
                        <div id="checkout-items" class="checkout-items">

                            <asp:DataList ID="DtLsOrdSum" runat="server" RepeatLayout="Table" RepeatDirection="Vertical"
                                CssClass="cart-items-list" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <div class="cart-item">
                                        <div class="item-image">
                                            <asp:Image ID="Image1" runat="server"
                                                ImageUrl='<%# Eval("C_Fod_Img") %>'
                                                CssClass="item-img"
                                                AlternateText='<%# Eval("C_Fod_Name") %>'
                                                Width="60" Height="60" />
                                        </div>
                                        <div class="item-details">
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("C_Fod_Name") %>'
                                                CssClass="item-name"></asp:Label>
                                            <div class="item-price-quantity">
                                                <asp:Label ID="Label2" runat="server"
                                                    Text='<%# "$" + Eval("C_Fod_Price") %>'
                                                    CssClass="item-price"></asp:Label>
                                                <span class="quantity">Qty:
                                                    <asp:Label ID="Label3" runat="server"
                                                        Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <hr class="item-separator" />
                                </SeparatorTemplate>
                            </asp:DataList>

                            <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty"
                                CssClass="empty-cart-message" Visible="false"></asp:Label>
                        </div>

                        <div class="summary-divider"></div>

                        <div class="summary-items">
                            <div class="summary-item">
                                <span>Subtotal</span>
                                <span id="subtotal">$0.00</span>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span>
                                <span id="deliveryFee">$2.99</span>
                            </div>
                            <div class="summary-item">
                                <span>Tax</span>
                                <span id="tax">$0.00</span>
                            </div>
                            <div class="summary-item total">
                                <span>Total</span>
                                <span id="total">$2.99</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Order Confirmation Modal -->
    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Order Placed Successfully!</h2>
                <span class="close-modal">&times;</span>
            </div>
            <div class="modal-body">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <p>Thank you for your order. Your order has been received and is being processed.</p>
                <div class="order-info">
                    <p><strong>Order Number:</strong> <span id="orderNumber"></span></p>
                    <p><strong>Estimated Delivery:</strong> <span id="estimatedDelivery"></span></p>
                </div>
                <p>A confirmation email has been sent to <span id="confirmationEmail"></span>.</p>
            </div>
            <div class="modal-footer">
                <a href="index.html" class="btn btn-secondary">Return to Home</a>
                <a href="order-history.html" class="btn btn-primary">View Order History</a>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="checkout.css" />
    <script src="checkout.js"></script>
    <style>
        /* DataList Styling */
        .cart-items-list {
            width: 100%;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .item-image {
            margin-right: 12px;
        }

        .item-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 8px;
        }

        .item-details {
            flex: 1;
        }

        .item-name {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 4px;
        }

        .item-price-quantity {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .item-price {
            color: #e74c3c;
            font-weight: 600;
        }

        .quantity {
            color: #666;
            font-size: 14px;
        }

        .item-separator {
            height: 1px;
            background-color: #eee;
            margin: 8px 0;
        }

        .empty-cart-message {
            text-align: center;
            color: #666;
            padding: 20px;
            font-style: italic;
        }

        /* Ensure DataList items are visible */
        #checkout-items {
            min-height: 100px;
        }

        .summary-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }




        /* DataList Container */
        .cart-items-list {
            width: 100% !important;
            display: block !important;
        }

        /* Cart Item Styling */
        .cart-item {
            display: flex !important;
            align-items: center !important;
            padding: 15px 0 !important;
            border-bottom: 1px solid #eee !important;
            width: 100% !important;
        }

        .item-image {
            margin-right: 15px !important;
            flex-shrink: 0 !important;
        }

        .item-img {
            width: 60px !important;
            height: 60px !important;
            object-fit: cover !important;
            border-radius: 8px !important;
            border: 1px solid #e0e0e0 !important;
        }

        .item-details {
            flex: 1 !important;
            min-width: 0 !important;
        }

        .item-name {
            font-weight: 600 !important;
            color: #333 !important;
            font-size: 16px !important;
            margin-bottom: 5px !important;
            display: block !important;
        }

        .item-price-quantity {
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
        }

        .item-price {
            color: #e74c3c !important;
            font-weight: 600 !important;
            font-size: 16px !important;
        }

        .quantity {
            color: #666 !important;
            font-size: 14px !important;
            background: #f8f9fa !important;
            padding: 4px 12px !important;
            border-radius: 20px !important;
            border: 1px solid #dee2e6 !important;
        }

        .item-separator {
            height: 1px !important;
            background-color: #eee !important;
            margin: 10px 0 !important;
            border: none !important;
        }

        /* Ensure DataList items are visible */
        #DtLsOrdSum {
            display: block !important;
            visibility: visible !important;
        }

            #DtLsOrdSum tr {
                display: block !important;
            }

            #DtLsOrdSum td {
                display: block !important;
                padding: 0 !important;
                border: none !important;
            }

        /* Summary Card */
        .summary-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 1px solid #e0e0e0;
        }

            .summary-card h3 {
                margin-bottom: 20px;
                font-size: 1.5rem;
                font-weight: 600;
                color: #2d3748;
                border-bottom: 2px solid #f7fafc;
                padding-bottom: 12px;
            }

        /* Empty Cart Message */
        .empty-cart-message {
            text-align: center;
            color: #a0aec0;
            padding: 40px 20px;
            font-style: italic;
            font-size: 1.1rem;
        }

        /* Summary Items */
        .summary-divider {
            height: 1px;
            background: #e2e8f0;
            margin: 20px 0;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            color: #4a5568;
            font-size: 0.95rem;
        }

            .summary-item.total {
                font-weight: 700;
                font-size: 1.2rem;
                color: #2d3748;
                padding: 16px 0 0 0;
                border-top: 2px solid #e2e8f0;
                margin-top: 8px;
            }
    </style>
</asp:Content>

