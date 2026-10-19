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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
            {
                string fullName = txtFullName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();
                string role = ddlRole.SelectedValue;

                if (fullName == "" || email == "" || password == "" || role == "")
                {
                    lblMessage.Text = "Please fill all fields.";
                    return;
                }

                string checkQuery = @"SELECT COUNT(*) FROM Users WHERE Email = @Email";
                int count = Convert.ToInt32(DBHelper.ExecuteScalar(checkQuery,
                    new SqlParameter("@Email", email)));

                if (count > 0)
                {
                    lblMessage.Text = "This email is already registered.";
                    return;
                }

                string insertQuery = @"INSERT INTO Users 
                                   (FullName, Email, Password, Role)
                                   VALUES 
                                   (@FullName, @Email, @Password, @Role)";

                int rows = DBHelper.ExecuteNonQuery(insertQuery,
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Password", password),
                    new SqlParameter("@Role", role));

                if (rows > 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Registration failed.";
                }
            }
        }
    }

