<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="JOB_PORTAL.PostJob" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Post Job - Job Portal</title>
    <meta name="viewport"
      content="width=device-width, initial-scale=1" />

<link href="Content/site.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h4>Post New Job</h4>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Job Title</label>
                            <asp:TextBox ID="txtJobTitle" runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory"
                                runat="server" CssClass="form-select">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Location</label>
                            <asp:TextBox ID="txtLocation" runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Salary Range</label>
                            <asp:TextBox ID="txtSalary" runat="server"
                                CssClass="form-control"
                                Placeholder="Example: 3 LPA - 6 LPA"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Job Type</label>
                            <asp:DropDownList ID="ddlJobType" runat="server"
                                CssClass="form-select">
                                <asp:ListItem>Full Time</asp:ListItem>
                                <asp:ListItem>Part Time</asp:ListItem>
                                <asp:ListItem>Internship</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Experience Required</label>
                            <asp:TextBox ID="txtExperience" runat="server"
                                CssClass="form-control"
                                Placeholder="Example: 0-2 Years"></asp:TextBox>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label>Job Description</label>
                            <asp:TextBox ID="txtDescription" runat="server"
                                TextMode="MultiLine" Rows="5"
                                CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="text-danger"></asp:Label>

                    <div class="mt-3">
                        <asp:Button ID="btnPost" runat="server"
                            Text="Post Job" CssClass="btn btn-success"
                            OnClick="btnPost_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
