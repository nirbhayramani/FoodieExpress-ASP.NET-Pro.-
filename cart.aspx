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
                    <%--<asp:DataList ID="DtLsCrt" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="imgFod" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' />
                            <asp:Label ID="lblnm" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                            <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("C_Fod_Desc") %>'></asp:Label>
                            <asp:Label ID="lbltot" runat="server" Text='<%# Eval("C_Fod_Total") %>'></asp:Label>
                            <asp:LinkButton ID="lnkmin" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'>Minus</asp:LinkButton>
                            <asp:Label ID="lblquant" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                            <asp:LinkButton ID="lnkplu" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'>Plus</asp:LinkButton>
                            <asp:LinkButton ID="lnkrem" runat="server" CommandArgument='<%# Eval("Cart_Id") %>'>Remove</asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>--%>
                    <%--with css<asp:DataList ID="DtLsCrt" runat="server">
                        <ItemTemplate>
                            <div class="cart-item">
                                <asp:Image ID="imgFod" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' CssClass="cart-item-image" />

                                <div class="cart-item-details">
                                    <div class="cart-item-name">
                                        <asp:Label ID="lblnm" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                                    </div>
                                    <div class="cart-item-description">
                                        <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("C_Fod_Desc") %>'></asp:Label>
                                    </div>
                                    <div class="cart-item-price">
                                        $<asp:Label ID="lbltot" runat="server" Text='<%# Eval("C_Fod_Total") %>'></asp:Label>
                                    </div>
                                </div>

                                <div class="cart-item-actions">
                                    <div class="quantity-control">
                                        <asp:LinkButton ID="lnkmin" runat="server" CommandName="Decrement" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="quantity-btn">-</asp:LinkButton>
                                        <div class="quantity-display">
                                            <asp:Label ID="lblquant" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                        </div>
                                        <asp:LinkButton ID="lnkplu" runat="server" CommandName="Increment" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="quantity-btn">+</asp:LinkButton>
                                    </div>
                                    <asp:LinkButton ID="lnkrem" runat="server" CommandName="RemoveItem" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="remove-link">Remove</asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>--%>
                    <asp:DataList ID="DtLsCrt" runat="server" OnItemCommand="DtLsCrt_ItemCommand">
                        <ItemTemplate>
                            <div class="cart-item">
                                <asp:Image ID="imgFod" runat="server" ImageUrl='<%# Eval("C_Fod_Img") %>' CssClass="cart-item-image" />

                                <div class="cart-item-details">
                                    <div class="cart-item-name">
                                        <asp:Label ID="lblnm" runat="server" Text='<%# Eval("C_Fod_Name") %>'></asp:Label>
                                    </div>
                                    <div class="cart-item-description">
                                        <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("C_Fod_Desc") %>'></asp:Label>
                                    </div>
                                    <div class="cart-item-price">
                                        $<asp:Label ID="lbltot" runat="server" Text='<%# Eval("C_Fod_Price") %>'></asp:Label>
                                    </div>
                                </div>

                                <div class="cart-item-actions">
                                    <div class="quantity-control">
                                        <asp:LinkButton ID="lnkmin" runat="server" CommandName="cmd_decre" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="quantity-btn">-</asp:LinkButton>
                                        <div class="quantity-display">
                                            <asp:Label ID="lblquant" runat="server" Text='<%# Eval("C_Fod_Quantity") %>'></asp:Label>
                                        </div>
                                        <asp:LinkButton ID="lnkplu" runat="server" CommandName="cmd_incre" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="quantity-btn">+</asp:LinkButton>
                                    </div>
                                    <asp:LinkButton ID="lnkrem" runat="server" CommandName="cmd_rem" CommandArgument='<%# Eval("Cart_Id") %>' CssClass="remove-link">Remove</asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Label ID="lblEmptyCart" runat="server" Text="Your cart is empty"
                        CssClass="empty-cart-message" Visible="false"></asp:Label>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <div class="summary-card">
                        <h3>Order Summary</h3>
                        <div class="summary-items">
                            <div class="summary-item">
                                <span>Subtotal</span><asp:Label ID="lblSubTot" runat="server" Text="$0.00"></asp:Label>
                            </div>
                            <div class="summary-item">
                                <span>Delivery Fee</span> <span id="deliveryFee">$2.99</span>
                            </div>
                            <div class="summary-divider">
                            </div>
                            <div class="summary-item total">
                                <span>Total</span><asp:Label ID="lblFnlTot" runat="server" Text="$0.00"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="delivery-options">
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
                        </div>--%>
                        <div class="promo-code">
                            <div class="promo-input">
                                <input type="text" id="promoCode" style="font-size: 14.4px" placeholder="Enter promo code">
                                <button type="button" id="applyPromo" class="btn btn-sm" style="font-size: 14.4px">
                                    Apply
                                </button>
                            </div>
                        </div>
                        <%--<button class="checkoutBtn btn btn-primary checkout-btn">
                            <span class="btn-text">Proceed to Checkout</span> <i class="fas fa-arrow-right"></i>
                        </button>--%>
                        <div class="checkoutBtn btn btn-primary checkout-btn">
                            <asp:LinkButton ID="lnkChkOut" runat="server" class="btn-text" OnClick="lnkChkOut_Click">Proceed to Checkout&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></asp:LinkButton>
                        </div>
                        <div class="continue-shopping">
                            <a href="menu.aspx" class="btn btn-secondary" style="background: #0000001a;"><i class="fas fa-arrow-left"></i>Continue Shopping </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <style>
        /* --- Styling for the Cart Items DataList --- */
        .cart-items-list {
            display: flex;
            flex-direction: column;
            gap: 25px; /* Adds space between each cart item */
        }

        /* Style for each individual cart item */
        .cart-item {
            display: flex;
            align-items: center;
            gap: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

            .cart-item:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            }

        /* Cart item image */
        .cart-item-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
        }

        /* Details section (name, description, price) */
        .cart-item-details {
            flex-grow: 1; /* Allows this section to take up available space */
        }

        .cart-item-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }

        .cart-item-description {
            font-size: 0.9rem;
            color: #777;
            margin-bottom: 10px;
        }

        .cart-item-price {
            font-size: 1.1rem;
            font-weight: 600;
            color: #e74c3c;
        }

        /* Quantity control and removal links */
        .cart-item-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .quantity-control {
            /*            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 50px;
            overflow: hidden;*/
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border-radius: 25px;
            padding: 5px;
        }

            .quantity-control .quantity-btn {
                padding: 8px 12px;
                background: transparent;
                border: none;
                color: #555;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.2s ease;
            }

                .quantity-control .quantity-btn:hover {
                    background-color: #f0f0f0;
                }

        .quantity-btn {
            width: 30px;
            height: 30px;
            border: none;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-weight: bold;
            color: #333;
            transition: all 0.3s ease;
        }

        .quantity-btn-disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .quantity-control .quantity-display {
            padding: 0 12px;
            font-weight: 600;
            font-size: 1rem;
        }

        .remove-link {
            font-size: 0.9rem;
            color: #e74c3c;
            text-decoration: none;
            transition: color 0.2s ease;
        }

            .remove-link:hover {
                color: #c0392b;
                text-decoration: underline;
            }

        /* Quantity control and removal links */
        .cart-item-actions {
            display: flex;
            align-items: center;
            gap: 15px; /* Spacing between quantity control and remove button */
        }

        /* Styles for the quantity control box (the - 1 + part) */
        .quantity-control {
            display: flex;
            align-items: center;
            border: 1px solid #ddd; /* Light gray border */
            border-radius: 50px; /* Makes the box pill-shaped */
            overflow: hidden;
        }

            /* Styles for the minus and plus buttons */
            .quantity-control .quantity-btn {
                padding: 8px 12px;
                background: transparent;
                border: none;
                color: #555;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.2s ease;
                text-decoration: none; /* Remove underline from link button */
            }

                .quantity-control .quantity-btn:hover {
                    background-color: #f0f0f0; /* Light gray background on hover */
                }

            /* Styles for the quantity display number */
            .quantity-control .quantity-display {
                padding: 0 12px;
                font-weight: 600;
                font-size: 1rem;
                color: #333;
            }

        /* Styles for the "Remove" link */
        .remove-link {
            font-size: 0.9rem;
            color: #e74c3c; /* A reddish color for the remove action */
            text-decoration: none; /* Remove underline */
            transition: color 0.2s ease;
        }

            .remove-link:hover {
                color: #c0392b; /* Darker red on hover */
                text-decoration: underline; /* Add underline on hover */
            }

        .btn-text {
            z-index: 5;
            color: white;
            text-decoration: none;
        }
    </style>
</asp:Content>
