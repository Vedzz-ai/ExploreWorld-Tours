
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="WebApplication20.Packages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExploreWorld Tours - Packages</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * { margin:0; padding:0; box-sizing:border-box; }

        body {
            font-family:Arial,sans-serif;
            background:#f5f7f8;
            color:#222;
        }

        .navbar {
            background:#72e8c9;
            padding:15px 6%;
            display:flex;
            justify-content:space-between;
            align-items:center;
            flex-wrap:wrap;
        }

        .logo {
            font-size:25px;
            font-weight:bold;
            color:#17202a;
        }

        .menu {
            display:flex;
            gap:25px;
            list-style:none;
        }

        .menu a {
            color:#111;
            text-decoration:none;
            font-size:17px;
        }

        .menu a:hover { color:white; }

        .heading {
            text-align:center;
            padding:55px 20px 35px;
        }

        .heading h1 {
            font-size:38px;
            margin-bottom:15px;
            color:#17202a;
        }

        .heading p {
            color:#666;
            font-size:17px;
            line-height:1.6;
        }

        .package-container {
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(270px,1fr));
            gap:28px;
            padding:20px 7% 65px;
            max-width:1250px;
            margin:auto;
        }

        .package-card {
            background:white;
            border-radius:12px;
            overflow:hidden;
            box-shadow:0 5px 18px rgba(0,0,0,.10);
            transition:.3s;
        }

        .package-card:hover {
            transform:translateY(-6px);
        }

        .package-card img {
            width:100%;
            height:210px;
            object-fit:cover;
        }

        .package-info { padding:20px; }

        .package-info h2 {
            font-size:23px;
            margin-bottom:12px;
            color:#17202a;
        }

        .package-info p {
            color:#666;
            line-height:1.7;
            margin-bottom:7px;
        }

        .price {
            font-size:22px;
            font-weight:bold;
            color:#087e65;
            margin-top:12px;
        }

        .btn {
            display:inline-block;
            background:#72e8c9;
            color:#111;
            padding:11px 22px;
            border-radius:6px;
            text-decoration:none;
            font-weight:bold;
            margin-top:14px;
        }

        .btn:hover {
            background:#17202a;
            color:white;
        }

        footer {
            background:#17202a;
            color:white;
            text-align:center;
            padding:35px 15px;
        }

        footer p { color:#ccc; margin-top:10px; }

        @media(max-width:650px) {
            .navbar { justify-content:center; gap:15px; }
            .menu {
                gap:13px;
                flex-wrap:wrap;
                justify-content:center;
            }
            .menu a { font-size:14px; }
            .heading h1 { font-size:30px; }
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

    <section class="heading">
        <h1>Our Tour Packages</h1>
        <p>Choose your favourite destination and enjoy an unforgettable holiday.</p>
        <p>All prices shown are sample prices per person.</p>
    </section>

    <div class="package-container">

        <div class="package-card">
            <img src="image/goa.jpg" alt="Goa" />
            <div class="package-info">
                <h2>Goa Beach Package</h2>
                <p><b>Duration:</b> 4 Days / 3 Nights</p>
                <p><b>Highlights:</b> Beaches, water sports and sightseeing.</p>
                <p class="price">₹15,000 / person</p>
                <a href="Booking.aspx?place=Goa" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/kerala.jpg" alt="Kerala" />
            <div class="package-info">
                <h2>Kerala Nature Package</h2>
                <p><b>Duration:</b> 5 Days / 4 Nights</p>
                <p><b>Highlights:</b> Backwaters, houseboats and tea gardens.</p>
                <p class="price">₹20,000 / person</p>
                <a href="Booking.aspx?place=Kerala" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/kashmir.jpg" alt="Kashmir" />
            <div class="package-info">
                <h2>Kashmir Paradise Package</h2>
                <p><b>Duration:</b> 6 Days / 5 Nights</p>
                <p><b>Highlights:</b> Dal Lake, gardens and mountain views.</p>
                <p class="price">₹25,000 / person</p>
                <a href="Booking.aspx?place=Kashmir" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/rajasthan.jpg" alt="Rajasthan" />
            <div class="package-info">
                <h2>Rajasthan Royal Package</h2>
                <p><b>Duration:</b> 5 Days / 4 Nights</p>
                <p><b>Highlights:</b> Forts, palaces and desert safari.</p>
                <p class="price">₹18,000 / person</p>
                <a href="Booking.aspx?place=Rajasthan" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/punjab.jpg" alt="Punjab" />
            <div class="package-info">
                <h2>Punjab Culture Package</h2>
                <p><b>Duration:</b> 3 Days / 2 Nights</p>
                <p><b>Highlights:</b> Golden Temple and Punjabi culture.</p>
                <p class="price">₹12,000 / person</p>
                <a href="Booking.aspx?place=Punjab" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/manali.jpg" alt="Manali" />
            <div class="package-info">
                <h2>Manali Adventure Package</h2>
                <p><b>Duration:</b> 5 Days / 4 Nights</p>
                <p><b>Highlights:</b> Snow activities, mountains and adventure.</p>
                <p class="price">₹22,000 / person</p>
                <a href="Booking.aspx?place=Manali" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/aasam.jpg" alt="Assam" />
            <div class="package-info">
                <h2>Assam Nature Package</h2>
                <p><b>Duration:</b> 4 Days / 3 Nights</p>
                <p><b>Highlights:</b> Tea gardens, wildlife and river views.</p>
                <p class="price">₹16,000 / person</p>
                <a href="Booking.aspx?place=Assam" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/meghalaya.jpg" alt="Meghalaya" />
            <div class="package-info">
                <h2>Meghalaya Explorer Package</h2>
                <p><b>Duration:</b> 5 Days / 4 Nights</p>
                <p><b>Highlights:</b> Waterfalls, caves and living root bridges.</p>
                <p class="price">₹19,000 / person</p>
                <a href="Booking.aspx?place=Meghalaya" class="btn">Book Now</a>
            </div>
        </div>

        <div class="package-card">
            <img src="image/uttarpradesh.jpg" alt="Uttar Pradesh" />
            <div class="package-info">
                <h2>Uttar Pradesh Heritage Package</h2>
                <p><b>Duration:</b> 4 Days / 3 Nights</p>
                <p><b>Highlights:</b> Taj Mahal and historic monuments.</p>
                <p class="price">₹14,000 / person</p>
                <a href="Booking.aspx?place=Uttar%20Pradesh" class="btn">Book Now</a>
            </div>
        </div>

    </div>

    <footer>
        <h2>ExploreWorld Tours</h2>
        <p>Your journey, our responsibility.</p>
        <p>© 2026 ExploreWorld Tours. All Rights Reserved.</p>
    </footer>

</form>
</body>
</html>
