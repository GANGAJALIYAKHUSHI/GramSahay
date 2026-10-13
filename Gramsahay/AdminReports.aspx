<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="Gramsahay.AdminReports" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ADMIN REPORTS SPECIFIC STYLES */
        .page-header-block {
            margin-bottom: 24px;
        }

        .page-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
        }

        .page-sub {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 2px;
        }

        /* 4 METRIC STATS */
        .reports-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .report-stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px 20px;
            display: flex;
            flex-direction: column;
            gap: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .stat-icon-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .report-icon-box {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon-blue { background-color: #eff6ff; color: #3b82f6; }
        .icon-green { background-color: #ecfdf5; color: #10b981; }
        .icon-amber { background-color: #fffbeb; color: #f59e0b; }
        .icon-red { background-color: #fef2f2; color: #ef4444; }

        .stat-main-num {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.1;
        }

        .stat-main-label {
            font-size: 13px;
            font-weight: 700;
            color: #1e293b;
        }

        .stat-sub-growth {
            font-size: 11.5px;
            font-weight: 600;
        }

        .growth-green { color: #10b981; }
        .growth-muted { color: #64748b; }

        /* 2 COLUMNS MIDDLE */
        .analytics-2col-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 28px;
        }

        .report-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .report-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
        }

        /* REGISTRATIONS BY STATE */
        .state-bars-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .state-bar-row {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .state-info-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        .state-bar-bg {
            width: 100%;
            height: 8px;
            background-color: #f1f5f9;
            border-radius: 4px;
            overflow: hidden;
        }

        .state-bar-fill {
            height: 100%;
            background-color: #0e1e36;
            border-radius: 4px;
        }

        /* MOST ACCESSED SCHEMES */
        .accessed-schemes-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .accessed-scheme-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f8fafc;
        }

        .accessed-scheme-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .rank-circle {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background-color: #0e1e36;
            color: #ffffff;
            font-size: 12px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .rank-info {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .rank-title {
            font-size: 13.5px;
            font-weight: 700;
            color: #0f172a;
        }

        .rank-category {
            font-size: 11.5px;
            color: #64748b;
        }

        .rank-count-val {
            font-size: 13.5px;
            font-weight: 700;
            color: #10b981;
        }

        /* MONTHLY ACTIVITY SUMMARY */
        .summary-table-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .summary-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            margin-top: 14px;
        }

        .summary-table th {
            text-align: left;
            padding: 12px 14px;
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            border-bottom: 1px solid #e2e8f0;
            letter-spacing: 0.05em;
        }

        .summary-table td {
            padding: 14px 14px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            font-weight: 500;
        }

        .rate-green {
            color: #10b981;
            font-weight: 700;
        }

        @media (max-width: 900px) {
            .reports-stats-grid { grid-template-columns: repeat(2, 1fr); }
            .analytics-2col-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Matching Screenshot 18 -->
    <div class="page-header-block">
        <h1 class="page-title">Reports</h1>
        <p class="page-sub">Platform activity and performance analytics</p>
    </div>

    <!-- 4 Stat Cards Matching Screenshot 18 -->
    <div class="reports-stats-grid">
        <div class="report-stat-card">
            <div class="stat-icon-row">
                <div class="report-icon-box icon-blue">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
                </div>
            </div>
            <div class="stat-main-num">8,320</div>
            <div class="stat-main-label">Total Checks</div>
            <div class="stat-sub-growth growth-green">+12% this month</div>
        </div>

        <div class="report-stat-card">
            <div class="stat-icon-row">
                <div class="report-icon-box icon-green">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line></svg>
                </div>
            </div>
            <div class="stat-main-num">1,200</div>
            <div class="stat-main-label">Schemes Applied</div>
            <div class="stat-sub-growth growth-green">+8% this month</div>
        </div>

        <div class="report-stat-card">
            <div class="stat-icon-row">
                <div class="report-icon-box icon-amber">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="12" y1="18" x2="12" y2="12"></line><line x1="9" y1="15" x2="15" y2="15"></line></svg>
                </div>
            </div>
            <div class="stat-main-num">3.4</div>
            <div class="stat-main-label">Avg. Eligible/User</div>
            <div class="stat-sub-growth growth-muted">schemes per user</div>
        </div>

        <div class="report-stat-card">
            <div class="stat-icon-row">
                <div class="report-icon-box icon-red">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
                </div>
            </div>
            <div class="stat-main-num">4,891</div>
            <div class="stat-main-label">Docs Uploaded</div>
            <div class="stat-sub-growth growth-muted">across all users</div>
        </div>
    </div>

    <!-- 2 Columns: Registrations by State & Most Accessed Schemes -->
    <div class="analytics-2col-grid">
        <!-- Registrations by State -->
        <div class="report-card">
            <div class="report-card-title">Registrations by State</div>
            <div class="state-bars-list">
                <div class="state-bar-row">
                    <div class="state-info-row">
                        <span>Uttar Pradesh</span>
                        <span>842 users</span>
                    </div>
                    <div class="state-bar-bg">
                        <div class="state-bar-fill" style="width: 85%;"></div>
                    </div>
                </div>

                <div class="state-bar-row">
                    <div class="state-info-row">
                        <span>Bihar</span>
                        <span>620 users</span>
                    </div>
                    <div class="state-bar-bg">
                        <div class="state-bar-fill" style="width: 62%;"></div>
                    </div>
                </div>

                <div class="state-bar-row">
                    <div class="state-info-row">
                        <span>Madhya Pradesh</span>
                        <span>415 users</span>
                    </div>
                    <div class="state-bar-bg">
                        <div class="state-bar-fill" style="width: 42%;"></div>
                    </div>
                </div>

                <div class="state-bar-row">
                    <div class="state-info-row">
                        <span>Rajasthan</span>
                        <span>310 users</span>
                    </div>
                    <div class="state-bar-bg">
                        <div class="state-bar-fill" style="width: 31%;"></div>
                    </div>
                </div>

                <div class="state-bar-row">
                    <div class="state-info-row">
                        <span>Maharashtra</span>
                        <span>264 users</span>
                    </div>
                    <div class="state-bar-bg">
                        <div class="state-bar-fill" style="width: 26%;"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Most Accessed Schemes -->
        <div class="report-card">
            <div class="report-card-title">Most Accessed Schemes</div>
            <div class="accessed-schemes-list">
                <div class="accessed-scheme-item">
                    <div class="accessed-scheme-left">
                        <div class="rank-circle">1</div>
                        <div class="rank-info">
                            <span class="rank-title">PM Kisan Samman Nidhi</span>
                            <span class="rank-category">Agriculture</span>
                        </div>
                    </div>
                    <div class="rank-count-val">3,200</div>
                </div>

                <div class="accessed-scheme-item">
                    <div class="accessed-scheme-left">
                        <div class="rank-circle">2</div>
                        <div class="rank-info">
                            <span class="rank-title">Ayushman Bharat PMJAY</span>
                            <span class="rank-category">Health</span>
                        </div>
                    </div>
                    <div class="rank-count-val">2,100</div>
                </div>

                <div class="accessed-scheme-item">
                    <div class="accessed-scheme-left">
                        <div class="rank-circle">3</div>
                        <div class="rank-info">
                            <span class="rank-title">PM Awas Yojana</span>
                            <span class="rank-category">Housing</span>
                        </div>
                    </div>
                    <div class="rank-count-val">1,540</div>
                </div>

                <div class="accessed-scheme-item">
                    <div class="accessed-scheme-left">
                        <div class="rank-circle">4</div>
                        <div class="rank-info">
                            <span class="rank-title">PM Ujjwala Yojana</span>
                            <span class="rank-category">Energy</span>
                        </div>
                    </div>
                    <div class="rank-count-val">980</div>
                </div>

                <div class="accessed-scheme-item">
                    <div class="accessed-scheme-left">
                        <div class="rank-circle">5</div>
                        <div class="rank-info">
                            <span class="rank-title">National Scholarship</span>
                            <span class="rank-category">Education</span>
                        </div>
                    </div>
                    <div class="rank-count-val">760</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Monthly Activity Summary Matching Screenshot 18 -->
    <div class="summary-table-card">
        <div class="report-card-title">Monthly Activity Summary</div>
        <table class="summary-table">
            <thead>
                <tr>
                    <th>MONTH</th>
                    <th>NEW USERS</th>
                    <th>ELIGIBILITY CHECKS</th>
                    <th>SCHEMES APPLIED</th>
                    <th>APPROVAL RATE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>August 2024</strong></td>
                    <td>412</td>
                    <td>1820</td>
                    <td>230</td>
                    <td><span class="rate-green">94%</span></td>
                </tr>
                <tr>
                    <td><strong>July 2024</strong></td>
                    <td>388</td>
                    <td>1640</td>
                    <td>198</td>
                    <td><span class="rate-green">92%</span></td>
                </tr>
                <tr>
                    <td><strong>June 2024</strong></td>
                    <td>305</td>
                    <td>1310</td>
                    <td>162</td>
                    <td><span class="rate-green">89%</span></td>
                </tr>
                <tr>
                    <td><strong>May 2024</strong></td>
                    <td>271</td>
                    <td>1120</td>
                    <td>140</td>
                    <td><span class="rate-green">91%</span></td>
                </tr>
                <tr>
                    <td><strong>April 2024</strong></td>
                    <td>224</td>
                    <td>930</td>
                    <td>115</td>
                    <td><span class="rate-green">88%</span></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
