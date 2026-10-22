
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Jobs.aspx.cs"
    Inherits="JOB_PORTAL.Jobs" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Explore Jobs | CareerConnect</title>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>

<body class="jobs-page">
<form id="form1" runat="server">

    <!-- Premium Navigation -->
    <header class="jobs-navbar">
        <div class="jobs-nav-inner">
            <a href="Dashboard.aspx" class="jobs-brand">
                <span class="jobs-brand-icon">C</span>
                <span>Career<span class="brand-accent">Connect</span></span>
            </a>

            <nav class="jobs-nav-links" aria-label="Main navigation">
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="Jobs.aspx" class="active">Explore Jobs</a>
            </nav>

            <a href="Dashboard.aspx" class="jobs-nav-cta">
                My Dashboard <span>↗</span>
            </a>
        </div>
    </header>

    <!-- Hero -->
    <main>
        <section class="jobs-hero">
            <div class="jobs-hero-glow glow-left"></div>
            <div class="jobs-hero-glow glow-right"></div>

            <div class="jobs-hero-inner">
                <div class="jobs-hero-copy">
                    <div class="jobs-eyebrow">
                        <span class="jobs-live-dot"></span>
                        YOUR CAREER JOURNEY STARTS HERE
                    </div>

                    <h1>
                        Find work you<br />
                        <span>love doing.</span>
                    </h1>

                    <p>
                        Discover exciting opportunities, connect your
                        skills with the right roles, and take the next
                        step towards your dream career.
                    </p>

                    <div class="jobs-hero-actions">
                        <a href="#job-listings" class="jobs-primary-link">
                            Explore Opportunities <span>→</span>
                        </a>
                        <span class="jobs-action-note">
                            ✦ Your next chapter starts today
                        </span>
                    </div>
                </div>

                <div class="jobs-hero-visual">
                    <div class="jobs-visual-ring ring-one"></div>
                    <div class="jobs-visual-ring ring-two"></div>

                    <div class="jobs-feature-card">
                        <div class="jobs-feature-top">
                            <div class="jobs-feature-icon">✦</div>
                            <div>
                                <strong>Dream big.</strong>
                                <span>Your future awaits.</span>
                            </div>
                        </div>

                        <div class="jobs-feature-line"></div>
                        <div class="jobs-feature-line short-line"></div>

                        <div class="jobs-feature-bottom">
                            <span class="jobs-feature-check">✓</span>
                            <div>
                                <strong>Make your next move</strong>
                                <span>Find a role that fits you.</span>
                            </div>
                        </div>
                    </div>

                    <div class="jobs-float-tag tag-one">
                        <span>↗</span> New possibilities
                    </div>

                    <div class="jobs-float-tag tag-two">
                        <span>✦</span> Build your future
                    </div>
                </div>
            </div>

            <div class="jobs-hero-bottom">
                <span>Discover</span>
                <span class="hero-bottom-line"></span>
                <span>Your next opportunity</span>
            </div>
        </section>

        <!-- Job listings begin here -->
        <section class="jobs-content" id="job-listings">
            <div class="jobs-content-heading">
                <div>
                    <span class="jobs-section-kicker">OPPORTUNITIES FOR YOU</span>
                    <h2>Explore open positions<span>.</span></h2>
                    <p>Find your next opportunity and make it count.</p>
                </div>

                <div class="jobs-heading-badge">
                    <span class="heading-badge-icon">✧</span>
                    <span>Find your next chapter</span>
                </div>
            </div>

            <!--
              IMPORTANT:
              Keep your existing job search controls, Repeater/GridView,
              and database-bound job cards here.

              Add class="jobs-listing-area" to the container that
              wraps your existing job list.
            -->

            
<div class="jobs-listing-area">

    <!-- Search -->
    <div class="jobs-search-panel">
        <asp:TextBox ID="txtSearch" runat="server"
            CssClass="jobs-search-input"
            placeholder="Search by job title or location..." />

        <asp:Button ID="btnSearch" runat="server"
            Text="Search Jobs"
            CssClass="jobs-search-button"
            OnClick="btnSearch_Click" />
    </div>

    <!-- Job List -->
    <div class="jobs-table-wrapper">
        <asp:GridView ID="gvJobs" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="JobId"
            CssClass="jobs-table"
            GridLines="None"
            EmptyDataText="No jobs found. Try another search.">

            <Columns>
                <asp:BoundField DataField="JobTitle"
                    HeaderText="Job Title" />

                <asp:BoundField DataField="CompanyName"
                    HeaderText="Company" />

                <asp:BoundField DataField="CategoryName"
                    HeaderText="Category" />

                <asp:BoundField DataField="Location"
                    HeaderText="Location" />

                <asp:BoundField DataField="SalaryRange"
                    HeaderText="Salary" />

                <asp:BoundField DataField="JobType"
                    HeaderText="Job Type" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a class="jobs-apply-button"
                           href='<%# "ApplyJob.aspx?JobId=" +
                               Eval("JobId") %>'>
                            Apply Now →
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

</div>

        </section>
    </main>

    <!-- Footer -->
    <footer class="jobs-footer">
        <div class="jobs-footer-inner">
            <a href="Dashboard.aspx" class="jobs-brand">
                <span class="jobs-brand-icon">C</span>
                <span>Career<span class="brand-accent">Connect</span></span>
            </a>

            <p>Discover your potential. Build your future. © 2026</p>
        </div>
    </footer>

</form>
</body>
</html>

           