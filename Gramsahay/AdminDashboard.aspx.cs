using System;
using System.Web.UI;

namespace Gramsahay
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx?returnUrl=AdminDashboard.aspx");
                return;
            }
        }
    }
}
