<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="dish-details.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.dish_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Hero -->
    <section class="dish-hero">
        <div class="container">
            <asp:Label ID="lbldnam" runat="server" Text="Label"></asp:Label>
        </div>
    </section>

    <!-- Dish Content -->
    <section class="dish-section">
        <div class="container">
            <div class="dish-layout">
                <%--<div>
                    <img id="dishImage" class="dish-image" src="images/kitchen.jpg" alt="Dish image">
                </div>
                <div class="dish-card">
                    <div class="dish-title" id="dishTitle">Dish Name</div>
                    <div class="meta" id="dishDescription">Delicious and freshly prepared.</div>
                    <div class="nutrition">
                        <div class="nutri-item">Proteins: <strong id="dishProteins">-</strong></div>
                        <div class="nutri-item">Carbs: <strong id="dishCarbs">-</strong></div>
                        <div class="nutri-item">Fats: <strong id="dishFats">-</strong></div>
                        <div class="nutri-item">Calories: <strong id="dishCalories">-</strong></div>
                    </div>
                    <div style="margin-top: 12px;">
                        <div class="meta">Ingredients</div>
                        <ul id="dishIngredients" style="margin-top: 6px; padding-left: 18px;"></ul>
                    </div>
                    <div style="margin-top: 12px;" class="price">Price: <span id="dishPrice">$0.00</span></div>
                    <div style="margin-top: 12px;">
                        <a id="orderBtn" href="menu.html" class="btn btn-primary">Order Now</a>
                    </div>
                </div>--%>
                <asp:DataList ID="DtLsDet" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="imgFod" runat="server" ImageUrl='<%# Eval("Fo_Img") %>' />
                        <br />
                        <br />
                        <asp:Label ID="lblCat" runat="server" Text='<%# Eval("Cat_Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblFodNam" runat="server" Text='<%# Eval("Fo_Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblFodDesc" runat="server" Text='<%# Eval("Fo_desc") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblFodCal" runat="server" Text='<%# Eval("Fo_Calr") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblFodIngr" runat="server" Text='<%# Eval("Fo_ingr") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblFodPri" runat="server" Text='<%# Eval("Fo_Price") %>'></asp:Label>
                        <br />
                        <asp:LinkButton ID="lnkAdCart" runat="server">Add To Cart</asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </section>
    <style>
        .dish-hero {
            padding: 70px 0;
            background: linear-gradient(135deg, #f7931e, #ff6b35);
            color: #fff;
        }

        .dish-section {
            padding: 60px 0;
            background: var(--bg-secondary);
        }

        .dish-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .dish-card {
            background: var(--bg-card);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 16px;
        }

        .dish-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--text-color);
        }

        .dish-image {
            width: 100%;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
        }

        .meta {
            color: var(--text-color-light);
        }

        .nutrition {
            display: grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap: 10px;
            margin-top: 12px;
        }

        .nutri-item {
            background: var(--bg-primary);
            border: 1px solid var(--border-color-light);
            border-radius: 10px;
            padding: 10px;
        }

        .price {
            font-weight: 700;
            color: #e74c3c;
            font-size: 1.2rem;
        }

        @media (max-width: 992px) {
            .dish-layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

