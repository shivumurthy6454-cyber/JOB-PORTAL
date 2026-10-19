<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="JOB_PORTAL.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register - Job Portal</title>
    <meta name="viewport"
      content="width=device-width, initial-scale=1" />

<link href="Content/site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white text-center">
                            <h4>Create Account</h4>
                        </div>

                        <div class="card-body">
                            <div class="mb-3">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server"
                                    CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server"
                                    TextMode="Email" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server"
                                    TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Register As</label>
                                <asp:DropDownList ID="ddlRole" runat="server"
                                    CssClass="form-select">
                                    <asp:ListItem Value="">Select Role</asp:ListItem>
                                    <asp:ListItem>Candidate</asp:ListItem>
                                    <asp:ListItem>Recruiter</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:Label ID="lblMessage" runat="server"
                                CssClass="text-danger"></asp:Label>

                            <div class="d-grid mt-3">
                                <asp:Button ID="btnRegister" runat="server"
                                    Text="Register" CssClass="btn btn-primary"
                                    OnClick="btnRegister_Click" />
                            </div>

                            <div class="text-center mt-3">
                                <a href="Login.aspx">Already have an account? Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
