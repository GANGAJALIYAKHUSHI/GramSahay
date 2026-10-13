using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;
using System.Linq;

namespace Gramsahay
{
    public partial class AdminSchemes : Page
    {
        protected TextBox txtSchemeSearch;
        protected Repeater rptSchemes;
        protected Literal litShowingCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx?returnUrl=AdminSchemes.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindSchemes();
            }
        }

        private void BindSchemes()
        {
            if (rptSchemes == null) return;
            string search = txtSchemeSearch != null ? txtSchemeSearch.Text.Trim().ToLower() : "";
            var list = DataStore.Schemes;
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(s =>
                    s.Name.ToLower().Contains(search) ||
                    s.Ministry.ToLower().Contains(search) ||
                    s.Category.ToLower().Contains(search)
                ).ToList();
            }

            rptSchemes.DataSource = list;
            rptSchemes.DataBind();
            if (litShowingCount != null) litShowingCount.Text = list.Count.ToString();
        }

        protected void txtSchemeSearch_TextChanged(object sender, EventArgs e)
        {
            BindSchemes();
        }

        protected void btnDeleteScheme_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int schemeId = int.Parse(btn.CommandArgument);
            var scheme = DataStore.Schemes.FirstOrDefault(s => s.Id == schemeId);
            if (scheme != null)
            {
                DataStore.Schemes.Remove(scheme);
            }
            BindSchemes();
        }
    }
}
