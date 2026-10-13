using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;

namespace Gramsahay
{
    public partial class Register : Page
    {
        protected Panel pnlError;
        protected Literal litError;
        protected TextBox txtFullName;
        protected TextBox txtEmail;
        protected TextBox txtMobile;
        protected DropDownList ddlState;
        protected TextBox txtPassword;
        protected TextBox txtConfirmPassword;
        protected CheckBox chkTerms;
        protected Button btnCreateAccount;

        protected RequiredFieldValidator rfvFullName;
        protected RequiredFieldValidator rfvEmail;
        protected RegularExpressionValidator revEmail;
        protected RequiredFieldValidator rfvMobile;
        protected RegularExpressionValidator revMobile;
        protected RequiredFieldValidator rfvPassword;
        protected RequiredFieldValidator rfvConfirmPassword;
        protected CompareValidator cvPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string fullName = txtFullName != null ? txtFullName.Text.Trim() : (Request.Form["txtFullName"] ?? "");
            string email = txtEmail != null ? txtEmail.Text.Trim() : (Request.Form["txtEmail"] ?? "");
            string mobile = txtMobile != null ? txtMobile.Text.Trim() : (Request.Form["txtMobile"] ?? "");
            string state = ddlState != null ? ddlState.SelectedValue : (Request.Form["ddlState"] ?? "Uttar Pradesh");
            string password = txtPassword != null ? txtPassword.Text.Trim() : (Request.Form["txtPassword"] ?? "");

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email))
            {
                if (pnlError != null) pnlError.Visible = true;
                if (litError != null) litError.Text = "Please enter your name and email address.";
                return;
            }

            var newUser = new CitizenUser
            {
                Id = DataStore.Users.Count + 1,
                Initials = fullName.Length >= 2 ? (fullName.Substring(0, 1) + (fullName.Contains(" ") ? fullName.Split(' ')[1].Substring(0, 1) : fullName.Substring(1, 1))).ToUpper() : "RK",
                FullName = fullName,
                Email = email,
                Mobile = string.IsNullOrEmpty(mobile) ? "9876543210" : mobile,
                State = state,
                District = "Lucknow",
                Age = 38,
                Gender = "Male",
                Occupation = "Farmer",
                AnnualIncome = 120000,
                Caste = "OBC",
                RegisteredDate = DateTime.Now.ToString("dd MMM yyyy"),
                EligibleSchemesCount = 4,
                Status = "Active",
                Password = string.IsNullOrEmpty(password) ? "password123" : password,
                ProfileCompletionPercent = 80
            };

            DataStore.Users.Insert(0, newUser);
            DataStore.CurrentUser = newUser;
            Session["User"] = newUser;

            string returnUrl = Request.QueryString["returnUrl"];
            if (!string.IsNullOrEmpty(returnUrl))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
    }
}
