<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="Gramsahay.Notifications" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* NOTIFICATIONS SPECIFIC STYLES */
        .notif-top-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .notif-page-title {
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
        }

        .notif-page-sub {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 2px;
        }

        .btn-mark-all-read {
            background-color: #ffffff;
            color: #2563eb;
            border: 1px solid #bfdbfe;
            padding: 9px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-mark-all-read:hover {
            background-color: #eff6ff;
            border-color: #93c5fd;
        }

        /* 3 COUNTER CARDS */
        .notif-counts-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .count-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px 24px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
        }

        .count-num {
            font-size: 26px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.1;
        }

        .count-label {
            font-size: 12.5px;
            color: #64748b;
            font-weight: 500;
            margin-top: 4px;
        }

        /* NOTIFICATIONS FEED CARDS */
        .notif-cards-feed {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .notif-card-row {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 18px 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            transition: border-color 0.15s;
        }

        .notif-card-row:hover {
            border-color: #cbd5e1;
        }

        .notif-card-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .notif-badge-circle {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .badge-green { background-color: #ecfdf5; color: #10b981; }
        .badge-blue { background-color: #eff6ff; color: #3b82f6; }
        .badge-yellow { background-color: #fefce8; color: #ca8a04; }

        .notif-text-info {
            display: flex;
            flex-direction: column;
            gap: 3px;
        }

        .notif-main-text {
            font-size: 14px;
            font-weight: 600;
            color: #1e293b;
        }

        .notif-sub-time {
            font-size: 12px;
            color: #94a3b8;
        }

        .notif-card-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-mark-item-read {
            background: #ffffff;
            border: 1px solid #bfdbfe;
            color: #2563eb;
            font-size: 12px;
            font-weight: 600;
            padding: 6px 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.15s;
        }

        .btn-mark-item-read:hover {
            background: #eff6ff;
        }

        .btn-dismiss-item {
            background: none;
            border: none;
            color: #94a3b8;
            font-size: 18px;
            cursor: pointer;
            padding: 4px;
            line-height: 1;
            transition: color 0.15s;
        }

        .btn-dismiss-item:hover {
            color: #ef4444;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Top Row Matching Screenshot 9 -->
    <div class="notif-top-row">
        <div>
            <h1 class="notif-page-title">Notifications</h1>
            <p class="notif-page-sub">
                <asp:Literal ID="litUnreadSummary" runat="server" Text="2 unread notifications"></asp:Literal>
            </p>
        </div>

        <asp:Button ID="btnMarkAllRead" runat="server" Text="Mark all as read" CssClass="btn-mark-all-read" OnClick="btnMarkAllRead_Click" />
    </div>

    <!-- 3 Counters Matching Screenshot 9 -->
    <div class="notif-counts-grid">
        <div class="count-card">
            <div class="count-num"><asp:Literal ID="litTotalCount" runat="server" Text="4"></asp:Literal></div>
            <div class="count-label">Total</div>
        </div>
        <div class="count-card">
            <div class="count-num" style="color: #ef4444;"><asp:Literal ID="litUnreadCount" runat="server" Text="2"></asp:Literal></div>
            <div class="count-label">Unread</div>
        </div>
        <div class="count-card">
            <div class="count-num" style="color: #10b981;"><asp:Literal ID="litReadCount" runat="server" Text="2"></asp:Literal></div>
            <div class="count-label">Read</div>
        </div>
    </div>

    <!-- Notification Cards Feed Matching Screenshot 9 -->
    <div class="notif-cards-feed">
        <!-- Item 1 -->
        <asp:Panel ID="pnlItem1" runat="server" CssClass="notif-card-row">
            <div class="notif-card-left">
                <div class="notif-badge-circle badge-green">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </div>
                <div class="notif-text-info">
                    <div class="notif-main-text">Your eligibility check is complete. 4 schemes found.</div>
                    <div class="notif-sub-time">2 hours ago</div>
                </div>
            </div>
            <div class="notif-card-actions">
                <asp:Button ID="btnMark1" runat="server" Text="Mark read" CssClass="btn-mark-item-read" OnClick="btnMarkItem_Click" CommandArgument="1" />
                <asp:LinkButton ID="btnDismiss1" runat="server" CssClass="btn-dismiss-item" OnClick="btnDismissItem_Click" CommandArgument="1">&times;</asp:LinkButton>
            </div>
        </asp:Panel>

        <!-- Item 2 -->
        <asp:Panel ID="pnlItem2" runat="server" CssClass="notif-card-row">
            <div class="notif-card-left">
                <div class="notif-badge-circle badge-blue">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                </div>
                <div class="notif-text-info">
                    <div class="notif-main-text">PM Kisan next installment due in 15 days.</div>
                    <div class="notif-sub-time">1 day ago</div>
                </div>
            </div>
            <div class="notif-card-actions">
                <asp:Button ID="btnMark2" runat="server" Text="Mark read" CssClass="btn-mark-item-read" OnClick="btnMarkItem_Click" CommandArgument="2" />
                <asp:LinkButton ID="btnDismiss2" runat="server" CssClass="btn-dismiss-item" OnClick="btnDismissItem_Click" CommandArgument="2">&times;</asp:LinkButton>
            </div>
        </asp:Panel>

        <!-- Item 3 -->
        <asp:Panel ID="pnlItem3" runat="server" CssClass="notif-card-row">
            <div class="notif-card-left">
                <div class="notif-badge-circle badge-green">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                </div>
                <div class="notif-text-info">
                    <div class="notif-main-text">New scheme added: PM SVANidhi. Check eligibility.</div>
                    <div class="notif-sub-time">3 days ago</div>
                </div>
            </div>
            <div class="notif-card-actions">
                <asp:LinkButton ID="btnDismiss3" runat="server" CssClass="btn-dismiss-item" OnClick="btnDismissItem_Click" CommandArgument="3">&times;</asp:LinkButton>
            </div>
        </asp:Panel>

        <!-- Item 4 -->
        <asp:Panel ID="pnlItem4" runat="server" CssClass="notif-card-row">
            <div class="notif-card-left">
                <div class="notif-badge-circle badge-yellow">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                </div>
                <div class="notif-text-info">
                    <div class="notif-main-text">Profile updated successfully.</div>
                    <div class="notif-sub-time">1 week ago</div>
                </div>
            </div>
            <div class="notif-card-actions">
                <asp:LinkButton ID="btnDismiss4" runat="server" CssClass="btn-dismiss-item" OnClick="btnDismissItem_Click" CommandArgument="4">&times;</asp:LinkButton>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
