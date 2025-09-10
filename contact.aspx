<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="FoodieExpress___ASP.NET_Pro.__.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Contact Hero Section -->
    <section class="contact-hero">
        <div class="container">
            <div class="contact-hero-content">
                <h1 class="contact-hero-title">Get in Touch</h1>
                <p class="contact-hero-subtitle">
                    We'd love to hear from you. Let's start a conversation.
                </p>
            </div>
        </div>
    </section>

    <!-- Contact Information Section -->
    <section class="contact-info-section">
        <div class="container">
            <div class="contact-grid">
                <div class="contact-info-card">
                    <div class="contact-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <h3>Visit Us</h3>
                    <p>
                        123 Food Street<br>
                        Cuisine City, CC 12345
                    </p>
                </div>
                <div class="contact-info-card">
                    <div class="contact-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <h3>Call Us</h3>
                    <p>
                        +1 (555) 123-4567<br>
                        +1 (555) 987-6543
                    </p>
                </div>
                <div class="contact-info-card">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email Us</h3>
                    <p>
                        info@foodieexpress.com<br>
                        orders@foodieexpress.com
                    </p>
                </div>
                <div class="contact-info-card">
                    <div class="contact-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3>Opening Hours</h3>
                    <p>
                        Monday - Sunday<br>
                        10:00 AM - 10:00 PM
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="contact-form-section">
        <div class="container">
            <div class="contact-content">
                <div class="contact-form">
                    <h2>Send us a Message</h2>
                    <form id="contactForm">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="name">
                                    Full Name</label>
                                <input type="text" id="name" name="name" placeholder="Your full name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    Email Address</label>
                                <input type="email" id="email" name="email" placeholder="Your email address" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="phone">
                                    Phone Number</label>
                                <input type="tel" id="phone" name="phone" placeholder="Your phone number">
                            </div>
                            <div class="form-group">
                                <label for="subject">
                                    Subject</label>
                                <select id="subject" name="subject" required>
                                    <option value="">Select a subject</option>
                                    <option value="general">General Inquiry</option>
                                    <option value="order">Order Question</option>
                                    <option value="feedback">Feedback</option>
                                    <option value="partnership">Partnership</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="message">
                                Message</label>
                            <textarea id="message" name="message" placeholder="Tell us how we can help you..." rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">
                            Send Message
                        </button>
                    </form>
                </div>
                <div class="contact-map">
                    <h2>Find Us</h2>
                    <div class="map-container">
                        <img src="images/kitchen.jpg" alt="Location Map" class="map-placeholder">
                        <div class="map-overlay">
                            <p>
                                Interactive map coming soon!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq-section">
        <div class="container">
            <h2 class="section-title">Frequently Asked Questions</h2>
            <div class="faq-grid">
                <div class="faq-item">
                    <h3>What are your delivery times?</h3>
                    <p>
                        We offer 30-minute delivery or your meal is free. Delivery times may vary during peak hours.
                    </p>
                </div>
                <div class="faq-item">
                    <h3>Do you offer catering services?</h3>
                    <p>
                        Yes! We provide catering for events of all sizes. Please contact us at least 48 hours in advance.
                    </p>
                </div>
                <div class="faq-item">
                    <h3>Can I customize my order?</h3>
                    <p>
                        Absolutely! We're happy to accommodate dietary restrictions and special requests.
                    </p>
                </div>
                <div class="faq-item">
                    <h3>What payment methods do you accept?</h3>
                    <p>
                        We accept all major credit cards, cash, and digital payment methods including Apple Pay and Google Pay.
                    </p>
                </div>
                <div class="faq-item">
                    <h3>Do you have a loyalty program?</h3>
                    <p>
                        Yes! Join our rewards program to earn points on every order and receive exclusive offers.
                    </p>
                </div>
                <div class="faq-item">
                    <h3>What if I'm not satisfied with my order?</h3>
                    <p>
                        Your satisfaction is our priority. If you're not happy with your order, we'll make it right or provide a full refund.
                    </p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>


