
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Applications.aspx.cs"
    Inherits="JOB_PORTAL.Applications" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Applications | CareerConnect</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />

    <style>
        .applications-page {
            min-height: 100vh;
            background: #f5f7ff;
            color: #182449;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        .app-navbar {
            background: linear-gradient(110deg, #172554, #4338ca);
            padding: 17px 0;
            box-shadow: 0 5px 20px rgba(35, 42, 100, .15);
        }

        .app-brand {
            display: flex;
            align-items: center;
            gap: 11px;
            color: white;
            font-size: 21px;
            font-weight: 800;
            text-decoration: none;
        }

        .app-brand:hover {
            color: #e0e7ff;
        }

        .brand-square {
            display: inline-flex;
            width: 39px;
            height: 39px;
            justify-content: center;
            align-items: center;
            border-radius: 12px;
            background: linear-gradient(135deg, #818cf8, #a78bfa);
            color: white;
            font-size: 22px;
        }

        .nav-dashboard {
            border: 1px solid rgba(255,255,255,.4);
            color: white;
            border-radius: 9px;
            padding: 9px 17px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: .2s;
        }

        .nav-dashboard:hover {
            color: #4338ca;
            background: white;
        }

        .applications-main {
            max-width: 1250px;
            padding-top: 35px;
            padding-bottom: 45px;
        }

        .page-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 28px;
        }

        .heading-label {
            color: #6366f1;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 9px;
        }

        .page-heading h1 {
            color: #172554;
            font-size: 31px;
            font-weight: 800;
            letter-spacing: -.8px;
            margin-bottom: 9px;
        }

        .heading-description {
            color: #7b849d;
            font-size: 14px;
            margin-bottom: 0;
        }

        .heading-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 58px;
            height: 58px;
            border-radius: 17px;
            background: #e8eaff;
            color: #4f46e5;
            font-size: 27px;
        }

        .overview-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 27px;
        }

        .overview-card {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 22px;
            background: white;
            border: 1px solid #edf0fa;
            border-radius: 17px;
            box-shadow: 0 7px 25px rgba(38, 48, 105, .045);
            transition: transform .2s, box-shadow .2s;
        }

        .overview-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 28px rgba(38, 48, 105, .09);
        }

        .overview-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            width: 48px;
            height: 48px;
            border-radius: 14px;
            background: #eef0ff;
            color: #4f46e5;
            font-size: 22px;
        }

        .overview-icon.green {
            background: #e5f9ef;
            color: #15945b;
        }

        .overview-icon.orange {
            background: #fff1df;
            color: #d97706;
        }

        .overview-card h3 {
            margin: 0 0 5px;
            color: #263457;
            font-size: 13px;
            font-weight: 700;
        }

        .overview-card p {
            margin: 0;
            color: #8b94aa;
            font-size: 11px;
            line-height: 1.6;
        }

        .applications-panel {
            overflow: hidden;
            background: white;
            border: 1px solid #e9edf7;
            border-radius: 19px;
            box-shadow: 0 10px 35px rgba(38, 48, 105, .06);
        }

        .panel-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
            padding: 25px 25px 20px;
            border-bottom: 1px solid #edf0f7;
        }

        .panel-header h2 {
            margin: 0 0 7px;
            color: #172554;
            font-size: 19px;
            font-weight: 800;
        }

        .panel-header p {
            margin: 0;
            color: #8b94aa;
            font-size: 12px;
        }

        .search-box {
            width: 280px;
            max-width: 100%;
            height: 43px;
            padding: 0 13px;
            border: 1px solid #e1e6f2;
            border-radius: 10px;
            outline: none;
            background: #fbfcff;
            color: #263457;
            font-size: 12px;
        }

        .search-box:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, .1);
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .applications-table {
            width: 100%;
            min-width: 900px;
            margin: 0;
            border-collapse: separate;
            border-spacing: 0;
            color: #35415f;
            font-size: 12px;
        }

        .applications-table th {
            padding: 17px 16px;
            background: #f8f9ff;
            color: #69748e;
            border: none !important;
            border-bottom: 1px solid #e9edf6 !important;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: .6px;
            text-transform: uppercase;
            white-space: nowrap;
        }

        .applications-table td {
            padding: 17px 16px;
            vertical-align: middle !important;
            border: none !important;
            border-bottom: 1px solid #f0f2f8 !important;
            background: white;
        }

        .applications-table tr:last-child td {
            border-bottom: none !important;
        }

        .applications-table tbody tr:hover td {
            background: #f8f9ff;
        }

        .applications-table tbody tr:last-child td {
            border-bottom: none !important;
        }

        .empty-message {
            display: block;
            padding: 25px;
            color: #7b849d;
            font-size: 13px;
            text-align: center;
        }

        .no-results {
            display: none;
            padding: 28px;
            color: #7b849d;
            font-size: 13px;
            text-align: center;
        }

        .table-footer {
            padding: 15px 24px;
            border-top: 1px solid #edf0f7;
            color: #8992a8;
            font-size: 11px;
        }

        .page-footer {
            padding-top: 22px;
            color: #929bb0;
            font-size: 11px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .applications-main {
                padding-top: 25px;
            }

            .page-heading h1 {
                font-size: 26px;
            }

            .overview-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .overview-card {
                padding: 17px;
            }

            .panel-header {
                align-items: stretch;
                padding: 20px;
            }

            .search-box {
                width: 100%;
            }

            .app-brand {
                font-size: 17px;
            }

            .nav-dashboard {
                padding: 8px 11px;
                font-size: 11px;
            }
        }
    </style>
