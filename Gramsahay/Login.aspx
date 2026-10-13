<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gramsahay.Login" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* LOGIN PAGE SPECIFIC STYLES */
        .auth-page-wrap {
            padding: 70px 20px 90px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8fafc;
            flex: 1;
        }

        .auth-card {
            width: 100%;
            max-width: 440px;
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }

        .auth-card-header {
            background-color: #0e1e36;
            padding: 32px 24px;
            text-align: center;
            color: #ffffff;
        }

        .auth-card-title {
            font-size: 22px;
            font-weight: 800;
            margin-bottom: 6px;
            letter-spacing: -0.2px;
        }

        .auth-card-sub {
            font-size: 13.5px;
            color: #94a3b8;
        }

        .auth-card-body {
            padding: 32px 30px;
        }

        .form-group {
            margin-bottom: 20px;
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

        .form-row-forgot {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 22px;
        }

        .forgot-link {
            font-size: 12.5px;
            color: #2563eb;
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        .btn-auth-submit {
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

        .btn-auth-submit:hover {
            background-color: #172a4d;
        }

        .auth-switch-text {
            text-align: center;
            margin-top: 24px;
            font-size: 13.5px;
            color: #64748b;
        }

        .auth-switch-text a {
            color: #0e1e36;
            font-weight: 700;
            text-decoration: none;
        }

        .auth-switch-text a:hover {
            color: #10b981;
            text-decoration: underline;
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
        <div class="auth-card">
            <!-- Header Matching Screenshot 3 -->
            <div class="auth-card-header">
                <h2 class="auth-card-title">GramSahay</h2>
                <p class="auth-card-sub">Welcome Back</p>
            </div>

            <!-- Body Form with .NET Validators and Placeholders -->
            <div class="auth-card-body">
                <asp:Panel ID="pnlLoginNotice" runat="server" Visible="false" style="background:#eff6ff; border:1px solid #bfdbfe; color:#1e40af; border-radius:8px; padding:12px 14px; font-size:13px; font-weight:500; margin-bottom:16px; display:flex; align-items:center; gap:10px;">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="flex-shrink:0;"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                    <span><asp:Literal ID="litNoticeText" runat="server">Please login first to access government welfare schemes and services.</asp:Literal></span>
                </asp:Panel>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your registered email address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-row-forgot">
                    <a href="ForgotPassword.aspx" class="forgot-link">Forgot password?</a>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-auth-submit" OnClick="btnLogin_Click" />

                <div class="auth-switch-text">
                    Don't have an account? <a href='<%= !string.IsNullOrEmpty(Request.QueryString["returnUrl"]) ? "Register.aspx?returnUrl=" + Server.UrlEncode(Request.QueryString["returnUrl"]) : "Register.aspx" %>'>Register now</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
