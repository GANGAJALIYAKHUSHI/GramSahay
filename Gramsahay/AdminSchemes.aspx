<%@ Page Title="Manage Schemes" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSchemes.aspx.cs" Inherits="Gramsahay.AdminSchemes" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ADMIN MANAGE SCHEMES SPECIFIC STYLES */
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

        .btn-green-add {
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
            transition: background 0.15s;
        }

        .btn-green-add:hover {
            background-color: #059669;
        }

        /* SEARCH BAR */
        .search-bar-wrap {
            margin-bottom: 24px;
        }

        .search-input-box {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 8px 16px;
            max-width: 380px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.02);
        }

        .search-input-box svg {
            color: #94a3b8;
        }

        .search-input-field {
            width: 100%;
            border: none;
            outline: none;
            font-size: 13.5px;
            color: #0f172a;
        }

        /* TABLE CARD */
        .schemes-table-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .schemes-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .schemes-table th {
            text-align: left;
            padding: 14px 18px;
            font-size: 11px;
            font-weight: 700;
            color: #64748b;
            background-color: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            letter-spacing: 0.05em;
        }

        .schemes-table td {
            padding: 16px 18px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            vertical-align: middle;
        }

        .scheme-name-text {
            font-weight: 700;
            color: #0f172a;
        }

        .scheme-category-badge {
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 6px;
            display: inline-block;
        }

        .badge-agri { background-color: #dcfce7; color: #15803d; }
        .badge-housing { background-color: #ccfbf1; color: #0f766e; }
        .badge-health { background-color: #dbeafe; color: #1d4ed8; }
        .badge-energy { background-color: #e0f2fe; color: #0369a1; }
        .badge-edu { background-color: #e0e7ff; color: #4338ca; }
        .badge-emp { background-color: #ede9fe; color: #6d28d9; }

        .actions-btn-group {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .action-link {
            color: #64748b;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: color 0.15s;
            cursor: pointer;
            background: none;
            border: none;
            padding: 2px;
        }

        .action-link:hover {
            color: #0e1e36;
        }

        .action-link.delete:hover {
            color: #ef4444;
        }

        .table-foot-row {
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
        }

        .btn-page:hover {
            background: #f8fafc;
        }

        @media (max-width: 900px) {
            .page-header-block { flex-direction: column; align-items: flex-start; gap: 14px; }
            .schemes-table-card { overflow-x: auto; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Matching Screenshot 19 -->
    <div class="page-header-block">
        <div>
            <h1 class="page-title">Manage Schemes</h1>
            <p class="page-sub">Add, edit, or remove government schemes</p>
        </div>

        <a href="AdminAddScheme.aspx" class="btn-green-add">
            + Add Scheme
        </a>
    </div>

    <!-- Search Input Matching Screenshot 19 -->
    <div class="search-bar-wrap">
        <div class="search-input-box">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSchemeSearch" runat="server" CssClass="search-input-field" placeholder="Search schemes..." AutoPostBack="true" OnTextChanged="txtSchemeSearch_TextChanged"></asp:TextBox>
        </div>
    </div>

    <!-- Schemes Table Matching Screenshot 19 -->
    <div class="schemes-table-card">
        <table class="schemes-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>SCHEME NAME</th>
                    <th>MINISTRY</th>
                    <th>CATEGORY</th>
                    <th>MAX INCOME</th>
                    <th>AGE</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptSchemes" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id") %></td>
                            <td><span class="scheme-name-text"><%# Eval("Name") %></span></td>
                            <td><%# Eval("Ministry") %></td>
                            <td>
                                <span class='scheme-category-badge <%# Eval("CategoryCssClass") %>'>
                                    <%# Eval("Category") %>
                                </span>
                            </td>
                            <td>&#8377;<%# string.Format("{0:N0}", Eval("MaxIncome")) %></td>
                            <td><%# Eval("MinAge") %>&ndash;<%# Eval("MaxAge") %></td>
                            <td>
                                <div class="actions-btn-group">
                                    <a href='AdminSchemeDetails.aspx?id=<%# Eval("Id") %>' class="action-link" title="View Scheme Details">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path></svg>
                                    </a>
                                    <a href='AdminAddScheme.aspx?edit=<%# Eval("Id") %>' class="action-link" title="Edit">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                    </a>
                                    <asp:LinkButton ID="btnDeleteScheme" runat="server" CssClass="action-link delete" OnClick="btnDeleteScheme_Click" CommandArgument='<%# Eval("Id") %>' title="Delete">
                                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                    </asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-foot-row">
            <div>
                Showing <asp:Literal ID="litShowingCount" runat="server" Text="6"></asp:Literal> of 6 schemes
            </div>
            <div class="pagination-btns">
                <button type="button" class="btn-page">Prev</button>
                <button type="button" class="btn-page">Next</button>
            </div>
        </div>
    </div>
</asp:Content>
