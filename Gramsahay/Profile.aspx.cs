using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Gramsahay.Models;

namespace Gramsahay
{
    public partial class Profile : Page
    {
        // Hero controls
        protected Literal litAvatarInitials;
        protected Literal litHeroName;
        protected Literal litHeroEmail;
        protected Panel pnlProfileSuccess;

        // Details card
        protected Literal litCompletionPercent;
        protected HtmlGenericControl barCompletion;
        protected Literal litFullName;
        protected Literal litEmail;
        protected Literal litMobile;
        protected Literal litAge;
        protected Literal litGender;
        protected Literal litState;
        protected Literal litDistrict;
        protected Literal litOccupation;
        protected Literal litAnnualIncome;
        protected Literal litCaste;

        // Password controls
        protected Panel pnlPassSuccess;
        protected TextBox txtCurrentPass;
        protected TextBox txtNewPass;
        protected TextBox txtConfirmPass;
        protected Button btnUpdatePass;
        protected RequiredFieldValidator rfvCurrentPass;
        protected RequiredFieldValidator rfvNewPass;
        protected RequiredFieldValidator rfvConfirmPass;
        protected CompareValidator cvPass;

        // Modal controls
        protected TextBox txtEditFullName;
        protected RequiredFieldValidator rfvEditFullName;
        protected TextBox txtEditMobile;
        protected RequiredFieldValidator rfvEditMobile;
        protected RegularExpressionValidator revEditMobile;
        protected TextBox txtEditAge;
        protected RequiredFieldValidator rfvEditAge;
        protected RangeValidator rvEditAge;
        protected DropDownList ddlEditGender;
        protected TextBox txtEditState;
        protected RequiredFieldValidator rfvEditState;
        protected TextBox txtEditDistrict;
        protected RequiredFieldValidator rfvEditDistrict;
        protected DropDownList ddlEditOccupation;
        protected TextBox txtEditIncome;
        protected RequiredFieldValidator rfvEditIncome;
        protected DropDownList ddlEditCaste;
        protected Button btnSaveProfile;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Profile.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            var user = Session["User"] as CitizenUser ?? DataStore.CurrentUser;
            if (user == null) return;

            string initials = !string.IsNullOrEmpty(user.Initials) ? user.Initials : "RK";
            if (litAvatarInitials != null) litAvatarInitials.Text = initials;
            if (litHeroName != null) litHeroName.Text = user.FullName;
            if (litHeroEmail != null) litHeroEmail.Text = user.Email;

            if (litFullName != null) litFullName.Text = user.FullName;
            if (litEmail != null) litEmail.Text = user.Email;
            if (litMobile != null) litMobile.Text = user.Mobile;
            if (litAge != null) litAge.Text = user.Age.ToString();
            if (litGender != null) litGender.Text = user.Gender;
            if (litState != null) litState.Text = user.State;
            if (litDistrict != null) litDistrict.Text = user.District;
            if (litOccupation != null) litOccupation.Text = user.Occupation;
            if (litAnnualIncome != null) litAnnualIncome.Text = $"&#8377;{user.AnnualIncome:N0}";
            if (litCaste != null) litCaste.Text = user.Caste;

            int percent = user.ProfileCompletionPercent > 0 ? user.ProfileCompletionPercent : 80;
            if (litCompletionPercent != null) litCompletionPercent.Text = $"{percent}%";
            if (barCompletion != null) barCompletion.Style["width"] = $"{percent}%";

            // Fill edit form
            if (txtEditFullName != null) txtEditFullName.Text = user.FullName;
            if (txtEditMobile != null) txtEditMobile.Text = user.Mobile;
            if (txtEditAge != null) txtEditAge.Text = user.Age > 0 ? user.Age.ToString() : "38";
            if (ddlEditGender != null && ddlEditGender.Items.FindByValue(user.Gender) != null)
                ddlEditGender.SelectedValue = user.Gender;
            if (txtEditState != null) txtEditState.Text = user.State;
            if (txtEditDistrict != null) txtEditDistrict.Text = user.District;
            if (ddlEditOccupation != null && ddlEditOccupation.Items.FindByValue(user.Occupation) != null)
                ddlEditOccupation.SelectedValue = user.Occupation;
            if (txtEditIncome != null) txtEditIncome.Text = user.AnnualIncome.ToString("0");
            if (ddlEditCaste != null && ddlEditCaste.Items.FindByValue(user.Caste) != null)
                ddlEditCaste.SelectedValue = user.Caste;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            Page.Validate("EditProfileGroup");
            if (!Page.IsValid)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ReopenModal", "openEditProfileModal();", true);
                return;
            }

            var user = Session["User"] as CitizenUser ?? DataStore.CurrentUser;
            if (user != null)
            {
                user.FullName = txtEditFullName.Text.Trim();
                if (!string.IsNullOrEmpty(user.FullName))
                {
                    var parts = user.FullName.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                    user.Initials = parts.Length > 1 
                        ? $"{parts[0][0]}{parts[1][0]}".ToUpper() 
                        : $"{user.FullName[0]}".ToUpper();
                }

                user.Mobile = txtEditMobile.Text.Trim();
                if (int.TryParse(txtEditAge.Text.Trim(), out int age)) user.Age = age;
                user.Gender = ddlEditGender.SelectedValue;
                user.State = txtEditState.Text.Trim();
                user.District = txtEditDistrict.Text.Trim();
                user.Occupation = ddlEditOccupation.SelectedValue;
                if (decimal.TryParse(txtEditIncome.Text.Trim(), out decimal inc)) user.AnnualIncome = inc;
                user.Caste = ddlEditCaste.SelectedValue;
                user.ProfileCompletionPercent = 100;

                // Sync current user and session
                DataStore.CurrentUser = user;
                Session["User"] = user;

                LoadProfileData();

                if (pnlProfileSuccess != null) pnlProfileSuccess.Visible = true;
            }
        }

        protected void btnUpdatePass_Click(object sender, EventArgs e)
        {
            Page.Validate("PassGroup");
            if (Page.IsValid)
            {
                if (pnlPassSuccess != null) pnlPassSuccess.Visible = true;
            }
        }
    }
}
