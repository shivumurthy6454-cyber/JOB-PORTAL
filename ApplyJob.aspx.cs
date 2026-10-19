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
    public partial class ApplyJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int jobId = Convert.ToInt32(Request.QueryString["JobId"]);
            int userId = Convert.ToInt32(Session["UserId"]);

            string checkQuery = @"SELECT COUNT(*) FROM Applications 
                                  WHERE JobId = @JobId AND UserId = @UserId";

            int alreadyApplied = Convert.ToInt32(DBHelper.ExecuteScalar(checkQuery,
                new SqlParameter("@JobId", jobId),
                new SqlParameter("@UserId", userId)));

            if (alreadyApplied > 0)
            {
                lblMessage.Text = "You have already applied for this job.";
                return;
            }

            string query = @"INSERT INTO Applications 
                             (JobId, UserId, FullName, Email, Phone, CoverLetter)
                             VALUES 
                             (@JobId, @UserId, @FullName, @Email, @Phone, @CoverLetter)";

            int rows = DBHelper.ExecuteNonQuery(query,
                new SqlParameter("@JobId", jobId),
                new SqlParameter("@UserId", userId),
                new SqlParameter("@FullName", txtFullName.Text.Trim()),
                new SqlParameter("@Email", txtEmail.Text.Trim()),
                new SqlParameter("@Phone", txtPhone.Text.Trim()),
                new SqlParameter("@CoverLetter", txtCoverLetter.Text.Trim()));

            if (rows > 0)
            {
                Response.Redirect("Jobs.aspx");
            }
            else
            {
                lblMessage.Text = "Application failed.";
            }
        }
    }
}