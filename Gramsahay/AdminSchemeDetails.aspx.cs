using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;

namespace Gramsahay
{
    public partial class AdminSchemeDetails : Page
    {
        protected Literal litBreadcrumbName;
        protected Literal litCategoryBadge;
        protected Literal litSchemeName;
        protected Literal litMinistry;
        protected Literal litSchemeCode;
        protected Literal litBenefitAmount;
        protected Literal litMaxIncome;
        protected Literal litAgeRange;
        protected Literal litBeneficiaryCount;
        protected Literal litDescription;
        protected Literal litMinistryFull;
        protected Literal litOccupations;
        protected Literal litMinAge;
        protected Literal litMaxAge;
        protected Literal litIncomeCeiling;
        protected Repeater rptDocuments;
        protected Repeater rptRecentApplicants;
        protected DropDownList ddlSchemeStatus;
        protected TextBox txtAdminRemarks;
        protected Panel pnlStatusSuccess;
        protected HyperLink lnkEditScheme;

        private int SchemeId
        {
            get
            {
                if (int.TryParse(Request.QueryString["id"], out int id))
                    return id;
                return 1;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                string id = Request.QueryString["id"] ?? "1";
                Response.Redirect("Login.aspx?returnUrl=AdminSchemeDetails.aspx%3Fid%3D" + id);
                return;
            }

            if (!IsPostBack)
            {
                LoadSchemeDetails();
            }
        }

        private void LoadSchemeDetails()
        {
            var scheme = DataStore.Schemes.FirstOrDefault(s => s.Id == SchemeId) ?? DataStore.Schemes[0];

            if (litBreadcrumbName != null) litBreadcrumbName.Text = scheme.Name;
            if (litSchemeName != null) litSchemeName.Text = scheme.Name;
            if (litMinistry != null) litMinistry.Text = scheme.Ministry;
            if (litMinistryFull != null) litMinistryFull.Text = scheme.Ministry;
            if (litSchemeCode != null) litSchemeCode.Text = $"#SCH-00{scheme.Id}";

            if (litCategoryBadge != null)
            {
                litCategoryBadge.Text = $"<span class='scheme-cat-badge {scheme.CategoryCssClass}'>{scheme.Category}</span>";
            }

            if (litBenefitAmount != null) litBenefitAmount.Text = scheme.Benefit;
            if (litMaxIncome != null) litMaxIncome.Text = $"&#8377;{scheme.MaxIncome:N0}";
            if (litIncomeCeiling != null) litIncomeCeiling.Text = $"&#8377;{scheme.MaxIncome:N0} per annum";
            if (litAgeRange != null) litAgeRange.Text = $"{scheme.MinAge}&ndash;{scheme.MaxAge} Years";
            if (litMinAge != null) litMinAge.Text = $"{scheme.MinAge} Years";
            if (litMaxAge != null) litMaxAge.Text = $"{scheme.MaxAge} Years";
            if (litBeneficiaryCount != null) litBeneficiaryCount.Text = $"{scheme.AccessCount:N0}";
            if (litDescription != null) litDescription.Text = scheme.Description;
            if (litOccupations != null) litOccupations.Text = scheme.EligibleOccupations;

            if (lnkEditScheme != null)
            {
                lnkEditScheme.NavigateUrl = $"AdminAddScheme.aspx?edit={scheme.Id}";
            }

            // Documents
            if (rptDocuments != null)
            {
                rptDocuments.DataSource = scheme.RequiredDocuments;
                rptDocuments.DataBind();
            }

            // Recent Applicants from DataStore.Users
            if (rptRecentApplicants != null)
            {
                var sampleUsers = DataStore.Users.Take(3).ToList();
                rptRecentApplicants.DataSource = sampleUsers;
                rptRecentApplicants.DataBind();
            }
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            if (pnlStatusSuccess != null)
            {
                pnlStatusSuccess.Visible = true;
            }
        }
    }
}
