using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Gramsahay
{
    public partial class AdminMaster : MasterPage
    {
        protected HtmlGenericControl menuAdminDashboard;
        protected HtmlGenericControl menuAdminUsers;
        protected HtmlGenericControl menuAdminReports;
        protected HtmlGenericControl menuAdminSchemes;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
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
            if (menuAdminDashboard != null) menuAdminDashboard.Attributes["class"] = "admin-menu-item";
            if (menuAdminUsers != null) menuAdminUsers.Attributes["class"] = "admin-menu-item";
            if (menuAdminReports != null) menuAdminReports.Attributes["class"] = "admin-menu-item";
            if (menuAdminSchemes != null) menuAdminSchemes.Attributes["class"] = "admin-menu-item";

            if (currentPage == "admindashboard.aspx" && menuAdminDashboard != null)
                menuAdminDashboard.Attributes["class"] = "admin-menu-item active";
            else if ((currentPage == "adminusers.aspx" || currentPage == "adminuserprofile.aspx") && menuAdminUsers != null)
                menuAdminUsers.Attributes["class"] = "admin-menu-item active";
            else if (currentPage == "adminreports.aspx" && menuAdminReports != null)
                menuAdminReports.Attributes["class"] = "admin-menu-item active";
            else if ((currentPage == "adminschemes.aspx" || currentPage == "adminaddscheme.aspx" || currentPage == "adminschemedetails.aspx") && menuAdminSchemes != null)
                menuAdminSchemes.Attributes["class"] = "admin-menu-item active";
        }
    }
}
