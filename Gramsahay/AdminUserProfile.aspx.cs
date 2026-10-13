using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;

namespace Gramsahay
{
    public partial class AdminUserProfile : Page
    {
        protected Literal litBreadcrumbName;
        protected Literal litAvatarHtml;
        protected Literal litFullName;
        protected Literal litStatusBadge;
        protected Literal litCitizenCode;
        protected Literal litOccupation;
        protected Literal litLocation;
        protected Literal litRegDate;
        protected Literal litEligibleCount;
        protected Literal litApplicationsCount;
        protected Literal litAnnualIncome;
        protected Literal litProfileCompletion;
        protected Literal litDetailName;
        protected Literal litDetailEmail;
        protected Literal litDetailMobile;
        protected Literal litDetailAgeGender;
        protected Literal litDetailCaste;
        protected Literal litDetailOccupation;
        protected Literal litDetailState;
        protected Literal litDetailDistrict;
        protected Literal litDetailIncome;
        protected Repeater rptEligibleSchemes;
        protected Panel pnlSuccess;
        protected DropDownList ddlUserStatus;
        protected TextBox txtAdminNotes;
        protected Button btnSaveStatus;

        private int UserId
        {
            get
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                    return id;
                return 2; // Default to Sunita Devi (Id = 2) if not specified
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                string id = Request.QueryString["id"] ?? "2";
                Response.Redirect("Login.aspx?returnUrl=AdminUserProfile.aspx%3Fid%3D" + id);
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            var user = DataStore.Users.FirstOrDefault(u => u.Id == UserId);
            if (user == null)
            {
                user = DataStore.Users.FirstOrDefault(u => u.Id == 2) ?? DataStore.Users.FirstOrDefault();
            }

            if (user == null) return;

            litBreadcrumbName.Text = user.FullName;
            litFullName.Text = user.FullName;
            litCitizenCode.Text = $"GS-CIT-2024-{user.Id:D3}";
            litOccupation.Text = user.Occupation;
            litLocation.Text = $"{user.District}, {user.State}";
            litRegDate.Text = user.RegisteredDate;

            // Status Badge
            string statusLower = user.Status.ToLower();
            litStatusBadge.Text = $"<span class=\"status-badge status-{statusLower}\">{user.Status}</span>";

            // Avatar or Initials
            if (!string.IsNullOrEmpty(user.AvatarUrl))
            {
                litAvatarHtml.Text = $"<img src=\"{user.AvatarUrl}\" alt=\"{user.FullName}\" />";
            }
            else
            {
                litAvatarHtml.Text = user.Initials;
            }

            // KPIs
            litEligibleCount.Text = user.EligibleSchemesCount.ToString();
            litApplicationsCount.Text = user.EligibleSchemesCount > 0 ? "2" : "0";
            litAnnualIncome.Text = $"&#8377;{user.AnnualIncome:N0}";
            litProfileCompletion.Text = $"{user.ProfileCompletionPercent}%";

            // Details Grid
            litDetailName.Text = user.FullName;
            litDetailEmail.Text = user.Email;
            litDetailMobile.Text = $"+91 {user.Mobile}";
            litDetailAgeGender.Text = $"{user.Age} Years &bull; {user.Gender}";
            litDetailCaste.Text = user.Caste;
            litDetailOccupation.Text = user.Occupation;
            litDetailState.Text = user.State;
            litDetailDistrict.Text = user.District;
            litDetailIncome.Text = $"&#8377;{user.AnnualIncome:N0} / year";

            // Dropdown Status
            if (ddlUserStatus.Items.FindByValue(user.Status) != null)
            {
                ddlUserStatus.SelectedValue = user.Status;
            }

            // Schemes matched to user
            var schemes = DataStore.Schemes.Take(user.EligibleSchemesCount > 0 ? user.EligibleSchemesCount : 2).ToList();
            rptEligibleSchemes.DataSource = schemes;
            rptEligibleSchemes.DataBind();
        }

        protected void btnSaveStatus_Click(object sender, EventArgs e)
        {
            var user = DataStore.Users.FirstOrDefault(u => u.Id == UserId);
            if (user != null)
            {
                user.Status = ddlUserStatus.SelectedValue;
                pnlSuccess.Visible = true;
                LoadUserProfile();
            }
        }
    }
}
