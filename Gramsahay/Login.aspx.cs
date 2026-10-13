using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;

namespace Gramsahay
{
    public partial class Login : Page
    {
        protected TextBox txtEmail;
        protected TextBox txtPassword;
        protected Button btnLogin;
        protected Panel pnlLoginNotice;
        protected Literal litNoticeText;
        protected RequiredFieldValidator rfvEmail;
        protected RegularExpressionValidator revEmail;
        protected RequiredFieldValidator rfvPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["action"] == "logout")
                {
                    Session.Clear();
                    Session.Abandon();
                }

                string returnUrl = Request.QueryString["returnUrl"];
                if (!string.IsNullOrEmpty(returnUrl) && pnlLoginNotice != null)
                {
                    pnlLoginNotice.Visible = true;
                    if (litNoticeText != null)
                    {
                        string lower = returnUrl.ToLower();
                        if (lower.Contains("eligibleschemes") || lower.Contains("schemedetails"))
                        {
                            litNoticeText.Text = "Please login first to browse and apply for government welfare schemes.";
                        }
                        else if (lower.Contains("checkeligibility"))
                        {
                            litNoticeText.Text = "Please login first to check your scheme eligibility and view personalized welfare benefits.";
                        }
                        else
                        {
                            litNoticeText.Text = "Please login to your citizen account to access this page.";
                        }
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = txtEmail != null ? txtEmail.Text.Trim().ToLower() : (Request.Form["txtEmail"] ?? "");

            if (email.Contains("admin"))
            {
                Session["Role"] = "Admin";
                string returnUrl = Request.QueryString["returnUrl"];
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
            }
            else
            {
                Session["Role"] = "User";
                Session["User"] = DataStore.CurrentUser;

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
}
