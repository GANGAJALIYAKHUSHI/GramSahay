<%@ Page Title="Check Eligibility" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CheckEligibility.aspx.cs" Inherits="Gramsahay.CheckEligibility" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* CHECK ELIGIBILITY 3-STEP WIZARD SPECIFIC STYLES */
        .elig-wrap {
            max-width: 680px;
        }

        .elig-page-title {
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
        }

        .elig-page-sub {
            font-size: 13px;
            color: #64748b;
            margin-top: 3px;
            margin-bottom: 24px;
        }

        /* STEPPER */
        .elig-stepper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
        }

        .elig-step {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 12.5px;
            font-weight: 600;
            color: #94a3b8;
            position: relative;
            z-index: 2;
        }

        .elig-step-bubble {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #f1f5f9;
            color: #94a3b8;
            border: 1px solid #cbd5e1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 700;
        }

        .elig-step.active .elig-step-bubble {
            background-color: #0e1e36;
            color: #ffffff;
            border-color: #0e1e36;
        }

        .elig-step.active {
            color: #0e1e36;
        }

        .elig-step.completed .elig-step-bubble {
            background-color: #10b981;
            color: #ffffff;
            border-color: #10b981;
        }

        .elig-step.completed {
            color: #10b981;
        }

        .elig-step-line {
            flex: 1;
            height: 2px;
            background-color: #e2e8f0;
            margin: 0 14px;
            z-index: 1;
        }

        .elig-step-line.active {
            background-color: #10b981;
        }

        /* WIZARD CARD */
        .elig-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 32px 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-label {
            font-size: 12.5px;
            font-weight: 600;
            color: #334155;
        }

        .form-control {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 13.5px;
            color: #0f172a;
            outline: none;
            transition: all 0.2s;
        }

        .form-control:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.12);
        }

        .helper-text {
            font-size: 11.5px;
            color: #94a3b8;
            margin-top: 2px;
        }

        .val-error {
            color: #ef4444;
            font-size: 11.5px;
            margin-top: 3px;
            display: block;
            font-weight: 500;
        }

        /* RADIO CHOICES */
        .radio-options-row {
            display: flex;
            align-items: center;
            gap: 24px;
            margin-top: 8px;
            font-size: 13.5px;
            color: #1e293b;
        }

        .radio-option-item {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        /* DOCUMENTS CHECKBOX GRID (Screenshot 13) */
        .doc-guide-title {
            font-size: 13.5px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 18px;
        }

        .docs-2col-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-bottom: 28px;
        }

        .doc-check-box {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background-color: #f8fafc;
            font-size: 13px;
            font-weight: 600;
            color: #1e293b;
            cursor: pointer;
            transition: all 0.15s;
        }

        .doc-check-box:hover {
            border-color: #cbd5e1;
            background-color: #f1f5f9;
        }

        /* FOOTER ACTIONS */
        .wizard-footer-actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid #f1f5f9;
        }

        .btn-wizard-prev {
            background-color: #ffffff;
            color: #94a3b8;
            border: 1px solid #e2e8f0;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: not-allowed;
        }

        .btn-wizard-prev.enabled {
            color: #0e1e36;
            cursor: pointer;
        }

        .btn-wizard-prev.enabled:hover {
            background-color: #f8fafc;
        }

        .btn-wizard-next {
            background-color: #0e1e36;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-wizard-next:hover {
            background-color: #172a4d;
        }

        .btn-wizard-check {
            background-color: #10b981;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.15s;
        }

        .btn-wizard-check:hover {
            background-color: #059669;
        }

        @media (max-width: 600px) {
            .form-row-2col, .docs-2col-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="elig-wrap">
        <h1 class="elig-page-title">Check Eligibility</h1>
        <p class="elig-page-sub">Fill in your details to find matching government schemes.</p>

        <!-- Stepper Indicator Matching Screenshots 11, 12, 13 -->
        <div class="elig-stepper">
            <div id="step1Indicator" runat="server" class="elig-step active">
                <div class="elig-step-bubble"><asp:Literal ID="litBubble1" runat="server" Text="1"></asp:Literal></div>
                <span>Personal</span>
            </div>

            <div id="line1" runat="server" class="elig-step-line"></div>

            <div id="step2Indicator" runat="server" class="elig-step">
                <div class="elig-step-bubble"><asp:Literal ID="litBubble2" runat="server" Text="2"></asp:Literal></div>
                <span>Financial</span>
            </div>

            <div id="line2" runat="server" class="elig-step-line"></div>

            <div id="step3Indicator" runat="server" class="elig-step">
                <div class="elig-step-bubble"><asp:Literal ID="litBubble3" runat="server" Text="3"></asp:Literal></div>
                <span>Documents</span>
            </div>
        </div>

        <div class="elig-card">
            <asp:MultiView ID="mvEligibility" runat="server" ActiveViewIndex="0">
                <!-- STEP 1: PERSONAL (Screenshot 11) with .NET Validators and Placeholders -->
                <asp:View ID="viewPersonal" runat="server">
                    <div class="form-row-2col">
                        <div class="form-group">
                            <label class="form-label">Age *</label>
                            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter age (e.g. 38)" Text="38"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required." Display="Dynamic" CssClass="val-error" ValidationGroup="Step1EligGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvAge" runat="server" ControlToValidate="txtAge" Type="Integer" MinimumValue="18" MaximumValue="120" ErrorMessage="Age must be between 18 and 120." Display="Dynamic" CssClass="val-error" ValidationGroup="Step1EligGroup" SetFocusOnError="true"></asp:RangeValidator>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Male" Selected="True">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-row-2col">
                        <div class="form-group">
                            <label class="form-label">Occupation *</label>
                            <asp:DropDownList ID="ddlOccupation" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Farmer" Selected="True">Farmer</asp:ListItem>
                                <asp:ListItem Value="Street Vendor">Street Vendor</asp:ListItem>
                                <asp:ListItem Value="Student">Student</asp:ListItem>
                                <asp:ListItem Value="Artisan">Artisan</asp:ListItem>
                                <asp:ListItem Value="Laborer">Laborer</asp:ListItem>
                                <asp:ListItem Value="Unemployed">Unemployed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label class="form-label">State</label>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Uttar Pradesh" Selected="True">Uttar Pradesh</asp:ListItem>
                                <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                                <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                                <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                                <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-row-2col">
                        <div class="form-group">
                            <label class="form-label">Caste Category</label>
                            <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                <asp:ListItem Value="OBC" Selected="True">OBC</asp:ListItem>
                                <asp:ListItem Value="General">General</asp:ListItem>
                                <asp:ListItem Value="SC">SC</asp:ListItem>
                                <asp:ListItem Value="ST">ST</asp:ListItem>
                                <asp:ListItem Value="EWS">EWS</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div></div>
                    </div>

                    <div class="wizard-footer-actions">
                        <button type="button" class="btn-wizard-prev" disabled="disabled">Previous</button>
                        <asp:Button ID="btnNextToFinancial" runat="server" Text="Next Step &rarr;" CssClass="btn-wizard-next" ValidationGroup="Step1EligGroup" OnClick="btnNextToFinancial_Click" />
                    </div>
                </asp:View>

                <!-- STEP 2: FINANCIAL (Screenshot 12) with .NET Validators and Placeholders -->
                <asp:View ID="viewFinancial" runat="server">
                    <div class="form-group" style="margin-bottom: 22px;">
                        <label class="form-label">Annual Family Income (&#8377;) *</label>
                        <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" placeholder="Enter annual household income (e.g. 120000)" Text="120000"></asp:TextBox>
                        <div class="helper-text">Total annual household income in rupees</div>
                        <asp:RequiredFieldValidator ID="rfvIncome" runat="server" ControlToValidate="txtIncome" ErrorMessage="Annual family income is required." Display="Dynamic" CssClass="val-error" ValidationGroup="Step2EligGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvIncome" runat="server" ControlToValidate="txtIncome" Type="Double" MinimumValue="0" MaximumValue="100000000" ErrorMessage="Please enter a valid income amount." Display="Dynamic" CssClass="val-error" ValidationGroup="Step2EligGroup" SetFocusOnError="true"></asp:RangeValidator>
                    </div>

                    <div class="form-group" style="margin-bottom: 22px;">
                        <label class="form-label">Do you own agricultural land?</label>
                        <div class="radio-options-row">
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbLandYes" runat="server" GroupName="LandGroup" Checked="true" />
                                Yes
                            </label>
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbLandNo" runat="server" GroupName="LandGroup" />
                                No
                            </label>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 24px;">
                        <label class="form-label">Ration Card Type</label>
                        <div class="radio-options-row">
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbAPL" runat="server" GroupName="RationGroup" />
                                APL
                            </label>
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbBPL" runat="server" GroupName="RationGroup" Checked="true" />
                                BPL
                            </label>
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbAAY" runat="server" GroupName="RationGroup" />
                                Antyodaya (AAY)
                            </label>
                            <label class="radio-option-item">
                                <asp:RadioButton ID="rbNone" runat="server" GroupName="RationGroup" />
                                None
                            </label>
                        </div>
                    </div>

                    <div class="wizard-footer-actions">
                        <asp:Button ID="btnBackToPersonal" runat="server" Text="Previous" CssClass="btn-wizard-prev enabled" OnClick="btnBackToPersonal_Click" />
                        <asp:Button ID="btnNextToDocs" runat="server" Text="Next Step &rarr;" CssClass="btn-wizard-next" ValidationGroup="Step2EligGroup" OnClick="btnNextToDocs_Click" />
                    </div>
                </asp:View>

                <!-- STEP 3: DOCUMENTS (Screenshot 13) -->
                <asp:View ID="viewDocs" runat="server">
                    <div class="doc-guide-title">Select documents you currently have:</div>

                    <div class="docs-2col-grid">
                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkAadhaar" runat="server" Checked="true" />
                            <span>Aadhaar Card</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkPAN" runat="server" />
                            <span>PAN Card</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkVoter" runat="server" />
                            <span>Voter ID</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkRation" runat="server" Checked="true" />
                            <span>Ration Card</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkIncome" runat="server" />
                            <span>Income Certificate</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkCaste" runat="server" />
                            <span>Caste Certificate</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkLand" runat="server" />
                            <span>Land Records</span>
                        </label>

                        <label class="doc-check-box">
                            <asp:CheckBox ID="chkBank" runat="server" Checked="true" />
                            <span>Bank Passbook</span>
                        </label>
                    </div>

                    <div class="wizard-footer-actions">
                        <asp:Button ID="btnBackToFinancial" runat="server" Text="Previous" CssClass="btn-wizard-prev enabled" OnClick="btnBackToFinancial_Click" />
                        <asp:Button ID="btnCheckEligibilitySubmit" runat="server" Text="Check Eligibility" CssClass="btn-wizard-check" OnClick="btnCheckEligibilitySubmit_Click" />
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
