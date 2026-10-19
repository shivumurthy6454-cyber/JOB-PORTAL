<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Applications.aspx.cs" Inherits="JOB_PORTAL.Applications" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Job Applications - Job Portal</title>
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
                <a href="Dashboard.aspx" class="btn btn-light btn-sm">Dashboard</a>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="panel">
    <div class="table-wrap">
            <h2 class="mb-3">Job Applications</h2>

            <asp:GridView ID="gvApplications" runat="server"
                CssClass="table table-bordered table-striped"
                AutoGenerateColumns="false">

                <Columns>

                    <asp:BoundField DataField="ApplicationId"
                        HeaderText="Application ID" />

                    <asp:BoundField DataField="JobTitle"
                        HeaderText="Job Title" />

                    <asp:BoundField DataField="FullName"
                        HeaderText="Candidate Name" />

                    <asp:BoundField DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField DataField="Phone"
                        HeaderText="Phone" />

                    <asp:BoundField DataField="AppliedOn"
                        HeaderText="Applied Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:BoundField DataField="Status"
                        HeaderText="Status" />

                </Columns>

            </asp:GridView>
        </div>
                </div>
        </div>

    </form>
</body>
</html>