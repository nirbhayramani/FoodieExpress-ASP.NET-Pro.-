<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Menu Hero Section -->
    <section class="menu-hero">
        <div class="container">
            <div class="menu-hero-content">
                <h1 class="menu-hero-title">Our Menu</h1>
                <p class="menu-hero-subtitle">
                    Discover our carefully crafted dishes, each telling a unique story
                </p>
            </div>
        </div>
    </section>

    <!-- Menu Filters -->
    <section class="menu-filters-section">
        <div class="container">
            <div class="menu-filters">
                <button class="filter-btn active" data-filter="all">
                    All Dishes
                </button>
                <button class="filter-btn" data-filter="appetizers">
                    Appetizers
                </button>
                <button class="filter-btn" data-filter="main-courses">
                    Main Courses
                </button>
                <button class="filter-btn" data-filter="desserts">
                    Desserts
                </button>
                <button class="filter-btn" data-filter="beverages">
                    Beverages
                </button>
            </div>
        </div>
    </section>

    <!-- Menu Grid -->
    <section class="menu-section">
        <div class="container">
            <div class="menu-grid">
                <%--<!-- Appetizers -->
                <div class="menu-item" data-category="appetizers">
                    <div class="menu-item-image">
                        <img src="images/bruschetta.jpg" alt="Bruschetta">
                    </div>
                    <div class="menu-item-content">
                        <h3>Classic Bruschetta</h3>
                        <p>
                            Toasted bread topped with fresh tomatoes, basil, and mozzarella
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$8.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="appetizers">
                    <div class="menu-item-image">
                        <img src="images/calamari.jpg" alt="Calamari">
                    </div>
                    <div class="menu-item-content">
                        <h3>Crispy Calamari</h3>
                        <p>
                            Lightly fried squid served with marinara sauce
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$12.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Main Courses -->
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/margherita-pizza.jpg" alt="Margherita Pizza">
                    </div>
                    <div class="menu-item-content">
                        <h3>Margherita Pizza</h3>
                        <p>
                            Fresh mozzarella, tomato sauce, and basil on our signature crust
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$16.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/grilled-salmon.jpg" alt="Grilled Salmon">
                    </div>
                    <div class="menu-item-content">
                        <h3>Grilled Salmon</h3>
                        <p>
                            Atlantic salmon with seasonal vegetables and lemon butter sauce
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$24.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Desserts -->
                <div class="menu-item" data-category="desserts">
                    <div class="menu-item-image">
                        <img src="images/tiramisu.jpg" alt="Tiramisu">
                    </div>
                    <div class="menu-item-content">
                        <h3>Classic Tiramisu</h3>
                        <p>
                            Layers of coffee-soaked ladyfingers and mascarpone cream
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$9.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="desserts">
                    <div class="menu-item-image">
                        <img src="images/chocolate-lava-cake.jpg" alt="Chocolate Lava Cake">
                    </div>
                    <div class="menu-item-content">
                        <h3>Chocolate Lava Cake</h3>
                        <p>
                            Warm chocolate cake with molten center and vanilla ice cream
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$11.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Beverages -->
                <div class="menu-item" data-category="beverages">
                    <div class="menu-item-image">
                        <img src="images/lemonade.jpg" alt="Fresh Lemonade">
                    </div>
                    <div class="menu-item-content">
                        <h3>Fresh Lemonade</h3>
                        <p>
                            Hand-squeezed lemons with a hint of mint
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$4.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>--%>
                <%--<asp:DataList ID="DtLsFod" runat="server"
                    RepeatColumns="3"
                    RepeatDirection="Horizontal"
                    CellPadding="10"
                    CssClass="menu-grid" Width="1777px">
                    <ItemTemplate>
                        <div class="menu-card">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Fo_Img") %>' AlternateText="Food Image" />
                            <h3><%# Eval("Fo_Name") %></h3>
                            <p><%# Eval("Fo_Desc") %></p>
                            <span class="price">$<%# Eval("Fo_Price") %></span><asp:LinkButton ID="LinkButton1" runat="server"
                                CommandArgument='<%# Eval("Id") %>' CssClass="btn-cart">
                Add To Cart
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:DataList>--%>
                <asp:DataList ID="DtLsFod" runat="server"
                    RepeatColumns="3"
                    RepeatDirection="Horizontal"
                    CellPadding="10"
                    CssClass="menu-grid" Width="1777px">
                    <ItemTemplate>
                        <div class="menu-card">
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl='<%# Eval("Fo_Img") %>'
                                Height="200" Width="100%" />
                            <h3><%# Eval("Fo_Name") %></h3>
                            <p><%# Eval("Fo_Desc") %></p>
                            <div class="menu-card-footer">
                                <span class="price"><%# Eval("Fo_Price") %></span>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn">Add To Cart</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>

    <!-- Special Offers Section -->
    <section class="special-offers">
        <div class="container">
            <h2 class="section-title">Special Offers</h2>
            <div class="offers-grid">
                <div class="offer-card">
                    <div class="offer-content">
                        <h3>Weekend Special</h3>
                        <p>
                            20% off on all main courses every weekend
                        </p>
                        <span class="offer-tag">Valid Fri-Sun</span>
                    </div>
                </div>
                <div class="offer-card">
                    <div class="offer-content">
                        <h3>Lunch Combo</h3>
                        <p>
                            Appetizer + Main Course + Dessert for $25
                        </p>
                        <span class="offer-tag">11 AM - 3 PM</span>
                    </div>
                </div>
                <div class="offer-card">
                    <div class="offer-content">
                        <h3>Family Pack</h3>
                        <p>
                            4 main courses + 2 sides + 2 desserts for $75
                        </p>
                        <span class="offer-tag">All Day</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--<style>
        /* Grid layout for DataList */
        .menu-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px; /* uniform gap between cards */
            margin-top: 20px;
        }

        /* Each card */
        .menu-card {
            width: 365.33px;
            height: 398.6px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin: 0 15px; /* 🔹 adds only left-right spacing */
        }


            .menu-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            }

            /* Force same image size */
            .menu-card img {
                width: 100%;
                height: 200px; /* fixed image height */
                object-fit: cover; /* keeps proportion, crops if needed */
                display: block;
            }

            /* Title */
            .menu-card h3 {
                font-size: 1.2rem;
                font-weight: 600;
                margin: 15px 10px 5px;
                color: #333;
            }

            /* Description */
            .menu-card p {
                font-size: 0.95rem;
                color: #666;
                margin: 0 15px 10px;
                flex-grow: 1;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
            }

            /* Price */
            .menu-card .price {
                font-size: 1.1rem;
                font-weight: bold;
                color: #ff5722;
                margin-bottom: 10px;
                display: block;
            }

        /* Add to Cart button */
        .btn-cart {
            background: linear-gradient(45deg, #ff7b54, #ff4b2b);
            border: none;
            color: #fff !important;
            font-size: 0.95rem;
            font-weight: bold;
            padding: 10px 18px;
            border-radius: 25px;
            margin: 15px auto 20px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

            .btn-cart:hover {
                background: linear-gradient(45deg, #ff4b2b, #ff7b54);
                box-shadow: 0 4px 12px rgba(255,75,43,0.4);
            }
    </style>--%>
    <style>
        .menu-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 20px 0;
        }

        .menu-card {
            width: 365.33px;
            height: 398.6px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            padding: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden; /* keep hover text contained */
            margin: 0 15px; /* 🔹 adds only left-right spacing */
        }

            .menu-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            }

            .menu-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 12px;
            }

            .menu-card h3 {
                font-size: 20px;
                font-weight: bold;
                margin: 8px 0;
            }

            /* Truncated description */
            .menu-card p {
                font-size: 14px;
                color: #555;
                margin: 6px 0;
                display: -webkit-box;
                -webkit-line-clamp: 1; /* show only 3 lines */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                transition: all 0.3s ease;
            }

            /* Show full description on hover */
            .menu-card:hover p {
                -webkit-line-clamp: unset;
                max-height: none;
                overflow: visible;
                background: #fff;
                position: relative;
                z-index: 2;
            }

        .menu-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .menu-card .price {
            font-size: 18px;
            font-weight: bold;
            color: #ff6b35;
        }

        .menu-card .btn {
            background: #e63946;
            color: #fff;
            padding: 8px 14px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
            font-size: 14px;
            background: var(--primary-color);
            color: var(--white);
            box-shadow: var(--button-shadow);
            padding: 12px 30px;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition-fast);
            text-decoration: none;
            display: inline-block;
            font-size: 1rem;
        }

            .menu-card .btn:hover {
                background: #d62828;
            }
    </style>
</asp:Content>

