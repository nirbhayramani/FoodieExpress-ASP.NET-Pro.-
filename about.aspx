<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- About Hero Section -->
    <section class="about-hero">
        <div class="container">
            <div class="about-hero-content">
                <h1 class="about-hero-title">Our Story</h1>
                <p class="about-hero-subtitle">
                    A culinary journey that began with a dream and a secret recipe
                </p>
            </div>
        </div>
    </section>

    <!-- Story Section -->
    <section class="story-section">
        <div class="container">
            <div class="story-content">
                <div class="story-text">
                    <h2>The Thrilling Tale of FoodieExpress</h2>
                    <div class="story-paragraph">
                        <p>
                            In the heart of a bustling city, where neon lights danced with shadows and the aroma of street food filled the air, a young chef named Marco discovered his grandmother's ancient cookbook hidden in the attic of their family restaurant. The yellowed pages contained more than just recipes—they held the secrets of a culinary dynasty that had been lost to time.
                        </p>
                        <p>
                            Marco's grandmother, Isabella, was once the most sought-after chef in the region, known for her ability to transform simple ingredients into extraordinary experiences. Her restaurant, "La Cucina Magica," was a place where food wasn't just sustenance—it was art, passion, and love all rolled into one. But when she mysteriously disappeared one stormy night in 1985, taking her secret spice blend with her, the restaurant closed its doors forever.
                        </p>
                        <p>
                            Years later, Marco found himself working in a corporate kitchen, his creativity stifled by profit margins and standardized menus. But fate had other plans. One evening, while cleaning out his grandmother's old kitchen, he discovered a hidden compartment behind the stove. Inside was a small, ornate box containing the legendary spice blend and a note that read: "For the one who dares to dream."
                        </p>
                        <p>
                            That night, Marco quit his job and began experimenting with his grandmother's recipes. He spent months perfecting each dish, adding his own modern twist while honoring the traditional techniques. The result was nothing short of magical—dishes that transported diners to another time and place, where every bite told a story.
                        </p>
                        <p>
                            Today, FoodieExpress carries on Isabella's legacy, delivering not just food, but experiences that awaken the senses and stir the soul. Every dish is crafted with the same passion, love, and secret spice blend that made La Cucina Magica legendary. We're not just a food delivery service—we're keepers of a culinary mystery, guardians of tradition, and creators of unforgettable moments.
                        </p>
                    </div>
                </div>
                <div class="story-image">
                    <img src="images/kitchen.jpg" alt="Our Kitchen">
                </div>
            </div>
        </div>
    </section>

    <!-- Values Section -->
    <section class="values-section">
        <div class="container">
            <h2 class="section-title">Our Values</h2>
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-seedling"></i>
                    </div>
                    <h3>Fresh & Local</h3>
                    <p>
                        We source only the finest ingredients from local farmers and suppliers, ensuring every dish is made with the freshest produce available.
                    </p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Made with Love</h3>
                    <p>
                        Every dish is prepared with the same passion and care that Isabella poured into her legendary recipes.
                    </p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3>Lightning Fast</h3>
                    <p>
                        We understand that great food should be enjoyed when it's at its peak, which is why we deliver in 30 minutes or less.
                    </p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3>Excellence</h3>
                    <p>
                        We never compromise on quality, from the ingredients we select to the final presentation of every dish.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <div class="container">
            <h2 class="section-title">Meet Our Team</h2>
            <div class="team-grid">
                <div class="team-member">
                    <img src="images/Head chef.jpg" alt="Chef Marco">
                    <h3>Chef Marco</h3>
                    <p>
                        Head Chef & Founder
                    </p>
                    <p>
                        The grandson of the legendary Isabella, Marco brings his grandmother's passion and his own innovative spirit to every dish.
                    </p>
                </div>
                <div class="team-member">
                    <img src="images/Chef Sofia.jpg" alt="Chef Sofia">
                    <h3>Chef Sofia</h3>
                    <p>
                        Sous Chef
                    </p>
                    <p>
                        A culinary prodigy who trained in some of the world's finest kitchens, Sofia adds her own creative flair to our traditional recipes.
                    </p>
                </div>
                <div class="team-member">
                    <img src="images/Chef Antonio.jpeg" alt="Chef Antonio">
                    <h3>Chef Antonio</h3>
                    <p>
                        Pastry Chef
                    </p>
                    <p>
                        Our master of desserts, Antonio creates sweet masterpieces that are the perfect ending to any meal.
                    </p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

