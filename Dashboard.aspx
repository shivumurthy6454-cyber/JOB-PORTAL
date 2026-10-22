
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="JOB_PORTAL.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard | CareerConnect</title>

    <style>



        :root {
            --purple: #7657f6;
            --dark: #241b49;
            --muted: #85859e;
            --line: #eaeaf4;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            color: #272342;
            background: #f6f7fc;
        }

        a { text-decoration: none; }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            position: sticky;
            top: 0;
            display: flex;
            flex-direction: column;
            width: 250px;
            height: 100vh;
            flex-shrink: 0;
            padding: 25px 16px;
            color: white;
            background: linear-gradient(165deg, #21183f, #49318b 75%, #30205d);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 5px 8px 38px;
            color: white;
            font-size: 21px;
            font-weight: 850;
        }

        .brand-mark {
            display: grid;
            place-items: center;
            width: 39px;
            height: 39px;
            border-radius: 13px;
            background: linear-gradient(135deg, #a78bfa, #7253f5);
            box-shadow: 0 7px 20px #7657f650;
        }

        .brand-name span { color: #c4b5fd; }

        .nav-label {
            margin: 0 10px 13px;
            color: #bcb2dd;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 1.5px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 11px;
            margin-bottom: 7px;
            padding: 12px;
            border: 1px solid transparent;
            border-radius: 12px;
            color: #e4def7;
            font-size: 12px;
            font-weight: 650;
            transition: .22s;
        }

        .nav-icon {
            display: grid;
            place-items: center;
            width: 29px;
            height: 29px;
            border-radius: 9px;
            background: #ffffff12;
            font-size: 16px;
        }

        .nav-link:hover, .nav-link.active {
            color: white;
            background: linear-gradient(110deg, #8061f6, #6947df);
            box-shadow: 0 7px 20px #08051c24;
            transform: translateX(3px);
        }

        .sidebar-spacer { flex: 1; min-height: 20px; }

        .sidebar-note {
            padding: 17px;
            border: 1px solid #ffffff20;
            border-radius: 16px;
            background: #ffffff0b;
        }

        .sidebar-note strong {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
        }

        .sidebar-note p {
            margin: 0;
            color: #d1c8ef;
            font-size: 11px;
            line-height: 1.8;
        }

        .main {
            flex: 1;
            min-width: 0;
            padding: 29px 32px;
        }

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 17px;
            margin-bottom: 26px;
        }

        .eyebrow {
            color: var(--purple);
            font-size: 10px;
            font-weight: 850;
            letter-spacing: 1.7px;
        }

        h1 {
            margin: 8px 0 6px;
            font-size: clamp(25px, 3vw, 34px);
            font-weight: 850;
            letter-spacing: -1px;
        }

        .muted {
            color: var(--muted);
            font-size: 12px;
            line-height: 1.7;
        }

        .user-area {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px;
            border: 1px solid var(--line);
            border-radius: 15px;
            background: white;
        }

        .avatar {
            display: grid;
            place-items: center;
            width: 42px;
            height: 42px;
            border-radius: 13px;
            color: #6848dc;
            background: #e9e2ff;
            font-size: 19px;
        }

        .user-name {
            max-width: 145px;
            overflow: hidden;
            color: #30264e;
            font-size: 12px;
            font-weight: 800;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .logout {
            padding: 10px 12px;
            border: 1px solid #e6e1f4;
            border-radius: 10px;
            color: #6044bd;
            background: white;
            font-size: 11px;
            font-weight: 800;
            cursor: pointer;
            transition: .2s;
        }

        .logout:hover {
            color: white;
            background: var(--purple);
        }

        /* Hero banner */
        .hero {
            position: relative;
            isolation: isolate;
            overflow: hidden;
            padding: 36px;
            border-radius: 24px;
            color: white;
            background: linear-gradient(115deg, #29204f, #5336ac 58%, #8565fa);
            box-shadow: 0 16px 35px #4c329f25;
        }

        .hero::after {
            position: absolute;
            z-index: -1;
            top: -105px;
            right: -35px;
            width: 270px;
            height: 270px;
            border: 1px solid #ffffff30;
            border-radius: 50%;
            box-shadow: 0 0 0 30px #ffffff0a,
                        0 0 0 60px #ffffff07;
            content: "";
        }

        .hero-tag {
            display: inline-block;
            padding: 8px 12px;
            border: 1px solid #ffffff30;
            border-radius: 30px;
            color: #f1eaff;
            background: #ffffff10;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: 1.2px;
        }

        .hero h2 {
            max-width: 570px;
            margin: 19px 0 12px;
            font-size: clamp(29px, 3.6vw, 42px);
            font-weight: 850;
            letter-spacing: -1.4px;
            line-height: 1.18;
        }

        .hero h2 span { color: #d6caff; }

        .hero p {
            max-width: 490px;
            margin: 0;
            color: #e2dcff;
            font-size: 13px;
            line-height: 1.9;
        }

        .hero-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 11px;
            margin-top: 24px;
        }

        .hero-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            padding: 13px 17px;
            border: 1px solid transparent;
            border-radius: 11px;
            font-size: 11px;
            font-weight: 850;
            transition: .22s;
        }

        .hero-btn:hover { transform: translateY(-3px); }

        .hero-btn.primary {
            color: #48328d;
            background: white;
        }

        .hero-btn.secondary {
            color: white;
            border-color: #ffffff45;
            background: #ffffff0c;
        }

        .section-heading {
            display: flex;
            align-items: end;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
            margin: 32px 0 16px;
        }

        .section-heading h2 {
            margin: 0 0 5px;
            font-size: 20px;
            letter-spacing: -.4px;
        }

        .section-heading p {
            margin: 0;
            color: var(--muted);
            font-size: 11px;
            line-height: 1.7;
        }

        .section-chip {
            padding: 7px 10px;
            border: 1px solid #e6e0ff;
            border-radius: 30px;
            color: #7352dd;
            background: #f0ecff;
            font-size: 9px;
            font-weight: 800;
        }

        /* Statistics */
        .stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px;
        }

        .stat {
            min-width: 0;
            padding: 21px;
            border: 1px solid var(--line);
            border-radius: 18px;
            background: white;
            box-shadow: 0 7px 23px #29204b05;
            transition: .25s;
        }

        .stat:hover {
            transform: translateY(-4px);
            box-shadow: 0 14px 28px #29204b0c;
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
        }

        .stat-icon {
            display: grid;
            place-items: center;
            width: 44px;
            height: 44px;
            border-radius: 13px;
            font-size: 20px;
        }

        .purple { color: #7654e8; background: #eee9ff; }
        .teal { color: #098b83; background: #def8f2; }
        .orange { color: #d7822c; background: #fff0df; }

        .stat-caption {
            color: #a0a0b3;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: .8px;
        }

        .stat-number {
            display: block;
            margin: 16px 0 6px;
            color: #262342;
            font-size: 34px;
            font-weight: 850;
            letter-spacing: -1px;
            overflow-wrap: anywhere;
        }

        .stat-description {
            color: var(--muted);
            font-size: 11px;
            line-height: 1.7;
        }

        /* Action cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 17px;
        }

        .action-card {
            --accent: #7657f6;
            --soft: #f0edff;
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            min-height: 245px;
            padding: 21px;
            overflow: hidden;
            border: 1px solid var(--line);
            border-radius: 19px;
            color: #272342;
            background: white;
            box-shadow: 0 7px 23px #29204b05;
            transition: transform .25s, box-shadow .25s, border-color .25s;
        }

        .action-card::after {
            position: absolute;
            top: -45px;
            right: -45px;
            width: 115px;
            height: 115px;
            border-radius: 50%;
            background: var(--soft);
            content: "";
            opacity: .85;
            transition: transform .3s;
        }

        .action-card:hover {
            transform: translateY(-6px);
            border-color: var(--accent);
            box-shadow: 0 17px 34px #30215f12;
        }

        .action-card:hover::after { transform: scale(1.2); }

        .action-card.teal-card {
            --accent: #2ab6a5;
            --soft: #dff9f3;
        }

        .action-card.blue-card {
            --accent: #5e9df5;
            --soft: #e4efff;
        }

        .action-card.orange-card {
            --accent: #f0a44f;
            --soft: #fff0dc;
        }

        .action-card.pink-card {
            --accent: #e783b2;
            --soft: #ffebf4;
        }

        .action-top {
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }

        .action-icon {
            display: grid;
            place-items: center;
            width: 49px;
            height: 49px;
            border-radius: 15px;
            color: var(--accent);
            background: var(--soft);
            font-size: 23px;
            transition: transform .25s;
        }

        .action-card:hover .action-icon {
            transform: rotate(-5deg) scale(1.06);
        }

        .action-badge {
            padding: 6px 8px;
            border-radius: 30px;
            color: #6e54cb;
            background: #f2efff;
            font-size: 8px;
            font-weight: 850;
            letter-spacing: .6px;
        }

        .action-card h3 {
            margin: 20px 0 8px;
            font-size: 17px;
            font-weight: 850;
        }

        .action-card p {
            flex: 1;
            margin: 0;
            color: #818198;
            font-size: 11px;
            line-height: 1.9;
        }

        .action-link {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
            margin-top: 19px;
            padding-top: 14px;
            border-top: 1px solid #efedf6;
            color: var(--accent);
            font-size: 11px;
            font-weight: 850;
        }

        .arrow {
            display: grid;
            place-items: center;
            width: 29px;
            height: 29px;
            border-radius: 50%;
            background: var(--soft);
            font-size: 16px;
            transition: transform .25s;
        }

        .action-card:hover .arrow { transform: translate(3px, -2px); }

        .footer {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 34px;
            padding-top: 19px;
            border-top: 1px solid #e7e6f0;
            color: #9393a7;
            font-size: 10px;
        }

        .footer strong { color: #7253dc; }

        @media(max-width: 1200px) {
            .sidebar { width: 225px; }
            .main { padding: 24px; }
            .cards { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }

        @media(max-width: 900px) {
            .layout { display: block; }
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 18px;
                overflow: visible;
            }
            .brand { margin: 0 5px 19px; }
            .sidebar nav {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 5px;
            }
            .nav-link { margin: 0; }
            .sidebar-spacer, .sidebar-note { display: none; }
            .main { padding: 22px; }
        }

        @media(max-width: 600px) {
            .main { padding: 17px 13px; }
            .sidebar { padding: 17px 12px; }
            .nav-link { padding: 10px 7px; gap: 7px; font-size: 11px; }
            .topbar { align-items: flex-start; }
            .user-area { width: 100%; flex-wrap: wrap; }
            .hero { padding: 25px 20px; }
            .hero h2 { font-size: 30px; }
            .hero-actions { flex-direction: column; }
            .hero-btn { width: 100%; }
            .stats, .cards { grid-template-columns: 1fr; }
            .footer { flex-direction: column; }
        }

        @media(prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                transition: none !important;
                scroll-behavior: auto !important;
            }
        }


        
/* ==========================================
   CAREERCONNECT - EXTRA PREMIUM DESIGN
   Add this before the closing tag
   ========================================== */

/* Smooth page appearance */
html {
    scroll-behavior: smooth;
}

body {
    background:
        radial-gradient(ellipse at 90% 5%, #eee9ff 0, transparent 30%),
        radial-gradient(ellipse at 5% 80%, #eaf8ff 0, transparent 27%),
        #f6f7fc;
}

/* Better text rendering */
h1, h2, h3, p, a, span {
    -webkit-font-smoothing: antialiased;
}

/* Sidebar enhancement */
.sidebar {
    box-shadow: 8px 0 35px #25164b12;
}

.brand-mark {
    position: relative;
    overflow: hidden;
    animation: brandGlow 4s ease-in-out infinite;
}

@keyframes brandGlow {
    0%, 100% {
        box-shadow: 0 7px 20px #7657f650;
    }
    50% {
        box-shadow: 0 7px 28px #a78bfa85;
    }
}

.nav-link {
    position: relative;
    overflow: hidden;
}

.nav-link::before {
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        100deg,
        transparent,
        #ffffff12,
        transparent
    );
    content: "";
    transition: left .45s ease;
}

.nav-link:hover::before {
    left: 100%;
}

.nav-icon {
    flex-shrink: 0;
    transition: transform .25s ease;
}

.nav-link:hover .nav-icon {
    transform: scale(1.12) rotate(-4deg);
}

/* Main dashboard entrance */
.main {
    animation: dashboardEnter .55s ease both;
}

@keyframes dashboardEnter {
    from {
        opacity: 0;
        transform: translateY(12px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Header and profile */
.topbar {
    position: relative;
}

.user-area {
    box-shadow: 0 8px 25px #28204b08;
    transition: transform .25s ease, box-shadow .25s ease;
}

.user-area:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 28px #28204b12;
}

.avatar {
    box-shadow: inset 0 0 0 1px #7657f618;
    transition: transform .25s ease;
}

.user-area:hover .avatar {
    transform: rotate(5deg) scale(1.04);
}

.logout:focus-visible,
.nav-link:focus-visible,
.hero-btn:focus-visible,
.action-card:focus-visible {
    outline: 3px solid #b9a7ff;
    outline-offset: 4px;
}

/* Premium hero banner */
.hero {
    border: 1px solid #ffffff20;
    background:
        radial-gradient(circle at 90% 10%, #ffffff20, transparent 27%),
        linear-gradient(115deg, #241b49 0%, #5134a4 57%, #8867ff 100%);
}

.hero::before {
    position: absolute;
    z-index: -1;
    right: 12%;
    bottom: -150px;
    width: 250px;
    height: 250px;
    border: 1px solid #ffffff20;
    border-radius: 50%;
    box-shadow: 0 0 0 25px #ffffff08,
                0 0 0 50px #ffffff05;
    content: "";
}

.hero-tag {
    backdrop-filter: blur(8px);
    box-shadow: inset 0 0 0 1px #ffffff08;
}

.hero h2 {
    text-wrap: balance;
}

.hero p {
    text-wrap: pretty;
}

.hero-btn {
    box-shadow: 0 5px 14px #140b3510;
}

.hero-btn.primary:hover {
    color: #5336ac;
    box-shadow: 0 10px 25px #10072530;
}

.hero-btn.secondary:hover {
    border-color: #ffffff85;
    background: #ffffff20;
}

/* Section heading details */
.section-heading h2 {
    position: relative;
}

.section-heading h2::after {
    display: block;
    width: 35px;
    height: 3px;
    margin-top: 9px;
    border-radius: 5px;
    background: linear-gradient(90deg, #7657f6, #b6a4ff);
    content: "";
}

.section-chip {
    box-shadow: 0 4px 12px #7657f60b;
}

/* Statistics cards */
.stat {
    position: relative;
    overflow: hidden;
}

.stat::before {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 3px;
    background: linear-gradient(90deg, #7657f6, #b7a5ff);
    content: "";
    transform: scaleX(0);
    transform-origin: left;
    transition: transform .3s ease;
}

.stat:hover::before {
    transform: scaleX(1);
}

.stat-icon {
    transition: transform .3s ease;
}

.stat:hover .stat-icon {
    transform: translateY(-3px) rotate(-5deg);
}

.stat-number {
    font-variant-numeric: tabular-nums;
}

/* Extra depth for action cards */
.action-card {
    isolation: isolate;
}

.action-card::before {
    position: absolute;
    z-index: -1;
    inset: 0;
    border-radius: inherit;
    background: linear-gradient(145deg, #ffffff, #faf9ff);
    content: "";
    opacity: 0;
    transition: opacity .3s ease;
}

.action-card:hover::before {
    opacity: 1;
}

.action-card h3 {
    transition: color .2s ease;
}

.action-card:hover h3 {
    color: var(--accent);
}

.action-badge {
    border: 1px solid #7657f612;
}

.action-link {
    transition: border-color .25s ease;
}

.action-card:hover .action-link {
    border-color: #e1dafb;
}

.arrow {
    flex-shrink: 0;
}

/* Recruiter panels keep their existing server-side visibility */
#quickActions {
    scroll-margin-top: 25px;
}

/* Footer polish */
.footer {
    line-height: 1.8;
}

.footer strong {
    letter-spacing: .2px;
}

/* More comfortable selection color */
::selection {
    color: #30204f;
    background: #ddd4ff;
}

/* Custom scrollbar */
* {
    scrollbar-width: thin;
    scrollbar-color: #c7baf7 #f6f7fc;
}

*::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

*::-webkit-scrollbar-track {
    background: #f6f7fc;
}

*::-webkit-scrollbar-thumb {
    border: 2px solid #f6f7fc;
    border-radius: 10px;
    background: #c7baf7;
}

*::-webkit-scrollbar-thumb:hover {
    background: #987cf0;
}

/* Tablet improvements */
@media (max-width: 900px) {
    .sidebar {
        box-shadow: 0 8px 25px #25164b12;
    }

    .hero {
        border-radius: 20px;
    }

    .stat,
    .action-card {
        box-shadow: 0 6px 20px #29204b08;
    }
}

/* Small mobile screens */
@media (max-width: 600px) {
    .brand {
        font-size: 20px;
    }

    .hero {
        background:
            radial-gradient(circle at 100% 0%, #ffffff18, transparent 35%),
            linear-gradient(145deg, #241b49, #6947df);
    }

    .section-heading {
        align-items: flex-start;
    }

    .stat,
    .action-card {
        border-radius: 16px;
    }

    .user-area {
        gap: 9px;
    }
}

/* Respect users who prefer reduced motion */
@media (prefers-reduced-motion: reduce) {
    html {
        scroll-behavior: auto;
    }

    .main,
    .brand-mark {
        animation: none !important;
    }

    *,
    *::before,
    *::after {
        transition-duration: .01ms !important;
    }
}





    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="layout">

    <aside class="sidebar">
        <a href="Dashboard.aspx" class="brand">
            <span class="brand-mark">&#10022;</span>
            <span class="brand-name">Career<span>Connect</span></span>
        </a>

        <p class="nav-label">YOUR WORKSPACE</p>

        <nav>
            <a href="Dashboard.aspx" class="nav-link active">
                <span class="nav-icon">&#9638;</span> Dashboard
            </a>

            <!-- Explore opens the job listing page -->
            <a href="Jobs.aspx" class="nav-link">
                <span class="nav-icon">&#128269;</span> Explore Jobs
            </a>

            <!-- Apply opens its own page -->
            <a href="ApplyJob.aspx" class="nav-link">
                <span class="nav-icon">&#128221;</span> Apply for a Job
            </a>

            <asp:HyperLink ID="navPostJob" runat="server"
                NavigateUrl="PostJob.aspx" CssClass="nav-link">
                <span class="nav-icon">&#128188;</span> Post a Job
            </asp:HyperLink>
            
                
            <asp:HyperLink ID="navApplications" runat="server"
                NavigateUrl="Applications.aspx" CssClass="nav-link">
                <span class="nav-icon">&#128203;</span> Applications
            </asp:HyperLink>

            <a href="Register.aspx" class="nav-link">
                <span class="nav-icon">&#128100;</span> Register Account
            </a>
        </nav>

        <div class="sidebar-spacer"></div>

        <div class="sidebar-note">
            <strong>&#10024; Your future starts here</strong>
            <p>
                Discover opportunities, grow your career, and connect
                with the right people through CareerConnect.
            </p>
        </div>
    </aside>

    <main class="main">

        <header class="topbar">
            <div>
                <div class="eyebrow">YOUR CAREER WORKSPACE</div>
                <h1>Welcome to your Dashboard</h1>
                <div class="muted">
                    Your next opportunity could be just one click away.
                </div>
            </div>

            <div class="user-area">
                <div class="avatar">&#128100;</div>
                <div>
                    <div class="muted">Signed in as</div>
                    <div class="user-name">
                        <asp:Label ID="lblUser" runat="server" />
                    </div>
                </div>
                <asp:Button ID="btnLogout" runat="server"
                    Text="Logout &#8594;" CssClass="logout"
                    CausesValidation="false"
                    OnClick="btnLogout_Click" />
            </div>
        </header>

        <section class="hero">
            <div class="hero-tag">&#10022; YOUR NEXT OPPORTUNITY AWAITS</div>
            <h2>Great careers begin with the <span>right connection.</span></h2>
            <p>
                Discover exciting opportunities, find roles that match your
                ambitions, and take the next step toward a brighter future.
            </p>

            <div class="hero-actions">
                <a href="Jobs.aspx" class="hero-btn primary">
                    Explore Opportunities &#8599;
                </a>
                <a href="ApplyJob.aspx" class="hero-btn secondary">
                    Apply for a Job &#8599;
                </a>
            </div>
        </section>

        










        <div class="section-heading">
            <div>
                <h2>Your Portal Overview</h2>
                <p>A quick look at the CareerConnect community.</p>
            </div>
            <span class="section-chip">PORTAL INSIGHTS</span>
        </div>

        <section class="stats">
            <article class="stat">
                <div class="stat-top">
                    <div class="stat-icon purple">&#128188;</div>
                    <span class="stat-caption">OPPORTUNITIES</span>
                </div>
                <span class="stat-number">
                    <asp:Label ID="lblTotalJobs" runat="server" Text="0" />
                </span>
                <div class="stat-description">Currently active job openings</div>
            </article>

            <article class="stat">
                <div class="stat-top">
                    <div class="stat-icon teal">&#128221;</div>
                    <span class="stat-caption">APPLICATIONS</span>
                </div>
                <span class="stat-number">
                    <asp:Label ID="lblTotalApplications"
                        runat="server" Text="0" />
                </span>
                <div class="stat-description">Applications submitted on the portal</div>
            </article>

            <article class="stat">
                <div class="stat-top">
                    <div class="stat-icon orange">&#128101;</div>
                    <span class="stat-caption">COMMUNITY</span>
                </div>
                <span class="stat-number">
                    <asp:Label ID="lblTotalUsers" runat="server" Text="0" />
                </span>
                <div class="stat-description">Registered active accounts</div>
            </article>


        </section>

        <div class="section-heading" id="quickActions">
            <div>
                <h2>Make Your Next Move</h2>
                <p>Everything you need to move forward, all in one place.</p>
            </div>
        </div>

        <section class="cards">

            <a href="Jobs.aspx" class="action-card">
                <div class="action-top">
                    <div class="action-icon">&#128269;</div>
                    <span class="action-badge">DISCOVER</span>
                </div>
                <h3>Explore Jobs</h3>
                <p>
                    Discover openings, explore different roles, and find
                    opportunities that match your skills.
                </p>
                <div class="action-link">
                    <span>Browse available jobs</span><span class="arrow">&#8599;</span>
                </div>
            </a>

            <a href="ApplyJob.aspx" class="action-card teal-card">
                <div class="action-top">
                    <div class="action-icon">&#128221;</div>
                    <span class="action-badge">TAKE ACTION</span>
                </div>
                <h3>Apply for a Job</h3>
                <p>
                    Open the application page, select a job, and submit
                    your details to apply.
                </p>
                <div class="action-link">
                    <span>Open application page</span><span class="arrow">&#8599;</span>
                </div>
            </a>

            <asp:Panel ID="pnlRecruiterPost" runat="server"
                CssClass="action-card blue-card" Visible="false">
                <div class="action-top">
                    <div class="action-icon">&#128188;</div>
                    <span class="action-badge">RECRUITERS</span>
                </div>
                <h3>Post a Job</h3>
                <p>Create a new opening and connect with potential candidates.</p>
                <div class="action-link">
                    <span>Create a job listing</span><span class="arrow">&#8599;</span>
                </div>
                <a href="PostJob.aspx" aria-label="Create a job listing"
                   style="position:absolute;inset:0;z-index:2"></a>
            </asp:Panel>

            <asp:Panel ID="pnlRecruiterApplications" runat="server"
                CssClass="action-card orange-card" Visible="false">
                <div class="action-top">
                    <div class="action-icon">&#128203;</div>
                    <span class="action-badge">CANDIDATES</span>
                </div>
                <h3>Manage Applications</h3>
                <p>Review applications and keep track of candidates.</p>
                <div class="action-link">
                    <span>Review applications</span><span class="arrow">&#8599;</span>
                </div>
                <a href="Applications.aspx" aria-label="Review applications"
                   style="position:absolute;inset:0;z-index:2"></a>
            </asp:Panel>

            <a href="Register.aspx" class="action-card pink-card">
                <div class="action-top">
                    <div class="action-icon">&#128100;</div>
                    <span class="action-badge">GET STARTED</span>
                </div>
                <h3>Register Account</h3>
                <p>Create an account to join the CareerConnect community.</p>
                <div class="action-link">
                    <span>Open registration</span><span class="arrow">&#8599;</span>
                </div>
            </a>

        </section>

        <footer class="footer">
            <span>&copy; 2026 <strong>CareerConnect</strong>. All rights reserved.</span>
            <span>Connecting talent with opportunity &#10022;</span>
        </footer>

    </main>
</div>

</form>
</body>
</html>

