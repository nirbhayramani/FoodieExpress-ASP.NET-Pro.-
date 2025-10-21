<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit-order.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.admin.edit_order" %>

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
                <h1>Edit Order</h1>
                <p>Update order status and payment information</p>
                <div class="header-actions">
                    <a href="order-management.aspx" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>
                        Back to Order Management
                    </a>
                </div>
            </div>

            <!-- Edit Order Form -->
            <div class="form-container">
                <form id="edit-order-form" class="admin-form">
                    <input type="hidden" id="order-id" name="orderId">

                    <div class="form-section">
                        <h3>Order Information</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Order ID</label>
                                <%--<input type="text" id="order-number" disabled>--%>
                                <asp:TextBox ID="txtOrdId" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Order Date</label>
                                <%--<input type="text" id="order-date" disabled>--%>
                                <asp:TextBox ID="txtOrdDt" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="order-status">Order Status *</label>
                                <%--<select id="order-status" name="orderStatus" required>
                                    <option value="pending">Pending</option>
                                    <option value="processing">Processing</option>
                                    <option value="shipped">Shipped</option>
                                    <option value="delivered">Delivered</option>
                                    <option value="cancelled">Cancelled</option>
                                </select>--%>
                                <asp:DropDownList ID="ddlOrdStat" runat="server">
                                    <asp:ListItem Value="Pending"></asp:ListItem>
                                    <asp:ListItem Value="Processing"></asp:ListItem>
                                    <asp:ListItem Value="Shipped"></asp:ListItem>
                                    <asp:ListItem Value="Delivered"></asp:ListItem>
                                    <asp:ListItem Value="Cancelled"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="payment-status">Payment Status *</label>
                                <%--<select id="payment-status" name="paymentStatus" required>
                                    <option value="pending">Pending</option>
                                    <option value="paid">Paid</option>
                                    <option value="failed">Failed</option>
                                    <option value="refunded">Refunded</option>
                                </select>--%>
                                <asp:DropDownList ID="ddlPayStat" runat="server">
                                    <asp:ListItem Value="Pending"></asp:ListItem>
                                    <asp:ListItem Value="Paid"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>Customer Information (Read-only)</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Customer Name</label>
                                <%--<input type="text" id="customer-name" disabled>--%>
                                <asp:TextBox ID="txtCustNm" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <%--<input type="email" id="customer-email" disabled>--%>
                                <asp:TextBox ID="txtCustEml" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Phone</label>
                                <%--<input type="text" id="customer-phone" disabled>--%>
                                <asp:TextBox ID="txtCustPhn" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Payment Method</label>
                                <%--<input type="text" id="payment-method" disabled>--%>
                                <asp:TextBox ID="txtPayMeth" runat="server" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>Shipping Address (Read-only)</h3>
                        <div class="form-row">
                            <div class="form-group full-width">
                                <label>Address</label>
                                <%--<textarea id="shipping-address" rows="3" disabled></textarea>--%>
                                <asp:TextBox ID="txtShipAdd" runat="server" Enabled="false" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>Order Items (Read-only)</h3>
                        <div class="table-container" style="margin-top: 20px;">
                            <table class="admin-table" id="order-items-table">
                                <%--<thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody id="order-items-body">
                                    <!-- Will be populated by JavaScript -->
                                </tbody>--%>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" class="text-right"><strong>Subtotal:</strong></td>
                                        <td id="subtotal">
                                            <asp:Label ID="lblSubTot" runat="server" Text="₹0.00"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="text-right"><strong>Shipping:</strong></td>
                                        <td id="shipping">
                                            <asp:Label ID="lblShip" runat="server" Text="₹100.00"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="text-right"><strong>Tax:</strong></td>
                                        <td id="tax">
                                            <asp:Label ID="lblTax" runat="server" Text="₹0.00"></asp:Label></td>
                                    </tr>
                                    <tr class="total-row">
                                        <td colspan="3" class="text-right"><strong>Total:</strong></td>
                                        <td id="total">
                                            <asp:Label ID="lblGrdTot" runat="server" Text="₹0.00"></asp:Label></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <%--<div class="form-section">
                        <h3>Admin Notes</h3>
                        <div class="form-row">
                            <div class="form-group full-width">
                                <label for="admin-notes">Notes</label>
                                <textarea id="admin-notes" name="adminNotes" rows="3" placeholder="Add any notes about this order..."></textarea>
                            </div>
                        </div>
                    </div>--%>

                    <div class="form-actions">
                        <%--<button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            Save Changes
                        </button>--%>
                        <asp:LinkButton ID="lnkSvChg" runat="server" class="btn btn-primary" OnClick="lnkSvChg_Click"><i class="fas fa-save"></i> Save Changes</asp:LinkButton>
                        <a href="order-management.aspx" class="btn btn-secondary">
                            <i class="fas fa-times"></i>
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="admin-scripts.js"></script>
</asp:Content>

