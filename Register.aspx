
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="JOB_PORTAL.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Create Account | CareerConnect</title>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #172554;
            background:
                radial-gradient(circle at 10% 10%, #dbeafe 0, transparent 32%),
                radial-gradient(circle at 90% 85%, #ede9fe 0, transparent 30%),
                #f7f9ff;
        }

        .navbar-custom {
            min-height: 82px;
            padding: 15px 6%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            background: rgba(255, 255, 255, .92);
            border-bottom: 1px solid #e6edff;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            color: #123b8c;
        }

        .brand-icon {
            width: 48px;
            height: 48px;
            border-radius: 15px;
            display: grid;
            place-items: center;
            color: white;
            font-size: 25px;
            background: linear-gradient(135deg, #087cf0, #5939e9);
            box-shadow: 0 8px 20px #345de444;
        }

        .brand-name {
            font-size: 27px;
            font-weight: 800;
            letter-spacing: -.8px;
            line-height: 1.1;
        }

        .brand-tagline {
            display: block;
            margin-top: 4px;
            color: #7183a8;
            font-size: 12px;
            letter-spacing: .5px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            text-decoration: none;
            color: #263a60;
            font-weight: 600;
            transition: color .2s;
        }

        .nav-links a:hover {
            color: #3867ed;
        }

        .nav-login {
            padding: 11px 22px;
            border-radius: 30px;
            color: white !important;
            background: linear-gradient(100deg, #1679f8, #6244ef);
            box-shadow: 0 7px 18px #4167ed30;
        }

        .page-wrap {
            width: min(1180px, 92%);
            margin: 48px auto 34px;
        }

        .register-layout {
            display: grid;
            grid-template-columns: .92fr 1.08fr;
            overflow: hidden;
            background: white;
            border: 1px solid #e4eaff;
            border-radius: 28px;
            box-shadow: 0 24px 70px #244b9915;
        }

        .hero-panel {
            position: relative;
            overflow: hidden;
            padding: 52px 42px 40px;
            color: white;
            background: linear-gradient(145deg, #0648b9 0%, #345ee9 52%, #8745ed 100%);
        }

        .hero-panel::before,
        .hero-panel::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
        }

        .hero-panel::before {
            width: 290px;
            height: 290px;
            right: -130px;
            top: 35%;
            background: #ffffff12;
        }

        .hero-panel::after {
            width: 230px;
            height: 230px;
            left: -130px;
            bottom: -110px;
            background: #ffffff12;
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-badge {
            display: inline-block;
            padding: 8px 14px;
            margin-bottom: 25px;
            border: 1px solid #ffffff48;
            border-radius: 30px;
            background: #ffffff18;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .hero-panel h1 {
            margin: 0 0 18px;
            font-size: clamp(34px, 4vw, 49px);
            line-height: 1.13;
            font-weight: 800;
            letter-spacing: -1.5px;
        }

        .hero-panel h1 span {
            color: #80f1ff;
        }

        .hero-description {
            max-width: 380px;
            margin-bottom: 34px;
            color: #e4edff;
            font-size: 16px;
            line-height: 1.8;
        }

        .feature {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin: 25px 0;
        }

        .feature-icon {
            flex: 0 0 48px;
            width: 48px;
            height: 48px;
            display: grid;
            place-items: center;
            border: 1px solid #ffffff3a;
            border-radius: 15px;
            background: #ffffff20;
            font-size: 23px;
        }

        .feature h3 {
            margin: 2px 0 6px;
            font-size: 16px;
            font-weight: 700;
        }

        .feature p {
            margin: 0;
            color: #e0e9ff;
            font-size: 13px;
            line-height: 1.6;
        }

        .hero-note {
            margin-top: 38px;
            padding: 17px;
            border: 1px solid #ffffff36;
            border-radius: 17px;
            background: #ffffff12;
            color: #f4f6ff;
            font-size: 14px;
            line-height: 1.6;
        }

        .form-panel {
            padding: 47px 52px 42px;
        }

        .form-icon {
            width: 68px;
            height: 68px;
            margin: 0 auto 17px;
            display: grid;
            place-items: center;
            border-radius: 22px;
            color: white;
            font-size: 30px;
            background: linear-gradient(135deg, #1685ff, #7444f2);
            box-shadow: 0 12px 25px #4c63e638;
        }

        .form-heading {
            margin: 0;
            text-align: center;
            font-size: 34px;
            font-weight: 800;
            letter-spacing: -1px;
            color: #14264b;
        }

        .form-heading span {
            color: #3768ed;
        }

        .form-subtitle {
            margin: 10px 0 30px;
            text-align: center;
            color: #7584a4;
            font-size: 14px;
        }

        .field-group {
            margin-bottom: 20px;
        }

        .field-label {
            display: block;
            margin-bottom: 9px;
            color: #26375a;
            font-size: 14px;
            font-weight: 700;
        }

        .field-label .field-icon {
            display: inline-block;
            width: 25px;
            color: #4c69cf;
            font-size: 16px;
        }

        .input-wrap {
            position: relative;
        }

        .form-input {
            width: 100%;
            min-height: 51px;
            padding: 13px 16px;
            border: 1px solid #dce4f3;
            border-radius: 12px;
            outline: none;
            background: #fbfcff;
            color: #172554;
            font-size: 14px;
            transition: border-color .2s, box-shadow .2s, background .2s;
        }

        .form-input:focus {
            border-color: #5b73f0;
            background: white;
            box-shadow: 0 0 0 4px #5b73f018;
        }

        .form-input::placeholder {
            color: #9aa8c0;
        }

        .password-input {
            padding-right: 52px;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 14px;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: #647ba8;
            cursor: pointer;
            font-size: 19px;
        }

        .message {
            display: block;
            margin: 6px 0;
            font-size: 13px;
            line-height: 1.5;
        }

        .register-button {
            width: 100%;
            min-height: 53px;
            margin-top: 8px;
            border: none;
            border-radius: 13px;
            color: white;
            background: linear-gradient(100deg, #117ef7, #6941ef);
            box-shadow: 0 9px 20px #4965e632;
            font-size: 16px;
            font-weight: 700;
            transition: transform .2s, box-shadow .2s;
        }

        .register-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 13px 25px #4965e644;
        }

        .login-note {
            margin-top: 24px;
            text-align: center;
            color: #7584a4;
            font-size: 14px;
        }

        .login-note a {
            color: #3567ed;
            font-weight: 700;
            text-decoration: none;
        }

        .login-note a:hover {
            text-decoration: underline;
        }

        .trust-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-top: 25px;
            padding: 24px 10px;
            border: 1px solid #e8edfb;
            border-radius: 19px;
            background: #ffffffc9;
            text-align: center;
        }

        .trust-item strong {
            display: block;
            margin-bottom: 6px;
            color: #253b65;
            font-size: 13px;
        }

        .trust-item span {
            color: #8794ad;
            font-size: 12px;
        }

        .footer {
            padding: 22px 15px;
            background: #14264b;
            color: #c5d0e7;
            text-align: center;
            font-size: 12px;
        }

        @media (max-width: 850px) {
            .page-wrap {
                margin-top: 25px;
            }

            .register-layout {
                grid-template-columns: 1fr;
            }

            .hero-panel {
                padding: 35px 30px;
            }

            .hero-panel h1 {
                font-size: 38px;
            }

            .hero-note {
                margin-top: 25px;
            }

            .form-panel {
                padding: 38px 30px;
            }
        }

        @media (max-width: 520px) {
            .navbar-custom {
                padding: 13px 5%;
            }

            .brand-name {
                font-size: 22px;
            }

            .brand-icon {
                width: 42px;
                height: 42px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a:not(.nav-login) {
                display: none;
            }

            .nav-login {
                padding: 10px 15px;
                font-size: 13px;
            }

            .page-wrap {
                width: 94%;
                margin: 18px auto;
            }

            .register-layout {
                border-radius: 20px;
            }

            .hero-panel {
                padding: 30px 24px;
            }

            .hero-panel h1 {
                font-size: 34px;
            }

            .form-panel {
                padding: 30px 22px;
            }

            .form-heading {
                font-size: 29px;
            }

            .trust-row {
                grid-template-columns: 1fr;
                gap: 18px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- NAVIGATION -->
        <header class="navbar-custom">
            <a href="Login.aspx" class="brand">
                <span class="brand-icon">&#128188;</span>
                <span>
                    <span class="brand-name">CareerConnect</span>
                    <span class="brand-tagline">YOUR CAREER. YOUR FUTURE.</span>
                </span>
            </a>

            <nav class="nav-links">
                <a href="Jobs.aspx">Explore Jobs</a>
                <a href="Login.aspx">Login</a>
                <a href="Register.aspx" class="nav-login">Join Us &#8594;</a>
            </nav>
        </header>

        <main class="page-wrap">
            <div class="register-layout">

                <!-- LEFT: WELCOME PANEL -->
                <section class="hero-panel">
                    <div class="hero-content">
                        <div class="hero-badge">
                            &#10022; START YOUR JOURNEY
                        </div>

                        <h1>
                            Your Dream Job.<br />
                            Your Next <span>Chapter.</span>
                        </h1>

                        <p class="hero-description">
                            Create your account and discover opportunities
                            that match your skills, passion, and ambitions.
                            Your future starts here.
                        </p>

                        <div class="feature">
                            <div class="feature-icon">&#128269;</div>
                            <div>
                                <h3>Discover Great Jobs</h3>
                                <p>Explore opportunities across IT and other industries.</p>
                            </div>
                        </div>

                        <div class="feature">
                            <div class="feature-icon">&#128101;</div>
                            <div>
                                <h3>Connect With Companies</h3>
                                <p>Find roles that match your career goals.</p>
                            </div>
                        </div>

                        <div class="feature">
                            <div class="feature-icon">&#128640;</div>
                            <div>
                                <h3>Grow Your Career</h3>
                                <p>Take the next step toward a brighter future.</p>
                            </div>
                        </div>

                        <div class="hero-note">
                            <strong>One account. New possibilities.</strong>
                            <br />
                            Join CareerConnect and take the first step
                            toward your next opportunity.
                        </div>
                    </div>
                </section>

                <!-- RIGHT: REGISTRATION FORM -->
                <section class="form-panel">
                    <div class="form-icon">&#128100;</div>

                    <h2 class="form-heading">
                        Create <span>Account</span>
                    </h2>

                    <p class="form-subtitle">
                        Join us today. Your next opportunity awaits.
                    </p>

                    <div class="field-group">
                        <label class="field-label" for="txtFullName">
                            <span class="field-icon">&#128100;</span>
                            Full Name
                        </label>

                        <asp:TextBox ID="txtFullName" runat="server"
                            CssClass="form-input"
                            placeholder="Enter your full name"
                            MaxLength="100" />
                    </div>

                    <div class="field-group">
                        <label class="field-label" for="txtEmail">
                            <span class="field-icon">&#9993;</span>
                            Email Address
                        </label>

                        <asp:TextBox ID="txtEmail" runat="server"
                            TextMode="Email"
                            CssClass="form-input"
                            placeholder="you@example.com"
                            MaxLength="100" />
                    </div>

                    <div class="field-group">
                        <label class="field-label" for="txtPassword">
                            <span class="field-icon">&#128274;</span>
                            Password
                        </label>

                        <div class="input-wrap">
                            <asp:TextBox ID="txtPassword" runat="server"
                                TextMode="Password"
                                CssClass="form-input password-input"
                                placeholder="Create a strong password"
                                MaxLength="100" />

                            <button type="button"
                                class="password-toggle"
                                aria-label="Show or hide password"
                                onclick="togglePassword()">
                                &#128065;
                            </button>
                        </div>
                    </div>

                    <div class="field-group">
                        <label class="field-label" for="ddlRole">
                            <span class="field-icon">&#128188;</span>
                            I want to join as
                        </label>

                        <asp:DropDownList ID="ddlRole" runat="server"
                            CssClass="form-input">
                            <asp:ListItem Value="">Select your role</asp:ListItem>
                            <asp:ListItem Value="Candidate">Candidate - Find Jobs</asp:ListItem>
                            <asp:ListItem Value="Recruiter">Recruiter - Hire Talent</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="message"
                        EnableViewState="false"
                        role="status" />

                    <asp:Button ID="btnRegister" runat="server"
                        Text="Create My Account  →"
                        CssClass="register-button"
                        OnClick="btnRegister_Click" />

                    <div class="login-note">
                        Already have an account?
                        <a href="Login.aspx">Sign in here</a>
                    </div>
                </section>

            </div>

            <!-- TRUST HIGHLIGHTS -->
            <div class="trust-row">
                <div class="trust-item">
                    <strong>&#128274; Privacy Matters</strong>
                    <span>Your account deserves protection</span>
                </div>

                <div class="trust-item">
                    <strong>&#9889; Simple Registration</strong>
                    <span>Get started in just a few steps</span>
                </div>

                <div class="trust-item">
                    <strong>&#127919; Career Opportunities</strong>
                    <span>Take your next step with confidence</span>
                </div>
            </div>
        </main>

        <footer class="footer">
            &copy; <%= DateTime.Now.Year %> CareerConnect
            &nbsp; | &nbsp; Find Jobs. Build Your Future.
        </footer>

        <script>
            function togglePassword() {
                var password = document.getElementById(
                    '<%= txtPassword.ClientID %>'
                );

                if (password) {
                    password.type =
                        password.type === "password"
                            ? "text"
                            : "password";
                }
            }
        </script>

    </form>
</body>
</html>

