<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="dish-details.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.dish_details" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- General Layout & Container --- */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .dish-section {
            padding: 50px 0;
            background-color: #fdfdfd;
        }

        /* 🍔 This is the crucial part for the horizontal layout 🍔 */
        .dish-layout {
            display: flex; /* Makes the container a flexbox */
            flex-direction: row; /* Arranges children horizontally */
            flex-wrap: wrap; /* Allows items to wrap on smaller screens */
            justify-content: center; /* Centers the content block */
            align-items: flex-start; /* Aligns the top of the image and card */
            gap: 40px; /* Space between the image and the card */
            max-width: 1000px;
            margin: 0 auto;
        }

            /* Styles for the image wrapper */
            .dish-layout > div:first-child {
                flex: 1; /* Allows it to grow and shrink */
                min-width: 300px;
                max-width: 450px;
                text-align: center;
            }

        .dish-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            display: block;
        }

        /* Styles for the dish details card */
        .dish-card {
            flex: 1.2; /* Gives the card slightly more space */
            min-width: 350px;
            max-width: 500px;
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        /* --- Other styles for the inner elements of the card (add these as needed) --- */
        .dish-title {
            font-size: 2.2rem;
            font-weight: 800;
            color: #333;
            margin-bottom: 10px;
        }

        .dish-description {
            font-size: 1rem;
            color: #666;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .nutrition-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .nutri-box {
            background-color: #f9f9f9;
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .nutri-label {
            font-size: 0.9rem;
            color: #888;
            margin-bottom: 5px;
        }

        .nutri-value {
            font-size: 1.1rem;
            font-weight: 700;
            color: #e74c3c;
        }

        .ingredients-heading {
            font-size: 1.2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        .ingredients-list {
            list-style-type: disc;
            padding-left: 25px;
            margin-bottom: 30px;
            color: #555;
            line-height: 1.8;
        }

        .dish-price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
            margin-top: 20px;
            margin-bottom: 30px;
            display: flex;
            align-items: baseline;
            gap: 10px;
        }

        .price-value {
            color: #e74c3c;
        }

        .btn-primary.order-btn {
            background-color: #ff6f61;
            color: white;
            padding: 15px 35px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            display: block;
            width: 100%;
            text-align: center;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .btn-primary.order-btn:hover {
                background-color: #e55a4f;
            }

        /* --- Responsive Design --- */
        @media (max-width: 992px) {
            .dish-layout {
                flex-direction: column; /* Stacks the columns vertically on mobile */
                align-items: center;
            }

                .dish-layout > div:first-child,
                .dish-card {
                    max-width: 90%;
                    min-width: unset;
                }

            .nutrition-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Base Styles --- */
        body {
            font-family: 'Poppins', sans-serif; /* A modern, clean font */
            margin: 0;
            padding: 0;
            background-color: #f0f2f5; /* Light background for the whole page */
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* --- Header / Hero Section (e.g., if you have a page title here) --- */
        .dish-hero {
            background-color: #f8f8f8; /* Light grey background for hero section */
            padding: 20px 0;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

            .dish-hero .container { /* If you want to style content in hero */
                padding: 20px 15px;
            }

        /* --- Main Dish Content Section --- */
        .dish-section {
            padding: 60px 0; /* More padding top/bottom */
            background-color: #fff; /* White background for the main content area */
        }

        /* 🍔 Outer Layout (Image + Card side-by-side) 🍔 */
        .dish-layout {
            display: flex;
            flex-direction: row; /* Default to row (side-by-side) */
            flex-wrap: wrap; /* Allow wrapping on smaller screens */
            justify-content: center; /* Center the entire layout block */
            align-items: flex-start; /* Align contents to the top */
            gap: 40px; /* Space between image and card */
            max-width: 1100px; /* Max width for the entire layout */
            margin: 0 auto; /* Center the layout on the page */
            background: #fff; /* Ensure this section has a white background */
            padding: 30px; /* Padding around the content */
            border-radius: 15px; /* Rounded corners for the entire section */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); /* Soft shadow for depth */
        }

            /* Styles for the image container */
            .dish-layout > div:first-child {
                flex: 1; /* Allows image to take up available space */
                min-width: 350px; /* Minimum width for image before wrapping */
                max-width: 500px; /* Max width for image */
                text-align: center;
            }

        .dish-image {
            width: 100%;
            height: auto;
            border-radius: 12px; /* Slightly more rounded image corners */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow for image */
            display: block; /* Ensures no extra space below image */
        }

        /* Styles for the dish details card */
        .dish-card {
            flex: 1.2; /* Gives card slightly more space than the image */
            min-width: 400px; /* Minimum width for card before wrapping */
            max-width: 600px; /* Max width for card */
            /* Background and shadow handled by .dish-layout parent now */
            padding: 0; /* Remove padding here as it's on the parent .dish-layout */
        }

        .dish-title {
            font-size: 2.5rem; /* Larger, bolder title */
            font-weight: 800;
            color: #222;
            margin-bottom: 15px;
            line-height: 1.2;
        }

        .dish-description {
            font-size: 1.05rem;
            color: #555;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        /* Nutrition Grid */
        .nutrition-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2 columns */
            gap: 20px; /* Space between nutrition boxes */
            margin-bottom: 35px;
            padding-top: 25px;
            border-top: 1px solid #eee; /* Separator line */
        }

        .nutri-box {
            background-color: #fdfdfd; /* White background for boxes */
            border: 1px solid #e0e0e0; /* Subtle border */
            border-radius: 10px;
            padding: 18px 20px; /* Increased padding */
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Align text to the left within the box */
            justify-content: center;
            text-align: left; /* Align text to the left */
        }

        .nutri-label {
            font-size: 0.95rem;
            color: #777;
            margin-bottom: 5px;
            text-transform: uppercase; /* Uppercase labels */
            letter-spacing: 0.5px;
        }

        .nutri-value {
            font-size: 1.3rem; /* Larger values */
            font-weight: 700;
            color: #e74c3c; /* Reddish accent color */
        }

        /* Ingredients List */
        .ingredients-heading {
            font-size: 1.3rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        .ingredients-list {
            list-style-type: disc; /* Bullet points */
            padding-left: 25px; /* Indent the list */
            margin-bottom: 35px;
            color: #555;
            line-height: 1.7; /* Slightly more space between items */
        }

            .ingredients-list li {
                font-size: 1rem;
                margin-bottom: 5px; /* Small gap between list items */
            }

        /* Dish Price */
        .dish-price {
            font-size: 2.2rem; /* Prominent price */
            font-weight: 800;
            color: #222;
            margin-top: 25px;
            margin-bottom: 40px; /* More space before button */
            display: flex;
            align-items: baseline;
            gap: 12px;
        }

            .dish-price .price-value {
                color: #e74c3c; /* Red color for price value */
            }

        /* Order Button */
        .btn-primary.order-btn {
            background: linear-gradient(135deg, #ff6f61 0%, #e55a4f 100%); /* Gradient button */
            color: white;
            padding: 18px 40px; /* Generous padding */
            border-radius: 10px; /* More rounded corners */
            text-decoration: none;
            font-weight: 600;
            font-size: 1.2rem; /* Larger font size */
            display: block; /* Takes full width */
            width: 100%; /* Ensure full width */
            text-align: center;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(255, 111, 97, 0.4); /* Soft shadow for button */
        }

            .btn-primary.order-btn:hover {
                background: linear-gradient(135deg, #e55a4f 0%, #cc473c 100%); /* Darker gradient on hover */
                box-shadow: 0 8px 20px rgba(255, 111, 97, 0.6);
                transform: translateY(-2px); /* Slight lift effect */
            }

        /* ASP.NET Specific Overrides (ensure labels don't break styling) */
        .dish-title .asp-label,
        .dish-description .asp-label,
        .nutri-value .asp-label,
        .ingredients-list .asp-label,
        .dish-price .price-value .asp-label {
            font-size: inherit;
            font-weight: inherit;
            color: inherit;
            display: inline; /* Keep labels inline with other text */
            padding: 0;
            margin: 0;
            background: none; /* Remove any default ASP.NET label background */
            border: none; /* Remove any default ASP.NET label border */
        }

        .nutrition-grid .nutri-value .asp-label {
            display: block; /* For nutrition values, if they are labels and you want them on new line */
            text-align: inherit;
        }

        .ingredients-list li .asp-label {
            display: inline; /* Keep ingredients inline within their li */
        }

        /* --- Responsive Design --- */
        @media (max-width: 1024px) { /* Adjust breakpoint for larger tablets */
            .dish-layout {
                gap: 30px;
                padding: 25px;
            }

            .dish-card {
                min-width: 300px;
            }

            .dish-title {
                font-size: 2.2rem;
            }

            .dish-price {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 768px) { /* Tablets and smaller */
            .dish-layout {
                flex-direction: column; /* Stack image and card vertically */
                align-items: center; /* Center when stacked */
                max-width: 95%; /* Use more of the screen width */
                padding: 20px;
            }

                .dish-layout > div:first-child,
                .dish-card {
                    min-width: unset; /* Remove min-width to allow full width usage */
                    max-width: 90%; /* Occupy most of the container width */
                }

            .dish-title {
                font-size: 2rem;
            }

            .dish-description {
                font-size: 1rem;
            }

            .nutrition-grid {
                grid-template-columns: 1fr; /* Stack nutrition boxes vertically */
                gap: 15px;
            }

            .nutri-box {
                padding: 15px;
            }

            .nutri-value {
                font-size: 1.2rem;
            }

            .ingredients-heading {
                font-size: 1.1rem;
            }

            .ingredients-list {
                padding-left: 20px;
            }

            .dish-price {
                font-size: 1.6rem;
                margin-bottom: 30px;
            }

            .btn-primary.order-btn {
                font-size: 1rem;
                padding: 15px 30px;
            }
        }

        @media (max-width: 480px) { /* Smaller mobile devices */
            .dish-layout {
                padding: 15px;
            }

                .dish-layout > div:first-child,
                .dish-card {
                    max-width: 100%;
                }

            .dish-title {
                font-size: 1.8rem;
            }

            .dish-description {
                font-size: 0.9rem;
            }

            .dish-price {
                font-size: 1.4rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="dish-hero">
        <div class="container">
            <asp:Label ID="lbldnam" runat="server" Text="Label"></asp:Label>
        </div>
    </section>

    <section class="dish-section">
        <div class="container">
            <asp:DataList ID="DtLsDet" runat="server">
                <ItemTemplate>
                    <div class="dish-layout">
                        <div>
                            <asp:Image ID="imgFod" runat="server" ImageUrl='<%# Eval("Fo_Img") %>' CssClass="dish-image" AlternateText="Dish Image" />
                        </div>
                        <div class="dish-card">
                            <h2 class="dish-title">
                                <asp:Label ID="lblFodNam" runat="server" Text='<%# Eval("Fo_Name") %>'></asp:Label>
                            </h2>
                            <p class="dish-description">
                                <asp:Label ID="lblFodDesc" runat="server" Text='<%# Eval("Fo_desc") %>'></asp:Label>
                            </p>
                            <div class="nutrition-grid">
                                <div class="nutri-box">
                                    <span class="nutri-label">Proteins:</span>
                                    <strong class="nutri-value">32g</strong>
                                </div>
                                <div class="nutri-box">
                                    <span class="nutri-label">Carbs:</span>
                                    <strong class="nutri-value">45g</strong>
                                </div>
                                <div class="nutri-box">
                                    <span class="nutri-label">Fats:</span>
                                    <strong class="nutri-value">22g</strong>
                                </div>
                                <div class="nutri-box">
                                    <span class="nutri-label">Calories:</span>
                                    <strong class="nutri-value">
                                        <asp:Label ID="lblFodCal" runat="server" Text='<%# Eval("Fo_Calr") %>'></asp:Label>
                                        kcal</strong>
                                </div>
                            </div>
                            <h3 class="ingredients-heading">Ingredients</h3>
                            <ul class="ingredients-list">
                                <li>
                                    <asp:Label ID="lblFodIngr" runat="server" Text='<%# Eval("Fo_ingr") %>'></asp:Label></li>
                            </ul>
                            <div class="dish-price">
                                Price: <span class="price-value">$<asp:Label ID="lblFodPri" runat="server" Text='<%# Eval("Fo_Price") %>'></asp:Label></span>
                            </div>
                            <asp:LinkButton ID="lnkAdCart" runat="server" CssClass="btn btn-primary order-btn">Order Now</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </section>
</asp:Content>
