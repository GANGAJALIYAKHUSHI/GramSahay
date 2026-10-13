using System;
using System.Web.UI;

namespace Gramsahay
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Dashboard.aspx");
                return;
            }
        }
    }
}
