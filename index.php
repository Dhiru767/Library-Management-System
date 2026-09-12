<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>

    <link rel="icon" type="image/png" href="img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f4f6f9;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: auto;
        }

        /* ================= HEADER ================= */
        .site-header {
            background: #1e3a8a;
            color: #fff;
            padding: 15px 0;
        }

        .header-bar {
            display: flex;
            align-items: center;
        }

        .site-logo img {
            width: 70px;
        }

        .highlight {
            color: #ffd166;
            font-weight: 500;
        }

        .sub-text {
            font-size: 14px;
            opacity: 0.9;
        }

        .main-navigation ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .main-navigation a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
        }

        .main-navigation a:hover {
            text-decoration: underline;
        }

        /* ================= HERO SECTION ================= */
        .hero-section {
            background: #fff;
            padding: 60px 0;
        }

        .hero-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            flex-wrap: wrap;
        }

        .hero-text {
            flex: 1;
        }

        .hero-text h2 {
            font-size: 32px;
            color: #1e3a8a;
            margin-bottom: 15px;
        }

        .hero-text p {
            font-size: 16px;
            line-height: 1.7;
        }

        /* IMAGE */
        .hero-image {
            flex: 1;
            text-align: right;
        }

        .hero-image img {
            width: 320px; /* medium size */
            max-width: 100%;
            height: auto;
        }

        /* BUTTON BELOW HERO */
        .hero-btn {
            margin-top: 30px;
            text-align: center;
        }

        .hero-btn a {
            background: #1e3a8a;
            color: #fff;
            padding: 12px 28px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .hero-btn a:hover {
            background: #163172;
        }

        /* ================= FOOTER ================= */
        .site-footer {
            background: #1e3a8a;
            color: #fff;
            padding: 20px 0;
            margin-top: 40px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .footer-links ul {
            list-style: none;
            display: flex;
            gap: 15px;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        /* ================= RESPONSIVE ================= */
        @media (max-width: 900px) {
            .hero-content {
                flex-direction: column;
                text-align: center;
            }

            .hero-image {
                text-align: center;
            }
        }
    </style>
</head>

<body>
<div id="wrapper">

<!-- ================= HEADER ================= -->
<header class="site-header">
    <div class="container header-bar">

        <div class="site-logo">
            <img src="img/logo.png" alt="Library Logo">
        </div>

        <div style="text-align:center; flex:1;">
            <h1>Library Management System</h1>
            <span class="highlight">Step into a world of knowledge</span><br>
            <span class="sub-text">Welcome to our library</span>
        </div>

        <nav class="main-navigation">
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="login.php">My Books</a></li>
                <li><a href="login.php">Login</a></li>
            </ul>
        </nav>

    </div>
</header>

<!-- ================= MAIN ================= -->
<main class="site-main">

<section class="hero-section">
    <div class="container">

        <div class="hero-content">
            <div class="hero-text">
                <h2>“Discover Today, Lead Tomorrow.”</h2>
                <p>
                    The Public Library Initiative stands for the belief that knowledge is a common right,
                    not a privilege. We are committed to building a free, inclusive, and publicly owned
                    library system that welcomes everyone.
                </p>
            </div>

            <div class="hero-image">
                <img src="img/library-hero.png" alt="Library Image">
            </div>
        </div>

        <!-- BUTTON BELOW HERO CONTENT -->
        <div class="hero-btn">
            <a href="login.php">Get Started</a>
        </div>

    </div>
</section>

</main>

<!-- ================= FOOTER ================= -->
<footer class="site-footer">
    <div class="container">
        <div class="footer-content">
            <p>&copy; 2026 Library Management System</p>
            <div class="footer-links">
                <ul>
                    <li><a href="about.php">About</a></li>
                    <li><a href="readme.php">Read Me</a></li>
                    <li><a href="policy.php">Policy</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</div>
</body>
</html>
