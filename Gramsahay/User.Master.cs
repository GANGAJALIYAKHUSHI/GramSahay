using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Gramsahay
{
    public partial class UserMaster : MasterPage
    {
        protected HtmlGenericControl menuDashboard;
        protected HtmlGenericControl menuNotifications;
        protected HtmlGenericControl menuProfile;
        protected HtmlGenericControl menuEligibility;
        protected HtmlGenericControl menuSchemes;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                string rawUrl = Request.RawUrl ?? "";
                if (rawUrl.StartsWith("/")) rawUrl = rawUrl.TrimStart('/');
                Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(rawUrl));
                return;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HighlightCurrentMenu();
        }

        private void HighlightCurrentMenu()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath).ToLower();
            if (menuDashboard != null) menuDashboard.Attributes["class"] = "portal-menu-item";
            if (menuNotifications != null) menuNotifications.Attributes["class"] = "portal-menu-item";
            if (menuProfile != null) menuProfile.Attributes["class"] = "portal-menu-item";
            if (menuEligibility != null) menuEligibility.Attributes["class"] = "portal-menu-item";
            if (menuSchemes != null) menuSchemes.Attributes["class"] = "portal-menu-item";

            if (currentPage == "dashboard.aspx" && menuDashboard != null)
                menuDashboard.Attributes["class"] = "portal-menu-item active";
            else if (currentPage == "notifications.aspx" && menuNotifications != null)
                menuNotifications.Attributes["class"] = "portal-menu-item active";
            else if (currentPage == "profile.aspx" && menuProfile != null)
                menuProfile.Attributes["class"] = "portal-menu-item active";
            else if (currentPage == "checkeligibility.aspx" && menuEligibility != null)
                menuEligibility.Attributes["class"] = "portal-menu-item active";
            else if ((currentPage == "eligibleschemes.aspx" || currentPage == "schemedetails.aspx") && menuSchemes != null)
                menuSchemes.Attributes["class"] = "portal-menu-item active";
        }
    }
}
