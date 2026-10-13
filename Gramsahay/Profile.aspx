<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Gramsahay.Profile" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* PROFILE PAGE SPECIFIC STYLES */
        .profile-container {
            max-width: 900px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        /* DARK NAVY HEADER BANNER */
        .profile-hero-card {
            background-color: #0e1e36;
            border-radius: 14px;
            padding: 26px 32px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: #ffffff;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
        }

        .profile-hero-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .profile-hero-avatar {
            width: 68px;
            height: 68px;
            border-radius: 50%;
            background-color: #10b981;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: 800;
            border: 3px solid rgba(255, 255, 255, 0.2);
            flex-shrink: 0;
        }

        .profile-hero-name {
            font-size: 20px;
            font-weight: 700;
            color: #ffffff;
        }

        .profile-hero-email {
            font-size: 13.5px;
            color: #94a3b8;
            margin-top: 3px;
        }

        .btn-edit-profile {
            background: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-edit-profile:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* DETAILS WHITE CARD */
        .profile-details-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 30px 32px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .profile-completion-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .completion-label {
            font-size: 13px;
            font-weight: 700;
            color: #0f172a;
        }

        .completion-percent {
            font-size: 13px;
            font-weight: 700;
            color: #10b981;
        }

        .progress-bar-bg {
            width: 100%;
            height: 8px;
            background-color: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .progress-bar-fill {
            height: 100%;
            background-color: #10b981;
            border-radius: 4px;
            width: 80%;
        }

        .profile-info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            row-gap: 24px;
            column-gap: 40px;
        }

        .info-field-group {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .info-field-label {
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
        }

        .info-field-val {
            font-size: 14.5px;
            font-weight: 600;
            color: #0f172a;
        }

        /* CHANGE PASSWORD CARD */
        .password-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 30px 32px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .card-heading {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
        }

        .pass-inputs-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
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

        .btn-update-pass {
            background-color: #ffffff;
            color: #0e1e36;
            border: 1px solid #cbd5e1;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-update-pass:hover {
            background-color: #f8fafc;
            border-color: #94a3b8;
        }

        .val-error {
            color: #ef4444;
            font-size: 11.5px;
            margin-top: 4px;
            display: block;
            font-weight: 500;
        }

        .alert-success {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #065f46;
            padding: 10px 14px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 16px;
        }

        @media (max-width: 768px) {
            .profile-info-grid { grid-template-columns: 1fr; }
            .pass-inputs-grid { grid-template-columns: 1fr; }
            .modal-form-grid { grid-template-columns: 1fr !important; }
        }

        /* EDIT PROFILE MODAL */
        .modal-backdrop-custom {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(14, 30, 54, 0.72);
            backdrop-filter: blur(4px);
            z-index: 10000;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .modal-card-custom {
            background: #ffffff;
            border-radius: 16px;
            width: 100%;
            max-width: 660px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 28px 32px;
            animation: modalFadeIn 0.2s ease-out;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: scale(0.97); }
            to { opacity: 1; transform: scale(1); }
        }

        .modal-header-custom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #e2e8f0;
            padding-bottom: 16px;
            margin-bottom: 22px;
        }

        .modal-title-custom {
            font-size: 19px;
            font-weight: 800;
            color: #0f172a;
            margin: 0;
        }

        .modal-sub-custom {
            font-size: 13px;
            color: #64748b;
            margin-top: 3px;
            margin-bottom: 0;
        }

        .modal-close-btn {
            background: none;
            border: none;
            font-size: 26px;
            color: #94a3b8;
            cursor: pointer;
            line-height: 1;
            padding: 4px;
            border-radius: 6px;
            transition: color 0.15s;
        }

        .modal-close-btn:hover {
            color: #0f172a;
        }

        .modal-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 24px;
        }

        .modal-actions-bar {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 12px;
            border-top: 1px solid #e2e8f0;
            padding-top: 18px;
        }

        .btn-save-profile {
            background-color: #10b981;
            color: #ffffff;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.15s;
        }

        .btn-save-profile:hover {
            background-color: #059669;
        }

        .btn-cancel-modal {
            background-color: #ffffff;
            color: #475569;
            border: 1px solid #cbd5e1;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-cancel-modal:hover {
            background-color: #f8fafc;
            color: #0f172a;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-container">
        <!-- Dark Navy Hero Card Matching Screenshot 10 -->
        <div class="profile-hero-card">
            <div class="profile-hero-left">
                <div class="profile-hero-avatar">
                    <asp:Literal ID="litAvatarInitials" runat="server">RK</asp:Literal>
                </div>
                <div>
                    <h2 class="profile-hero-name">
                        <asp:Literal ID="litHeroName" runat="server">Ramesh Kumar</asp:Literal>
                    </h2>
                    <p class="profile-hero-email">
                        <asp:Literal ID="litHeroEmail" runat="server">ramesh.kumar@example.com</asp:Literal>
                    </p>
                </div>
            </div>

            <button type="button" class="btn-edit-profile" onclick="openEditProfileModal();">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                Edit
            </button>
        </div>

        <asp:Panel ID="pnlProfileSuccess" runat="server" Visible="false" CssClass="alert-success">
            &#10003; Profile details updated successfully!
        </asp:Panel>

        <!-- Details Card Matching Screenshot 10 -->
        <div class="profile-details-card">
            <div class="profile-completion-header">
                <span class="completion-label">Profile Completion</span>
                <span class="completion-percent">
                    <asp:Literal ID="litCompletionPercent" runat="server">80%</asp:Literal>
                </span>
            </div>
            <div class="progress-bar-bg">
                <div id="barCompletion" runat="server" class="progress-bar-fill" style="width: 80%;"></div>
            </div>

            <div class="profile-info-grid">
                <div class="info-field-group">
                    <span class="info-field-label">Full Name</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litFullName" runat="server">Ramesh Kumar</asp:Literal>
                    </span>
                </div>
                <div class="info-field-group">
                    <span class="info-field-label">Email</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litEmail" runat="server">ramesh.kumar@example.com</asp:Literal>
                    </span>
                </div>

                <div class="info-field-group">
                    <span class="info-field-label">Mobile</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litMobile" runat="server">9876543210</asp:Literal>
                    </span>
                </div>
                <div class="info-field-group">
                    <span class="info-field-label">Age</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litAge" runat="server">38</asp:Literal>
                    </span>
                </div>

                <div class="info-field-group">
                    <span class="info-field-label">Gender</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litGender" runat="server">Male</asp:Literal>
                    </span>
                </div>
                <div class="info-field-group">
                    <span class="info-field-label">State</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litState" runat="server">Uttar Pradesh</asp:Literal>
                    </span>
                </div>

                <div class="info-field-group">
                    <span class="info-field-label">District</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litDistrict" runat="server">Lucknow</asp:Literal>
                    </span>
                </div>
                <div class="info-field-group">
                    <span class="info-field-label">Occupation</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litOccupation" runat="server">Farmer</asp:Literal>
                    </span>
                </div>

                <div class="info-field-group">
                    <span class="info-field-label">Annual Income (&#8377;)</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litAnnualIncome" runat="server">&#8377;120,000</asp:Literal>
                    </span>
                </div>
                <div class="info-field-group">
                    <span class="info-field-label">Caste</span>
                    <span class="info-field-val">
                        <asp:Literal ID="litCaste" runat="server">OBC</asp:Literal>
                    </span>
                </div>
            </div>
        </div>

        <!-- Change Password Card with .NET Validation and Placeholders -->
        <div class="password-card">
            <h3 class="card-heading">Change Password</h3>

            <asp:Panel ID="pnlPassSuccess" runat="server" Visible="false" CssClass="alert-success">
                Password updated successfully!
            </asp:Panel>

            <div class="pass-inputs-grid">
                <div class="form-group">
                    <label class="form-label">Current Password</label>
                    <asp:TextBox ID="txtCurrentPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter current password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCurrentPass" runat="server" ControlToValidate="txtCurrentPass" ErrorMessage="Current password is required." Display="Dynamic" CssClass="val-error" ValidationGroup="PassGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter new password (min 6 chars)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="New password is required." Display="Dynamic" CssClass="val-error" ValidationGroup="PassGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm new password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="Confirm password is required." Display="Dynamic" CssClass="val-error" ValidationGroup="PassGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPass" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtNewPass" ErrorMessage="Passwords do not match." Display="Dynamic" CssClass="val-error" ValidationGroup="PassGroup" SetFocusOnError="true"></asp:CompareValidator>
                </div>
            </div>

            <asp:Button ID="btnUpdatePass" runat="server" Text="Update Password" CssClass="btn-update-pass" ValidationGroup="PassGroup" OnClick="btnUpdatePass_Click" />
        </div>
    </div>

    <!-- Edit Profile Interactive Modal -->
    <div id="modalEditProfileBackdrop" class="modal-backdrop-custom" style="display: none;">
        <div class="modal-card-custom">
            <div class="modal-header-custom">
                <div>
                    <h3 class="modal-title-custom">Edit Profile</h3>
                    <p class="modal-sub-custom">Update your citizen profile and welfare eligibility details</p>
                </div>
                <button type="button" class="modal-close-btn" onclick="closeEditProfileModal();">&times;</button>
            </div>

            <div class="modal-form-grid">
                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtEditFullName" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditFullName" runat="server" ControlToValidate="txtEditFullName" ErrorMessage="Full name is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Mobile Number</label>
                    <asp:TextBox ID="txtEditMobile" runat="server" CssClass="form-control" placeholder="Enter 10-digit mobile number" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditMobile" runat="server" ControlToValidate="txtEditMobile" ErrorMessage="Mobile number is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEditMobile" runat="server" ControlToValidate="txtEditMobile" ErrorMessage="Enter a valid 10-digit mobile number." ValidationExpression="^[6-9]\d{9}$" Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Age</label>
                    <asp:TextBox ID="txtEditAge" runat="server" TextMode="Number" CssClass="form-control" placeholder="Enter age"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditAge" runat="server" ControlToValidate="txtEditAge" ErrorMessage="Age is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvEditAge" runat="server" ControlToValidate="txtEditAge" MinimumValue="18" MaximumValue="120" Type="Integer" ErrorMessage="Age must be between 18 and 120." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RangeValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Gender</label>
                    <asp:DropDownList ID="ddlEditGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">State</label>
                    <asp:TextBox ID="txtEditState" runat="server" CssClass="form-control" placeholder="Enter state"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditState" runat="server" ControlToValidate="txtEditState" ErrorMessage="State is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">District</label>
                    <asp:TextBox ID="txtEditDistrict" runat="server" CssClass="form-control" placeholder="Enter district"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditDistrict" runat="server" ControlToValidate="txtEditDistrict" ErrorMessage="District is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Occupation</label>
                    <asp:DropDownList ID="ddlEditOccupation" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Farmer">Farmer</asp:ListItem>
                        <asp:ListItem Value="Agricultural Laborer">Agricultural Laborer</asp:ListItem>
                        <asp:ListItem Value="Small Business Owner">Small Business Owner</asp:ListItem>
                        <asp:ListItem Value="Artisan / Craftsman">Artisan / Craftsman</asp:ListItem>
                        <asp:ListItem Value="Construction Worker">Construction Worker</asp:ListItem>
                        <asp:ListItem Value="Student">Student</asp:ListItem>
                        <asp:ListItem Value="Senior Citizen">Senior Citizen</asp:ListItem>
                        <asp:ListItem Value="Homemaker">Homemaker</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Annual Income (&#8377;)</label>
                    <asp:TextBox ID="txtEditIncome" runat="server" TextMode="Number" CssClass="form-control" placeholder="Enter annual income"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditIncome" runat="server" ControlToValidate="txtEditIncome" ErrorMessage="Annual income is required." Display="Dynamic" CssClass="val-error" ValidationGroup="EditProfileGroup" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label">Caste / Category</label>
                    <asp:DropDownList ID="ddlEditCaste" runat="server" CssClass="form-control">
                        <asp:ListItem Value="General">General</asp:ListItem>
                        <asp:ListItem Value="OBC">OBC</asp:ListItem>
                        <asp:ListItem Value="SC">SC</asp:ListItem>
                        <asp:ListItem Value="ST">ST</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="modal-actions-bar">
                <button type="button" class="btn-cancel-modal" onclick="closeEditProfileModal();">Cancel</button>
                <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn-save-profile" ValidationGroup="EditProfileGroup" OnClick="btnSaveProfile_Click" />
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function openEditProfileModal() {
            var m = document.getElementById('modalEditProfileBackdrop');
            if (m) m.style.display = 'flex';
        }

        function closeEditProfileModal() {
            var m = document.getElementById('modalEditProfileBackdrop');
            if (m) m.style.display = 'none';
        }
    </script>
</asp:Content>
