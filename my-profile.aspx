<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="my-profile.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.my_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Hero -->
    <section class="profile-hero">
        <div class="container">
            <h1 class="profile-title">My Profile</h1>
        </div>
    </section>

    <!-- Profile with sidebar -->
    <section class="profile-section">
        <div class="container" style="display: grid; grid-template-columns: 260px 1fr; gap: 20px; align-items: start;">
            <aside class="review-card" style="position: sticky; top: 90px; padding: 0; overflow: hidden;">
                <div style="padding: 14px 16px; border-bottom: 1px solid var(--border-color-light); font-weight: 700; color: var(--text-color);">My Panel</div>
                <nav style="display: flex; flex-direction: column;">
                    <a href="my-profile.aspx" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">My Profile</a>
                    <a href="order-history.html" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">Order History</a>
                    <a href="my-reviews.html" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">My Reviews</a>
                    <a href="reviews.html" style="padding: 12px 16px; text-decoration: none; color: var(--text-color);">Write a Review</a>
                </nav>
            </aside>
            <div>
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="profile-info">
                            <h2>John Doe</h2>
                            <p>john.doe@example.com</p>
                        </div>
                    </div>
                    <div class="profile-form">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" value="John">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" value="Doe">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" value="john.doe@example.com">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" value="(555) 123-4567">
                        </div>
                        <div class="form-group full">
                            <label for="address">Address</label>
                            <input type="text" id="address" value="123 Main St, Anytown, USA">
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn-save">Save Changes</button>
                        </div>
                    </div>
                    <%--                    <asp:DataList ID="DtLsProf" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" />
                            &nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

                            <asp:TextBox ID="txtFnm" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtLnm" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtEml" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtPhn" runat="server"></asp:TextBox>
                            <asp:TextBox ID="txtAdd" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="form-group">
                        <button type="button" class="btn-save">Save Changes</button>
                    </div>--%>
                </div>

                <!-- Change Password Link -->
                <div class="profile-card" style="margin-top: 20px;">
                    <h3 style="margin-top: 0; margin-bottom: 20px; color: var(--text-color);">Security Settings</h3>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <div>
                            <p style="margin-bottom: 5px; font-weight: 500;">Password</p>
                            <p style="color: #666; font-size: 14px;">Update your password to keep your account secure</p>
                        </div>
                        <a href="change-password.html" class="btn-save" style="text-decoration: none; display: inline-block; text-align: center;">Change Password</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <style>.profile-hero { padding: 70px 0; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #fff; }
        .profile-hero .container { display:flex; align-items:center; justify-content:space-between; }
        .profile-title { font-size: 2rem; font-weight: 700; }
        .profile-section { padding: 60px 0; background: var(--bg-secondary); }
        .profile-card { background: var(--bg-card); border-radius: 12px; box-shadow: var(--card-shadow); padding: 20px; margin-bottom: 20px; }
        .profile-header { display:flex; align-items:center; gap: 20px; margin-bottom: 20px; }
        .profile-avatar { width: 80px; height: 80px; border-radius: 50%; background: #ddd; display: flex; align-items: center; justify-content: center; }
        .profile-avatar i { font-size: 40px; color: #888; }
        .profile-info h2 { margin: 0 0 5px 0; color: var(--text-color); }
        .profile-info p { margin: 0; color: var(--text-color-light); }
        .profile-form { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        .review-card { background: var(--bg-card); border-radius: 12px; box-shadow: var(--card-shadow); padding: 16px; margin-bottom: 16px; }
        .review-header { display:flex; align-items:center; justify-content: space-between; margin-bottom: 8px; }
        .form-group { margin-bottom: 16px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: 500; color: var(--text-color); }
        .form-group input { width: 100%; padding: 10px; border: 1px solid var(--border-color); border-radius: 6px; }
        .form-group.full { grid-column: span 2; }
        .btn-save { background: var(--primary-color); color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer; }</style>
    <%--<style>
        .profile-hero {
            padding: 70px 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
        }

            .profile-hero .container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding-top: 70px;
            }

        .profile-title {
            font-size: 2rem;
            font-weight: 700;
        }

        .profile-section {
            padding: 60px 0;
            background: var(--bg-secondary);
        }

        .profile-card {
            background: var(--bg-card);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            margin-bottom: 20px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .profile-avatar i {
                font-size: 40px;
                color: #888;
            }

        .profile-info h2 {
            margin: 0 0 5px 0;
            color: var(--text-color);
        }

        .profile-info p {
            margin: 0;
            color: var(--text-color-light);
        }

        .profile-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .review-card {
            background: var(--bg-card);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 16px;
            margin-bottom: 16px;
        }

        .review-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        /*        .form-group {
            margin-bottom: 16px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
                color: var(--text-color);
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid var(--border-color);
                border-radius: 6px;
            }*/

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }

            .form-group label {
                width: 120px; /* Adjust label width as needed */
                margin-bottom: 0;
                margin-right: 10px;
                font-weight: 500;
                color: var(--text-color);
            }

            .form-group input {
                flex: 1;
                padding: 10px;
                border: 1px solid var(--border-color);
                border-radius: 6px;
            }


            .form-group.full {
                grid-column: span 2;
            }

        .btn-save {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>--%>
    <script>
        // Change Password Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const changePasswordBtn = document.getElementById('changePasswordBtn');

            if (changePasswordBtn) {
                changePasswordBtn.addEventListener('click', function () {
                    const currentPassword = document.getElementById('currentPassword').value;
                    const newPassword = document.getElementById('newPassword').value;
                    const confirmPassword = document.getElementById('confirmPassword').value;

                    // Validate inputs
                    if (!currentPassword || !newPassword || !confirmPassword) {
                        alert('Please fill in all password fields');
                        return;
                    }

                    if (newPassword !== confirmPassword) {
                        alert('New password and confirmation do not match');
                        return;
                    }

                    if (newPassword.length < 6) {
                        alert('New password must be at least 6 characters long');
                        return;
                    }

                    // Get current user from localStorage
                    const currentUser = JSON.parse(localStorage.getItem('currentUser'));

                    if (!currentUser) {
                        alert('You must be logged in to change your password');
                        window.location.href = 'login.html';
                        return;
                    }

                    // Check if current password is correct (in a real app, this would be done server-side)
                    if (currentUser.password !== currentPassword) {
                        alert('Current password is incorrect');
                        return;
                    }

                    // Update password in localStorage
                    currentUser.password = newPassword;
                    localStorage.setItem('currentUser', JSON.stringify(currentUser));

                    // Update in users array if exists
                    const users = JSON.parse(localStorage.getItem('users')) || [];
                    const userIndex = users.findIndex(user => user.email === currentUser.email);

                    if (userIndex !== -1) {
                        users[userIndex].password = newPassword;
                        localStorage.setItem('users', JSON.stringify(users));
                    }

                    // Show success message
                    alert('Password updated successfully!');

                    // Clear form
                    document.getElementById('currentPassword').value = '';
                    document.getElementById('newPassword').value = '';
                    document.getElementById('confirmPassword').value = '';
                });
            }
        });
    </script>
</asp:Content>

