<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Gramsahay.ForgotPassword" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* FORGOT PASSWORD SPECIFIC STYLES */
        .auth-page-wrap {
            padding: 60px 20px 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8fafc;
            flex: 1;
        }

        .forgot-card {
            width: 100%;
            max-width: 460px;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }

        .forgot-card-header {
            background-color: #0e1e36;
            padding: 28px 26px;
            color: #ffffff;
            position: relative;
        }

        .back-login-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #94a3b8;
            font-size: 13px;
            text-decoration: none;
            margin-bottom: 12px;
            transition: color 0.15s;
        }

        .back-login-link:hover {
            color: #ffffff;
        }

        .forgot-card-title {
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .forgot-card-sub {
            font-size: 13px;
            color: #94a3b8;
        }

        /* STEPPER BAR */
        .stepper-bar {
            display: flex;
            align-items: center;
            justify-content: space-around;
            padding: 16px 20px;
            background: #ffffff;
            border-bottom: 1px solid #e2e8f0;
        }

        .step-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
            font-size: 11px;
            font-weight: 600;
            color: #94a3b8;
            position: relative;
            flex: 1;
        }

        .step-item:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 13px;
            left: 60%;
            width: 80%;
            height: 2px;
            background: #e2e8f0;
            z-index: 1;
        }

        .step-item.completed:not(:last-child)::after {
            background: #10b981;
        }

        .step-bubble {
            width: 26px;
            height: 26px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            background: #f1f5f9;
            color: #94a3b8;
            border: 2px solid #e2e8f0;
            z-index: 2;
        }

        .step-item.active .step-bubble {
            background: #0e1e36;
            color: #ffffff;
            border-color: #0e1e36;
        }

        .step-item.active span {
            color: #0e1e36;
        }

        .step-item.completed .step-bubble {
            background: #10b981;
            color: #ffffff;
            border-color: #10b981;
        }

        .step-item.completed span {
            color: #10b981;
        }

        /* FORM BODY */
        .forgot-body {
            padding: 32px 30px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            height: 44px;
            padding: 0 14px;
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            color: #0f172a;
            outline: none;
            transition: all 0.2s;
        }

        .form-control:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.12);
        }

        .btn-navy-submit {
            width: 100%;
            height: 46px;
            background-color: #0e1e36;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-navy-submit:hover {
            background-color: #172a4d;
        }

        .btn-green-submit {
            width: 100%;
            height: 46px;
            background-color: #10b981;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 14.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-green-submit:hover {
            background-color: #059669;
        }

        /* OTP INPUT BOXES */
        .otp-guide-text {
            text-align: center;
            font-size: 13px;
            color: #64748b;
            margin-bottom: 20px;
        }

        .otp-boxes-grid {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-bottom: 24px;
        }

        .otp-digit-input {
            width: 44px;
            height: 48px;
            text-align: center;
            font-size: 18px;
            font-weight: 700;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            outline: none;
            background: #ffffff;
            transition: all 0.15s;
        }

        .otp-digit-input:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.15);
        }

        .resend-otp-wrap {
            text-align: center;
            margin-top: 18px;
        }

        .resend-otp-btn {
            background: none;
            border: none;
            color: #64748b;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: underline;
        }

        .resend-otp-btn:hover {
            color: #0e1e36;
        }

        /* PASSWORD STRENGTH */
        .strength-bar-wrap {
            display: flex;
            gap: 6px;
            margin-top: 8px;
            margin-bottom: 6px;
        }

        .strength-segment {
            flex: 1;
            height: 4px;
            background: #e2e8f0;
            border-radius: 2px;
        }

        .strength-segment.active {
            background: #10b981;
        }

        .strength-caption {
            font-size: 11.5px;
            color: #94a3b8;
        }

        /* SUCCESS VIEW */
        .success-box {
            text-align: center;
            padding: 16px 0;
        }

        .success-icon-circle {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            background: #ecfdf5;
            color: #10b981;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            border: 2px solid #a7f3d0;
        }

        .success-title {
            font-size: 20px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .success-sub {
            font-size: 13.5px;
            color: #64748b;
            line-height: 1.55;
            margin-bottom: 26px;
        }

        .val-error {
            color: #ef4444;
            font-size: 12px;
            margin-top: 4px;
            display: block;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-page-wrap">
        <div class="forgot-card">
            <!-- Header Matching Screenshots 4, 5, 6, 7 -->
            <div class="forgot-card-header">
                <a href="Login.aspx" class="back-login-link">&larr; Back to Login</a>
                <h2 class="forgot-card-title">Forgot Password</h2>
                <p class="forgot-card-sub">
                    <asp:Literal ID="litHeaderSub" runat="server" Text="Enter your registered email address"></asp:Literal>
                </p>
            </div>

            <!-- Stepper Indicator -->
            <div class="stepper-bar">
                <div id="stepItem1" runat="server" class="step-item active">
                    <div class="step-bubble">
                        <asp:Literal ID="litStep1Bubble" runat="server" Text="1"></asp:Literal>
                    </div>
                    <span>Email</span>
                </div>
                <div id="stepItem2" runat="server" class="step-item">
                    <div class="step-bubble">
                        <asp:Literal ID="litStep2Bubble" runat="server" Text="2"></asp:Literal>
                    </div>
                    <span>OTP</span>
                </div>
                <div id="stepItem3" runat="server" class="step-item">
                    <div class="step-bubble">
                        <asp:Literal ID="litStep3Bubble" runat="server" Text="3"></asp:Literal>
                    </div>
                    <span>Reset</span>
                </div>
            </div>

            <!-- MultiView for Steps -->
            <asp:MultiView ID="mvForgot" runat="server" ActiveViewIndex="0">
                <!-- VIEW 1: ENTER EMAIL (Screenshot 4) -->
                <asp:View ID="viewEmail" runat="server">
                    <div class="forgot-body">
                        <div class="form-group">
                            <label class="form-label">Registered Email Address</label>
                            <asp:TextBox ID="txtForgotEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your registered email address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvForgotEmail" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Email address is required." Display="Dynamic" CssClass="val-error" ValidationGroup="Step1Group" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revForgotEmail" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" CssClass="val-error" ValidationGroup="Step1Group" SetFocusOnError="true"></asp:RegularExpressionValidator>
                        </div>

                        <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP" CssClass="btn-navy-submit" ValidationGroup="Step1Group" OnClick="btnSendOTP_Click" />
                    </div>
                </asp:View>

                <!-- VIEW 2: ENTER OTP (Screenshot 5) -->
                <asp:View ID="viewOTP" runat="server">
                    <div class="forgot-body">
                        <div class="otp-guide-text">
                            Enter the 6-digit OTP sent to <br />
                            <strong><asp:Literal ID="litTargetEmail" runat="server" Text="your registered email"></asp:Literal></strong>
                        </div>

                        <div class="otp-boxes-grid">
                            <asp:TextBox ID="otp1" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                            <asp:TextBox ID="otp2" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                            <asp:TextBox ID="otp3" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                            <asp:TextBox ID="otp4" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                            <asp:TextBox ID="otp5" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                            <asp:TextBox ID="otp6" runat="server" CssClass="otp-digit-input" MaxLength="1" placeholder="•"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" CssClass="btn-navy-submit" OnClick="btnVerifyOTP_Click" />

                        <div class="resend-otp-wrap">
                            <asp:LinkButton ID="btnResendOTP" runat="server" CssClass="resend-otp-btn" OnClick="btnResendOTP_Click">Resend OTP</asp:LinkButton>
                        </div>
                    </div>
                </asp:View>

                <!-- VIEW 3: CREATE NEW PASSWORD (Screenshot 6) -->
                <asp:View ID="viewNewPassword" runat="server">
                    <div class="forgot-body">
                        <div class="form-group">
                            <label class="form-label">New Password</label>
                            <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter new password (min 6 characters)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="New password is required." Display="Dynamic" CssClass="val-error" ValidationGroup="Step3Group" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Confirm New Password</label>
                            <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-enter new password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="Confirm password is required." Display="Dynamic" CssClass="val-error" ValidationGroup="Step3Group" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvNewPass" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtNewPass" ErrorMessage="Passwords do not match." Display="Dynamic" CssClass="val-error" ValidationGroup="Step3Group" SetFocusOnError="true"></asp:CompareValidator>

                            <div class="strength-bar-wrap">
                                <div class="strength-segment active"></div>
                                <div class="strength-segment active"></div>
                                <div class="strength-segment active"></div>
                                <div class="strength-segment"></div>
                            </div>
                            <div class="strength-caption">Strong password</div>
                        </div>

                        <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn-green-submit" ValidationGroup="Step3Group" OnClick="btnResetPassword_Click" />
                    </div>
                </asp:View>

                <!-- VIEW 4: RESET SUCCESSFUL (Screenshot 7) -->
                <asp:View ID="viewSuccess" runat="server">
                    <div class="forgot-body">
                        <div class="success-box">
                            <div class="success-icon-circle">
                                <svg width="34" height="34" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            </div>
                            <h3 class="success-title">Password Reset!</h3>
                            <p class="success-sub">
                                Your password has been updated successfully.<br />
                                Please login with your new password.
                            </p>
                            <a href="Login.aspx" class="btn-navy-submit" style="display: flex; align-items: center; justify-content: center; text-decoration: none;">
                                Back to Login
                            </a>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
