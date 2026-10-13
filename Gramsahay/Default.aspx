<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Gramsahay.Default" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* HOME PAGE SPECIFIC STYLES */
        .hero-section {
            background: linear-gradient(135deg, #0a172a 0%, #0d213a 100%);
            color: #ffffff;
            padding: 80px 48px 90px;
            position: relative;
            overflow: hidden;
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            gap: 56px;
            align-items: center;
        }

        .hero-title {
            font-size: 32px;
            font-weight: 700;
            line-height: 1.45;
            color: #ffffff;
            margin-bottom: 36px;
            letter-spacing: -0.3px;
        }

        .hero-btn-group {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .btn-hero-green {
            background-color: #10b981;
            color: #ffffff;
            padding: 13px 26px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            border: none;
        }

        .btn-hero-green:hover {
            background-color: #059669;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(16, 185, 129, 0.3);
        }

        .btn-hero-outline {
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.25);
            padding: 13px 26px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-hero-outline:hover {
            background: rgba(255, 255, 255, 0.12);
            border-color: #ffffff;
        }

        /* HERO CARD PREVIEW */
        .hero-preview-card {
            background: rgba(15, 33, 58, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.12);
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .preview-scheme-row {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 10px;
            padding: 14px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .preview-scheme-info {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .preview-scheme-name {
            font-size: 14px;
            font-weight: 700;
            color: #ffffff;
        }

        .preview-scheme-sub {
            font-size: 12px;
            color: #94a3b8;
        }

        .preview-percent-badge {
            font-size: 13px;
            font-weight: 700;
            color: #10b981;
        }

        .btn-preview-check {
            background-color: #10b981;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 4px;
            transition: background 0.2s;
        }

        .btn-preview-check:hover {
            background-color: #059669;
        }

        /* STATS STRIP */
        .stats-strip {
            background-color: #10b981;
            color: #ffffff;
            padding: 28px 48px;
        }

        .stats-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            text-align: center;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 800;
            line-height: 1.1;
        }

        .stat-label {
            font-size: 13px;
            font-weight: 500;
            opacity: 0.95;
            margin-top: 4px;
        }

        /* HOW IT WORKS */
        .section-wrap {
            padding: 80px 48px;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        .section-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-tag {
            font-size: 12px;
            font-weight: 700;
            color: #10b981;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 8px;
        }

        .section-title {
            font-size: 28px;
            font-weight: 800;
            color: #0f172a;
        }

        .steps-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 28px;
        }

        .step-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 36px 28px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.02);
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.2s;
        }

        .step-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        }

        .step-number-circle {
            width: 52px;
            height: 52px;
            border-radius: 50%;
            background-color: #0e1e36;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .step-card-title {
            font-size: 18px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 10px;
        }

        .step-card-desc {
            font-size: 14px;
            color: #64748b;
            line-height: 1.5;
        }

        /* FEATURES SECTION */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .feature-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 28px 24px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.02);
            transition: all 0.2s;
        }

        .feature-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.04);
        }

        .feature-icon-box {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: #f1f5f9;
            color: #0e1e36;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 18px;
        }

        .feature-title {
            font-size: 16px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .feature-desc {
            font-size: 13.5px;
            color: #64748b;
            line-height: 1.55;
        }

        /* CTA SECTION */
        .cta-strip {
            background-color: #0e1e36;
            color: #ffffff;
            padding: 70px 48px;
            text-align: center;
        }

        .cta-container {
            max-width: 700px;
            margin: 0 auto;
        }

        .cta-title {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .cta-sub {
            font-size: 15px;
            color: #94a3b8;
            margin-bottom: 30px;
        }

        .cta-btn-group {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
        }

        .btn-cta-green {
            background-color: #10b981;
            color: #ffffff;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-cta-green:hover {
            background-color: #059669;
        }

        .btn-cta-login {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.35);
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-cta-login:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: #ffffff;
        }

        @media (max-width: 900px) {
            .hero-section { padding: 48px 20px; }
            .hero-container { grid-template-columns: 1fr; gap: 40px; }
            .stats-grid { grid-template-columns: repeat(2, 1fr); gap: 20px; }
            .section-wrap { padding: 50px 20px; }
            .steps-grid, .features-grid { grid-template-columns: 1fr; }
            .cta-strip { padding: 50px 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Banner Matching Screenshot 1 -->
    <section class="hero-section">
        <div class="hero-container">
            <div class="hero-left">
                <h1 class="hero-title">
                    GramSahay helps rural citizens instantly discover welfare schemes based on age, income, and occupation. Check eligibility in under 2 minutes &mdash; completely free.
                </h1>
                <div class="hero-btn-group">
                    <a href="Register.aspx" class="btn-hero-green">
                        Get Started Free &rarr;
                    </a>
                    <a href='<%= (Session["User"] != null) ? "EligibleSchemes.aspx" : "Login.aspx?returnUrl=EligibleSchemes.aspx" %>' class="btn-hero-outline">
                        Browse Schemes
                    </a>
                </div>
            </div>

            <div class="hero-right">
                <div class="hero-preview-card">
                    <div class="preview-scheme-row">
                        <div class="preview-scheme-info">
                            <div class="preview-scheme-name">Ayushman Bharat PMJAY</div>
                            <div class="preview-scheme-sub">Health &bull; 5L/yr</div>
                        </div>
                        <div class="preview-percent-badge">95%</div>
                    </div>

                    <div class="preview-scheme-row">
                        <div class="preview-scheme-info">
                            <div class="preview-scheme-name">PM Awas Yojana</div>
                            <div class="preview-scheme-sub">Housing &bull; 1.3L</div>
                        </div>
                        <div class="preview-percent-badge">87%</div>
                    </div>

                    <a href='<%= (Session["User"] != null) ? "CheckEligibility.aspx" : "Login.aspx?returnUrl=CheckEligibility.aspx" %>' class="btn-preview-check">
                        Check My Eligibility &rarr;
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Green Stats Strip -->
    <div class="stats-strip">
        <div class="stats-grid">
            <div class="stat-item">
                <div class="stat-value">50+</div>
                <div class="stat-label">Active Schemes</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">2.4L+</div>
                <div class="stat-label">Citizens Helped</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">28</div>
                <div class="stat-label">States Covered</div>
            </div>
            <div class="stat-item">
                <div class="stat-value">8</div>
                <div class="stat-label">Categories</div>
            </div>
        </div>
    </div>

    <!-- HOW IT WORKS Section -->
    <div class="section-wrap">
        <div class="section-header">
            <div class="section-tag">HOW IT WORKS</div>
            <h2 class="section-title">Three Simple Steps</h2>
        </div>

        <div class="steps-grid">
            <div class="step-card">
                <div class="step-number-circle">01</div>
                <h3 class="step-card-title">Register</h3>
                <p class="step-card-desc">Create your free account with basic details.</p>
            </div>

            <div class="step-card">
                <div class="step-number-circle">02</div>
                <h3 class="step-card-title">Fill Details</h3>
                <p class="step-card-desc">Enter age, income, occupation and location.</p>
            </div>

            <div class="step-card">
                <div class="step-number-circle">03</div>
                <h3 class="step-card-title">Get Results</h3>
                <p class="step-card-desc">Instantly see all schemes you qualify for.</p>
            </div>
        </div>
    </div>

    <!-- FEATURES Section -->
    <div style="background-color: #ffffff; border-top: 1px solid #e2e8f0; border-bottom: 1px solid #e2e8f0;">
        <div class="section-wrap">
            <div class="section-header">
                <div class="section-tag">FEATURES</div>
                <h2 class="section-title">Why Choose GramSahay?</h2>
            </div>

            <div class="features-grid">
                <!-- 1: Smart Eligibility Check -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                    </div>
                    <h3 class="feature-title">Smart Eligibility Check</h3>
                    <p class="feature-desc">Answer simple questions and get matched to schemes in seconds.</p>
                </div>

                <!-- 2: Personalized Results -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    </div>
                    <h3 class="feature-title">Personalized Results</h3>
                    <p class="feature-desc">Schemes recommended based on your unique profile.</p>
                </div>

                <!-- 3: Document Checklist -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect><path d="m9 14 2 2 4-4"></path></svg>
                    </div>
                    <h3 class="feature-title">Document Checklist</h3>
                    <p class="feature-desc">Know exactly which documents to prepare for each scheme.</p>
                </div>

                <!-- 4: Save & Track -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </div>
                    <h3 class="feature-title">Save &amp; Track</h3>
                    <p class="feature-desc">Bookmark schemes and track your application status.</p>
                </div>

                <!-- 5: Instant Alerts -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                    </div>
                    <h3 class="feature-title">Instant Alerts</h3>
                    <p class="feature-desc">Get notified about new schemes and deadlines.</p>
                </div>

                <!-- 6: Secure Platform -->
                <div class="feature-card">
                    <div class="feature-icon-box">
                        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                    </div>
                    <h3 class="feature-title">Secure Platform</h3>
                    <p class="feature-desc">Your data is encrypted and fully protected.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Ready to Get Started? CTA -->
    <div class="cta-strip">
        <div class="cta-container">
            <h2 class="cta-title">Ready to Get Started?</h2>
            <p class="cta-sub">Register for free and discover schemes you qualify for in minutes.</p>
            <div class="cta-btn-group">
                <a href="Register.aspx" class="btn-cta-green">Register Now</a>
                <a href="Login.aspx" class="btn-cta-login">Login</a>
            </div>
        </div>
    </div>
</asp:Content>
