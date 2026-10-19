using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace JOB_PORTAL
{
    public partial class Applications : System.Web.UI.Page
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
                LoadApplications();
            }
        }

        private void LoadApplications()
        {
            string query = @"SELECT a.ApplicationId, 
                                    j.JobTitle, 
                                    a.FullName, 
                                    a.Email, 
                                    a.Phone, 
                                    a.AppliedOn, 
                                    a.Status
                             FROM Applications a
                             INNER JOIN Jobs j 
                                ON a.JobId = j.JobId
                             ORDER BY a.AppliedOn DESC";

            DataTable dt = DBHelper.GetData(query);

            gvApplications.DataSource = dt;
            gvApplications.DataBind();
        }
    }
}