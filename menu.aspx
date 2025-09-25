<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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

    <section class="menu-filters-section" style="padding: 10px 0">
        <div class="container">
            <div class="menu-filters">
                <%-- The buttons are now styled with the new CSS class --%>
                <asp:Button ID="btnAllCat" runat="server" Text="All Dishes" OnClick="btnAllCat_Click" CssClass="menu-filter-btn active" />
                <asp:DataList ID="DtLsCat" runat="server" RepeatDirection="Horizontal" OnItemCommand="DtLsCat_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btnCat" runat="server" Text='<%# Eval("Cat_Name") %>' CommandArgument='<%# Eval("Cat_Name") %>' CommandName="cmd_cat" CssClass="menu-filter-btn" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>

    <section class="menu-section" >
        <div class="container">
            <div class="menu-grid">
                <asp:DataList ID="DtLsFod" runat="server"
                    RepeatColumns="3"
                    RepeatDirection="Horizontal"
                    CellPadding="10"
                    CssClass="menu-grid" Width="1777px" OnItemCommand="DtLsFod_ItemCommand">
                    <ItemTemplate>
                        <a href='dish-details.aspx?id=<%# Eval("Id") %>' class="menu-card-link">
                            <div class="menu-card">
                                <asp:Image ID="Image1" runat="server"
                                    ImageUrl='<%# Eval("Fo_Img") %>'
                                    Height="200" Width="100%" />
                                <h3><%# Eval("Fo_Name") %></h3>
                                <p><%# Eval("Fo_Desc") %></p>
                                <div class="menu-card-footer">
                                    <span class="price">$<%# Eval("Fo_Price") %></span>
                                    <asp:LinkButton ID="lnkadcart" runat="server"
                                        CommandArgument='<%# Eval("Id") %>'
                                        CssClass="btn" CommandName="cmd_cart" OnClick="lnkadcart_Click">Add To Cart</asp:LinkButton>
                                </div>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>

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

    <style>
        /* General styles for filter buttons */
        .menu-filter-btn {
            background-color: transparent;
            color: #ff6b35; /* a reddish-orange color */
            border: 2px solid #ff6b35;
            padding: 12px 24px;
            border-radius: 50px;
            font-size: 13.33px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin: 0 1rem;
        }

            /* Hover effect */
            .menu-filter-btn:hover {
                background-color: #ff6b35;
                color: #fff;
            }

            /* Active state */
            .menu-filter-btn.active {
                background-color: #ff6b35;
                color: #fff;
                box-shadow: 0 4px 8px rgba(255, 107, 53, 0.3);
            }

        .menu-filters {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 20px 0;
            text-align: center;
        }

        /* The rest of your existing CSS... */
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
            overflow: hidden;
            margin: 15px 15px;
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

            .menu-card p {
                font-size: 14px;
                color: #555;
                margin: 6px 0;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                transition: all 0.3s ease;
            }

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

        .menu-card-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

            .menu-card-link:hover {
                text-decoration: none;
                color: inherit;
            }
    </style>
</asp:Content>

