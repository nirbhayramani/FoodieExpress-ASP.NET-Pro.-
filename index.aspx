<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-background">
            <div class="hero-overlay"></div>
        </div>
        <div class="hero-content">
            <div class="hero-text">
                <h1 class="hero-title">Experience Culinary Excellence</h1>
                <p class="hero-subtitle">Where every bite tells a story of passion, tradition, and innovation</p>
                <div class="hero-buttons">
                    <a href="menu.aspx" class="btn btn-primary">Explore Menu</a>
                    <a href="about.aspx" class="btn btn-secondary">Our Story</a>
                </div>
            </div>
            <div class="hero-image">
                <img src="images/kitchen.jpg" alt="Culinary Excellence">
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3>Lightning Fast</h3>
                    <p>30-minute delivery or your meal is on us</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3>Premium Quality</h3>
                    <p>Fresh ingredients sourced daily from local farms</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Made with Love</h3>
                    <p>Every dish crafted with passion and care</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Dishes Section -->
    <section class="popular-section">
        <div class="container">
            <h2 class="section-title">Popular Dishes</h2>
            <div class="popular-grid">
                <div class="popular-item">
                    <img src="images/Garden Fresh Salad.jpg" alt="Fresh Salad">
                    <div class="popular-content">
                        <h3>Garden Fresh Salad</h3>
                        <p>Crisp vegetables with house dressing</p>
                        <div class="menu-item-footer">
                            <span class="price">$12.99</span>
                            <button class="btn btn-primary">Add to Cart</button>
                        </div>
                    </div>
                </div>
                <div class="popular-item">
                    <img src="images/Chef's Special.jpg" alt="Chef's Special">
                    <div class="popular-content">
                        <h3>Chef's Special</h3>
                        <p>Daily curated masterpiece</p>
                        <div class="menu-item-footer">
                            <span class="price">$18.99</span>
                            <button class="btn btn-primary">Add to Cart</button>
                        </div>
                    </div>
                </div>
                <div class="popular-item">
                    <img src="images/Signature Dish.png" alt="Signature Dish">
                    <div class="popular-content">
                        <h3>Signature Dish</h3>
                        <p>Our most loved creation</p>
                        <div class="menu-item-footer">
                            <span class="price">$15.99</span>
                            <button class="btn btn-primary">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <a href="menu.aspx" class="btn btn-primary">View Full Menu</a>
            </div>
        </div>
    </section>
</asp:Content>

