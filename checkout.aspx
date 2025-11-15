<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Checkout Hero Section -->
    <section class="checkout-hero">
        <div class="container">
            <div class="checkout-hero-content">
                <h1 class="checkout-hero-title" style="padding-top: 90px;">Checkout</h1>
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
                    <div class="form-section active">
                        <h2>Checkout</h2>

                        <div class="form-group">
                            <label for="txtShipAdd">Shipping Address</label>
                            <asp:TextBox ID="txtShipAdd" runat="server" placeholder="12B, Anay Apartment, Civil Lines, Delhi" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter shipping address" ControlToValidate="txtShipAdd" Style="color: red;"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="txtZipCod">Zip Code</label>
                            <asp:TextBox ID="txtZipCod" runat="server" placeholder="110054" TextMode="Number" MaxLength="6" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter zip-code for address" ControlToValidate="txtZipCod" Style="color: red;"></asp:RequiredFieldValidator>
                        </div>

                        <div class="payment-methods">
                            <div>
                                <h3>Payment Method</h3>
                            </div>
                            <asp:RadioButtonList ID="rblPayMeth" runat="server" Width="369px" CssClass="payment-radio-list">
                                <asp:ListItem Value="Cash on Delivery (COD)" Selected="True">Cash on Delivery (COD)</asp:ListItem>
                                <asp:ListItem Value="UPI (GPay/PhonePe/PayTm)">UPI (GPay, PhonePe, PayTm)</asp:ListItem>
                                <asp:ListItem Value="Card (Visa/MasterCard)">Card (Visa/MasterCard)</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="form-actions">
                            <a href="cart.aspx" class="btn btn-secondary">Back to Cart</a>
                            <asp:Button ID="btnPlcOrd" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="btnPlcOrd_Click" OnClientClick="return validateAndShowModal();" />
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>

                        <div id="checkout-items" class="checkout-items">
                            <asp:DataList ID="DtLsOrdSum" runat="server">
                                <ItemTemplate>
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
                                </ItemTemplate>
                            </asp:DataList>

                            <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty"
                                CssClass="empty-cart-message" Visible="false"></asp:Label>
                        </div>

                        <div class="summary-divider"></div>

                        <div class="summary-items">
                            <div class="summary-item">
                                <span>Subtotal</span>
                                <asp:Label ID="lblSubTot" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span>
                                <asp:Label ID="lblDelFee" runat="server" Text="₹100.00"></asp:Label>
                            </div>
                            <div class="summary-item">
                                <span>Goods and Services Tax</span>
                                <asp:Label ID="lblTax" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                            <div class="summary-item total">
                                <span>Grand Total</span>
                                <asp:Label ID="lblTot" runat="server" Text="₹0.00"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Order Confirmation Modal -->
    -<div id="confirmationModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close-modal" onclick="closeModal()">&times;</span>
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
                    <span id="modalOrderNumber" class="value">ORD-<%= DateTime.Now.ToString("HHmmss") %></span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Estimated Delivery:</span>
                    <span id="modalDelivery" class="value">Approximately 30-45 minutes</span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Payment Method:</span>
                    <span id="modalPaymentMethod" class="value"></span>
                </div>
                <div class="confirmation-item">
                    <span class="label">Shipping Address:</span>
                    <span id="modalShippingAddress" class="value"></span>
                </div>
            </div>

            <div class="confirmation-actions">
                <a href="index.aspx" class="btn btn-primary">Continue Shopping</a>
                <a href="order-history.aspx" class="btn btn-secondary">View Orders</a>
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

        .payment-radio-list {
            margin-top: 10px;
        }

            .payment-radio-list label {
                margin-left: 8px;
                cursor: pointer;
            }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 30px;
            border-radius: 12px;
            width: 90%;
            max-width: 500px;
            position: relative;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .close-modal {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            line-height: 1;
        }

            .close-modal:hover {
                color: #000;
            }

        .confirmation-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .success-checkmark {
            margin: 0 auto 20px;
            width: 80px;
            height: 80px;
        }

        .check-icon {
            width: 80px;
            height: 80px;
            position: relative;
            border-radius: 50%;
            box-sizing: content-box;
            border: 4px solid #4CAF50;
        }

        .icon-line {
            height: 5px;
            background-color: #4CAF50;
            display: block;
            border-radius: 2px;
            position: absolute;
            z-index: 10;
        }

        .line-tip {
            top: 46px;
            left: 14px;
            width: 25px;
            transform: rotate(45deg);
        }

        .line-long {
            top: 38px;
            right: 8px;
            width: 47px;
            transform: rotate(-45deg);
        }

        .confirmation-details {
            margin: 25px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .confirmation-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e9ecef;
        }

            .confirmation-item:last-child {
                margin-bottom: 0;
                padding-bottom: 0;
                border-bottom: none;
            }

            .confirmation-item .label {
                font-weight: 600;
                color: #495057;
            }

            .confirmation-item .value {
                color: #6c757d;
                text-align: right;
            }

        .confirmation-actions {
            display: flex;
            gap: 12px;
            justify-content: center;
            flex-wrap: wrap;
        }

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

            .checkout-item-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
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
    <script>
        function validateAndShowModal() {
            // Validate form
            var address = document.getElementById('<%= txtShipAdd.ClientID %>');
            var zipCode = document.getElementById('<%= txtZipCod.ClientID %>');
            var paymentMethod = document.querySelector('#<%= rblPayMeth.ClientID %> input:checked');

            var isValid = true;

            //  Validate address
            if (!address.value.trim()) {
                address.style.borderColor = 'red';
                isValid = false;
            } else {
                address.style.borderColor = '';
            }

            //  Validate zip code
            if (!zipCode.value.trim() || zipCode.value.length !== 6) {
                zipCode.style.borderColor = 'red';
                isValid = false;
            } else {
                zipCode.style.borderColor = '';
            }

            //  Validate payment method
            if (!paymentMethod) {
                alert('Please select a payment method');
                isValid = false;
            }

            if (!isValid) {
                return false; // Prevent postback
            }

            //  Get form values for modal
            var selectedPayment = paymentMethod ? paymentMethod.nextElementSibling.textContent : '';

            //  Set modal content
            document.getElementById('modalPaymentMethod').textContent = selectedPayment;
            document.getElementById('modalShippingAddress').textContent = address.value + ' - ' + zipCode.value;

            //  Generate a simple order number based on timestamp
            var orderNumber = 'ORD-' + new Date().getTime().toString().slice(-6);
            document.getElementById('modalOrderNumber').textContent = orderNumber;

            //  Show modal immediately
            showModal();

            //  Let the server-side click event continue
            return true;
        }

        function showModal() {
            var modal = document.getElementById('confirmationModal');
            if (modal) {
                modal.style.display = 'block';

                // Add a small delay for visual effect
                setTimeout(function () {
                    modal.style.opacity = '1';
                }, 10);
            }
        }

        function closeModal() {
            var modal = document.getElementById('confirmationModal');
            if (modal) {
                modal.style.opacity = '0';
                setTimeout(function () {
                    modal.style.display = 'none';
                }, 300);
            }
        }

        // Close modal when clicking outside
        window.onclick = function (event) {
            var modal = document.getElementById('confirmationModal');
            if (event.target === modal) {
                closeModal();
            }
        }

        // Add smooth transition for modal
        document.addEventListener('DOMContentLoaded', function () {
            var modal = document.getElementById('confirmationModal');
            if (modal) {
                modal.style.transition = 'opacity 0.3s ease';
            }
        });
    </script>
    <link rel="stylesheet" href="checkout.css" />
    <%--<script src="checkout.js"></script>--%>
</asp:Content>
