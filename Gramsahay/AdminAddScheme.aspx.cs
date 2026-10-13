using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;
using System.Linq;
using System.Collections.Generic;

namespace Gramsahay
{
    public partial class AdminAddScheme : Page
    {
        protected Literal litFormTitle;
        protected Panel pnlSuccess;
        protected TextBox txtName;
        protected TextBox txtMinistry;
        protected TextBox txtCategory;
        protected TextBox txtMaxIncome;
        protected TextBox txtMinAge;
        protected TextBox txtMaxAge;
        protected TextBox txtBenefit;
        protected TextBox txtDescription;
        protected Button btnSaveScheme;

        protected RequiredFieldValidator rfvName;
        protected RequiredFieldValidator rfvMinistry;
        protected RequiredFieldValidator rfvCategory;
        protected RequiredFieldValidator rfvMaxIncome;
        protected RangeValidator rvMaxIncome;
        protected RequiredFieldValidator rfvMinAge;
        protected RangeValidator rvMinAge;
        protected RequiredFieldValidator rfvMaxAge;
        protected RangeValidator rvMaxAge;
        protected RequiredFieldValidator rfvBenefit;
        protected RequiredFieldValidator rfvDescription;

        private int EditId
        {
            get
            {
                if (Request.QueryString["edit"] != null && int.TryParse(Request.QueryString["edit"], out int id))
                    return id;
                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx?returnUrl=AdminAddScheme.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (EditId > 0)
                {
                    if (litFormTitle != null) litFormTitle.Text = "Edit Scheme";
                    if (btnSaveScheme != null) btnSaveScheme.Text = "Update Scheme";

                    var scheme = DataStore.Schemes.FirstOrDefault(s => s.Id == EditId);
                    if (scheme != null)
                    {
                        if (txtName != null) txtName.Text = scheme.Name;
                        if (txtMinistry != null) txtMinistry.Text = scheme.Ministry;
                        if (txtCategory != null) txtCategory.Text = scheme.Category;
                        if (txtMaxIncome != null) txtMaxIncome.Text = scheme.MaxIncome.ToString();
                        if (txtMinAge != null) txtMinAge.Text = scheme.MinAge.ToString();
                        if (txtMaxAge != null) txtMaxAge.Text = scheme.MaxAge.ToString();
                        if (txtBenefit != null) txtBenefit.Text = scheme.Benefit;
                        if (txtDescription != null) txtDescription.Text = scheme.Description;
                    }
                }
            }
        }

        protected void btnSaveScheme_Click(object sender, EventArgs e)
        {
            Page.Validate("SchemeGroup");
            if (!Page.IsValid) return;

            decimal maxIncome = 200000;
            if (txtMaxIncome != null) decimal.TryParse(txtMaxIncome.Text.Trim(), out maxIncome);

            int minAge = 18;
            if (txtMinAge != null) int.TryParse(txtMinAge.Text.Trim(), out minAge);

            int maxAge = 65;
            if (txtMaxAge != null) int.TryParse(txtMaxAge.Text.Trim(), out maxAge);

            string category = txtCategory != null ? txtCategory.Text.Trim() : "Agriculture";
            string cssClass = "badge-agri";
            if (category.ToLower().Contains("housing")) cssClass = "badge-housing";
            else if (category.ToLower().Contains("health")) cssClass = "badge-health";
            else if (category.ToLower().Contains("energy")) cssClass = "badge-energy";
            else if (category.ToLower().Contains("edu")) cssClass = "badge-edu";
            else if (category.ToLower().Contains("emp")) cssClass = "badge-emp";

            string name = txtName != null ? txtName.Text.Trim() : "";
            string ministry = txtMinistry != null ? txtMinistry.Text.Trim() : "";
            string benefit = txtBenefit != null ? txtBenefit.Text.Trim() : "";
            string desc = txtDescription != null ? txtDescription.Text.Trim() : "";

            if (EditId > 0)
            {
                var scheme = DataStore.Schemes.FirstOrDefault(s => s.Id == EditId);
                if (scheme != null)
                {
                    scheme.Name = name;
                    scheme.Ministry = ministry;
                    scheme.Category = category;
                    scheme.CategoryCssClass = cssClass;
                    scheme.MaxIncome = maxIncome;
                    scheme.MinAge = minAge;
                    scheme.MaxAge = maxAge;
                    scheme.Benefit = benefit;
                    scheme.Description = desc;
                }
            }
            else
            {
                var newScheme = new Scheme
                {
                    Id = DataStore.Schemes.Count + 1,
                    Name = name,
                    Ministry = ministry,
                    Category = category,
                    CategoryCssClass = cssClass,
                    MaxIncome = maxIncome,
                    MinAge = minAge,
                    MaxAge = maxAge,
                    Benefit = benefit,
                    Description = desc,
                    EligibleOccupations = "All eligible rural citizens",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Bank Passbook" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 100,
                    ImageUrl = "Images/schemes/agriculture.jpg"
                };
                DataStore.Schemes.Add(newScheme);
            }

            Response.Redirect("AdminSchemes.aspx");
        }
    }
}
