using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Gramsahay.Models;
using System.Linq;

namespace Gramsahay
{
    public partial class SchemeDetails : Page
    {
        protected HtmlGenericControl badgeCategory;
        protected Literal litSchemeName;
        protected Literal litMinistry;
        protected Literal litDescription;
        protected Literal litBenefit;
        protected Literal litMinAge;
        protected Literal litMaxAge;
        protected Literal litMaxIncome;
        protected Literal litOccupations;
        protected Button btnApplyOnline;
        protected Panel pnlApplySuccess;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                string id = Request.QueryString["id"] ?? "1";
                Response.Redirect("Login.aspx?returnUrl=SchemeDetails.aspx%3Fid%3D" + id);
                return;
            }

            if (!IsPostBack)
            {
                int schemeId = 1;
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int.TryParse(Request.QueryString["id"], out schemeId);
                }

                var scheme = DataStore.Schemes.FirstOrDefault(s => s.Id == schemeId) ?? DataStore.Schemes[0];
                if (litSchemeName != null) litSchemeName.Text = scheme.Name;
                if (litMinistry != null) litMinistry.Text = scheme.Ministry;
                if (litDescription != null) litDescription.Text = scheme.Description;
                if (litBenefit != null) litBenefit.Text = scheme.Benefit;
                if (litMinAge != null) litMinAge.Text = $"{scheme.MinAge} years";
                if (litMaxAge != null) litMaxAge.Text = $"{scheme.MaxAge} years";
                if (litMaxIncome != null) litMaxIncome.Text = $"&#8377;{scheme.MaxIncome:N0}";
                if (litOccupations != null) litOccupations.Text = scheme.EligibleOccupations;
                if (badgeCategory != null) badgeCategory.InnerText = scheme.Category;
            }
        }

        protected void btnApplyOnline_Click(object sender, EventArgs e)
        {
            if (pnlApplySuccess != null) pnlApplySuccess.Visible = true;
        }
    }
}
