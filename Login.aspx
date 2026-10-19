<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="JobPortal.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - Job Portal</title>
    <meta name="viewport"
      content="width=device-width, initial-scale=1" />

<link href="Content/site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white text-center">
                            <h4>Job Portal Login</h4>
                        </div>

                        <div class="card-body">
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

                            <asp:Label ID="lblMessage" runat="server"
                                CssClass="text-danger"></asp:Label>

                            <div class="d-grid mt-3">
                                <asp:Button ID="btnLogin" runat="server"
                                    Text="Login" CssClass="btn btn-primary"
                                    OnClick="btnLogin_Click" />
                            </div>

                            <div class="text-center mt-3">
                                <a href="Register.aspx">Create new account</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>