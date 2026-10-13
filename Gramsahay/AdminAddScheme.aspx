<%@ Page Title="Manage Schemes" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAddScheme.aspx.cs" Inherits="Gramsahay.AdminAddScheme" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ADMIN ADD SCHEME SPECIFIC STYLES */
        .page-header-block {
            display: flex;
            align-items: center;
            justify-content: space-between;
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

        .btn-green-top {
            background-color: #10b981;
            color: #ffffff;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        /* FORM CARD */
        .scheme-form-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 32px 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            max-width: 900px;
        }

        .form-card-title {
            font-size: 16px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
        }

        .form-control {
            width: 100%;
            height: 44px;
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

        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        textarea.form-control {
            height: 100px;
            padding: 12px 14px;
            resize: vertical;
        }

        .form-actions-bottom {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-top: 28px;
            padding-top: 10px;
        }

        .btn-navy-submit {
            background-color: #0e1e36;
            color: #ffffff;
            border: none;
            padding: 11px 24px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-navy-submit:hover {
            background-color: #172a4d;
        }

        .btn-cancel-link {
            background-color: #ffffff;
            color: #64748b;
            border: 1px solid #cbd5e1;
            padding: 11px 24px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.15s;
        }

        .btn-cancel-link:hover {
            background-color: #f8fafc;
            color: #0f172a;
        }

        .val-error {
            color: #ef4444;
            font-size: 11.5px;
            margin-top: 2px;
            display: block;
            font-weight: 500;
        }

        .alert-box-msg {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13.5px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .form-row-2col { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Matching Screenshot 20 -->
    <div class="page-header-block">
        <div>
            <h1 class="page-title">Manage Schemes</h1>
            <p class="page-sub">Add, edit, or remove government schemes</p>
        </div>

        <a href="AdminAddScheme.aspx" class="btn-green-top">
            + Add Scheme
        </a>
    </div>

    <div class="scheme-form-card">
        <h2 class="form-card-title">
            <asp:Literal ID="litFormTitle" runat="server" Text="Add New Scheme"></asp:Literal>
        </h2>

        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert-box-msg">
            Scheme saved successfully!
        </asp:Panel>

        <div class="form-group">
            <label class="form-label">Scheme Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter scheme name (e.g. PM Kisan Samman Nidhi)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Scheme name is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label class="form-label">Ministry</label>
            <asp:TextBox ID="txtMinistry" runat="server" CssClass="form-control" placeholder="Enter ministry name (e.g. Ministry of Agriculture)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMinistry" runat="server" ControlToValidate="txtMinistry" ErrorMessage="Ministry name is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="form-row-2col">
            <div class="form-group">
                <label class="form-label">Category</label>
                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="e.g. Agriculture"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="txtCategory" ErrorMessage="Category is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">Max Income (&#8377;)</label>
                <asp:TextBox ID="txtMaxIncome" runat="server" CssClass="form-control" placeholder="Enter maximum income (e.g. 200000)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMaxIncome" runat="server" ControlToValidate="txtMaxIncome" ErrorMessage="Max income is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvMaxIncome" runat="server" ControlToValidate="txtMaxIncome" Type="Double" MinimumValue="0" MaximumValue="100000000" ErrorMessage="Please enter a valid amount." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RangeValidator>
            </div>
        </div>

        <div class="form-row-2col">
            <div class="form-group">
                <label class="form-label">Min Age</label>
                <asp:TextBox ID="txtMinAge" runat="server" CssClass="form-control" placeholder="Enter min age (e.g. 18)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMinAge" runat="server" ControlToValidate="txtMinAge" ErrorMessage="Min age is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvMinAge" runat="server" ControlToValidate="txtMinAge" Type="Integer" MinimumValue="0" MaximumValue="120" ErrorMessage="Age must be 0-120." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RangeValidator>
            </div>

            <div class="form-group">
                <label class="form-label">Max Age</label>
                <asp:TextBox ID="txtMaxAge" runat="server" CssClass="form-control" placeholder="Enter max age (e.g. 65)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMaxAge" runat="server" ControlToValidate="txtMaxAge" ErrorMessage="Max age is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvMaxAge" runat="server" ControlToValidate="txtMaxAge" Type="Integer" MinimumValue="0" MaximumValue="120" ErrorMessage="Age must be 0-120." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RangeValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Benefit</label>
            <asp:TextBox ID="txtBenefit" runat="server" CssClass="form-control" placeholder="Enter benefit (e.g. &#8377;6,000 per year)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBenefit" runat="server" ControlToValidate="txtBenefit" ErrorMessage="Benefit description is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label class="form-label">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter detailed description of the welfare scheme..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required." Display="Dynamic" CssClass="val-error" ValidationGroup="SchemeGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>

        <div class="form-actions-bottom">
            <asp:Button ID="btnSaveScheme" runat="server" Text="Add Scheme" CssClass="btn-navy-submit" ValidationGroup="SchemeGroup" OnClick="btnSaveScheme_Click" />
            <a href="AdminSchemes.aspx" class="btn-cancel-link">Cancel</a>
        </div>
    </div>
</asp:Content>