</head>

<body class="applications-page">
<form id="form1" runat="server">

    <!-- Navigation -->
    <nav class="app-navbar">
        <div class="container d-flex align-items-center
                    justify-content-between">

            <a href="Dashboard.aspx" class="app-brand">
                <span class="brand-square">J</span>
                CareerConnect
            </a>

            <a href="Dashboard.aspx" class="nav-dashboard">
                &#8592; Dashboard
            </a>

        </div>
    </nav>

    <main class="container applications-main">

        <!-- Page heading -->
        <section class="page-heading">
            <div>
                <div class="heading-label">
                    RECRUITMENT MANAGEMENT
                </div>

                <h1>Job Applications</h1>

                <p class="heading-description">
                    Review candidate details and track job applications
                    in one place.
                </p>
            </div>

            <div class="heading-icon">
                &#128203;
            </div>
        </section>

        <!-- Information cards -->
        <section class="overview-grid">

            <div class="overview-card">
                <div class="overview-icon">&#128221;</div>
                <div>
                    <h3>Application Records</h3>
                    <p>View submitted applications</p>
                </div>
            </div>

            <div class="overview-card">
                <div class="overview-icon green">&#128101;</div>
                <div>
                    <h3>Candidate Details</h3>
                    <p>Review contact information</p>
                </div>
            </div>

            <div class="overview-card">
                <div class="overview-icon orange">&#128337;</div>
                <div>
                    <h3>Application Tracking</h3>
                    <p>Check application status and dates</p>
                </div>
            </div>

        </section>

        <!-- Applications table -->
        <section class="applications-panel">

            <div class="panel-header">
                <div>
                    <h2>All Applications</h2>
                    <p>Search and review candidate records below.</p>
                </div>

                <input type="search"
                    id="applicationSearch"
                    class="search-box"
                    placeholder="&#128269; Search applications..."
                    aria-label="Search applications" />
            </div>

            <div class="table-wrap">

                <asp:GridView
                    ID="gvApplications"
                    runat="server"
                    CssClass="applications-table"
                    AutoGenerateColumns="false"
                    GridLines="None"
                    CellPadding="0"
                    EmptyDataText="No job applications are available yet.">

                    <Columns>

                        <asp:BoundField
                            DataField="ApplicationId"
                            HeaderText="Application ID" />

                        <asp:BoundField
                            DataField="JobTitle"
                            HeaderText="Job Title" />

                        <asp:BoundField
                            DataField="FullName"
                            HeaderText="Candidate Name" />

                        <asp:BoundField
                            DataField="Email"
                            HeaderText="Email Address" />

                        <asp:BoundField
                            DataField="Phone"
                            HeaderText="Phone Number" />

                        <asp:BoundField
                            DataField="AppliedOn"
                            HeaderText="Applied Date"
                            DataFormatString="{0:dd MMM yyyy}"
                            HtmlEncode="false" />

                        <asp:BoundField
                            DataField="Status"
                            HeaderText="Status" />

                    </Columns>

                    <EmptyDataRowStyle
                        CssClass="empty-message" />

                </asp:GridView>

                <div id="noSearchResults" class="no-results">
                    No matching applications found.
                </div>

            </div>

            <div class="table-footer">
                Candidate applications and their current status
            </div>

        </section>

        <footer class="page-footer">
            &copy; 2026 CareerConnect. Building better careers together.
        </footer>

    </main>

    <script>
        (function () {
            var search = document.getElementById("applicationSearch");
            var table = document.getElementById(
                "<%= gvApplications.ClientID %>");
            var noResults = document.getElementById("noSearchResults");

            if (!search || !table) return;

            search.addEventListener("input", function () {
                var term = search.value.toLowerCase().trim();
                var rows = table.querySelectorAll("tr");
                var matches = 0;

                for (var i = 0; i < rows.length; i++) {
                    // Keep the table header visible.
                    if (rows[i].querySelector("th")) continue;

                    var text = rows[i].innerText.toLowerCase();
                    var show = text.indexOf(term) !== -1;

                    rows[i].style.display = show ? "" : "none";

                    if (show) matches++;
                }

                noResults.style.display =
                    matches === 0 && term !== "" ? "block" : "none";
            });
        })();
    </script>

</form>
</body>
</html>
