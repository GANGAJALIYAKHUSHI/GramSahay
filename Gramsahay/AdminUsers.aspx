<%@ Page Title="Users" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="Gramsahay.AdminUsers" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ADMIN USERS SPECIFIC STYLES */
        .page-header-block {
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

        /* 4 STATS CARDS */
        .user-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .user-stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px 20px;
            display: flex;
            align-items: center;
            gap: 16px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .user-stat-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-blue { background-color: #eff6ff; color: #3b82f6; }
        .icon-green { background-color: #ecfdf5; color: #10b981; }
        .icon-amber { background-color: #fffbeb; color: #f59e0b; }
        .icon-red { background-color: #fef2f2; color: #ef4444; }

        .stat-val {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.1;
        }

        .stat-label {
            font-size: 12px;
            font-weight: 500;
            color: #64748b;
            margin-top: 4px;
        }

        /* MAIN USERS CARD */
        .users-table-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .users-card-header {
            padding: 20px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #f1f5f9;
        }

        .users-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
        }

        .search-field-wrap {
            display: flex;
            align-items: center;
            gap: 8px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 7px 14px;
            width: 260px;
        }

        .search-field-wrap svg {
            color: #94a3b8;
        }

        .search-field-input {
            width: 100%;
            border: none;
            outline: none;
            background: transparent;
            font-size: 13px;
            color: #0f172a;
        }

        /* TABLE */
        .users-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .users-table th {
            text-align: left;
            padding: 12px 18px;
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            background-color: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            letter-spacing: 0.05em;
        }

        .users-table td {
            padding: 14px 18px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            vertical-align: middle;
        }

        .name-avatar-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .circle-initials {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #0e1e36;
            color: #ffffff;
            font-size: 11px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .schemes-count-val {
            font-weight: 700;
        }

        .schemes-count-val.green {
            color: #10b981;
        }

        .status-badge {
            display: inline-block;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 12px;
        }

        .status-active { background-color: #dcfce7; color: #15803d; }
        .status-pending { background-color: #fef3c7; color: #b45309; }
        .status-inactive { background-color: #f1f5f9; color: #64748b; }

        .actions-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn-action-icon {
            background: none;
            border: none;
            cursor: pointer;
            color: #64748b;
            padding: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: color 0.15s;
        }

        .btn-action-icon:hover {
            color: #0e1e36;
        }

        .btn-action-icon.trash:hover {
            color: #ef4444;
        }

        /* TABLE FOOTER */
        .users-card-footer {
            padding: 16px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 13px;
            color: #64748b;
            border-top: 1px solid #f1f5f9;
        }

        .pagination-btns {
            display: flex;
            gap: 8px;
        }

        .btn-page {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 12.5px;
            font-weight: 600;
            color: #334155;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-page:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
        }

        @media (max-width: 900px) {
            .user-stats-grid { grid-template-columns: repeat(2, 1fr); }
            .users-table-card { overflow-x: auto; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Matching Screenshot 17 -->
    <div class="page-header-block">
        <h1 class="page-title">Users</h1>
        <p class="page-sub">All registered citizens on GramSahay</p>
    </div>

    <!-- 4 Stats Cards Matching Screenshot 17 -->
    <div class="user-stats-grid">
        <div class="user-stat-card">
            <div class="user-stat-icon icon-blue">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-3-3.87"></path><path d="M9 21v-2a4 4 0 0 0-4-4H3v6"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            </div>
            <div>
                <div class="stat-val">2,451</div>
                <div class="stat-label">Total Users</div>
            </div>
        </div>

        <div class="user-stat-card">
            <div class="user-stat-icon icon-green">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
            </div>
            <div>
                <div class="stat-val">2,104</div>
                <div class="stat-label">Active</div>
            </div>
        </div>

        <div class="user-stat-card">
            <div class="user-stat-icon icon-amber">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            </div>
            <div>
                <div class="stat-val">210</div>
                <div class="stat-label">Pending</div>
            </div>
        </div>

        <div class="user-stat-card">
            <div class="user-stat-icon icon-red">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="18" y1="8" x2="23" y2="13"></line><line x1="23" y1="8" x2="18" y2="13"></line></svg>
            </div>
            <div>
                <div class="stat-val">137</div>
                <div class="stat-label">Inactive</div>
            </div>
        </div>
    </div>

    <!-- Main Table Card Matching Screenshot 17 -->
    <div class="users-table-card">
        <div class="users-card-header">
            <div class="users-card-title">All Registered Users</div>
            <div class="search-field-wrap">
                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtUserSearch" runat="server" CssClass="search-field-input" placeholder="Search by name or email..." AutoPostBack="true" OnTextChanged="txtUserSearch_TextChanged"></asp:TextBox>
            </div>
        </div>

        <table class="users-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>NAME</th>
                    <th>EMAIL</th>
                    <th>STATE</th>
                    <th>DISTRICT</th>
                    <th>REGISTERED</th>
                    <th>SCHEMES</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptUsers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id") %></td>
                            <td>
                                <a href='AdminUserProfile.aspx?id=<%# Eval("Id") %>' class="name-avatar-cell" style="text-decoration: none; color: inherit;">
                                    <div class="circle-initials"><%# Eval("Initials") %></div>
                                    <span style="font-weight: 600; color: #0f172a;"><%# Eval("FullName") %></span>
                                </a>
                            </td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("State") %></td>
                            <td><%# Eval("District") %></td>
                            <td><%# Eval("RegisteredDate") %></td>
                            <td>
                                <span class='schemes-count-val <%# (int)Eval("EligibleSchemesCount") > 0 ? "green" : "" %>'>
                                    <%# Eval("EligibleSchemesCount") %>
                                </span>
                            </td>
                            <td>
                                <span class='status-badge status-<%# Eval("Status").ToString().ToLower() %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div class="actions-cell">
                                    <a href='AdminUserProfile.aspx?id=<%# Eval("Id") %>' class="btn-action-icon" title="View Profile">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path></svg>
                                    </a>
                                    <asp:LinkButton ID="btnDeleteUser" runat="server" CssClass="btn-action-icon trash" OnClick="btnDeleteUser_Click" CommandArgument='<%# Eval("Id") %>' title="Delete">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                    </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="users-card-footer">
            <div>Showing 8 of 2,451 users</div>
            <div class="pagination-btns">
                <button type="button" class="btn-page">Prev</button>
                <button type="button" class="btn-page">Next</button>
            </div>
        </div>
    </div>
</asp:Content>
