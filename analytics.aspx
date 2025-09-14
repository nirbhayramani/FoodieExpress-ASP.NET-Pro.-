<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="analytics.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.analytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Main Content -->
    <main class="admin-main">
        <div class="container">
            <!-- Page Header -->
            <div class="dashboard-header">
                <h1>Analytics & Reports</h1>
                <p>Track your restaurant's performance with detailed analytics and insights.</p>
            </div>

            <!-- Analytics Filters -->
            <div class="analytics-filters">
                <select class="time-filter">
                    <option value="today">Today</option>
                    <option value="week">This Week</option>
                    <option value="month" selected>This Month</option>
                    <option value="quarter">This Quarter</option>
                    <option value="year">This Year</option>
                </select>
                <button class="btn btn-primary">
                    <i class="fas fa-download"></i>
                    Export Report
                </button>
            </div>

            <!-- Key Metrics -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Revenue Growth</h3>
                        <p class="stat-number">+12.5%</p>
                        <span class="stat-change positive">vs last month</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Order Volume</h3>
                        <p class="stat-number">1,247</p>
                        <span class="stat-change positive">+8% vs last month</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Average Order Value</h3>
                        <p class="stat-number">$24.50</p>
                        <span class="stat-change positive">+$2.30 vs last month</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Avg Delivery Time</h3>
                        <p class="stat-number">28 min</p>
                        <span class="stat-change negative">+2 min vs last month</span>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="analytics-content">
                <div class="analytics-left">
                    <!-- Revenue Chart -->
                    <div class="dashboard-card">
                        <div class="card-header">
                            <h3>Revenue Trends</h3>
                            <div class="chart-controls">
                                <button class="btn btn-sm active">Daily</button>
                                <button class="btn btn-sm">Weekly</button>
                                <button class="btn btn-sm">Monthly</button>
                            </div>
                        </div>
                        <div class="chart-container">
                            <div class="chart-placeholder">
                                <i class="fas fa-chart-area"></i>
                                <p>Revenue Chart</p>
                                <small>Chart visualization would be implemented with Chart.js or similar library</small>
                            </div>
                        </div>
                    </div>

                    <!-- Popular Items Chart -->
                    <div class="dashboard-card">
                        <div class="card-header">
                            <h3>Top Selling Items</h3>
                        </div>
                        <div class="popular-items-chart">
                            <div class="chart-item">
                                <div class="item-info">
                                    <img src="../images/margherita-pizza.jpg" alt="Margherita Pizza" class="item-img">
                                    <div>
                                        <h4>Margherita Pizza</h4>
                                        <p>127 orders</p>
                                    </div>
                                </div>
                                <div class="chart-bar">
                                    <div class="bar-fill" style="width: 100%"></div>
                                </div>
                                <span class="percentage">100%</span>
                            </div>
                            <div class="chart-item">
                                <div class="item-info">
                                    <img src="../images/grilled-salmon.jpg" alt="Grilled Salmon" class="item-img">
                                    <div>
                                        <h4>Grilled Salmon</h4>
                                        <p>89 orders</p>
                                    </div>
                                </div>
                                <div class="chart-bar">
                                    <div class="bar-fill" style="width: 70%"></div>
                                </div>
                                <span class="percentage">70%</span>
                            </div>
                            <div class="chart-item">
                                <div class="item-info">
                                    <img src="../images/Classic Burger.jpg" alt="Gourmet Burger" class="item-img">
                                    <div>
                                        <h4>Gourmet Burger</h4>
                                        <p>156 orders</p>
                                    </div>
                                </div>
                                <div class="chart-bar">
                                    <div class="bar-fill" style="width: 85%"></div>
                                </div>
                                <span class="percentage">85%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="analytics-right">
                    <!-- Customer Insights -->
                    <div class="dashboard-card">
                        <div class="card-header">
                            <h3>Customer Insights</h3>
                        </div>
                        <div class="insights-list">
                            <div class="insight-item">
                                <div class="insight-icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <div class="insight-content">
                                    <h4>New Customers</h4>
                                    <p>247 new customers this month</p>
                                    <span class="insight-change positive">+15%</span>
                                </div>
                            </div>
                            <div class="insight-item">
                                <div class="insight-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="insight-content">
                                    <h4>Customer Satisfaction</h4>
                                    <p>4.8/5 average rating</p>
                                    <span class="insight-change positive">+0.2</span>
                                </div>
                            </div>
                            <div class="insight-item">
                                <div class="insight-icon">
                                    <i class="fas fa-redo"></i>
                                </div>
                                <div class="insight-content">
                                    <h4>Repeat Orders</h4>
                                    <p>68% of customers order again</p>
                                    <span class="insight-change positive">+5%</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Peak Hours -->
                    <div class="dashboard-card">
                        <div class="card-header">
                            <h3>Peak Hours</h3>
                        </div>
                        <div class="peak-hours">
                            <div class="hour-item">
                                <span class="hour">12:00 PM</span>
                                <div class="hour-bar">
                                    <div class="bar-fill" style="width: 90%"></div>
                                </div>
                                <span class="orders">45 orders</span>
                            </div>
                            <div class="hour-item">
                                <span class="hour">1:00 PM</span>
                                <div class="hour-bar">
                                    <div class="bar-fill" style="width: 100%"></div>
                                </div>
                                <span class="orders">52 orders</span>
                            </div>
                            <div class="hour-item">
                                <span class="hour">7:00 PM</span>
                                <div class="hour-bar">
                                    <div class="bar-fill" style="width: 85%"></div>
                                </div>
                                <span class="orders">38 orders</span>
                            </div>
                            <div class="hour-item">
                                <span class="hour">8:00 PM</span>
                                <div class="hour-bar">
                                    <div class="bar-fill" style="width: 75%"></div>
                                </div>
                                <span class="orders">32 orders</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

