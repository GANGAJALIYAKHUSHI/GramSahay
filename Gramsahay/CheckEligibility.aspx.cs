using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Gramsahay
{
    public partial class CheckEligibility : Page
    {
        protected HtmlGenericControl step1Indicator;
        protected HtmlGenericControl step2Indicator;
        protected HtmlGenericControl step3Indicator;
        protected HtmlGenericControl line1;
        protected HtmlGenericControl line2;
        protected Literal litBubble1;
        protected Literal litBubble2;
        protected Literal litBubble3;
        protected MultiView mvEligibility;
        protected View viewPersonal;
        protected View viewFinancial;
        protected View viewDocs;
        protected TextBox txtAge;
        protected DropDownList ddlGender;
        protected DropDownList ddlOccupation;
        protected DropDownList ddlState;
        protected DropDownList ddlCaste;
        protected Button btnNextToFinancial;
        protected TextBox txtIncome;
        protected RadioButton rbLandYes;
        protected RadioButton rbLandNo;
        protected RadioButton rbAPL;
        protected RadioButton rbBPL;
        protected RadioButton rbAAY;
        protected RadioButton rbNone;
        protected Button btnBackToPersonal;
        protected Button btnNextToDocs;
        protected CheckBox chkAadhaar;
        protected CheckBox chkPAN;
        protected CheckBox chkVoter;
        protected CheckBox chkRation;
        protected CheckBox chkIncome;
        protected CheckBox chkCaste;
        protected CheckBox chkLand;
        protected CheckBox chkBank;
        protected Button btnBackToFinancial;
        protected Button btnCheckEligibilitySubmit;

        protected RequiredFieldValidator rfvAge;
        protected RangeValidator rvAge;
        protected RequiredFieldValidator rfvIncome;
        protected RangeValidator rvIncome;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=CheckEligibility.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["step"] == "2")
                    ShowStep2();
                else if (Request.QueryString["step"] == "3")
                    ShowStep3();
                else
                    ShowStep1();
            }
        }

        private void ShowStep1()
        {
            if (mvEligibility != null) mvEligibility.ActiveViewIndex = 0;
            if (step1Indicator != null) step1Indicator.Attributes["class"] = "elig-step active";
            if (step2Indicator != null) step2Indicator.Attributes["class"] = "elig-step";
            if (step3Indicator != null) step3Indicator.Attributes["class"] = "elig-step";
            if (line1 != null) line1.Attributes["class"] = "elig-step-line";
            if (line2 != null) line2.Attributes["class"] = "elig-step-line";
            if (litBubble1 != null) litBubble1.Text = "1";
            if (litBubble2 != null) litBubble2.Text = "2";
            if (litBubble3 != null) litBubble3.Text = "3";
        }

        private void ShowStep2()
        {
            if (mvEligibility != null) mvEligibility.ActiveViewIndex = 1;
            if (step1Indicator != null) step1Indicator.Attributes["class"] = "elig-step completed";
            if (step2Indicator != null) step2Indicator.Attributes["class"] = "elig-step active";
            if (step3Indicator != null) step3Indicator.Attributes["class"] = "elig-step";
            if (line1 != null) line1.Attributes["class"] = "elig-step-line active";
            if (line2 != null) line2.Attributes["class"] = "elig-step-line";
            if (litBubble1 != null) litBubble1.Text = "✓";
            if (litBubble2 != null) litBubble2.Text = "2";
            if (litBubble3 != null) litBubble3.Text = "3";
        }

        private void ShowStep3()
        {
            if (mvEligibility != null) mvEligibility.ActiveViewIndex = 2;
            if (step1Indicator != null) step1Indicator.Attributes["class"] = "elig-step completed";
            if (step2Indicator != null) step2Indicator.Attributes["class"] = "elig-step completed";
            if (step3Indicator != null) step3Indicator.Attributes["class"] = "elig-step active";
            if (line1 != null) line1.Attributes["class"] = "elig-step-line active";
            if (line2 != null) line2.Attributes["class"] = "elig-step-line active";
            if (litBubble1 != null) litBubble1.Text = "✓";
            if (litBubble2 != null) litBubble2.Text = "✓";
            if (litBubble3 != null) litBubble3.Text = "3";
        }

        protected void btnNextToFinancial_Click(object sender, EventArgs e)
        {
            Page.Validate("Step1EligGroup");
            if (Page.IsValid)
            {
                ShowStep2();
            }
        }

        protected void btnBackToPersonal_Click(object sender, EventArgs e)
        {
            ShowStep1();
        }

        protected void btnNextToDocs_Click(object sender, EventArgs e)
        {
            Page.Validate("Step2EligGroup");
            if (Page.IsValid)
            {
                ShowStep3();
            }
        }

        protected void btnBackToFinancial_Click(object sender, EventArgs e)
        {
            ShowStep2();
        }

        protected void btnCheckEligibilitySubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EligibleSchemes.aspx");
        }
    }
}
