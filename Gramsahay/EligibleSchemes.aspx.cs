using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gramsahay
{
    public partial class EligibleSchemes : Page
    {
        protected Panel pnlApplySuccess;
        protected LinkButton btnCloseToast;
        protected TextBox txtSearch;
        protected DropDownList ddlCategory;
        protected Panel card1;
        protected Panel card2;
        protected Panel card3;
        protected Panel card4;
        protected Panel card5;
        protected Panel card6;
        protected LinkButton btnBookmark1;
        protected LinkButton btnBookmark2;
        protected LinkButton btnBookmark3;
        protected LinkButton btnBookmark4;
        protected LinkButton btnBookmark5;
        protected LinkButton btnBookmark6;
        protected Button btnApply1;
        protected Button btnApply2;
        protected Button btnApply3;
        protected Button btnApply4;
        protected Button btnApply5;
        protected Button btnApply6;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=EligibleSchemes.aspx");
                return;
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FilterSchemes();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterSchemes();
        }

        private void FilterSchemes()
        {
            string search = txtSearch != null ? txtSearch.Text.Trim().ToLower() : "";
            string category = ddlCategory != null ? ddlCategory.SelectedValue : "All";

            if (card1 != null) card1.Visible = (category == "All" || category == "Agriculture") && (string.IsNullOrEmpty(search) || "pm kisan samman nidhi agriculture".Contains(search));
            if (card2 != null) card2.Visible = (category == "All" || category == "Housing") && (string.IsNullOrEmpty(search) || "pradhan mantri awas yojana gramin housing".Contains(search));
            if (card3 != null) card3.Visible = (category == "All" || category == "Health") && (string.IsNullOrEmpty(search) || "ayushman bharat pmjay health".Contains(search));
            if (card4 != null) card4.Visible = (category == "All" || category == "Energy") && (string.IsNullOrEmpty(search) || "pradhan mantri ujjwala yojana energy".Contains(search));
            if (card5 != null) card5.Visible = (category == "All" || category == "Education") && (string.IsNullOrEmpty(search) || "national scholarship portal education".Contains(search));
            if (card6 != null) card6.Visible = (category == "All" || category == "Employment") && (string.IsNullOrEmpty(search) || "pm svanidhi street vendor loan employment".Contains(search));
        }

        protected void btnToggleBookmark_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            if (btn.CssClass.Contains("saved"))
            {
                btn.CssClass = "scheme-bookmark-btn";
            }
            else
            {
                btn.CssClass = "scheme-bookmark-btn saved";
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (pnlApplySuccess != null) pnlApplySuccess.Visible = true;
        }

        protected void btnCloseToast_Click(object sender, EventArgs e)
        {
            if (pnlApplySuccess != null) pnlApplySuccess.Visible = false;
        }
    }
}
