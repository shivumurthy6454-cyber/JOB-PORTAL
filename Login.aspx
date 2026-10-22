
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="JobPortal.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>CareerConnect | Login</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com"
        crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet" />
</head>

<body class="login-page">
<form id="form1" runat="server">

    <main class="login-layout">

        <!-- Left branding section -->
        <section class="brand-panel">

            <a href="Login.aspx" class="brand-logo">
                <span class="brand-icon">J</span>
                CareerConnect
            </a>

            <div class="brand-content">
                <span class="eyebrow">
                    YOUR CAREER. YOUR FUTURE.
                </span>

                <h1>
                    Find a job you
                    <span>love doing.</span>
                </h1>

                <p>
                    Discover new opportunities, connect with
                    employers, and take the next step in your
                    professional journey.
                </p>

                <div class="benefit">
                    <span class="benefit-icon">&#10003;</span>
                    Find opportunities that match your skills
                </div>

                <div class="benefit">
                    <span class="benefit-icon">&#10003;</span>
                    Connect with potential employers
                </div>

                <div class="benefit">
                    <span class="benefit-icon">&#10003;</span>
                    Build your future with confidence
                </div>
            </div>

            <div class="brand-footer">
                Your next chapter starts today.
            </div>

        </section>

        <!-- Right login section -->
        <section class="form-panel">

            <div class="login-card">

                <div class="mobile-brand">
                    <span class="brand-icon">J</span>
                    CareerConnect
                </div>

                <div class="welcome-icon">
                    &#128075;
                </div>

                <p class="welcome-label">WELCOME BACK</p>

                <h2>Sign in to your account</h2>

                <p class="form-subtitle">
                    Enter your details to continue.
                </p>

                <div class="form-group">
                    <label for="txtEmail">Email address</label>

                    <div class="input-wrapper">
                        <span class="input-icon">&#9993;</span>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            TextMode="Email"
                            CssClass="login-input"
                            placeholder="you@example.com">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password</label>

                    <div class="input-wrapper">
                        <span class="input-icon">&#128274;</span>

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="login-input"
                            placeholder="Enter your password">
                        </asp:TextBox>
                    </div>
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="login-message">
                </asp:Label>

                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Sign In  →"
                    CssClass="login-button"
                    OnClick="btnLogin_Click" />

                <div class="register-section">
                    <span>New to CareerConnect?</span>
                    <a href="Register.aspx">Create an account</a>
                </div>

                <div class="security-note">
                    <span>&#128274;</span>
                    Your career journey starts with a secure sign in.
                </div>

            </div>

            <p class="copyright">
                &copy; 2026 CareerConnect. All rights reserved.
            </p>

        </section>

    </main>

</form>
</body>
</html>
