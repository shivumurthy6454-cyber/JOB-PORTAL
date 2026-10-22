using System;
using JOB_PORTAL;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace JOB_PORTAL
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Write(
                    "UserId: " + (Session["UserId"] ?? "NULL") +
                    "<br/>Role: " + (Session["Role"] ?? "NULL")
                );
            }


            // Check login session
            if (Session["UserId"] == null ||
                Session["FullName"] == null ||
                Session["Role"] == null)
            {
                Response.Redirect("Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // Display the logged-in user's name
            lblUser.Text = Server.HtmlEncode(
                Convert.ToString(Session["FullName"]));

            // Check user role
            string role = Convert.ToString(Session["Role"]);

            bool isRecruiter = string.Equals(
                role,
                "Recruiter",
                StringComparison.OrdinalIgnoreCase);

            // Show recruiter controls only to recruiters
            pnlRecruiterPost.Visible = isRecruiter;
            pnlRecruiterApplications.Visible = isRecruiter;

            navPostJob.Visible = isRecruiter;
            navApplications.Visible = isRecruiter;

            // Load database statistics once per initial page load
            if (!IsPostBack)
            {
                LoadCounts();
            }
        }

        private void LoadCounts()
        {
            lblTotalJobs.Text = Convert.ToString(
                DBHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Jobs WHERE IsActive = 1"));

            lblTotalApplications.Text = Convert.ToString(
                DBHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Applications"));

            lblTotalUsers.Text = Convert.ToString(
                DBHelper.ExecuteScalar(
                    "SELECT COUNT(*) FROM Users WHERE IsActive = 1"));
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
