<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Gramsahay.Register" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* REGISTER PAGE SPECIFIC STYLES */
        .auth-page-wrap {
            padding: 60px 20px 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8fafc;
            flex: 1;
        }

        .auth-card {
            width: 100%;
            max-width: 480px;
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
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .auth-card-sub {
            font-size: 13.5px;
            color: #94a3b8;
        }

        .auth-card-body {
            padding: 32px 30px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 7px;
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

        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .terms-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 20px 0 24px;
            font-size: 13px;
            color: #475569;
        }

        .terms-row a {
            color: #10b981;
            text-decoration: none;
            font-weight: 600;
        }

        .terms-row a:hover {
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
            margin-top: 22px;
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

        .msg-error {
            background: #fef2f2;
            border: 1px solid #fee2e2;
            color: #dc2626;
            padding: 10px 14px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auth-page-wrap">
        <div class="auth-card">
            <!-- Header Matching Screenshot 2 -->
            <div class="auth-card-header">
                <h2 class="auth-card-title">Create Your Account</h2>
                <p class="auth-card-sub">Register to check scheme eligibility</p>
            </div>

            <!-- Body Form with .NET Validators and Placeholders -->
            <div class="auth-card-body">
                <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="msg-error">
                    <asp:Literal ID="litError" runat="server"></asp:Literal>
                </asp:Panel>

                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name (e.g. Ramesh Kumar)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full name is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>

                <div class="form-row-2col">
                    <div class="form-group">
                        <label class="form-label">Mobile Number</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter 10-digit mobile number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile number is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter valid 10-digit number." ValidationExpression="^[6-9]\d{9}$" Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label class="form-label">State</label>
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Uttar Pradesh" Selected="True">Uttar Pradesh</asp:ListItem>
                            <asp:ListItem Value="Bihar">Bihar</asp:ListItem>
                            <asp:ListItem Value="Madhya Pradesh">Madhya Pradesh</asp:ListItem>
                            <asp:ListItem Value="Rajasthan">Rajasthan</asp:ListItem>
                            <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                            <asp:ListItem Value="West Bengal">West Bengal</asp:ListItem>
                            <asp:ListItem Value="Gujarat">Gujarat</asp:ListItem>
                            <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                            <asp:ListItem Value="Haryana">Haryana</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-row-2col">
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create password (min 6 chars)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password is required." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match." Display="Dynamic" CssClass="val-error" SetFocusOnError="true"></asp:CompareValidator>
                    </div>
                </div>

                <div class="terms-row">
                    <asp:CheckBox ID="chkTerms" runat="server" Checked="true" />
                    <label for="<%= chkTerms.ClientID %>">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                </div>

                <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" CssClass="btn-auth-submit" OnClick="btnCreateAccount_Click" />

                <div class="auth-switch-text">
                    Already have an account? <a href="Login.aspx">Login here</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
