<%@ Page Title="Citizen Profile" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUserProfile.aspx.cs" Inherits="Gramsahay.AdminUserProfile" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
            max-width: 1180px;
            margin: 0 auto;
        }

        .back-nav-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .btn-back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 13.5px;
            font-weight: 600;
            color: #64748b;
            text-decoration: none;
            padding: 8px 14px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            transition: all 0.15s;
        }

        .btn-back-link:hover {
            color: #0e1e36;
            border-color: #cbd5e1;
            background-color: #f8fafc;
        }

        .breadcrumb-text {
            font-size: 13px;
            color: #94a3b8;
        }

        .breadcrumb-text span {
            color: #0f172a;
            font-weight: 600;
        }

        /* HEADER CARD */
        .citizen-header-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 28px 32px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
        }

        .citizen-intro-flex {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .citizen-avatar-box {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: #0e1e36;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 700;
            border: 3px solid #e2e8f0;
            flex-shrink: 0;
            overflow: hidden;
        }

        .citizen-avatar-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .citizen-meta-details h1 {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .citizen-meta-sub {
            font-size: 13.5px;
            color: #64748b;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .citizen-meta-sub .bullet {
            color: #cbd5e1;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            text-transform: capitalize;
        }

        .status-active { background: #e6f9f0; color: #059669; }
        .status-pending { background: #fef3c7; color: #d97706; }
        .status-inactive, .status-suspended { background: #fee2e2; color: #dc2626; }

        .header-action-group {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-print {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 16px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #475569;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-print:hover {
            border-color: #cbd5e1;
            background: #f8fafc;
        }

        /* KPI ROW */
        .kpi-metric-row {
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
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .kpi-icon-wrap {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .kpi-green { background: #e6f9f0; color: #10b981; }
        .kpi-blue { background: #eff6ff; color: #3b82f6; }
        .kpi-amber { background: #fef3c7; color: #f59e0b; }
        .kpi-purple { background: #f3e8ff; color: #a855f7; }

        .kpi-val {
            font-size: 19px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.2;
        }

        .kpi-label {
            font-size: 12px;
            color: #64748b;
            font-weight: 500;
            margin-top: 2px;
        }

        /* TWO COLUMNS */
        .profile-layout-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
        }

        .content-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px 28px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.03);
        }

        .panel-header-title {
            font-size: 16px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 1px solid #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .detail-data-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px 24px;
        }

        .data-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .data-item-label {
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .data-item-value {
            font-size: 14px;
            font-weight: 600;
            color: #0f172a;
        }

        .badge-verified {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: #059669;
            font-size: 12px;
            font-weight: 700;
        }

        /* SCHEMES TABLE */
        .schemes-list-wrap {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .scheme-item-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 14px 16px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            transition: all 0.15s;
        }

        .scheme-item-row:hover {
            border-color: #cbd5e1;
            background: #f1f5f9;
        }

        .scheme-title-col h4 {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 2px;
        }

        .scheme-title-col p {
            font-size: 12px;
            color: #64748b;
        }

        .scheme-benefit-badge {
            background: #e6f9f0;
            color: #065f46;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 6px;
        }

        /* ADMIN ACTION PANEL */
        .form-action-group {
            margin-bottom: 16px;
        }

        .form-action-group label {
            display: block;
            font-size: 12.5px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
        }

        .action-select {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13.5px;
            font-family: inherit;
            color: #0f172a;
            background: #ffffff;
            outline: none;
        }

        .action-textarea {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13px;
            font-family: inherit;
            color: #0f172a;
            min-height: 80px;
            resize: vertical;
            outline: none;
        }

        .action-select:focus, .action-textarea:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
        }

        .btn-update-status {
            width: 100%;
            padding: 10px;
            background: #0e1e36;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-update-status:hover {
            background: #1e3a63;
        }

        .success-banner {
            background: #e6f9f0;
            border: 1px solid #10b981;
            color: #065f46;
            padding: 10px 14px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .kyc-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f1f5f9;
            font-size: 13px;
        }

        .kyc-item:last-child {
            border-bottom: none;
        }

        .kyc-label {
            color: #64748b;
        }

        .kyc-status {
            font-weight: 600;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        @media (max-width: 900px) {
            .profile-layout-grid { grid-template-columns: 1fr; }
            .kpi-metric-row { grid-template-columns: repeat(2, 1fr); }
            .citizen-header-card { flex-direction: column; align-items: flex-start; gap: 16px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-container">
        <!-- Breadcrumb & Back Navigation -->
        <div class="back-nav-bar">
            <a href="AdminUsers.aspx" class="btn-back-link">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                <span>Back to All Users</span>
            </a>
            <div class="breadcrumb-text">
                Users &nbsp;/&nbsp; <span><asp:Literal ID="litBreadcrumbName" runat="server">Citizen Profile</asp:Literal></span>
            </div>
        </div>

        <!-- Citizen Header Card -->
        <div class="citizen-header-card">
            <div class="citizen-intro-flex">
                <div class="citizen-avatar-box">
                    <asp:Literal ID="litAvatarHtml" runat="server"></asp:Literal>
                </div>
                <div class="citizen-meta-details">
                    <h1>
                        <asp:Literal ID="litFullName" runat="server">Sunita Devi</asp:Literal>
                        <asp:Literal ID="litStatusBadge" runat="server"></asp:Literal>
                    </h1>
                    <div class="citizen-meta-sub">
                        <span><strong>ID:</strong> <asp:Literal ID="litCitizenCode" runat="server">GS-CIT-2024-002</asp:Literal></span>
                        <span class="bullet">&bull;</span>
                        <span><asp:Literal ID="litOccupation" runat="server">Artisan</asp:Literal></span>
                        <span class="bullet">&bull;</span>
                        <span><asp:Literal ID="litLocation" runat="server">Patna, Bihar</asp:Literal></span>
                        <span class="bullet">&bull;</span>
                        <span>Registered <asp:Literal ID="litRegDate" runat="server">01 Aug 2024</asp:Literal></span>
                    </div>
                </div>
            </div>

            <div class="header-action-group">
                <button type="button" class="btn-print" onclick="window.print();">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg>
                    Print Profile
                </button>
            </div>
        </div>

        <!-- KPI Metrics Strip -->
        <div class="kpi-metric-row">
            <div class="kpi-card">
                <div class="kpi-icon-wrap kpi-green">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                </div>
                <div>
                    <div class="kpi-val"><asp:Literal ID="litEligibleCount" runat="server">3</asp:Literal> Schemes</div>
                    <div class="kpi-label">Eligible Welfare Programs</div>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon-wrap kpi-blue">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><path d="M12 6v6l4 2"></path></svg>
                </div>
                <div>
                    <div class="kpi-val"><asp:Literal ID="litApplicationsCount" runat="server">2</asp:Literal> Submitted</div>
                    <div class="kpi-label">Scheme Applications</div>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon-wrap kpi-amber">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
                </div>
                <div>
                    <div class="kpi-val"><asp:Literal ID="litAnnualIncome" runat="server">&#8377;95,000</asp:Literal></div>
                    <div class="kpi-label">Reported Annual Income</div>
                </div>
            </div>

            <div class="kpi-card">
                <div class="kpi-icon-wrap kpi-purple">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                </div>
                <div>
                    <div class="kpi-val"><asp:Literal ID="litProfileCompletion" runat="server">75%</asp:Literal></div>
                    <div class="kpi-label">Profile Completed</div>
                </div>
            </div>
        </div>

        <!-- 2 Columns Grid Layout -->
        <div class="profile-layout-grid">
            <!-- Left: Citizen Full Information & Eligible Schemes -->
            <div>
                <!-- Demographics Card -->
                <div class="content-panel">
                    <div class="panel-header-title">
                        <span>Personal & Demographic Information</span>
                        <span class="badge-verified">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            Aadhaar Verified
                        </span>
                    </div>

                    <div class="detail-data-grid">
                        <div class="data-item">
                            <span class="data-item-label">Full Name</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailName" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Email Address</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailEmail" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Mobile Number</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailMobile" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Age & Gender</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailAgeGender" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Social Category / Caste</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailCaste" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Primary Occupation</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailOccupation" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">State</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailState" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">District</span>
                            <span class="data-item-value"><asp:Literal ID="litDetailDistrict" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Annual Family Income</span>
                            <span class="data-item-value" style="color: #059669; font-weight: 700;"><asp:Literal ID="litDetailIncome" runat="server"></asp:Literal></span>
                        </div>
                        <div class="data-item">
                            <span class="data-item-label">Ration Card Status</span>
                            <span class="data-item-value">BPL / Antyodaya Category</span>
                        </div>
                    </div>
                </div>

                <!-- Matched Eligible Schemes -->
                <div class="content-panel">
                    <div class="panel-header-title">
                        <span>Matched Schemes for Citizen</span>
                        <a href="AdminSchemes.aspx" style="font-size: 13px; font-weight: 600; color: #10b981; text-decoration: none;">Browse All Schemes &rarr;</a>
                    </div>

                    <div class="schemes-list-wrap">
                        <asp:Repeater ID="rptEligibleSchemes" runat="server">
                            <ItemTemplate>
                                <div class="scheme-item-row">
                                    <div class="scheme-title-col">
                                        <h4><%# Eval("Name") %></h4>
                                        <p><%# Eval("Ministry") %> &bull; <%# Eval("Category") %></p>
                                    </div>
                                    <div style="display: flex; align-items: center; gap: 14px;">
                                        <div class="scheme-benefit-badge"><%# Eval("Benefit") %></div>
                                        <a href='AdminSchemes.aspx' class="btn-print" style="padding: 6px 12px; font-size: 12px; text-decoration: none;">View</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- Right: Admin Status Management & Verification Audit -->
            <div>
                <!-- Admin Action Card -->
                <div class="content-panel">
                    <div class="panel-header-title">
                        <span>Manage Account</span>
                    </div>

                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="success-banner">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        <span>Citizen status updated successfully.</span>
                    </asp:Panel>

                    <div class="form-action-group">
                        <label>Account Status</label>
                        <asp:DropDownList ID="ddlUserStatus" runat="server" CssClass="action-select">
                            <asp:ListItem Value="Active">Active (Verified)</asp:ListItem>
                            <asp:ListItem Value="Pending">Pending Verification</asp:ListItem>
                            <asp:ListItem Value="Inactive">Inactive / Suspended</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-action-group">
                        <label>Administrative Notes</label>
                        <asp:TextBox ID="txtAdminNotes" runat="server" TextMode="MultiLine" CssClass="action-textarea" placeholder="Add administrative verification remarks or internal notes..."></asp:TextBox>
                    </div>

                    <asp:Button ID="btnSaveStatus" runat="server" Text="Update Citizen Status" CssClass="btn-update-status" OnClick="btnSaveStatus_Click" />
                </div>

                <!-- Verification & KYC Checklist -->
                <div class="content-panel">
                    <div class="panel-header-title">
                        <span>KYC Verification Record</span>
                    </div>

                    <div class="kyc-item">
                        <span class="kyc-label">Aadhaar Card</span>
                        <span class="kyc-status" style="color: #059669;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            Verified
                        </span>
                    </div>

                    <div class="kyc-item">
                        <span class="kyc-label">Mobile OTP</span>
                        <span class="kyc-status" style="color: #059669;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            Linked & Verified
                        </span>
                    </div>

                    <div class="kyc-item">
                        <span class="kyc-label">DBT Bank Account</span>
                        <span class="kyc-status" style="color: #059669;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            SBI (Seed: Yes)
                        </span>
                    </div>

                    <div class="kyc-item">
                        <span class="kyc-label">Ration Card / Income</span>
                        <span class="kyc-status" style="color: #059669;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            Certified by Tehsildar
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
