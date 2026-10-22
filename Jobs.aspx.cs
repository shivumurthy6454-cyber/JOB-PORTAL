using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JOB_PORTAL
{
    public partial class Jobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                LoadJobs("");
            }
        }

        private void LoadJobs(string searchText)
        {
            string query = @"
                SELECT
                    j.JobId,
                    j.JobTitle,
                    c.CompanyName,
                    jc.CategoryName,
                    j.Location,
                    j.SalaryRange,
                    j.JobType
                FROM Jobs j
                INNER JOIN Companies c
                    ON j.CompanyId = c.CompanyId
                INNER JOIN JobCategories jc
                    ON j.CategoryId = jc.CategoryId
                WHERE j.IsActive = 1
                  AND (
                      j.JobTitle LIKE @Search
                      OR j.Location LIKE @Search
                  )
                ORDER BY j.PostedOn DESC";

            DataTable dt = DBHelper.GetData(
                query,
                new SqlParameter("@Search", "%" + searchText + "%"));

            gvJobs.DataSource = dt;
            gvJobs.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadJobs(txtSearch.Text.Trim());
        }
    }
}