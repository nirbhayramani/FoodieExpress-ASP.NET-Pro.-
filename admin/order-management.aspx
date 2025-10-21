<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="order-management.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.order_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Admin Content -->
    <div class="admin-container">
        <div class="admin-sidebar">
            <div class="sidebar-menu">
                <a href="index.aspx" class="sidebar-item">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                <a href="profile.aspx" class="sidebar-item">
                    <i class="fas fa-user-cog"></i>
                    <span>My Profile</span>
                </a>
                <a href="food-management.aspx" class="sidebar-item">
                    <i class="fas fa-hamburger"></i>
                    <span>Food Management</span>
                </a>
                <a href="category-management.aspx" class="sidebar-item">
                    <i class="fas fa-tags"></i>
                    <span>Category Management</span>
                </a>
                <a href="user-management.aspx" class="sidebar-item">
                    <i class="fas fa-users"></i>
                    <span>User Management</span>
                </a>
                <a href="order-management.aspx" class="sidebar-item active">
                    <i class="fas fa-shopping-bag"></i>
                    <span>Order Management</span>
                </a>
                <a href="../index.aspx" class="sidebar-item">
                    <i class="fas fa-external-link-alt"></i>
                    <span>View Website</span>
                </a>
            </div>
        </div>

        <div class="admin-main-content">
            <div class="admin-header" style="padding-top:3rem;">
                <h1>Order Management</h1>
                <p>Manage customer orders, update order status, and track payments</p>
                <div class="header-actions">
                    <asp:Button ID="btnRep" runat="server" Text="Orders Report" class="btn btn-primary" />
                    <asp:Button ID="btnRepItem" runat="server" Text="Ordered Items Report" class="btn btn-primary" />
                </div>
            </div>

            <%--<asp:GridView ID="grdVuOrd" runat="server" AutoGenerateColumns="False" OnRowCommand="grdVuOrd_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Or_Order_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer Name &amp; Email">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Or_Order_date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Or_Grand_Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Status">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Or_Ord_Stat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Status">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Or_Pay_Stat") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("Or_Order_Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>

            <asp:GridView ID="grdVuOrd" runat="server" AutoGenerateColumns="False" OnRowCommand="grdVuOrd_RowCommand" CssClass="admin-table">
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                            <center>
                            <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("Or_Order_Id") %>' CssClass="order-id"></asp:Label></center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <div class="customer-info">
                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("First_Name") + " " + Eval("Last_Name") %>'></asp:Label>
                                <%--<asp:Label ID="lblCustomerEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="customer-email"></asp:Label>--%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email ID">
                        <ItemTemplate>
                            <div class="customer-info">
                                <%--<asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("First_Name") + " " + Eval("Last_Name") %>'></asp:Label>--%>
                                <asp:Label ID="lblCustomerEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="customer-email"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Or_Order_date") %>' CssClass="order-date"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="lblTotal" runat="server" Text='<%# "₹" + Eval("Or_Grand_Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Status">
                        <ItemTemplate>
                            <asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("Or_Ord_Stat") %>' CssClass="status-badge"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Status">
                        <ItemTemplate>
                            <asp:Label ID="lblPaymentStatus" runat="server" Text='<%# Eval("Or_Pay_Stat") %>' CssClass="status-badge"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("Or_Order_Id") %>' CommandName="cmd_edt" CssClass="btn-edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <style>
                /* Custom styles for order management table */
                .order-id {
                    font-weight: 600;
                    color: #FF6B35;
                    font-family: 'Poppins', sans-serif;
                    letter-spacing: 0.5px;
                }

                .customer-info h4 {
                    margin: 0 0 5px 0;
                    font-size: 1rem;
                    color: #333;
                    font-weight: 600;
                }

                .customer-info p {
                    margin: 0;
                    font-size: 0.85rem;
                    color: #666;
                    font-style: italic;
                }

                .order-date {
                    font-family: 'Poppins', sans-serif;
                    color: #555;
                    font-size: 0.9rem;
                    font-weight: 500;
                }

                /* Add a subtle hover effect to the table rows */
                .admin-table tr:hover td {
                    background-color: #fff9f2;
                }

                /* Style for the order details modal customer information */
                #modal-order-id {
                    color: #FF6B35;
                    font-weight: 600;
                }

                #modal-customer-name {
                    font-weight: 600;
                    color: #333;
                }

                #modal-customer-email {
                    color: #666;
                    font-style: italic;
                }

                #modal-order-date {
                    color: #555;
                    font-weight: 500;
                }



                /* GridView Styling */
                .admin-main-content {
                    padding: 20px;
                    background: #f8f9fa;
                }

                #ContentPlaceHolder2_grdVuOrd {
                    width: 100%;
                    border-collapse: collapse;
                    background: white;
                    border-radius: 8px;
                    overflow: hidden;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                    margin-top: 20px;
                }

                    #ContentPlaceHolder2_grdVuOrd th {
                        background: #f8f9fa;
                        padding: 15px 12px;
                        text-align: left;
                        font-weight: 600;
                        color: #333;
                        border-bottom: 1px solid #dee2e6;
                        font-size: 0.9rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    #ContentPlaceHolder2_grdVuOrd td {
                        padding: 15px 12px;
                        border-bottom: 1px solid #dee2e6;
                        color: #555;
                        font-size: 0.9rem;
                    }

                    #ContentPlaceHolder2_grdVuOrd tr:last-child td {
                        border-bottom: none;
                    }

                    #ContentPlaceHolder2_grdVuOrd tr:hover {
                        background-color: #f8f9fa;
                    }

                    /* Order ID Styling */
                    #ContentPlaceHolder2_grdVuOrd td:first-child {
                        font-weight: 600;
                        color: #FF6B35;
                    }

                    /* Customer Info Styling */
                    #ContentPlaceHolder2_grdVuOrd td:nth-child(2) {
                        font-weight: 500;
                    }

                        #ContentPlaceHolder2_grdVuOrd td:nth-child(2) br + span {
                            color: #666;
                            font-size: 0.85rem;
                            font-style: italic;
                        }

                    /* Status Badges */
                    #ContentPlaceHolder2_grdVuOrd td:nth-child(5),
                    #ContentPlaceHolder2_grdVuOrd td:nth-child(6) {
                        font-weight: 500;
                    }

                        /* Processing/Delivered status */
                        #ContentPlaceHolder2_grdVuOrd td:nth-child(5):contains("Processing") {
                            color: #ffc107;
                        }

                        #ContentPlaceHolder2_grdVuOrd td:nth-child(5):contains("Delivered") {
                            color: #28a745;
                        }

                        /* Payment Status */
                        #ContentPlaceHolder2_grdVuOrd td:nth-child(6):contains("Paid") {
                            color: #28a745;
                        }

                    /* Action Links */
                    #ContentPlaceHolder2_grdVuOrd .lnkEdit {
                        color: #007bff;
                        text-decoration: none;
                        font-weight: 500;
                        padding: 5px 10px;
                        border-radius: 4px;
                        transition: all 0.3s ease;
                    }

                        #ContentPlaceHolder2_grdVuOrd .lnkEdit:hover {
                            background-color: #007bff;
                            color: white;
                            text-decoration: none;
                        }

                /* Header Actions */
                .header-actions {
                    margin: 20px 0;
                }

                .btn {
                    padding: 10px 20px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: 500;
                    margin-right: 10px;
                    transition: all 0.3s ease;
                }

                /* Search and Filter Section */
                .admin-main-content > div:first-child {
                    background: white;
                    padding: 20px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                }

                /* Responsive */
                @media (max-width: 768px) {
                    #ContentPlaceHolder2_grdVuOrd {
                        font-size: 0.8rem;
                    }

                        #ContentPlaceHolder2_grdVuOrd th,
                        #ContentPlaceHolder2_grdVuOrd td {
                            padding: 10px 8px;
                        }
                }
            </style>
        </div>
    </div>
</asp:Content>
