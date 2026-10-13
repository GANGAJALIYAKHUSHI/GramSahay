<%@ Page Title="Scheme Details" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SchemeDetails.aspx.cs" Inherits="Gramsahay.SchemeDetails" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* SCHEME DETAILS SPECIFIC STYLES */
        .back-schemes-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 13px;
            font-weight: 600;
            color: #2563eb;
            text-decoration: none;
            margin-bottom: 22px;
        }

        .back-schemes-link:hover {
            text-decoration: underline;
        }

        .scheme-detail-grid {
            display: grid;
            grid-template-columns: 1.8fr 1fr;
            gap: 28px;
            align-items: start;
        }

        /* LEFT CONTENT */
        .detail-left-wrap {
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .detail-box-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .detail-header-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .category-pill {
            font-size: 12px;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 6px;
            background-color: #dcfce7;
            color: #15803d;
        }

        .btn-save-scheme {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 6px 14px;
            font-size: 12.5px;
            font-weight: 600;
            color: #475569;
            display: flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-save-scheme:hover {
            border-color: #cbd5e1;
            background: #f8fafc;
        }

        .detail-scheme-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .detail-ministry-row {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: #64748b;
            margin-bottom: 16px;
        }

        .detail-desc-text {
            font-size: 14px;
            color: #475569;
            line-height: 1.6;
        }

        /* CRITERIA SECTION */
        .section-header-row {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
        }

        .criteria-icon {
            color: #10b981;
        }

        .criteria-metrics-3col {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-bottom: 16px;
        }

        .metric-cell {
            background-color: #f8fafc;
            border: 1px solid #f1f5f9;
            border-radius: 8px;
            padding: 14px 16px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .metric-cell-label {
            font-size: 11.5px;
            color: #64748b;
            font-weight: 500;
        }

        .metric-cell-val {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
        }

        .occupation-cell {
            background-color: #f8fafc;
            border: 1px solid #f1f5f9;
            border-radius: 8px;
            padding: 14px 16px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        /* REQUIRED DOCS LIST */
        .doc-items-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .doc-item-row {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 13.5px;
            color: #334155;
            font-weight: 500;
        }

        .doc-chevron {
            color: #10b981;
            font-size: 14px;
            font-weight: 700;
        }

        /* RIGHT COLUMN (Screenshot 15) */
        .detail-right-wrap {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .benefit-dark-card {
            background-color: #0e1e36;
            color: #ffffff;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 4px 14px rgba(14, 30, 54, 0.15);
        }

        .benefit-card-tag {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: #94a3b8;
            margin-bottom: 8px;
        }

        .benefit-amount-text {
            font-size: 24px;
            font-weight: 800;
            color: #ffffff;
        }

        .apply-white-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .apply-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .apply-card-sub {
            font-size: 12.5px;
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .btn-apply-online {
            width: 100%;
            height: 44px;
            background-color: #0e1e36;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-apply-online:hover {
            background-color: #172a4d;
        }

        .btn-apply-online.applied {
            background-color: #059669;
            cursor: default;
        }

        .apply-modal-box {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 14px 18px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            margin-top: 14px;
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

        @media (max-width: 900px) {
            .scheme-detail-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Breadcrumb Link Matching Screenshot 15 -->
    <a href="EligibleSchemes.aspx" class="back-schemes-link">&larr; Back to Schemes</a>

    <div class="scheme-detail-grid">
        <!-- Left Column -->
        <div class="detail-left-wrap">
            <!-- Scheme Header Card -->
            <div class="detail-box-card">
                <div class="detail-header-top">
                    <span id="badgeCategory" runat="server" class="category-pill">Agriculture</span>
                    <button type="button" class="btn-save-scheme" onclick="this.innerHTML = this.innerHTML.indexOf('Saved') > -1 ? '<svg width=\'14\' height=\'14\' viewBox=\'0 0 24 24\' fill=\'none\' stroke=\'currentColor\' stroke-width=\'2\'><path d=\'m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z\'></path></svg> Save' : '<svg width=\'14\' height=\'14\' viewBox=\'0 0 24 24\' fill=\'#10b981\' stroke=\'#10b981\' stroke-width=\'2\'><polyline points=\'20 6 9 17 4 12\'></polyline></svg> Saved';">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path></svg>
                        Save
                    </button>
                </div>

                <h1 class="detail-scheme-title">
                    <asp:Literal ID="litSchemeName" runat="server" Text="PM Kisan Samman Nidhi"></asp:Literal>
                </h1>

                <div class="detail-ministry-row">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 21h18"></path><path d="M3 10h18"></path><path d="M5 6l7-3 7 3"></path><path d="M4 10v11"></path><path d="M20 10v11"></path></svg>
                    <span><asp:Literal ID="litMinistry" runat="server" Text="Ministry of Agriculture"></asp:Literal></span>
                </div>

                <p class="detail-desc-text">
                    <asp:Literal ID="litDescription" runat="server" Text="Provides income support of &#8377;6,000 per year to all landholding farmer families across the country in three equal installments of &#8377;2,000 each directly to bank accounts."></asp:Literal>
                </p>
            </div>

            <!-- Eligibility Criteria Card -->
            <div class="detail-box-card">
                <div class="section-header-row">
                    <svg class="criteria-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    <span>Eligibility Criteria</span>
                </div>

                <div class="criteria-metrics-3col">
                    <div class="metric-cell">
                        <span class="metric-cell-label">Min Age</span>
                        <span class="metric-cell-val"><asp:Literal ID="litMinAge" runat="server" Text="18 years"></asp:Literal></span>
                    </div>
                    <div class="metric-cell">
                        <span class="metric-cell-label">Max Age</span>
                        <span class="metric-cell-val"><asp:Literal ID="litMaxAge" runat="server" Text="65 years"></asp:Literal></span>
                    </div>
                    <div class="metric-cell">
                        <span class="metric-cell-label">Max Income</span>
                        <span class="metric-cell-val"><asp:Literal ID="litMaxIncome" runat="server" Text="&#8377;200,000"></asp:Literal></span>
                    </div>
                </div>

                <div class="occupation-cell">
                    <span class="metric-cell-label">Eligible Occupations</span>
                    <span class="metric-cell-val"><asp:Literal ID="litOccupations" runat="server" Text="Farmer"></asp:Literal></span>
                </div>
            </div>

            <!-- Required Documents Card -->
            <div class="detail-box-card">
                <div class="section-header-row">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
                    <span>Required Documents</span>
                </div>

                <ul class="doc-items-list">
                    <li class="doc-item-row"><span class="doc-chevron">&rsaquo;</span> <span>Aadhaar Card</span></li>
                    <li class="doc-item-row"><span class="doc-chevron">&rsaquo;</span> <span>Land ownership documents</span></li>
                    <li class="doc-item-row"><span class="doc-chevron">&rsaquo;</span> <span>Bank passbook</span></li>
                    <li class="doc-item-row"><span class="doc-chevron">&rsaquo;</span> <span>Passport-size photograph</span></li>
                </ul>
            </div>
        </div>

        <!-- Right Column Matching Screenshot 15 -->
        <div class="detail-right-wrap">
            <div class="benefit-dark-card">
                <div class="benefit-card-tag">SCHEME BENEFIT</div>
                <div class="benefit-amount-text">
                    <asp:Literal ID="litBenefit" runat="server" Text="&#8377;6,000 per year"></asp:Literal>
                </div>
            </div>

            <div class="apply-white-card">
                <h3 class="apply-card-title">Apply for This Scheme</h3>
                <p class="apply-card-sub">Ensure you have all required documents ready before applying.</p>

                <asp:Button ID="btnApplyOnline" runat="server" Text="Apply Online" CssClass="btn-apply-online" OnClick="btnApplyOnline_Click" OnClientClick="return openDetailApplyModal();" />

                <asp:Panel ID="pnlApplySuccess" runat="server" Visible="false" CssClass="apply-modal-box">
                    Application successfully submitted to the respective Ministry portal! Application ID: #GS-2024-9842.
                </asp:Panel>
            </div>
        </div>
    </div>

    <!-- Apply Online Interactive Modal -->
    <div id="applyModalOverlay" class="apply-modal-backdrop" style="display: none;">
        <div class="apply-modal-card">
            <div class="apply-modal-header">
                <div>
                    <h3 id="modalSchemeName" class="modal-title"><%= litSchemeName.Text %></h3>
                    <p id="modalMinistryName" class="modal-sub"><%= litMinistry.Text %> &bull; Central Sector Scheme</p>
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
                    <span class="benefit-tag">SCHEME BENEFIT</span>
                    <span class="benefit-val"><%= litBenefit.Text %></span>
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
                <p class="success-desc">Your application has been registered with the Ministry portal. You will receive an SMS confirmation on your mobile.</p>

                <div class="ref-badge-box">
                    <span class="ref-label">APPLICATION REFERENCE NUMBER</span>
                    <span class="ref-number">GS-APP-2024-9842</span>
                </div>

                <button type="button" class="btn-modal-done" onclick="finishDetailApplication();">Done &amp; View Status</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openDetailApplyModal() {
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

        function finishDetailApplication() {
            closeApplyModal();
            var btn = document.getElementById('<%= btnApplyOnline.ClientID %>');
            if (btn) {
                btn.value = '✓ Applied (Ref: #GS-2024-9842)';
                btn.classList.add('applied');
                btn.style.backgroundColor = '#059669';
                btn.style.cursor = 'default';
            }
            var box = document.getElementById('<%= pnlApplySuccess.ClientID %>');
            if (box) {
                box.style.display = 'block';
            }
        }
    </script>
</asp:Content>
