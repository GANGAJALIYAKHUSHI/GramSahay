<%@ Page Title="Scheme Administration" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSchemeDetails.aspx.cs" Inherits="Gramsahay.AdminSchemeDetails" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-scheme-wrap {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* TOP NAVIGATION & BREADCRUMB */
        .scheme-nav-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 22px;
        }

        .btn-back-schemes {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 13.5px;
            font-weight: 600;
            color: #475569;
            text-decoration: none;
            padding: 8px 16px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            transition: all 0.15s;
        }

        .btn-back-schemes:hover {
            color: #0e1e36;
            border-color: #cbd5e1;
            background-color: #f8fafc;
        }

        .breadcrumb-trail {
            font-size: 13px;
            color: #94a3b8;
        }

        .breadcrumb-trail span {
            color: #0f172a;
            font-weight: 600;
        }

        /* HEADER BANNER CARD */
        .scheme-hero-banner {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 26px 32px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
        }

        .scheme-hero-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .scheme-icon-emblem {
            width: 68px;
            height: 68px;
            border-radius: 14px;
            background: #0e1e36;
            color: #10b981;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #e2e8f0;
            flex-shrink: 0;
        }

        .scheme-title-box h1 {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .scheme-meta-row {
            font-size: 13.5px;
            color: #64748b;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .scheme-meta-row .meta-dot {
            color: #cbd5e1;
        }

        .scheme-cat-badge {
            font-size: 11.5px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 6px;
            display: inline-block;
        }

        .badge-agri { background-color: #dcfce7; color: #15803d; }
        .badge-housing { background-color: #ccfbf1; color: #0f766e; }
        .badge-health { background-color: #dbeafe; color: #1d4ed8; }
        .badge-energy { background-color: #e0f2fe; color: #0369a1; }
        .badge-edu { background-color: #e0e7ff; color: #4338ca; }
        .badge-emp { background-color: #ede9fe; color: #6d28d9; }

        .scheme-status-pill {
            background-color: #e6f9f0;
            color: #059669;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .scheme-status-pill::before {
            content: '';
            width: 7px;
            height: 7px;
            background-color: #10b981;
            border-radius: 50%;
        }

        .scheme-hero-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-edit-action {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 18px;
            background-color: #10b981;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            text-decoration: none;
            transition: background 0.15s;
        }

        .btn-edit-action:hover {
            background-color: #059669;
        }

        .btn-print-action {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 16px;
            background-color: #ffffff;
            color: #475569;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-print-action:hover {
            background-color: #f8fafc;
            color: #0f172a;
        }

        /* 4-KPI STATS ROW */
        .scheme-kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 24px;
        }

        .kpi-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px 20px;
            display: flex;
            flex-direction: column;
            gap: 6px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .kpi-title {
            font-size: 12px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .kpi-value {
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
        }

        .kpi-sub {
            font-size: 12px;
            color: #94a3b8;
        }

        /* MAIN CONTENT 2-COL GRID */
        .scheme-content-grid {
            display: grid;
            grid-template-columns: 2fr 1.2fr;
            gap: 24px;
        }

        .content-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px 28px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .card-head-title {
            font-size: 16px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 12px;
        }

        .card-head-title svg {
            color: #10b981;
        }

        .desc-text-body {
            font-size: 14px;
            line-height: 1.65;
            color: #334155;
            margin-bottom: 20px;
        }

        .spec-table {
            width: 100%;
            border-collapse: collapse;
        }

        .spec-table td {
            padding: 10px 0;
            border-bottom: 1px solid #f8fafc;
            font-size: 13.5px;
        }

        .spec-label {
            color: #64748b;
            font-weight: 600;
            width: 40%;
        }

        .spec-val {
            color: #0f172a;
            font-weight: 700;
        }

        /* CHECKLIST */
        .doc-check-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .doc-check-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13.5px;
            color: #1e293b;
            background: #f8fafc;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #f1f5f9;
        }

        .doc-check-icon {
            color: #10b981;
            flex-shrink: 0;
        }

        /* RIGHT COLUMN CONTROLS */
        .status-select-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .form-select-control {
            width: 100%;
            height: 40px;
            padding: 0 12px;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13.5px;
            color: #0f172a;
            outline: none;
        }

        .form-select-control:focus {
            border-color: #10b981;
        }

        .form-textarea-control {
            width: 100%;
            height: 75px;
            padding: 10px 12px;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13px;
            color: #0f172a;
            outline: none;
            resize: vertical;
        }

        .btn-update-status {
            background-color: #0e1e36;
            color: #ffffff;
            border: none;
            padding: 10px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-update-status:hover {
            background-color: #1a2f52;
        }

        .status-alert-box {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 10px 14px;
            border-radius: 8px;
            font-size: 12.5px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        /* APPLICANTS MINI TABLE */
        .applicant-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f1f5f9;
        }

        .applicant-row:last-child {
            border-bottom: none;
        }

        .applicant-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .applicant-mini-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: #0e1e36;
            color: #ffffff;
            font-size: 12px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .applicant-name {
            font-size: 13.5px;
            font-weight: 700;
            color: #0f172a;
        }

        .applicant-sub {
            font-size: 11.5px;
            color: #64748b;
        }

        .applicant-view-link {
            font-size: 12px;
            font-weight: 600;
            color: #10b981;
            text-decoration: none;
        }

        .applicant-view-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .scheme-kpi-grid { grid-template-columns: repeat(2, 1fr); }
            .scheme-content-grid { grid-template-columns: 1fr; }
            .scheme-hero-banner { flex-direction: column; align-items: flex-start; gap: 16px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-scheme-wrap">
        <!-- Top Nav & Breadcrumb -->
        <div class="scheme-nav-bar">
            <a href="AdminSchemes.aspx" class="btn-back-schemes">
                &larr; Back to Manage Schemes
            </a>

            <div class="breadcrumb-trail">
                Manage Schemes / <span><asp:Literal ID="litBreadcrumbName" runat="server"></asp:Literal></span>
            </div>
        </div>

        <!-- Scheme Hero Card -->
        <div class="scheme-hero-banner">
            <div class="scheme-hero-left">
                <div class="scheme-icon-emblem">
                    <svg width="34" height="34" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                </div>
                <div class="scheme-title-box">
                    <h1>
                        <asp:Literal ID="litSchemeName" runat="server"></asp:Literal>
                        <asp:Literal ID="litCategoryBadge" runat="server"></asp:Literal>
                    </h1>
                    <div class="scheme-meta-row">
                        <span><asp:Literal ID="litMinistry" runat="server"></asp:Literal></span>
                        <span class="meta-dot">&bull;</span>
                        <span><asp:Literal ID="litSchemeCode" runat="server"></asp:Literal></span>
                        <span class="meta-dot">&bull;</span>
                        <span class="scheme-status-pill">Active Scheme</span>
                    </div>
                </div>
            </div>

            <div class="scheme-hero-actions">
                <button type="button" class="btn-print-action" onclick="window.print();">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg>
                    Print
                </button>
                <asp:HyperLink ID="lnkEditScheme" runat="server" CssClass="btn-edit-action">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                    Edit Scheme
                </asp:HyperLink>
            </div>
        </div>

        <!-- KPI Summary Strip -->
        <div class="scheme-kpi-grid">
            <div class="kpi-card">
                <div class="kpi-title">Direct Benefit</div>
                <div class="kpi-value"><asp:Literal ID="litBenefitAmount" runat="server"></asp:Literal></div>
                <div class="kpi-sub">Direct Benefit Transfer (DBT)</div>
            </div>

            <div class="kpi-card">
                <div class="kpi-title">Income Ceiling</div>
                <div class="kpi-value"><asp:Literal ID="litMaxIncome" runat="server"></asp:Literal></div>
                <div class="kpi-sub">Maximum annual income</div>
            </div>

            <div class="kpi-card">
                <div class="kpi-title">Age Eligibility</div>
                <div class="kpi-value"><asp:Literal ID="litAgeRange" runat="server"></asp:Literal></div>
                <div class="kpi-sub">Minimum &amp; maximum age</div>
            </div>

            <div class="kpi-card">
                <div class="kpi-title">Total Enrolled</div>
                <div class="kpi-value"><asp:Literal ID="litBeneficiaryCount" runat="server"></asp:Literal></div>
                <div class="kpi-sub">Citizens accessed &amp; applied</div>
            </div>
        </div>

        <!-- 2-Column Main Section -->
        <div class="scheme-content-grid">
            <!-- Left Column: Scheme Details -->
            <div>
                <!-- Description Card -->
                <div class="content-card">
                    <div class="card-head-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                        <span>Scheme Description &amp; Objective</span>
                    </div>

                    <p class="desc-text-body">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </p>

                    <table class="spec-table">
                        <tr>
                            <td class="spec-label">Nodal Ministry</td>
                            <td class="spec-val"><asp:Literal ID="litMinistryFull" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td class="spec-label">Scheme Type</td>
                            <td class="spec-val">Central Sector Scheme &bull; 100% Union Funding</td>
                        </tr>
                        <tr>
                            <td class="spec-label">Disbursement Mode</td>
                            <td class="spec-val">Direct Benefit Transfer (DBT) via Aadhaar Linked Bank A/c</td>
                        </tr>
                        <tr>
                            <td class="spec-label">Portal Coverage</td>
                            <td class="spec-val">All 28 States &amp; 8 Union Territories</td>
                        </tr>
                    </table>
                </div>

                <!-- Eligibility Criteria Card -->
                <div class="content-card">
                    <div class="card-head-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                        <span>Citizen Eligibility Rules</span>
                    </div>

                    <table class="spec-table">
                        <tr>
                            <td class="spec-label">Eligible Occupations</td>
                            <td class="spec-val"><asp:Literal ID="litOccupations" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td class="spec-label">Minimum Age Limit</td>
                            <td class="spec-val"><asp:Literal ID="litMinAge" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td class="spec-label">Maximum Age Limit</td>
                            <td class="spec-val"><asp:Literal ID="litMaxAge" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td class="spec-label">Annual Family Income Ceiling</td>
                            <td class="spec-val"><asp:Literal ID="litIncomeCeiling" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </div>

                <!-- Required Documents Checklist -->
                <div class="content-card">
                    <div class="card-head-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"></path><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                        <span>Required Verification Documents</span>
                    </div>

                    <ul class="doc-check-list">
                        <asp:Repeater ID="rptDocuments" runat="server">
                            <ItemTemplate>
                                <li class="doc-check-item">
                                    <svg class="doc-check-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    <span><%# Container.DataItem %></span>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>

            <!-- Right Column: Administrative Actions & Applicants -->
            <div>
                <!-- Status & Admin Operations Card -->
                <div class="content-card">
                    <div class="card-head-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
                        <span>Administration Status</span>
                    </div>

                    <asp:Panel ID="pnlStatusSuccess" runat="server" Visible="false" CssClass="status-alert-box">
                        &#10003; Scheme operational status updated!
                    </asp:Panel>

                    <div class="status-select-group">
                        <label class="spec-label">Operational Status</label>
                        <asp:DropDownList ID="ddlSchemeStatus" runat="server" CssClass="form-select-control">
                            <asp:ListItem Value="Active">Active &bull; Accepting Applications</asp:ListItem>
                            <asp:ListItem Value="Under Review">Under Review &bull; Verification Ongoing</asp:ListItem>
                            <asp:ListItem Value="Paused">Temporarily Paused</asp:ListItem>
                        </asp:DropDownList>

                        <label class="spec-label" style="margin-top: 6px;">Admin Circular / Remarks</label>
                        <asp:TextBox ID="txtAdminRemarks" runat="server" TextMode="MultiLine" CssClass="form-textarea-control" placeholder="Internal administration notes..."></asp:TextBox>

                        <asp:Button ID="btnUpdateStatus" runat="server" Text="Save Status" CssClass="btn-update-status" OnClick="btnUpdateStatus_Click" />
                    </div>
                </div>

                <!-- Recent Enrolled Beneficiaries -->
                <div class="content-card">
                    <div class="card-head-title">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        <span>Enrolled Citizens</span>
                    </div>

                    <div>
                        <asp:Repeater ID="rptRecentApplicants" runat="server">
                            <ItemTemplate>
                                <div class="applicant-row">
                                    <div class="applicant-info">
                                        <div class="applicant-mini-avatar"><%# Eval("Initials") %></div>
                                        <div>
                                            <div class="applicant-name"><%# Eval("FullName") %></div>
                                            <div class="applicant-sub"><%# Eval("State") %> &bull; <%# Eval("Occupation") %></div>
                                        </div>
                                    </div>
                                    <a href='AdminUserProfile.aspx?id=<%# Eval("Id") %>' class="applicant-view-link">View Profile &rarr;</a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
