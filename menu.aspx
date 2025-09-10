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
                <!-- Appetizers -->
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
                <div class="menu-item" data-category="appetizers">
                    <div class="menu-item-image">
                        <img src="images/caprese-salad.jpg" alt="Caprese Salad">
                    </div>
                    <div class="menu-item-content">
                        <h3>Caprese Salad</h3>
                        <p>
                            Fresh mozzarella, ripe tomatoes, and basil with balsamic glaze
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$10.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="appetizers">
                    <div class="menu-item-image">
                        <img src="images/spinach-dip.jpg" alt="Spinach Artichoke Dip">
                    </div>
                    <div class="menu-item-content">
                        <h3>Spinach Artichoke Dip</h3>
                        <p>
                            Creamy dip with spinach, artichokes, and melted cheese
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$9.99</span>
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
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/beef-tenderloin.jpg" alt="Beef Tenderloin">
                    </div>
                    <div class="menu-item-content">
                        <h3>Beef Tenderloin</h3>
                        <p>
                            8oz tenderloin with roasted potatoes and red wine reduction
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$32.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/pasta-carbonara.jpg" alt="Pasta Carbonara">
                    </div>
                    <div class="menu-item-content">
                        <h3>Pasta Carbonara</h3>
                        <p>
                            Spaghetti with pancetta, eggs, and parmesan cheese
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$18.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/Classic Burger.jpg" alt="Gourmet Burger">
                    </div>
                    <div class="menu-item-content">
                        <h3>Gourmet Burger</h3>
                        <p>
                            Angus beef patty with aged cheddar, caramelized onions, and special sauce
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$19.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/Pepperoni Pizza.jpg" alt="Pepperoni Pizza">
                    </div>
                    <div class="menu-item-content">
                        <h3>Pepperoni Pizza</h3>
                        <p>
                            Spicy pepperoni with mozzarella and our signature tomato sauce
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$18.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="main-courses">
                    <div class="menu-item-image">
                        <img src="images/Veggie Burger.jpg" alt="Veggie Burger">
                    </div>
                    <div class="menu-item-content">
                        <h3>Veggie Burger</h3>
                        <p>
                            Plant-based patty with avocado, sprouts, and vegan mayo
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
                        <img src="images/Chef's Special.jpg" alt="Chef's Special Pasta">
                    </div>
                    <div class="menu-item-content">
                        <h3>Chef's Special Pasta</h3>
                        <p>
                            Homemade fettuccine with wild mushrooms and truffle cream sauce
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$22.99</span>
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
                <div class="menu-item" data-category="desserts">
                    <div class="menu-item-image">
                        <img src="images/Chocolate Cake.png" alt="New York Cheesecake">
                    </div>
                    <div class="menu-item-content">
                        <h3>New York Cheesecake</h3>
                        <p>
                            Creamy cheesecake with berry compote and graham cracker crust
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$8.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="desserts">
                    <div class="menu-item-image">
                        <img src="images/creme-brulee.jpg" alt="Crème Brûlée">
                    </div>
                    <div class="menu-item-content">
                        <h3>Crème Brûlée</h3>
                        <p>
                            Classic French custard with caramelized sugar crust
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$10.99</span>
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
                </div>
                <div class="menu-item" data-category="beverages">
                    <div class="menu-item-image">
                        <img src="images/italian-coffee.jpg" alt="Italian Coffee">
                    </div>
                    <div class="menu-item-content">
                        <h3>Italian Coffee</h3>
                        <p>
                            Rich espresso served with a twist of orange
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$3.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="beverages">
                    <div class="menu-item-image">
                        <img src="images/berry-smoothie.jpg" alt="Berry Smoothie">
                    </div>
                    <div class="menu-item-content">
                        <h3>Berry Smoothie</h3>
                        <p>
                            Mixed berries with yogurt and honey
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$6.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
                <div class="menu-item" data-category="beverages">
                    <div class="menu-item-image">
                        <img src="images/iced-tea.jpg" alt="Iced Tea">
                    </div>
                    <div class="menu-item-content">
                        <h3>Iced Tea</h3>
                        <p>
                            Refreshing black tea with lemon and mint
                        </p>
                        <div class="menu-item-footer">
                            <span class="price">$3.99</span>
                            <button class="btn btn-primary">
                                Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
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
</asp:Content>

