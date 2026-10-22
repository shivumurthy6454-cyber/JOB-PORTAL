using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace JOB_PORTAL
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            // 1. Validate all fields
            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(role))
            {
                ShowMessage("Please fill in all fields.", false);
                return;
            }

            // 2. Validate email format
            if (!Regex.IsMatch(email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowMessage("Please enter a valid email address.", false);
                return;
            }

            // 3. Allow only the roles offered on the registration page
            if (role != "Candidate" && role != "Recruiter")
            {
                ShowMessage("Please select a valid role.", false);
                return;
            }

            // 4. Validate password length
            if (password.Length < 8)
            {
                ShowMessage(
                    "Password must contain at least 8 characters.", false);
                return;
            }

            try
            {
                // 5. Check whether email already exists
                string checkQuery = @"
                    SELECT COUNT(*)
                    FROM Users
                    WHERE Email = @Email";

                int count = Convert.ToInt32(
                    DBHelper.ExecuteScalar(
                        checkQuery,
                        new SqlParameter("@Email", email)
                    )
                );

                if (count > 0)
                {
                    ShowMessage(
                        "This email is already registered. Please log in.",
                        false);
                    return;
                }

                // 6. Hash the password before saving it
                string passwordHash = HashPassword(password);

                // 7. Insert the new user
                string insertQuery = @"
                    INSERT INTO Users
                        (FullName, Email, Password, Role)
                    VALUES
                        (@FullName, @Email, @Password, @Role)";

                int rows = DBHelper.ExecuteNonQuery(
                    insertQuery,
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Password", passwordHash),
                    new SqlParameter("@Role", role)
                );

                // 8. Show result
                if (rows > 0)
                {
                    Response.Redirect("Login.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    ShowMessage(
                        "Registration could not be completed. Please try again.",
                        false);
                }
            }
            catch (SqlException ex)
            {
                // SQL error 2601 or 2627 can indicate a duplicate email.
                if (ex.Number == 2601 || ex.Number == 2627)
                {
                    ShowMessage(
                        "This email is already registered. Please log in.",
                        false);
                }
                else
                {
                    ShowMessage(
                        "A database error occurred. Please try again later.",
                        false);
                }
            }
            catch (Exception)
            {
                ShowMessage(
                    "Something went wrong. Please try again later.",
                    false);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = success
                ? "message text-success"
                : "message text-danger";
        }

        private string HashPassword(string password)
        {
            // PBKDF2 password hashing with a random salt.
            byte[] salt = new byte[16];

            using (var rng = System.Security.Cryptography.RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            using (var deriveBytes =
                new System.Security.Cryptography.Rfc2898DeriveBytes(
                    password,
                    salt,
                    100000,
                    System.Security.Cryptography.HashAlgorithmName.SHA256))
            {
                byte[] hash = deriveBytes.GetBytes(32);

                // Store salt and hash together in the Password column.
                return "PBKDF2$100000$" +
                    Convert.ToBase64String(salt) + "$" +
                    Convert.ToBase64String(hash);
            }
        }
    }
}
