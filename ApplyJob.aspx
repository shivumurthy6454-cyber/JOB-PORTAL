

<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ApplyJob.aspx.cs"
    Inherits="JOB_PORTAL.ApplyJob" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Apply for a Job | CareerConnect</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #292544;
            background:
                radial-gradient(circle at 10% 0%, #eee8ff 0, transparent 30%),
                #f6f7fc;
        }

        a { text-decoration: none; }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 17px 6%;
            color: white;
            background: linear-gradient(110deg, #251b4b, #6142c6);
            box-shadow: 0 8px 24px #32205d20;
        }

        .brand {
            color: white;
            font-size: 21px;
            font-weight: 850;
        }

        .brand span { color: #c4b5fd; }

        .back-link {
            padding: 10px 14px;
            border: 1px solid #ffffff42;
            border-radius: 10px;
            color: white;
            font-size: 12px;
            font-weight: 750;
            transition: .2s;
        }

        .back-link:hover { background: #ffffff18; }

        .page {
            width: min(100% - 30px, 1040px);
            margin: 38px auto;
        }

        .intro {
            margin-bottom: 23px;
            text-align: center;
        }

        .eyebrow {
            color: #7657f6;
            font-size: 10px;
            font-weight: 850;
            letter-spacing: 1.8px;
        }

        h1 {
            margin: 10px 0;
            font-size: clamp(27px, 4vw, 38px);
            letter-spacing: -1.1px;
        }

        .intro p {
            max-width: 530px;
            margin: 0 auto;
            color: #85859e;
            font-size: 13px;
            line-height: 1.8;
        }

        .form-layout {
            display: grid;
            grid-template-columns: .8fr 1.4fr;
            overflow: hidden;
            border: 1px solid #e8e6f2;
            border-radius: 24px;
            background: white;
            box-shadow: 0 20px 55px #30215f12;
        }

        .side-panel {
            position: relative;
            overflow: hidden;
            padding: 35px 28px;
            color: white;
            background: linear-gradient(155deg, #30205e, #6745d0 70%, #8a6bfa);
        }

        .side-panel::after {
            position: absolute;
            right: -65px;
            bottom: -65px;
            width: 200px;
            height: 200px;
            border: 1px solid #ffffff35;
            border-radius: 50%;
            box-shadow: 0 0 0 25px #ffffff0a,
                        0 0 0 50px #ffffff08;
            content: "";
        }

        .side-symbol {
            display: grid;
            place-items: center;
            width: 57px;
            height: 57px;
            margin-bottom: 25px;
            border: 1px solid #ffffff35;
            border-radius: 17px;
            background: #ffffff18;
            font-size: 27px;
        }

        .side-panel h2 {
            margin: 0 0 12px;
            font-size: 25px;
            line-height: 1.3;
        }

        .side-panel > p {
            color: #e3dcff;
            font-size: 12px;
            line-height: 1.9;
        }

        .benefit {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-top: 23px;
            color: #f0ebff;
            font-size: 12px;
            line-height: 1.7;
        }

        .check {
            display: grid;
            place-items: center;
            width: 24px;
            height: 24px;
            flex-shrink: 0;
            border-radius: 8px;
            color: white;
            background: #ffffff20;
        }

        .form-panel { padding: 33px; }

        .form-panel h2 {
            margin: 0 0 7px;
            font-size: 22px;
        }

        .form-description {
            margin: 0 0 25px;
            color: #85859e;
            font-size: 12px;
            line-height: 1.7;
        }

        .field { margin-bottom: 18px; }

        .field label {
            display: block;
            margin-bottom: 8px;
            color: #3b3556;
            font-size: 12px;
            font-weight: 800;
        }

        .required { color: #e05d7a; }

        .control {
            display: block;
            width: 100%;
            min-height: 46px;
            padding: 12px 13px;
            border: 1px solid #e5e3f0;
            border-radius: 11px;
            outline: none;
            color: #30294d;
            background: #fdfdff;
            font-family: inherit;
            font-size: 13px;
            transition: border-color .2s, box-shadow .2s;
        }

        .control:focus {
            border-color: #8b72f7;
            box-shadow: 0 0 0 4px #7657f615;
        }

        textarea.control {
            min-height: 115px;
            resize: vertical;
        }

        .help {
            display: block;
            margin-top: 7px;
            color: #9291a6;
            font-size: 10px;
            line-height: 1.6;
        }

        .submit {
            width: 100%;
            min-height: 48px;
            margin-top: 3px;
            border: 0;
            border-radius: 12px;
            color: white;
            background: linear-gradient(110deg, #7657f6, #5c3acb);
            box-shadow: 0 9px 20px #7657f630;
            font-family: inherit;
            font-size: 13px;
            font-weight: 850;
            cursor: pointer;
            transition: transform .2s, box-shadow .2s;
        }

        .submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 13px 24px #7657f640;
        }

        .message {
            display: block;
            margin: 0 0 17px;
            color: #b42345;
            font-size: 12px;
            font-weight: 700;
            line-height: 1.7;
        }

        .bottom-note {
            margin-top: 17px;
            color: #9291a6;
            font-size: 10px;
            line-height: 1.8;
            text-align: center;
        }

        @media(max-width: 720px) {
            .form-layout { grid-template-columns: 1fr; }
            .side-panel { padding: 26px; }
            .side-panel h2 { font-size: 22px; }
            .form-panel { padding: 25px 20px; }
            .page { margin: 27px auto; }
        }

        @media(prefers-reduced-motion: reduce) {
            *, *::before, *::after { transition: none !important; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <header class="navbar">
        <a href="Dashboard.aspx" class="brand">
            &#10022; Career<span>Connect</span>
        </a>
        <a href="Jobs.aspx" class="back-link">
            &#8592; Browse Jobs
        </a>
    </header>

    <main class="page">

        <section class="intro">
            <div class="eyebrow">YOUR NEXT CHAPTER STARTS HERE</div>
            <h1>Take the next step in your career.</h1>
            <p>
                Choose an opportunity, share your details, and submit
                your application through CareerConnect.
            </p>
        </section>

        <div class="form-layout">

            <aside class="side-panel">
                <div class="side-symbol">&#128188;</div>
                <h2>Your future deserves a great opportunity.</h2>
                <p>
                    Make your next move with confidence. Complete your
                    application carefully and provide accurate contact
                    information.
                </p>

                <div class="benefit">
                    <span class="check">&#10003;</span>
                    <span><strong>Choose your role</strong><br />
                    Select the job you want to apply for.</span>
                </div>

                <div class="benefit">
                    <span class="check">&#10003;</span>
                    <span><strong>Share your details</strong><br />
                    Provide your name and contact information.</span>
                </div>

                <div class="benefit">
                    <span class="check">&#10003;</span>
                    <span><strong>Submit with confidence</strong><br />
                    Review your information before sending.</span>
                </div>
            </aside>

            <section class="form-panel">
                <h2>Job Application</h2>
                <p class="form-description">
                    Complete the required fields marked with an asterisk.
                </p>

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="message" EnableViewState="false" />

                <div class="field">
                    <label for="ddlJob">Select Job <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlJob" runat="server"
                        CssClass="control" />
                    <span class="help">
                        Choose the position you would like to apply for.
                    </span>
                </div>

                <div class="field">
                    <label for="txtFullName">Full Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtFullName" runat="server"
                        CssClass="control" MaxLength="100"
                        placeholder="Enter your full name" />
                </div>

                <div class="field">
                    <label for="txtEmail">Email Address <span class="required">*</span></label>
                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="control" TextMode="Email"
                        MaxLength="150"
                        placeholder="you@example.com" />
                </div>

                <div class="field">
                    <label for="txtPhone">Phone Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtPhone" runat="server"
                        CssClass="control" TextMode="Phone"
                        MaxLength="20"
                        placeholder="Enter your phone number" />
                </div>

                <div class="field">
                    <label for="txtCoverLetter">Cover Letter</label>
                    <asp:TextBox ID="txtCoverLetter" runat="server"
                        CssClass="control" TextMode="MultiLine"
                        MaxLength="3000"
                        placeholder="Tell the employer why you are suitable for this role..." />
                    <span class="help">
                        Briefly describe your skills, interest, and suitability.
                    </span>
                </div>

                <asp:Button ID="btnApply" runat="server"
                    Text="Submit Application  →"
                    CssClass="submit"
                    CausesValidation="false"
                    OnClick="btnApply_Click" />

                <div class="bottom-note">
                    Please ensure your information is accurate before submitting.
                </div>
            </section>

        </div>
    </main>

</form>
</body>
</html>
