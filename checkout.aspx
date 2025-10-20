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
            <div class="checkout-layout">
                <!-- Checkout Form -->
                <div class="checkout-form-container">
                    <form id="checkoutForm">
                        <div class="form-section active">
                            <h2>Checkout</h2>

                            <div class="form-group">
                                <label for="address">Shipping Address</label>
                                <input type="text" id="address" name="address" required>
                            </div>

                            <div class="form-group">
                                <label for="zipCode">Zip Code</label>
                                <input type="text" id="zipCode" name="zipCode" required>
                            </div>

                            <div class="payment-methods">
                                <div>
                                    <h3>Payment Method</h3>
                                </div>
                                <br />
                                <div>
                                    <div class="payment-method">
                                        <input type="radio" id="cod" name="paymentMethod" value="cod" checked>
                                        <label for="cod">Cash on Delivery (COD)</label>
                                    </div>
                                    <div class="payment-method">
                                        <input type="radio" id="upi" name="paymentMethod" value="upi">
                                        <label for="upi">UPI (GPay, PhonePe, PayTm)</label>
                                    </div>
                                    <div class="payment-method">
                                        <input type="radio" id="card" name="paymentMethod" value="card">
                                        <label for="card">Card (Visa/MasterCard)</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions">
                                <a href="cart.html" class="btn btn-secondary">Back to Cart</a>
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
                <span id="subtotal">₹0.00</span>
            </div>
            <div class="summary-item">
                <span>Delivery Fee</span>
                <span id="deliveryFee">₹2.99</span>
            </div>
            <div class="summary-item">
                <span>Tax</span>
                <span id="tax">₹0.00</span>
            </div>
            <div class="summary-item discount" id="discountRow" style="display: none;">
                <span>Discount</span>
                <span id="discount">-₹0.00</span>
            </div>
            <div class="summary-divider"></div>
            <div class="summary-item total">
                <span>Total</span>
                <span id="total">₹0.00</span>
            </div>
        </div>
    </div>
