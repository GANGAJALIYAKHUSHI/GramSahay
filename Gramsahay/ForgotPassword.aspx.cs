using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Gramsahay
{
    public partial class ForgotPassword : Page
    {
        protected HtmlGenericControl stepItem1;
        protected HtmlGenericControl stepItem2;
        protected HtmlGenericControl stepItem3;
        protected Literal litHeaderSub;
        protected Literal litStep1Bubble;
        protected Literal litStep2Bubble;
        protected Literal litStep3Bubble;
        protected Literal litTargetEmail;
        protected MultiView mvForgot;
        protected View viewEmail;
        protected View viewOTP;
        protected View viewNewPassword;
        protected View viewSuccess;
        protected TextBox txtForgotEmail;
        protected Button btnSendOTP;
        protected TextBox otp1;
        protected TextBox otp2;
        protected TextBox otp3;
        protected TextBox otp4;
        protected TextBox otp5;
        protected TextBox otp6;
        protected Button btnVerifyOTP;
        protected LinkButton btnResendOTP;
        protected TextBox txtNewPass;
        protected TextBox txtConfirmPass;
        protected Button btnResetPassword;

        protected RequiredFieldValidator rfvForgotEmail;
        protected RegularExpressionValidator revForgotEmail;
        protected RequiredFieldValidator rfvNewPass;
        protected RequiredFieldValidator rfvConfirmPass;
        protected CompareValidator cvNewPass;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["step"] == "2")
                {
                    ShowStep2();
                }
                else if (Request.QueryString["step"] == "3")
                {
                    ShowStep3();
                }
                else if (Request.QueryString["step"] == "4")
                {
                    ShowStep4();
                }
                else
                {
                    ShowStep1();
                }
            }
        }

        private void ShowStep1()
        {
            if (mvForgot != null) mvForgot.ActiveViewIndex = 0;
            if (litHeaderSub != null) litHeaderSub.Text = "Enter your registered email address";
            if (stepItem1 != null) stepItem1.Attributes["class"] = "step-item active";
            if (stepItem2 != null) stepItem2.Attributes["class"] = "step-item";
            if (stepItem3 != null) stepItem3.Attributes["class"] = "step-item";
            if (litStep1Bubble != null) litStep1Bubble.Text = "1";
            if (litStep2Bubble != null) litStep2Bubble.Text = "2";
            if (litStep3Bubble != null) litStep3Bubble.Text = "3";
        }

        private void ShowStep2()
        {
            if (mvForgot != null) mvForgot.ActiveViewIndex = 1;
            if (litHeaderSub != null) litHeaderSub.Text = "Enter the OTP sent to your email";
            if (stepItem1 != null) stepItem1.Attributes["class"] = "step-item completed";
            if (stepItem2 != null) stepItem2.Attributes["class"] = "step-item active";
            if (stepItem3 != null) stepItem3.Attributes["class"] = "step-item";
            if (litStep1Bubble != null) litStep1Bubble.Text = "✓";
            if (litStep2Bubble != null) litStep2Bubble.Text = "2";
            if (litStep3Bubble != null) litStep3Bubble.Text = "3";
            if (litTargetEmail != null) litTargetEmail.Text = txtForgotEmail != null && !string.IsNullOrEmpty(txtForgotEmail.Text) ? txtForgotEmail.Text.Trim() : "your registered email";
        }

        private void ShowStep3()
        {
            if (mvForgot != null) mvForgot.ActiveViewIndex = 2;
            if (litHeaderSub != null) litHeaderSub.Text = "Set your new password";
            if (stepItem1 != null) stepItem1.Attributes["class"] = "step-item completed";
            if (stepItem2 != null) stepItem2.Attributes["class"] = "step-item completed";
            if (stepItem3 != null) stepItem3.Attributes["class"] = "step-item active";
            if (litStep1Bubble != null) litStep1Bubble.Text = "✓";
            if (litStep2Bubble != null) litStep2Bubble.Text = "✓";
            if (litStep3Bubble != null) litStep3Bubble.Text = "3";
        }

        private void ShowStep4()
        {
            if (mvForgot != null) mvForgot.ActiveViewIndex = 3;
            if (litHeaderSub != null) litHeaderSub.Text = "Password reset successful";
            if (stepItem1 != null) stepItem1.Attributes["class"] = "step-item completed";
            if (stepItem2 != null) stepItem2.Attributes["class"] = "step-item completed";
            if (stepItem3 != null) stepItem3.Attributes["class"] = "step-item completed";
            if (litStep1Bubble != null) litStep1Bubble.Text = "✓";
            if (litStep2Bubble != null) litStep2Bubble.Text = "✓";
            if (litStep3Bubble != null) litStep3Bubble.Text = "✓";
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            Page.Validate("Step1Group");
            if (Page.IsValid)
            {
                ShowStep2();
            }
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            ShowStep3();
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Page.Validate("Step3Group");
            if (Page.IsValid)
            {
                ShowStep4();
            }
        }

        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            if (otp1 != null) otp1.Text = "1";
            if (otp2 != null) otp2.Text = "2";
            if (otp3 != null) otp3.Text = "3";
            if (otp4 != null) otp4.Text = "4";
            if (otp5 != null) otp5.Text = "5";
            if (otp6 != null) otp6.Text = "6";
        }
    }
}
