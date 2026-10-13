using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gramsahay
{
    public partial class Notifications : Page
    {
        protected Literal litUnreadSummary;
        protected Literal litTotalCount;
        protected Literal litUnreadCount;
        protected Literal litReadCount;
        protected Button btnMarkAllRead;
        protected Panel pnlItem1;
        protected Panel pnlItem2;
        protected Panel pnlItem3;
        protected Panel pnlItem4;
        protected Button btnMark1;
        protected Button btnMark2;
        protected LinkButton btnDismiss1;
        protected LinkButton btnDismiss2;
        protected LinkButton btnDismiss3;
        protected LinkButton btnDismiss4;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Notifications.aspx");
                return;
            }
        }

        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            if (litUnreadSummary != null) litUnreadSummary.Text = "0 unread notifications";
            if (litUnreadCount != null) litUnreadCount.Text = "0";
            if (litReadCount != null) litReadCount.Text = "4";
            if (btnMark1 != null) btnMark1.Visible = false;
            if (btnMark2 != null) btnMark2.Visible = false;
        }

        protected void btnMarkItem_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            btn.Visible = false;
            if (litUnreadCount != null && int.TryParse(litUnreadCount.Text, out int unread) && unread > 0)
            {
                unread--;
                litUnreadCount.Text = unread.ToString();
                if (litReadCount != null && int.TryParse(litReadCount.Text, out int read))
                {
                    litReadCount.Text = (read + 1).ToString();
                }
                if (litUnreadSummary != null) litUnreadSummary.Text = $"{unread} unread notifications";
            }
        }

        protected void btnDismissItem_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string arg = btn.CommandArgument;
            if (arg == "1" && pnlItem1 != null) pnlItem1.Visible = false;
            else if (arg == "2" && pnlItem2 != null) pnlItem2.Visible = false;
            else if (arg == "3" && pnlItem3 != null) pnlItem3.Visible = false;
            else if (arg == "4" && pnlItem4 != null) pnlItem4.Visible = false;

            if (litTotalCount != null && int.TryParse(litTotalCount.Text, out int total) && total > 0)
            {
                total--;
                litTotalCount.Text = total.ToString();
            }
        }
    }
}