</div>--%>


                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>

                        <div id="checkout-items" class="checkout-items">
                            <%--<asp:DataList ID="DtLsOrdSum" runat="server" RepeatLayout="Flow" CssClass="cart-items-datalist">
                <ItemTemplate>
                    <div class="datalist-cart-item">
                        <div class="item-info">
                            <div class="item-name"><%# Eval("C_Fod_Name") %></div>
                            <div class="item-meta">
                                <span class="item-price">₹<%# Eval("C_Fod_Price") %></span><span class="item-quantity">Qty: <%# Eval("C_Fod_Quantity") %></span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <div class="item-separator-light"></div>
                </SeparatorTemplate>
            </asp:DataList>--%>


                            <asp:DataList ID="DtLsOrdSum" runat="server">
                                <itemtemplate>
                                    <div class="checkout-item">
                                        <div class="checkout-item-image">
                                            <asp:Image ID="FodImg" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' />
                                        </div>
                                        <div class="checkout-item-details">
                                            <div class="checkout-item-name">
                                                <asp:Label ID="FodName" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                                            </div>
                                            <div class="checkout-item-price">
                                                ₹<asp:Label ID="FodPrice" runat="server" Text='<%# Eval("C_Fod_Price") %>'></asp:Label>
                                            </div>
                                            <div class="checkout-item-quantity">
                                                Qty:
                                <asp:Label ID="FodQuantity" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </itemtemplate>
                            </asp:DataList>

                            <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty"
                                CssClass="empty-cart-message" Visible="false"></asp:Label>
                        </div>

                        <div class="summary-divider"></div>

                        <div class="summary-items">
                            <div class="summary-item">
                                <span>Subtotal</span>
                                <%--<span id="subtotal">₹0.00</span>--%>
                                <asp:Label ID="lblSubTot" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span>
                                <%--<span id="deliveryFee">₹2.99</span>--%>
                                <asp:Label ID="lblDelFee" runat="server" Text="₹100.00"></asp:Label>
                            </div>
                            <div class="summary-item">
                                <span>Goods and Services Tax</span>
                                <%--<span id="tax">₹0.00</span>--%>
                                <asp:Label ID="lblTax" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                            <div class="summary-item total">
                                <span>Grand Total</span>
                                <%--<span id="total">₹2.99</span>--%>
                                <asp:Label ID="lblTot" runat="server" Text="₹0.00"></asp:Label>
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
            <span class="close-modal">&times;</span>
            <div class="confirmation-header">
                <div class="success-checkmark">
                    <div class="check-icon">
                        <span class="icon-line line-tip"></span>
                        <span class="icon-line line-long"></span>
                    </div>
                </div>
                <h2>Order Confirmed!</h2>
                <p>Your order has been successfully placed.</p>
            </div>

            <div class="confirmation-details">
                <div class="confirmation-item">
                    <span class="label">Order Number:</span>
                    <span id="orderNumber" class="value"></span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Estimated Delivery:</span>
                    <span id="estimatedDelivery" class="value"></span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Payment Method:</span>
                    <span id="paymentMethod" class="value"></span>
                </div>
            </div>

            <div class="confirmation-actions">
                <a href="index.html" class="btn btn-primary">Continue Shopping</a>
                <a href="orders.html" class="btn btn-secondary">View Orders</a>
                <%--<a href="#" id="generateBill" class="btn btn-tertiary">Generate Bill</a>--%>
            </div>
        </div>
    </div>
    <style>
        .payment-method {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
            position: relative;
            cursor: pointer;
            padding: 10px 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }
    </style>
    <script src="checkout.js"></script>
    <link rel="stylesheet" href="checkout.css">
    
    <%--<style>
        /* DataList Specific Styles */
        .cart-items-datalist {
            width: 100% !important;
            display: block !important;
        }

        .datalist-cart-item {
            display: flex !important;
            align-items: flex-start !important;
            padding: 12px 0 !important;
            border-bottom: 1px solid #f0f0f0 !important;
            width: 100% !important;
        }

            .datalist-cart-item:last-child {
                border-bottom: none !important;
            }

        .item-info {
            flex: 1 !important;
            min-width: 0 !important;
        }

        .item-name {
            font-weight: 500 !important;
            color: #2d3748 !important;
            font-size: 14px !important;
            margin-bottom: 6px !important;
            line-height: 1.4 !important;
        }

        .item-meta {
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
        }

        .item-price {
            color: #e53e3e !important;
            font-weight: 600 !important;
            font-size: 14px !important;
        }

        .item-quantity {
            color: #718096 !important;
            font-size: 12px !important;
            background: #f7fafc !important;
            padding: 2px 8px !important;
            border-radius: 12px !important;
            border: 1px solid #e2e8f0 !important;
        }

        .item-separator-light {
            height: 1px !important;
            background: linear-gradient(90deg, transparent, #e2e8f0, transparent) !important;
            margin: 8px 0 !important;
        }

        /* Ensure proper spacing in checkout items container */
        .checkout-items {
            max-height: 400px;
            overflow-y: auto;
            padding-right: 8px;
            margin-bottom: 20px;
        }

            /* Custom scrollbar for checkout items */
            .checkout-items::-webkit-scrollbar {
                width: 4px;
            }

            .checkout-items::-webkit-scrollbar-track {
                background: #f1f1f1;
                border-radius: 10px;
            }

            .checkout-items::-webkit-scrollbar-thumb {
                background: #cbd5e0;
                border-radius: 10px;
            }

                .checkout-items::-webkit-scrollbar-thumb:hover {
                    background: #a0aec0;
                }

        /* Summary Card Styling */
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

        .summary-divider {
            height: 1px;
            background: #e2e8f0;
            margin: 20px 0;
        }

        .summary-items {
            space-y: 12px;
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

        .empty-cart-message {
            text-align: center;
            color: #a0aec0;
            padding: 40px 20px;
            font-style: italic;
            font-size: 1.1rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .summary-card {
                padding: 16px;
                margin-top: 20px;
            }

            .datalist-cart-item {
                padding: 10px 0 !important;
            }

            .item-name {
                font-size: 13px !important;
            }

            .item-price {
                font-size: 13px !important;
            }

            .item-quantity {
                font-size: 11px !important;
                padding: 1px 6px !important;
            }
        }
    </style>--%>



    <style>
        .checkout-items {
            margin-bottom: 20px;
            max-height: 300px;
            overflow-y: auto;
        }

        .checkout-item {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .checkout-item-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            overflow: hidden;
            margin-right: 15px;
        }

        .checkout-item-details {
            flex-grow: 1;
        }

        .checkout-item-name {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .checkout-item-price {
            color: #666;
            font-size: 0.9rem;
        }

        .checkout-item-quantity {
            color: #888;
            font-size: 0.85rem;
        }
    </style>
</asp:Content>

