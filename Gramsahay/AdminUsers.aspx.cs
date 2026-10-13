using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gramsahay.Models;
using System.Linq;

namespace Gramsahay
{
    public partial class AdminUsers : Page
    {
        protected TextBox txtUserSearch;
        protected Repeater rptUsers;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx?returnUrl=AdminUsers.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            if (rptUsers == null) return;
            string search = txtUserSearch != null ? txtUserSearch.Text.Trim().ToLower() : "";
            if (string.IsNullOrEmpty(search))
            {
                rptUsers.DataSource = DataStore.Users;
            }
            else
            {
                rptUsers.DataSource = DataStore.Users.Where(u =>
                    u.FullName.ToLower().Contains(search) ||
                    u.Email.ToLower().Contains(search) ||
                    u.State.ToLower().Contains(search)
                ).ToList();
            }
            rptUsers.DataBind();
        }

        protected void txtUserSearch_TextChanged(object sender, EventArgs e)
        {
            BindUsers();
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            int userId = int.Parse(btn.CommandArgument);
            var user = DataStore.Users.FirstOrDefault(u => u.Id == userId);
            if (user != null)
            {
                DataStore.Users.Remove(user);
            }
            BindUsers();
        }
    }
}
