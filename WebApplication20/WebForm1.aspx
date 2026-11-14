
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication20.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExploreWorld Tours - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:Arial, sans-serif; color:#222; background:#f5f7f8; }

        .navbar {
            background:#72e8c9; padding:15px 6%;
            display:flex; justify-content:space-between;
            align-items:center; flex-wrap:wrap;
        }
        .logo { font-size:25px; font-weight:bold; color:#17202a; }
        .menu { display:flex; gap:25px; list-style:none; }
        .menu a { color:#111; text-decoration:none; font-size:17px; }
        .menu a:hover { color:white; }

        .hero {
            min-height:520px;
            background:linear-gradient(rgba(0,0,0,.48),rgba(0,0,0,.48)),
            url('image/hero.jpg') center/cover no-repeat;
            display:flex; flex-direction:column;
            justify-content:center; align-items:center;
            text-align:center; color:white; padding:30px;
        }
        .hero h1 { font-size:48px; margin-bottom:18px; }
        .hero p { font-size:20px; max-width:700px; line-height:1.6; }
        .btn {
            display:inline-block; background:#72e8c9; color:#111;
            padding:13px 28px; border-radius:7px;
            text-decoration:none; font-weight:bold; margin-top:25px;
        }
        .btn:hover { background:#17202a; color:white; }

        .section { padding:65px 7%; text-align:center; }
        .section h2 { font-size:34px; margin-bottom:15px; }
        .section-intro { color:#666; margin-bottom:35px; }

        .cards {
            display:grid; grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px; max-width:1150px; margin:auto;
        }
        .card {
            background:white; border-radius:12px; overflow:hidden;
            box-shadow:0 5px 18px rgba(0,0,0,.10);
            transition:.3s;
        }
        .card:hover { transform:translateY(-6px); }
        .card img { width:100%; height:210px; object-fit:cover; }
        .card h3 { padding:18px 10px 5px; font-size:22px; }
        .card p { padding:8px 15px; color:#666; line-height:1.5; }
        .card .btn { margin:12px 0 22px; }

        .why { background:#eefaf7; }
        .why-item {
            background:white; padding:25px; border-radius:10px;
            box-shadow:0 4px 12px rgba(0,0,0,.06);
        }
        .why-item h3 { margin-bottom:10px; }

        footer {
            background:#17202a; color:white;
            text-align:center; padding:35px 15px;
        }
        footer p { color:#ccc; margin-top:10px; }

        @media(max-width:650px) {
            .navbar { justify-content:center; gap:15px; }
            .menu { gap:13px; flex-wrap:wrap; justify-content:center; }
            .menu a { font-size:14px; }
            .hero h1 { font-size:34px; }
            .hero p { font-size:16px; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <nav class="navbar">
        <div class="logo">ExploreWorld Tours</div>
        <ul class="menu">
            <li><a href="WebForm1.aspx">Home</a></li>
            <li><a href="Destination.aspx">Destinations</a></li>
            <li><a href="Packages.aspx">Packages</a></li>
            <li><a href="Booking.aspx">Booking</a></li>
        </ul>
    </nav>

    <section class="hero">
        <h1>Discover the Beauty of India</h1>
        <p>Explore amazing destinations, experience different cultures
           and create unforgettable memories with ExploreWorld Tours.</p>
        <a href="Destination.aspx" class="btn">Explore Destinations</a>
    </section>

    <section class="section">
        <h2>Popular Destinations</h2>
        <p class="section-intro">Explore some of India's most beautiful places.</p>

        <div class="cards">
            <div class="card">
                <img src="image/goa.jpg" alt="Goa" />
                <h3>Goa</h3>
                <p>Enjoy beautiful beaches, water sports and nightlife.</p>
                <a href="Packages.aspx" class="btn">View Packages</a>
            </div>

            <div class="card">
                <img src="image/kerala.jpg" alt="Kerala" />
                <h3>Kerala</h3>
                <p>Experience peaceful backwaters and green landscapes.</p>
                <a href="Packages.aspx" class="btn">View Packages</a>
            </div>

            <div class="card">
                <img src="image/kashmir.jpg" alt="Kashmir" />
                <h3>Kashmir</h3>
                <p>Discover mountains, valleys and beautiful lakes.</p>
                <a href="Packages.aspx" class="btn">View Packages</a>
            </div>
        </div>
    </section>

    <section class="section why">
        <h2>Why Choose ExploreWorld Tours?</h2>
        <p class="section-intro">We make every journey comfortable and memorable.</p>

        <div class="cards">
            <div class="why-item">
                <h3>Affordable Packages</h3>
                <p>Enjoy memorable holidays at reasonable prices.</p>
            </div>
            <div class="why-item">
                <h3>Comfortable Travel</h3>
                <p>Plan your trip with convenient travel and stay options.</p>
            </div>
            <div class="why-item">
                <h3>Beautiful Destinations</h3>
                <p>Explore carefully selected destinations across India.</p>
            </div>
        </div>
    </section>

    <footer>
        <h2>ExploreWorld Tours</h2>
        <p>Your journey, our responsibility.</p>
        <p>© 2026 ExploreWorld Tours. All Rights Reserved.</p>
    </footer>

</form>
</body>
</html>
