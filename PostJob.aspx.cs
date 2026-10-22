
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace JOB_PORTAL
{
    public partial class PostJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // STEP 1: Check whether the user is logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // STEP 2: Check whether the user is a Recruiter
            if (Session["Role"] == null ||
                !string.Equals(
                    Session["Role"].ToString().Trim(),
                    "Recruiter",
                    StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // STEP 3: Load categories when the page opens
            if (!IsPostBack)
            {
                try
                {
                    LoadCategories();
                }
                catch (Exception)
                {
                    lblMessage.Text =
                        "Unable to load job categories. Please check your database connection.";
                }
            }
        }

        // Load job categories into the dropdown
        private void LoadCategories()
        {
            DataTable dt = DBHelper.GetData(
                "SELECT CategoryId, CategoryName FROM JobCategories");

            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();

            if (ddlCategory.Items.Count == 0)
            {
                lblMessage.Text =
                    "No job categories found. Please add categories to the database.";
            }
        }

        // Post a new job
        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null ||
                Session["Role"] == null ||
                !string.Equals(
                    Session["Role"].ToString().Trim(),
                    "Recruiter",
                    StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            // Basic validation
            if (string.IsNullOrWhiteSpace(txtJobTitle.Text) ||
                string.IsNullOrWhiteSpace(txtLocation.Text) ||
                string.IsNullOrWhiteSpace(txtDescription.Text) ||
                string.IsNullOrWhiteSpace(txtSalary.Text) ||
                string.IsNullOrWhiteSpace(txtExperience.Text))
            {
                lblMessage.Text = "Please fill in all job details.";
                return;
            }

            if (ddlCategory.Items.Count == 0 ||
                string.IsNullOrEmpty(ddlCategory.SelectedValue))
            {
                lblMessage.Text = "Please select a job category.";
                return;
            }

            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);

                // STEP 1: Find the recruiter's company
                object companyId = DBHelper.ExecuteScalar(
                    @"SELECT CompanyId
                      FROM Companies
                      WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));

                // STEP 2: Create a company if one doesn't exist
                if (companyId == null || companyId == DBNull.Value)
                {
                    int companyRows = DBHelper.ExecuteNonQuery(
                        @"INSERT INTO Companies
                          (UserId, CompanyName, Location)
                          VALUES
                          (@UserId, @CompanyName, @Location)",
                        new SqlParameter("@UserId", userId),
                        new SqlParameter("@CompanyName", "My Company"),
                        new SqlParameter(
                            "@Location", txtLocation.Text.Trim()));

                    if (companyRows <= 0)
                    {
                        lblMessage.Text =
                            "Could not create the company record.";
                        return;
                    }

                    companyId = DBHelper.ExecuteScalar(
                        @"SELECT CompanyId
                          FROM Companies
                          WHERE UserId = @UserId",
                        new SqlParameter("@UserId", userId));
                }

                if (companyId == null || companyId == DBNull.Value)
                {
                    lblMessage.Text =
                        "Could not find the company for this recruiter.";
                    return;
                }

                // STEP 3: Insert the job into the Jobs table
                string query = @"
                    INSERT INTO Jobs
                    (
                        CompanyId,
                        CategoryId,
                        JobTitle,
                        Description,
                        Location,
                        SalaryRange,
                        JobType,
                        ExperienceRequired
                    )
                    VALUES
                    (
                        @CompanyId,
                        @CategoryId,
                        @JobTitle,
                        @Description,
                        @Location,
                        @SalaryRange,
                        @JobType,
                        @ExperienceRequired
                    )";

                int rows = DBHelper.ExecuteNonQuery(
                    query,
                    new SqlParameter(
                        "@CompanyId", Convert.ToInt32(companyId)),
                    new SqlParameter(
                        "@CategoryId",
                        Convert.ToInt32(ddlCategory.SelectedValue)),
                    new SqlParameter(
                        "@JobTitle", txtJobTitle.Text.Trim()),
                    new SqlParameter(
                        "@Description", txtDescription.Text.Trim()),
                    new SqlParameter(
                        "@Location", txtLocation.Text.Trim()),
                    new SqlParameter(
                        "@SalaryRange", txtSalary.Text.Trim()),
                    new SqlParameter(
                        "@JobType", ddlJobType.SelectedValue),
                    new SqlParameter(
                        "@ExperienceRequired",
                        txtExperience.Text.Trim()));

                // STEP 4: Show the result
                if (rows > 0)
                {
                    Response.Redirect("Jobs.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }

                lblMessage.Text =
                    "Job could not be posted. Please try again.";
            }
            catch (Exception)
            {
                // Avoid displaying database details to users
                lblMessage.Text =
                    "An error occurred while posting the job. " +
                    "Please check the database connection and try again.";
            }
        }
    }
}
