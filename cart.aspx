<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="cart.css">
    <script src="script.js"></script>
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Cart Hero Section -->
    <section class="cart-hero" style="height: 334.17px">
        <div class="cart-hero-content">
            <div class="container" style="padding: 75px;">
                <h1 class="cart-hero-title">Your Cart</h1>
                <p class="cart-hero-subtitle">
                    Review your delicious selections
                </p>
            </div>
        </div>
    </section>

    <!-- Cart Section -->
    <section class="cart-section">
        <div class="container">
            <div class="cart-layout">
                <!-- Cart Items -->
                <div class="cart-items-container">
                    <div class="cart-header">
                        <h2>Shopping Cart</h2>
                        <span class="cart-item-count">
                            <asp:Label ID="lblCrt" runat="server" Text="Label"></asp:Label>
                            items</span>
                    </div>

                    <%--<!-- Empty Cart State -->
                    <div id="emptyCart" class="empty-cart">
                        <div class="empty-cart-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <h3>Your cart is empty</h3>
                        <p>
                            Looks like you haven't added any delicious dishes yet!
                        </p>
                        <a href="menu.aspx" class="btn btn-primary">Browse Menu</a>
                    </div>

                    <!-- Cart Items List -->
                    <div id="cartItemsList" class="cart-items-list" style="display: none;">
                        <!-- Cart items will be dynamically added here -->
                    </div>--%>
                    <asp:DataList ID="DtLsCrt" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' Height="80px" Width="100%" />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("C_Fod_Desc") %>'></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("C_Fod_Total") %>'></asp:Label>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'></asp:LinkButton>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'>LinkButton</asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>
                        <div class="summary-items">

                            <div class="summary-item">
                                <span>Subtotal</span> <span id="subtotal">$0.00</span>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span> <span id="deliveryFee">$2.99</span>
                            </div>
                            <div class="summary-item">
                                <span>Tax</span> <span id="tax">$0.00</span>
                            </div>
                            <div class="summary-divider">
                            </div>
                            <div class="summary-item total">
                                <span>Total</span> <span id="total">$0.00</span>
                            </div>
                        </div>
                        <div class="delivery-options">
                            <h4>Delivery Options</h4>
                            <div class="delivery-option">
                                <input type="radio" id="standard" name="delivery" value="standard" checked>
                                <label for="standard">
                                    <div class="option-info">
                                        <span class="option-name">Standard Delivery</span> <span class="option-time">30-45 minutes</span>
                                    </div>
                                    <span class="option-price">$2.99</span>
                                </label>
                            </div>
                            <div class="delivery-option">
                                <input type="radio" id="express" name="delivery" value="express">
                                <label for="express">
                                    <div class="option-info">
                                        <span class="option-name">Express Delivery</span> <span class="option-time">15-25 minutes</span>
                                    </div>
                                    <span class="option-price">$4.99</span>
                                </label>
                            </div>
                        </div>
                        <div class="promo-code">
                            <div class="promo-input">
                                <input type="text" id="promoCode" style="font-size: 14.4px" placeholder="Enter promo code">
                                <button type="button" id="applyPromo" class="btn btn-sm" style="font-size: 14.4px">
                                    Apply
                                </button>
                            </div>
                        </div>
                        <button class="checkoutBtn btn btn-primary checkout-btn">
                            <span class="btn-text">Proceed to Checkout</span> <i class="fas fa-arrow-right"></i>
                        </button>
                        <div class="continue-shopping">
                            <a href="menu.aspx" class="btn btn-secondary"><i class="fas fa-arrow-left"></i>Continue Shopping </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
