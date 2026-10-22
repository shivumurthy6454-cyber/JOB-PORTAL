    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Data;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

namespace JOB_PORTAL
{
    public partial class ApplyJob : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadJobs();

                string jobIdText = Request.QueryString["JobId"];
                int jobId;

                if (int.TryParse(jobIdText, out jobId))
                {
                    System.Web.UI.WebControls.ListItem item =
                        ddlJob.Items.FindByValue(jobId.ToString());

                    if (item != null)
                    {
                        ddlJob.ClearSelection();
                        item.Selected = true;
                    }
                }
            }
        }

        private void LoadJobs()
        {
            string query = @"
                SELECT JobId,
                       JobTitle + ' - ' +
                       COALESCE(Location, 'Location not specified') AS DisplayTitle
                FROM Jobs
                WHERE IsActive = 1
                ORDER BY PostedOn DESC";

            DataTable dt = DBHelper.GetData(query);

            ddlJob.DataSource = dt;
            ddlJob.DataTextField = "DisplayTitle";
            ddlJob.DataValueField = "JobId";
            ddlJob.DataBind();

            ddlJob.Items.Insert(
                0,
                new System.Web.UI.WebControls.ListItem(
                    "-- Select a job --", ""));
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            int jobId;
            int userId;

            if (ddlJob.SelectedValue == "" ||
                !int.TryParse(ddlJob.SelectedValue, out jobId))
            {
                lblMessage.Text = "Please select a job.";
                return;
            }

            if (!int.TryParse(
                Convert.ToString(Session["UserId"]), out userId))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMessage.Text =
                    "Please enter your full name, email, and phone number.";
                return;
            }

            // Confirm that the selected job is still active.
            string activeJobQuery = @"
                SELECT COUNT(*)
                FROM Jobs
                WHERE JobId = @JobId AND IsActive = 1";

            int activeJob = Convert.ToInt32(
                DBHelper.ExecuteScalar(
                    activeJobQuery,
                    new SqlParameter("@JobId", jobId)));

            if (activeJob == 0)
            {
                lblMessage.Text =
                    "This job is no longer available. Please select another job.";
                LoadJobs();
                return;
            }

            // Prevent duplicate applications by the same user.
            string checkQuery = @"
                SELECT COUNT(*)
                FROM Applications
                WHERE JobId = @JobId AND UserId = @UserId";

            int alreadyApplied = Convert.ToInt32(
                DBHelper.ExecuteScalar(
                    checkQuery,
                    new SqlParameter("@JobId", jobId),
                    new SqlParameter("@UserId", userId)));

            if (alreadyApplied > 0)
            {
                lblMessage.Text =
                    "You have already applied for this job.";
                return;
            }

            string insertQuery = @"
                INSERT INTO Applications
                    (JobId, UserId, FullName, Email, Phone, CoverLetter)
                VALUES
                    (@JobId, @UserId, @FullName, @Email, @Phone, @CoverLetter)";

            int rows = DBHelper.ExecuteNonQuery(
                insertQuery,
                new SqlParameter("@JobId", jobId),
                new SqlParameter("@UserId", userId),
                new SqlParameter("@FullName", txtFullName.Text.Trim()),
                new SqlParameter("@Email", txtEmail.Text.Trim()),
                new SqlParameter("@Phone", txtPhone.Text.Trim()),
                new SqlParameter("@CoverLetter",
                    string.IsNullOrWhiteSpace(txtCoverLetter.Text)
                        ? (object)DBNull.Value
                        : txtCoverLetter.Text.Trim()));

            if (rows > 0)
            {
                Response.Redirect("Jobs.aspx");
            }
            else
            {
                lblMessage.Text =
                    "Your application could not be submitted. Please try again.";
            }
        }
    }
}
