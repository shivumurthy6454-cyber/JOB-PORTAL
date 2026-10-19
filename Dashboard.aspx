<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="JOB_PORTAL.Dashboard" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Dashboard - Job Portal</title>
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
                <div>
                    <span class="text-white me-3">
                        Welcome, <asp:Label ID="lblUser" runat="server"></asp:Label>
                    </span>
                    <asp:Button ID="btnLogout" runat="server"
                        Text="Logout" CssClass="btn btn-light btn-sm"
                        OnClick="btnLogout_Click" />
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h2>Dashboard</h2>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card text-bg-primary mb-3">
                        <div class="card-body">
                            <h5>Total Jobs</h5>
                            <h2><asp:Label ID="lblTotalJobs" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-bg-success mb-3">
                        <div class="card-body">
                            <h5>Total Applications</h5>
                            <h2><asp:Label ID="lblTotalApplications" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-bg-warning mb-3">
                        <div class="card-body">
                            <h5>Total Users</h5>
                            <h2><asp:Label ID="lblTotalUsers" runat="server"></asp:Label></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <a href="Jobs.aspx" class="btn btn-primary">Browse Jobs</a>

                <asp:HyperLink ID="lnkPostJob" runat="server"
                    NavigateUrl="PostJob.aspx"
                    CssClass="btn btn-success">
                    Post New Job
                </asp:HyperLink>

                <asp:HyperLink ID="lnkApplications" runat="server"
                    NavigateUrl="Applications.aspx"
                    CssClass="btn btn-warning">
                    View Applications
                </asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>