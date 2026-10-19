<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyJob.aspx.cs" Inherits="JOB_PORTAL.ApplyJob" %>



<!DOCTYPE html>
<html>
<head runat="server">
    <title>Apply Job - Job Portal</title>
    <meta name="viewport"
      content="width=device-width, initial-scale=1" />

<link href="Content/site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-dark bg-primary">
            <div class="container">
                <span class="navbar-brand">Job Portal</span>
                <a href="Jobs.aspx" class="btn btn-light btn-sm">Back to Jobs</a>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h4>Apply for Job</h4>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server"
                                TextMode="Email" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Phone</label>
                            <asp:TextBox ID="txtPhone" runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Resume</label>
                            <asp:FileUpload ID="fuResume" runat="server"
                                CssClass="form-control" />
                        </div>

                        <div class="col-md-12 mb-3">
                            <label>Cover Letter</label>
                            <asp:TextBox ID="txtCoverLetter" runat="server"
                                TextMode="MultiLine" Rows="5"
                                CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="text-danger"></asp:Label>

                    <div class="mt-3">
                        <asp:Button ID="btnApply" runat="server"
                            Text="Apply Now"
                            CssClass="btn btn-success"
                            OnClick="btnApply_Click" />
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
