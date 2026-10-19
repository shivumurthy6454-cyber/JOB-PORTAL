using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JOB_PORTAL
{
    public partial class PostJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["Role"].ToString() != "Recruiter")
            {
                Response.Redirect("Dashboard.aspx");
            }

            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            DataTable dt = DBHelper.GetData(
                "SELECT CategoryId, CategoryName FROM JobCategories");

            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            object companyId = DBHelper.ExecuteScalar(
                @"SELECT CompanyId FROM Companies WHERE UserId = @UserId",
                new SqlParameter("@UserId", userId));

            if (companyId == null)
            {
                string insertCompany = @"INSERT INTO Companies 
                                         (UserId, CompanyName, Location)
                                         VALUES 
                                         (@UserId, @CompanyName, @Location)";

                DBHelper.ExecuteNonQuery(insertCompany,
                    new SqlParameter("@UserId", userId),
                    new SqlParameter("@CompanyName", "My Company"),
                    new SqlParameter("@Location", txtLocation.Text.Trim()));

                companyId = DBHelper.ExecuteScalar(
                    @"SELECT CompanyId FROM Companies WHERE UserId = @UserId",
                    new SqlParameter("@UserId", userId));
            }

            string query = @"INSERT INTO Jobs 
                             (CompanyId, CategoryId, JobTitle, Description, 
                              Location, SalaryRange, JobType, ExperienceRequired)
                             VALUES 
                             (@CompanyId, @CategoryId, @JobTitle, @Description, 
                              @Location, @SalaryRange, @JobType, @ExperienceRequired)";

            int rows = DBHelper.ExecuteNonQuery(query,
                new SqlParameter("@CompanyId", Convert.ToInt32(companyId)),
                new SqlParameter("@CategoryId",
                    Convert.ToInt32(ddlCategory.SelectedValue)),
                new SqlParameter("@JobTitle", txtJobTitle.Text.Trim()),
                new SqlParameter("@Description", txtDescription.Text.Trim()),
                new SqlParameter("@Location", txtLocation.Text.Trim()),
                new SqlParameter("@SalaryRange", txtSalary.Text.Trim()),
                new SqlParameter("@JobType", ddlJobType.SelectedValue),
                new SqlParameter("@ExperienceRequired", txtExperience.Text.Trim()));

            if (rows > 0)
            {
                Response.Redirect("Jobs.aspx");
            }
            else
            {
                lblMessage.Text = "Job could not be posted.";
            }
        }
    }
}