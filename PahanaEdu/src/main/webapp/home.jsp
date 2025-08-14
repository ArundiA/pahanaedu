<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu Bookstore</title>
    <link rel="stylesheet" href="CSS/home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/png">
</head>
<body>
    <!-- Header -->
    <header class="header" id="header">
        <div class="container">
            <nav class="navbar">
                <a href="#" class="logo">
                    <i class="fas fa-book-open logo-icon"></i>
                    <span>Pahana Edu</span>
                </a>
                
                <ul class="nav-links" id="navLinks">
                    <li><a href="#home" class="nav-link">Home</a></li>
                    <li><a href="#features" class="nav-link">Service</a></li>
                    <li><a href="#about" class="nav-link">About</a></li>
                    <li><a href="#contact" class="nav-link">Contact</a></li>
                    <li><a href="adminlogin.jsp" class="nav-link nav-cta" onclick="login()">Login</a></li>
                </ul>
                
                <button class="mobile-menu-btn" id="mobileMenuBtn">
                    <i class="fas fa-bars"></i>
                </button>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">Unlock Knowledge with Premium Educational Resources</h1>
                <p class="hero-subtitle">Discover our extensive collection of textbooks, reference materials, and learning tools designed to empower students and educators.</p>
                <div class="hero-buttons">
                    <a href="#features" class="btn btn-primary">Explore Books</a>
                    <a href="#contact" class="btn btn-accent">Get in Touch</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="section features" id="features">
        <div class="container">
            <h2 class="section-title">Why Choose Pahana Edu</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <h3 class="feature-title">Comprehensive Collection</h3>
                    <p>Thousands of titles across all academic disciplines and educational levels, carefully curated for quality.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-tag"></i>
                    </div>
                    <h3 class="feature-title">Competitive Pricing</h3>
                    <p>Student-friendly prices with regular discounts, bulk purchase options, and special educator rates.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h3 class="feature-title">Quality Assurance</h3>
                    <p>All materials vetted by educational professionals to ensure accuracy and pedagogical value.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="section about" id="about">
        <div class="container">
            <h2 class="section-title">About Our Bookstore</h2>
            <div class="about-content">
                <div class="about-text">
                    <p>Founded in 2010, Pahana Edu Bookstore has grown from a small local shop to a leading provider of educational resources nationwide. Our mission is to bridge the gap between knowledge seekers and quality educational materials.</p>
                    <p>We work directly with publishers, educators, and academic institutions to ensure our inventory meets the highest standards and addresses current educational needs.</p>
                    <p>Our team consists of former educators and subject matter experts who personally evaluate each title we carry.</p>
                    <div class="stats">
                        <div class="stat-item">
                            <h3>10,000+</h3>
                            <p>Books in Stock</p>
                        </div>
                        <div class="stat-item">
                            <h3>500+</h3>
                            <p>Schools Served</p>
                        </div>
                    </div>
                </div>
                <div class="about-image">
                    <img src="image/b5.jpg" alt="Pahana Edu Bookstore interior">
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="section contact" id="contact">
        <div class="container">
            <h2 class="section-title">Contact Us</h2>
            <form class="contact-form" id="contactForm">
                <div class="form-group">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" id="name" class="form-control" required placeholder="Enter your name">
                </div>
                
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" id="email" class="form-control" required placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label for="subject" class="form-label">Subject</label>
                    <input type="text" id="subject" class="form-control" required placeholder="Subject of your message">
                </div>
                
                <div class="form-group">
                    <label for="message" class="form-label">Message</label>
                    <textarea id="message" class="form-control" required placeholder="Your message here..."></textarea>
                </div>
                
                <button type="submit" class="btn btn-accent">Send Message <i class="fas fa-paper-plane"></i></button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-col">
                    <div class="footer-logo">
                        <i class="fas fa-book-open"></i> Pahana Edu
                    </div>
                    <p>Providing quality educational resources since 2010.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                
                <div class="footer-col">
                    <h3 class="footer-links-title">Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#features">Features</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-col">
                    <h3 class="footer-links-title">Resources</h3>
                    <ul class="footer-links">
                        <li><a href="#">Textbooks</a></li>
                        <li><a href="#">Reference Books</a></li>
                        <li><a href="#">Study Guides</a></li>
                        <li><a href="#">Educational Tools</a></li>
                    </ul>
                </div>
                
                <div class="footer-col">
                    <h3 class="footer-links-title">Contact Info</h3>
                    <ul class="footer-links">
                        <li><i class="fas fa-map-marker-alt"></i> 123 Education St, Colombo</li>
                        <li><i class="fas fa-phone"></i> +94 112 345 678</li>
                        <li><i class="fas fa-envelope"></i> info@pahanaedu.com</li>
                    </ul>
                </div>
            </div>
            
            <div class="copyright">
                <p>&copy; 2025 Pahana Edu Bookstore. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Mobile Menu Toggle
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const navLinks = document.getElementById('navLinks');
        
        mobileMenuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            mobileMenuBtn.innerHTML = navLinks.classList.contains('active') 
                ? '<i class="fas fa-times"></i>' 
                : '<i class="fas fa-bars"></i>';
        });
        
        // Header Scroll Effect
        window.addEventListener('scroll', () => {
            const header = document.getElementById('header');
            header.classList.toggle('scrolled', window.scrollY > 50);
        });
        
        // Smooth Scrolling for Anchor Links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                if(this.getAttribute('href') === '#') return;
                
                const target = document.querySelector(this.getAttribute('href'));
                if(target) {
                    window.scrollTo({
                        top: target.offsetTop - 80,
                        behavior: 'smooth'
                    });
                    
                    // Close mobile menu if open
                    if(navLinks.classList.contains('active')) {
                        navLinks.classList.remove('active');
                        mobileMenuBtn.innerHTML = '<i class="fas fa-bars"></i>';
                    }
                }
            });
        });
        
        // Form Submission
        const contactForm = document.getElementById('contactForm');
        if(contactForm) {
            contactForm.addEventListener('submit', function(e) {
                e.preventDefault();
                alert('Thank you for your message! We will get back to you soon.');
                this.reset();
            });
        }
        
        function login() {
            // In a real application, this would redirect to a login page
            alert("Login functionality will be implemented here!");
            return false;
        }
    </script>
</body>
</html>