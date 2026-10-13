<%@ Page Title="Eligible Schemes" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="EligibleSchemes.aspx.cs" Inherits="Gramsahay.EligibleSchemes" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ELIGIBLE SCHEMES SPECIFIC STYLES */
        .schemes-header-row {
            margin-bottom: 24px;
        }

        .schemes-page-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
        }

        .schemes-page-sub {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 2px;
        }

        /* SEARCH & FILTER BAR */
        .schemes-search-bar {
            display: flex;
            align-items: center;
            gap: 16px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 10px 16px;
            margin-bottom: 28px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .search-input-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
            flex: 1;
        }

        .search-input-wrap svg {
            color: #94a3b8;
            flex-shrink: 0;
        }

        .search-field {
            width: 100%;
            border: none;
            outline: none;
            font-size: 14px;
            color: #0f172a;
            background: transparent;
        }

        .category-select {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 8px 14px;
            font-size: 13.5px;
            color: #334155;
            outline: none;
            background: #ffffff;
            cursor: pointer;
            font-weight: 500;
        }

        /* SCHEMES GRID (Screenshot 14) */
        .schemes-cards-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .scheme-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px 22px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            transition: all 0.2s ease;
        }

        .scheme-card:hover {
            transform: translateY(-2px);
            border-color: #cbd5e1;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.04);
        }

        .scheme-card-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 14px;
        }

        .scheme-category-badge {
            font-size: 11.5px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 6px;
        }

        .badge-agri { background-color: #dcfce7; color: #15803d; }
        .badge-housing { background-color: #ccfbf1; color: #0f766e; }
        .badge-health { background-color: #dbeafe; color: #1d4ed8; }
        .badge-energy { background-color: #e0f2fe; color: #0369a1; }
        .badge-edu { background-color: #e0e7ff; color: #4338ca; }
        .badge-emp { background-color: #ede9fe; color: #6d28d9; }

        .scheme-bookmark-btn {
            background: none;
            border: none;
            cursor: pointer;
            color: #cbd5e1;
            display: flex;
            align-items: center;
            padding: 4px;
            transition: color 0.15s;
        }

        .scheme-bookmark-btn.saved {
            color: #f59e0b;
        }

        .scheme-bookmark-btn:hover {
            color: #f59e0b;
        }

        .scheme-title {
            font-size: 15.5px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 4px;
            line-height: 1.35;
        }

        .scheme-ministry {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 12px;
        }

        .scheme-desc {
            font-size: 13px;
            color: #475569;
            line-height: 1.5;
            margin-bottom: 16px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .scheme-benefit-highlight {
            font-size: 13px;
            font-weight: 700;
            color: #10b981;
            display: flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 20px;
        }

        .scheme-benefit-highlight svg {
            flex-shrink: 0;
        }

        .scheme-card-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: auto;
        }

        .btn-view-details {
            background-color: #ffffff;
            color: #334155;
            border: 1px solid #cbd5e1;
            padding: 9px 0;
            border-radius: 8px;
            font-size: 12.5px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            transition: all 0.15s;
        }

        .btn-view-details:hover {
            background-color: #f8fafc;
            border-color: #94a3b8;
            color: #0f172a;
        }

        .btn-apply-now {
            background-color: #10b981;
            color: #ffffff;
            border: none;
            padding: 9px 0;
            border-radius: 8px;
            font-size: 12.5px;
            font-weight: 700;
            text-align: center;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.15s;
            cursor: pointer;
        }

        .btn-apply-now:hover {
            background-color: #059669;
        }

        .toast-banner {
            background-color: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .btn-apply-now.applied {
            background-color: #059669;
            cursor: default;
        }

        /* APPLY MODAL STYLES */
        .apply-modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(14, 30, 54, 0.65);
            backdrop-filter: blur(4px);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            padding: 20px;
        }

        .apply-modal-card {
            background: #ffffff;
            border-radius: 14px;
            width: 100%;
            max-width: 520px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            animation: modalSlideIn 0.2s ease-out;
        }

        @keyframes modalSlideIn {
            from { transform: translateY(16px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .apply-modal-header {
            background: #0e1e36;
            color: #ffffff;
            padding: 20px 24px;
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
        }

        .modal-title {
            font-size: 17px;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 4px;
        }

        .modal-sub {
            font-size: 12.5px;
            color: #94a3b8;
        }

        .btn-close-modal {
            background: transparent;
            border: none;
            color: #94a3b8;
            font-size: 26px;
            line-height: 1;
            cursor: pointer;
            transition: color 0.15s;
        }

        .btn-close-modal:hover {
            color: #ffffff;
        }

        .modal-info-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            margin: 20px 24px 16px;
            padding: 14px 18px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .modal-info-row {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
        }

        .info-label {
            color: #64748b;
        }

        .info-val {
            font-weight: 600;
            color: #0f172a;
        }

        .info-val.verified {
            color: #059669;
        }

        .modal-benefit-strip {
            background: #e6f9f0;
            border: 1px solid #a7f3d0;
            border-radius: 8px;
            margin: 0 24px 16px;
            padding: 10px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .benefit-tag {
            font-size: 11px;
            font-weight: 700;
            color: #065f46;
            letter-spacing: 0.05em;
        }

        .benefit-val {
            font-size: 13.5px;
            font-weight: 700;
            color: #047857;
        }

        .modal-declaration {
            margin: 0 24px 20px;
            display: flex;
            align-items: flex-start;
            gap: 10px;
            font-size: 12px;
            color: #64748b;
            line-height: 1.4;
        }

        .modal-declaration input {
            margin-top: 2px;
        }

        .modal-btn-row {
            padding: 0 24px 24px;
            display: flex;
            gap: 12px;
        }

        .btn-modal-cancel {
            flex: 1;
            padding: 11px;
            background: #f1f5f9;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            color: #475569;
            cursor: pointer;
        }

        .btn-modal-submit {
            flex: 2;
            padding: 11px;
            background: #10b981;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            color: #ffffff;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-modal-submit:hover {
            background: #059669;
        }

        .success-icon-circle {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: #e6f9f0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px auto 14px;
        }

        .success-title {
            font-size: 18px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .success-desc {
            font-size: 13px;
            color: #64748b;
            max-width: 380px;
            margin: 0 auto 16px;
        }

        .ref-badge-box {
            background: #f8fafc;
            border: 1px dashed #cbd5e1;
            border-radius: 8px;
            padding: 12px;
            margin: 0 24px 20px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .ref-label {
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            letter-spacing: 0.05em;
        }

        .ref-number {
            font-size: 16px;
            font-weight: 800;
            color: #0e1e36;
        }

        .btn-modal-done {
            width: calc(100% - 48px);
            margin: 0 24px 10px;
            padding: 11px;
            background: #0e1e36;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            color: #ffffff;
            cursor: pointer;
        }

        @media (max-width: 1024px) {
            .schemes-cards-grid { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 640px) {
            .schemes-cards-grid { grid-template-columns: 1fr; }
            .schemes-search-bar { flex-direction: column; align-items: stretch; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Row Matching Screenshot 14 -->
    <div class="schemes-header-row">
        <h1 class="schemes-page-title">6 Eligible Schemes</h1>
        <p class="schemes-page-sub">Matching your profile</p>
    </div>

    <asp:Panel ID="pnlApplySuccess" runat="server" Visible="false" CssClass="toast-banner">
        <span>Application initiated successfully! All required documents verified.</span>
        <asp:LinkButton ID="btnCloseToast" runat="server" OnClick="btnCloseToast_Click" style="color: #065f46; text-decoration: none; font-size: 18px;">&times;</asp:LinkButton>
    </asp:Panel>

    <!-- Search & Filter Bar with Placeholder -->
    <div class="schemes-search-bar">
        <div class="search-input-wrap">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-field" placeholder="Search schemes by name or ministry..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
        </div>

        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="category-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
            <asp:ListItem Value="All" Selected="True">All Categories</asp:ListItem>
            <asp:ListItem Value="Agriculture">Agriculture</asp:ListItem>
            <asp:ListItem Value="Housing">Housing</asp:ListItem>
            <asp:ListItem Value="Health">Health</asp:ListItem>
            <asp:ListItem Value="Energy">Energy</asp:ListItem>
            <asp:ListItem Value="Education">Education</asp:ListItem>
            <asp:ListItem Value="Employment">Employment</asp:ListItem>
        </asp:DropDownList>
    </div>

    <!-- 6 Cards Grid with clean SVG Star and HTML entities -->
    <div class="schemes-cards-grid">
        <!-- 1: PM Kisan Samman Nidhi -->
        <asp:Panel ID="card1" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-agri">Agriculture</span>
                    <asp:LinkButton ID="btnBookmark1" runat="server" CssClass="scheme-bookmark-btn" OnClick="btnToggleBookmark_Click" CommandArgument="1">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">PM Kisan Samman Nidhi</h3>
                <div class="scheme-ministry">Ministry of Agriculture</div>
                <p class="scheme-desc">
                    Provides income support of &#8377;6,000 per year to all landholding farmer families across the country in three equal installments of &#8377;2,000 each directly to bank accounts.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>&#8377;6,000 per year</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=1" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply1" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="1" OnClientClick="return openApplyModal('PM Kisan Samman Nidhi', 'Ministry of Agriculture', '&#8377;6,000 per year', 1, this);" />
            </div>
        </asp:Panel>

        <!-- 2: Pradhan Mantri Awas Yojana (Gramin) -->
        <asp:Panel ID="card2" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-housing">Housing</span>
                    <asp:LinkButton ID="btnBookmark2" runat="server" CssClass="scheme-bookmark-btn saved" OnClick="btnToggleBookmark_Click" CommandArgument="2">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">Pradhan Mantri Awas Yojana (Gramin)</h3>
                <div class="scheme-ministry">Ministry of Rural Development</div>
                <p class="scheme-desc">
                    Aims to provide housing for all in rural India by providing financial assistance for construction of pucca house to all houseless households.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>&#8377;1.20 lakh (plain areas)</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=2" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply2" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="2" OnClientClick="return openApplyModal('Pradhan Mantri Awas Yojana (Gramin)', 'Ministry of Rural Development', '&#8377;1.20 lakh grant', 2, this);" />
            </div>
        </asp:Panel>

        <!-- 3: Ayushman Bharat - PMJAY -->
        <asp:Panel ID="card3" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-health">Health</span>
                    <asp:LinkButton ID="btnBookmark3" runat="server" CssClass="scheme-bookmark-btn" OnClick="btnToggleBookmark_Click" CommandArgument="3">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">Ayushman Bharat - PMJAY</h3>
                <div class="scheme-ministry">Ministry of Health</div>
                <p class="scheme-desc">
                    World's largest health insurance scheme providing coverage of &#8377;5 lakh per family per year for secondary and tertiary care hospitalization.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>&#8377;5 lakh health cover per year</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=3" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply3" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="3" OnClientClick="return openApplyModal('Ayushman Bharat - PMJAY', 'Ministry of Health', '&#8377;5 lakh health cover', 3, this);" />
            </div>
        </asp:Panel>

        <!-- 4: Pradhan Mantri Ujjwala Yojana -->
        <asp:Panel ID="card4" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-energy">Energy</span>
                    <asp:LinkButton ID="btnBookmark4" runat="server" CssClass="scheme-bookmark-btn" OnClick="btnToggleBookmark_Click" CommandArgument="4">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">Pradhan Mantri Ujjwala Yojana</h3>
                <div class="scheme-ministry">Ministry of Petroleum</div>
                <p class="scheme-desc">
                    Provides free LPG connections to women from Below Poverty Line households to protect their health by replacing polluting fuels.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>Free LPG connection + &#8377;1,600</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=4" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply4" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="4" OnClientClick="return openApplyModal('Pradhan Mantri Ujjwala Yojana', 'Ministry of Petroleum', 'Free LPG connection', 4, this);" />
            </div>
        </asp:Panel>

        <!-- 5: National Scholarship Portal -->
        <asp:Panel ID="card5" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-edu">Education</span>
                    <asp:LinkButton ID="btnBookmark5" runat="server" CssClass="scheme-bookmark-btn" OnClick="btnToggleBookmark_Click" CommandArgument="5">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">National Scholarship Portal</h3>
                <div class="scheme-ministry">Ministry of Education</div>
                <p class="scheme-desc">
                    One-stop platform for all scholarships including pre-matric, post-matric, and merit-cum-means for minority and underprivileged students.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>&#8377;500 &ndash; &#8377;20,000 per year</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=5" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply5" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="5" OnClientClick="return openApplyModal('National Scholarship Portal', 'Ministry of Education', '&#8377;10,000 - &#8377;50,000/yr', 5, this);" />
            </div>
        </asp:Panel>

        <!-- 6: PM SVANidhi - Street Vendor Loan -->
        <asp:Panel ID="card6" runat="server" CssClass="scheme-card">
            <div>
                <div class="scheme-card-top">
                    <span class="scheme-category-badge badge-emp">Employment</span>
                    <asp:LinkButton ID="btnBookmark6" runat="server" CssClass="scheme-bookmark-btn" OnClick="btnToggleBookmark_Click" CommandArgument="6">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                    </asp:LinkButton>
                </div>
                <h3 class="scheme-title">PM SVANidhi - Street Vendor Loan</h3>
                <div class="scheme-ministry">Ministry of Housing &amp; Urban Affairs</div>
                <p class="scheme-desc">
                    Micro-credit scheme to help street vendors access affordable working capital loans up to &#8377;50,000 on a progressive basis.
                </p>
                <div class="scheme-benefit-highlight">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="#10b981" stroke="#10b981"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                    <span>Collateral-free loan up to &#8377;50,000</span>
                </div>
            </div>
            <div class="scheme-card-actions">
                <a href="SchemeDetails.aspx?id=6" class="btn-view-details">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    View Details
                </a>
                <asp:Button ID="btnApply6" runat="server" Text="Apply Now" CssClass="btn-apply-now" OnClick="btnApply_Click" CommandArgument="6" OnClientClick="return openApplyModal('PM SVANidhi - Street Vendor Loan', 'Ministry of Housing & Urban Affairs', 'Loan up to &#8377;50,000', 6, this);" />
            </div>
        </asp:Panel>
    </div>

    <!-- Apply Now Interactive Modal -->
    <div id="applyModalOverlay" class="apply-modal-backdrop" style="display: none;">
        <div class="apply-modal-card">
            <div class="apply-modal-header">
                <div>
                    <h3 id="modalSchemeName" class="modal-title">PM Kisan Samman Nidhi</h3>
                    <p id="modalMinistryName" class="modal-sub">Ministry of Agriculture &bull; Central Sector Scheme</p>
                </div>
                <button type="button" class="btn-close-modal" onclick="closeApplyModal();">&times;</button>
            </div>

            <div id="modalStepForm">
                <div class="modal-info-box">
                    <div class="modal-info-row">
                        <span class="info-label">Applicant Name</span>
                        <span class="info-val">Ramesh Kumar</span>
                    </div>
                    <div class="modal-info-row">
                        <span class="info-label">Category / State</span>
                        <span class="info-val">OBC &bull; Uttar Pradesh</span>
                    </div>
                    <div class="modal-info-row">
                        <span class="info-label">Aadhaar Status</span>
                        <span class="info-val verified">Verified (XXXX-XXXX-4819) ✓</span>
                    </div>
                    <div class="modal-info-row">
                        <span class="info-label">DBT Bank Account</span>
                        <span class="info-val verified">State Bank of India (Active) ✓</span>
                    </div>
                </div>

                <div class="modal-benefit-strip">
                    <span class="benefit-tag">DIRECT BENEFIT</span>
                    <span id="modalBenefitAmount" class="benefit-val">&#8377;6,000 per year (3 installments)</span>
                </div>

                <div class="modal-declaration">
                    <input type="checkbox" id="chkModalConsent" checked="checked" />
                    <label for="chkModalConsent">I confirm that all provided details and documents are authentic. I authorize GramSahay to submit my application to the government portal.</label>
                </div>

                <div class="modal-btn-row">
                    <button type="button" class="btn-modal-cancel" onclick="closeApplyModal();">Cancel</button>
                    <button type="button" class="btn-modal-submit" onclick="submitApplication();">Confirm &amp; Submit Application</button>
                </div>
            </div>

            <div id="modalStepSuccess" style="display: none; text-align: center; padding: 20px 10px;">
                <div class="success-icon-circle">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </div>
                <h3 class="success-title">Application Submitted Successfully!</h3>
                <p class="success-desc">Your application has been registered with the Ministry. You will receive an SMS confirmation on your mobile.</p>

                <div class="ref-badge-box">
                    <span class="ref-label">APPLICATION REFERENCE NUMBER</span>
                    <span id="modalAppRef" class="ref-number">GS-APP-2024-8921</span>
                </div>

                <button type="button" class="btn-modal-done" onclick="finishApplication();">Done &amp; View Status</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var currentCardBtn = null;
        var currentSchemeId = 1;

        function openApplyModal(schemeName, ministry, benefit, schemeId, btnElement) {
            currentCardBtn = btnElement;
            currentSchemeId = schemeId;
            document.getElementById('modalSchemeName').innerText = schemeName;
            document.getElementById('modalMinistryName').innerText = ministry + ' • Central Sector Scheme';
            document.getElementById('modalBenefitAmount').innerHTML = benefit;
            document.getElementById('modalAppRef').innerText = 'GS-APP-2024-' + (8920 + parseInt(schemeId));
            document.getElementById('modalStepForm').style.display = 'block';
            document.getElementById('modalStepSuccess').style.display = 'none';
            document.getElementById('applyModalOverlay').style.display = 'flex';
            return false;
        }

        function closeApplyModal() {
            document.getElementById('applyModalOverlay').style.display = 'none';
        }

        function submitApplication() {
            document.getElementById('modalStepForm').style.display = 'none';
            document.getElementById('modalStepSuccess').style.display = 'block';
        }

        function finishApplication() {
            closeApplyModal();
            if (currentCardBtn) {
                currentCardBtn.value = '✓ Applied';
                currentCardBtn.innerText = '✓ Applied';
                currentCardBtn.classList.add('applied');
                currentCardBtn.style.backgroundColor = '#059669';
                currentCardBtn.style.cursor = 'default';
            }
            var toast = document.getElementById('<%= pnlApplySuccess.ClientID %>');
            if (toast) {
                toast.style.display = 'flex';
            }
        }
    </script>
</asp:Content>
