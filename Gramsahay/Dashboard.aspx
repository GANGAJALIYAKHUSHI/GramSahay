<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Gramsahay.Dashboard" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* USER DASHBOARD SPECIFIC STYLES */
        .dash-welcome-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
        }

        .dash-greeting-title {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.2px;
        }

        .dash-greeting-sub {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 2px;
        }

        .btn-check-elig {
            background-color: #10b981;
            color: #ffffff;
            padding: 11px 22px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);
        }

        .btn-check-elig:hover {
            background-color: #059669;
            transform: translateY(-1px);
        }

        /* METRIC CARDS GRID */
        .dash-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px 20px;
            display: flex;
            align-items: center;
            gap: 16px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            transition: transform 0.15s;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
        }

        .stat-icon-wrap {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-blue { background-color: #eff6ff; color: #3b82f6; }
        .icon-green { background-color: #ecfdf5; color: #10b981; }
        .icon-amber { background-color: #fffbeb; color: #f59e0b; }
        .icon-red { background-color: #fef2f2; color: #ef4444; }

        .stat-info {
            display: flex;
            flex-direction: column;
        }

        .stat-num {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.1;
        }

        .stat-desc {
            font-size: 12px;
            font-weight: 500;
            color: #64748b;
            margin-top: 4px;
        }

        /* 2-COLUMN MAIN LAYOUT */
        .dash-cols-layout {
            display: grid;
            grid-template-columns: 1.7fr 1fr;
            gap: 24px;
        }

        /* SECTION CARDS */
        .dash-box {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .dash-box-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .dash-box-title {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
        }

        .dash-box-link {
            font-size: 12.5px;
            font-weight: 600;
            color: #2563eb;
            text-decoration: none;
        }

        .dash-box-link:hover {
            text-decoration: underline;
        }

        /* NOTIFICATIONS LIST */
        .notif-items-list {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .notif-item {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .notif-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            margin-top: 6px;
            flex-shrink: 0;
        }

        .dot-blue { background-color: #3b82f6; }
        .dot-green { background-color: #10b981; }

        .notif-content {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .notif-title-text {
            font-size: 13.5px;
            font-weight: 600;
            color: #1e293b;
            line-height: 1.4;
        }

        .notif-time-text {
            font-size: 12px;
            color: #94a3b8;
        }

        /* QUICK ACTIONS */
        .quick-actions-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .quick-action-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 14px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            text-decoration: none;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.15s;
        }

        .quick-action-item:hover {
            background-color: #f1f5f9;
            border-color: #cbd5e1;
            color: #0f172a;
            transform: translateX(2px);
        }

        .quick-action-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .quick-action-icon {
            color: #64748b;
        }

        .quick-action-arrow {
            color: #94a3b8;
            font-size: 16px;
        }

        /* PROFILE COMPLETION CARD */
        .profile-progress-box {
            margin-top: 20px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px 24px;
        }

        .profile-progress-header {
            font-size: 13px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 10px;
        }

        .progress-bar-bg {
            width: 100%;
            height: 8px;
            background-color: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .progress-bar-fill {
            height: 100%;
            background-color: #10b981;
            border-radius: 4px;
            width: 80%;
        }

        .progress-foot-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 12px;
        }

        .progress-percent-label {
            color: #64748b;
            font-weight: 500;
        }

        .progress-update-link {
            color: #2563eb;
            font-weight: 700;
            text-decoration: none;
        }

        .progress-update-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .dash-stats-grid { grid-template-columns: repeat(2, 1fr); }
            .dash-cols-layout { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Top Welcome Greeting Matching Screenshot 8 -->
    <div class="dash-welcome-row">
        <div>
            <h1 class="dash-greeting-title">Good Morning, Ramesh!</h1>
            <p class="dash-greeting-sub">Here's your eligibility overview.</p>
        </div>

        <a href="CheckEligibility.aspx" class="btn-check-elig">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
            Check Eligibility
        </a>
    </div>

    <!-- 4 Stats Cards Matching Screenshot 8 -->
    <div class="dash-stats-grid">
        <div class="stat-card">
            <div class="stat-icon-wrap icon-blue">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
            </div>
            <div class="stat-info">
                <div class="stat-num">6</div>
                <div class="stat-desc">Total Schemes</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-green">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
            </div>
            <div class="stat-info">
                <div class="stat-num">4</div>
                <div class="stat-desc">Eligible Schemes</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-amber">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
            </div>
            <div class="stat-info">
                <div class="stat-num">2</div>
                <div class="stat-desc">Saved Schemes</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-red">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
            </div>
            <div class="stat-info">
                <div class="stat-num">2</div>
                <div class="stat-desc">Notifications</div>
            </div>
        </div>
    </div>

    <!-- 2-Column Section Matching Screenshot 8 -->
    <div class="dash-cols-layout">
        <!-- Left Column: Recent Notifications -->
        <div class="dash-box">
            <div class="dash-box-header">
                <div class="dash-box-title">Recent Notifications</div>
                <a href="Notifications.aspx" class="dash-box-link">View all &rarr;</a>
            </div>

            <div class="notif-items-list">
                <div class="notif-item">
                    <div class="notif-dot dot-blue"></div>
                    <div class="notif-content">
                        <div class="notif-title-text">Your eligibility check is complete. 4 schemes found.</div>
                        <div class="notif-time-text">2 hours ago</div>
                    </div>
                </div>

                <div class="notif-item">
                    <div class="notif-dot dot-blue"></div>
                    <div class="notif-content">
                        <div class="notif-title-text">PM Kisan next installment due in 15 days.</div>
                        <div class="notif-time-text">1 day ago</div>
                    </div>
                </div>

                <div class="notif-item">
                    <div class="notif-dot dot-green"></div>
                    <div class="notif-content">
                        <div class="notif-title-text">New scheme added: PM SVANidhi. Check eligibility.</div>
                        <div class="notif-time-text">3 days ago</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column: Quick Actions & Profile Completion -->
        <div>
            <div class="dash-box">
                <div class="dash-box-header">
                    <div class="dash-box-title">Quick Actions</div>
                </div>

                <div class="quick-actions-list">
                    <a href="CheckEligibility.aspx" class="quick-action-item">
                        <div class="quick-action-left">
                            <span class="quick-action-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
                            </span>
                            <span>Check Eligibility</span>
                        </div>
                        <span class="quick-action-arrow">&rsaquo;</span>
                    </a>

                    <a href="EligibleSchemes.aspx" class="quick-action-item">
                        <div class="quick-action-left">
                            <span class="quick-action-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76"></polygon></svg>
                            </span>
                            <span>Browse Schemes</span>
                        </div>
                        <span class="quick-action-arrow">&rsaquo;</span>
                    </a>

                    <a href="Notifications.aspx" class="quick-action-item">
                        <div class="quick-action-left">
                            <span class="quick-action-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                            </span>
                            <span>Notifications</span>
                        </div>
                        <span class="quick-action-arrow">&rsaquo;</span>
                    </a>

                    <a href="Profile.aspx" class="quick-action-item">
                        <div class="quick-action-left">
                            <span class="quick-action-icon">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            </span>
                            <span>My Profile</span>
                        </div>
                        <span class="quick-action-arrow">&rsaquo;</span>
                    </a>
                </div>
            </div>

            <!-- Profile Completion Progress Card -->
            <div class="profile-progress-box">
                <div class="profile-progress-header">Profile Completion</div>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill"></div>
                </div>
                <div class="progress-foot-row">
                    <span class="progress-percent-label">80% complete</span>
                    <a href="Profile.aspx" class="progress-update-link">Update</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
