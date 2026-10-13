<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Gramsahay.AdminDashboard" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ADMIN DASHBOARD SPECIFIC STYLES */
        .admin-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 26px;
        }

        .admin-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
        }

        .admin-sub {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 2px;
        }

        .btn-add-scheme {
            background-color: #0e1e36;
            color: #ffffff;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background 0.15s;
        }

        .btn-add-scheme:hover {
            background-color: #172a4d;
        }

        /* 4 METRIC STATS */
        .admin-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
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

        .stat-val {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.1;
        }

        .stat-label {
            font-size: 12px;
            font-weight: 500;
            color: #64748b;
            margin-top: 4px;
        }

        /* 2 COLUMNS LAYOUT */
        .admin-grid-layout {
            display: grid;
            grid-template-columns: 1.8fr 1fr;
            gap: 24px;
        }

        .admin-box-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .box-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .box-title {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
        }

        .box-link {
            font-size: 12.5px;
            font-weight: 600;
            color: #2563eb;
            text-decoration: none;
        }

        .box-link:hover {
            text-decoration: underline;
        }

        /* TABLE */
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .admin-table th {
            text-align: left;
            padding: 10px 12px;
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            border-bottom: 1px solid #e2e8f0;
            letter-spacing: 0.05em;
        }

        .admin-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            vertical-align: middle;
        }

        .user-name-cell {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .user-name-cell strong {
            color: #0f172a;
            font-weight: 600;
        }

        .user-name-cell span {
            font-size: 11.5px;
            color: #94a3b8;
        }

        /* BADGES */
        .status-badge {
            display: inline-block;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 12px;
        }

        .status-active { background-color: #dcfce7; color: #15803d; }
        .status-pending { background-color: #fef3c7; color: #b45309; }
        .status-inactive { background-color: #f1f5f9; color: #64748b; }

        /* SCHEMES BY CATEGORY PROGRESS */
        .cat-progress-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-bottom: 24px;
        }

        .cat-progress-item {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .cat-label-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 12.5px;
            font-weight: 600;
            color: #334155;
        }

        .cat-bar-bg {
            width: 100%;
            height: 6px;
            background-color: #f1f5f9;
            border-radius: 3px;
            overflow: hidden;
        }

        .cat-bar-fill {
            height: 100%;
            background-color: #0e1e36;
            border-radius: 3px;
        }

        .cat-footer-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            padding-top: 18px;
            border-top: 1px solid #f1f5f9;
            text-align: center;
            margin-bottom: 14px;
        }

        .foot-stat-val {
            font-size: 22px;
            font-weight: 800;
        }

        .val-green { color: #10b981; }
        .val-dark { color: #0f172a; }

        .foot-stat-label {
            font-size: 11.5px;
            color: #64748b;
            margin-top: 2px;
        }

        .view-reports-center {
            text-align: center;
            font-size: 12.5px;
        }

        @media (max-width: 900px) {
            .admin-stats-grid { grid-template-columns: repeat(2, 1fr); }
            .admin-grid-layout { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Matching Screenshot 16 -->
    <div class="admin-header-row">
        <div>
            <h1 class="admin-title">Admin Overview</h1>
            <p class="admin-sub">GramSahay Administration Panel</p>
        </div>

        <a href="AdminAddScheme.aspx" class="btn-add-scheme">
            + Add Scheme
        </a>
    </div>

    <!-- 4 Metric Cards Matching Screenshot 16 -->
    <div class="admin-stats-grid">
        <div class="stat-card">
            <div class="stat-icon-wrap icon-blue">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-3-3.87"></path><path d="M9 21v-2a4 4 0 0 0-4-4H3v6"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            </div>
            <div>
                <div class="stat-val">2,451</div>
                <div class="stat-label">Total Users</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-green">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
            </div>
            <div>
                <div class="stat-val">6</div>
                <div class="stat-label">Active Schemes</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-amber">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
            </div>
            <div>
                <div class="stat-val">8,320</div>
                <div class="stat-label">Eligibility Checks</div>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-icon-wrap icon-red">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
            </div>
            <div>
                <div class="stat-val">1,200</div>
                <div class="stat-label">Applications</div>
            </div>
        </div>
    </div>

    <!-- 2 Columns Layout Matching Screenshot 16 -->
    <div class="admin-grid-layout">
        <!-- Left: Recent Registrations Table -->
        <div class="admin-box-card">
            <div class="box-header-row">
                <div class="box-title">Recent Registrations</div>
                <a href="AdminUsers.aspx" class="box-link">View all users &rarr;</a>
            </div>

            <table class="admin-table">
                <thead>
                    <tr>
                        <th>NAME</th>
                        <th>STATE</th>
                        <th>DATE</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <a href="AdminUserProfile.aspx?id=1" class="user-name-cell" style="text-decoration:none; color:inherit;">
                                <strong>Ramesh Kumar</strong>
                                <span>ramesh@example.com</span>
                            </a>
                        </td>
                        <td>UP</td>
                        <td>02 Aug 2024</td>
                        <td><span class="status-badge status-active">Active</span></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="AdminUserProfile.aspx?id=2" class="user-name-cell" style="text-decoration:none; color:inherit;">
                                <strong>Sunita Devi</strong>
                                <span>sunita@example.com</span>
                            </a>
                        </td>
                        <td>Bihar</td>
                        <td>01 Aug 2024</td>
                        <td><span class="status-badge status-active">Active</span></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="AdminUserProfile.aspx?id=3" class="user-name-cell" style="text-decoration:none; color:inherit;">
                                <strong>Mohan Lal</strong>
                                <span>mohan@example.com</span>
                            </a>
                        </td>
                        <td>MP</td>
                        <td>31 Jul 2024</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="AdminUserProfile.aspx?id=4" class="user-name-cell" style="text-decoration:none; color:inherit;">
                                <strong>Priya Singh</strong>
                                <span>priya@example.com</span>
                            </a>
                        </td>
                        <td>Rajasthan</td>
                        <td>30 Jul 2024</td>
                        <td><span class="status-badge status-active">Active</span></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="AdminUserProfile.aspx?id=5" class="user-name-cell" style="text-decoration:none; color:inherit;">
                                <strong>Anil Yadav</strong>
                                <span>anil@example.com</span>
                            </a>
                        </td>
                        <td>Maharashtra</td>
                        <td>29 Jul 2024</td>
                        <td><span class="status-badge status-inactive">Inactive</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Right: Schemes by Category -->
        <div class="admin-box-card">
            <div class="box-header-row">
                <div class="box-title">Schemes by Category</div>
            </div>

            <div class="cat-progress-list">
                <div class="cat-progress-item">
                    <div class="cat-label-row">
                        <span>Agriculture</span>
                        <span>12</span>
                    </div>
                    <div class="cat-bar-bg">
                        <div class="cat-bar-fill" style="width: 85%;"></div>
                    </div>
                </div>

                <div class="cat-progress-item">
                    <div class="cat-label-row">
                        <span>Health</span>
                        <span>10</span>
                    </div>
                    <div class="cat-bar-bg">
                        <div class="cat-bar-fill" style="width: 70%;"></div>
                    </div>
                </div>

                <div class="cat-progress-item">
                    <div class="cat-label-row">
                        <span>Education</span>
                        <span>8</span>
                    </div>
                    <div class="cat-bar-bg">
                        <div class="cat-bar-fill" style="width: 55%;"></div>
                    </div>
                </div>

                <div class="cat-progress-item">
                    <div class="cat-label-row">
                        <span>Housing</span>
                        <span>6</span>
                    </div>
                    <div class="cat-bar-bg">
                        <div class="cat-bar-fill" style="width: 42%;"></div>
                    </div>
                </div>

                <div class="cat-progress-item">
                    <div class="cat-label-row">
                        <span>Employment</span>
                        <span>9</span>
                    </div>
                    <div class="cat-bar-bg">
                        <div class="cat-bar-fill" style="width: 65%;"></div>
                    </div>
                </div>
            </div>

            <div class="cat-footer-stats">
                <div>
                    <div class="foot-stat-val val-green">94%</div>
                    <div class="foot-stat-label">Approval Rate</div>
                </div>
                <div>
                    <div class="foot-stat-val val-dark">1.8k</div>
                    <div class="foot-stat-label">This Month</div>
                </div>
            </div>

            <div class="view-reports-center">
                <a href="AdminReports.aspx" class="box-link">View full reports &rarr;</a>
            </div>
        </div>
    </div>
</asp:Content>
