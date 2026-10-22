using System;
using JOB_PORTAL;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace JobPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Please enter email and password.";
                return;
            }

            string query = @"
                SELECT UserId, FullName, Role
                FROM Users
                WHERE Email = @Email
                  AND Password = @Password
                  AND IsActive = 1";

            DataTable dt = DBHelper.GetData(
                query,
                new SqlParameter("@Email", email),
                new SqlParameter("@Password", password));

            if (dt.Rows.Count > 0)
            {
                Session["UserId"] = dt.Rows[0]["UserId"].ToString();
                Session["FullName"] = dt.Rows[0]["FullName"].ToString();
                Session["Role"] = dt.Rows[0]["Role"].ToString();

                Response.Redirect("Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            lblMessage.Text = "Invalid email or password.";
        }
    }
}