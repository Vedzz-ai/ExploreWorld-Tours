
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destination.aspx.cs" Inherits="WebApplication20.Destination" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExploreWorld Tours - Destinations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7f8;
            color: #222;
        }

        .navbar {
            background: #72e8c9;
            padding: 15px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #17202a;
        }

        .menu {
            display: flex;
            gap: 25px;
            list-style: none;
        }

        .menu a {
            color: #111;
            text-decoration: none;
            font-size: 17px;
        }

        .menu a:hover {
            color: white;
        }

        .heading {
            text-align: center;
            padding: 55px 20px 35px;
        }

        .heading h1 {
            font-size: 38px;
            margin-bottom: 15px;
            color: #17202a;
        }

        .heading p {
            color: #666;
            font-size: 17px;
            line-height: 1.6;
        }

        .destination-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 28px;
            padding: 20px 7% 65px;
            max-width: 1250px;
            margin: auto;
        }

        .destination-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0,0,0,.10);
            transition: .3s;
        }

        .destination-card:hover {
            transform: translateY(-7px);
        }

        .destination-card img {
            width: 100%;
            height: 210px;
            object-fit: cover;
        }

        .destination-info {
            padding: 20px;
        }

        .destination-info h2 {
            font-size: 23px;
            margin-bottom: 10px;
            color: #17202a;
        }

        .destination-info p {
            color: #666;
            line-height: 1.6;
            min-height: 75px;
        }

        .btn {
            display: inline-block;
            background: #72e8c9;
            color: #111;
            padding: 11px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 15px;
        }

        .btn:hover {
            background: #17202a;
            color: white;
        }

        footer {
            background: #17202a;
            color: white;
            text-align: center;
            padding: 35px 15px;
        }

        footer p {
            color: #ccc;
            margin-top: 10px;
        }

        @media(max-width: 650px) {
            .navbar {
                justify-content: center;
                gap: 15px;
            }

            .menu {
                gap: 13px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .menu a {
                font-size: 14px;
            }

            .heading h1 {
                font-size: 30px;
            }
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
        <h1>Explore Our Destinations</h1>
        <p>Discover beautiful places across India and choose your next adventure.</p>
    </section>

    <div class="destination-container">

        <div class="destination-card">
            <img src="image/goa.jpg" alt="Goa" />
            <div class="destination-info">
                <h2>Goa</h2>
                <p>Enjoy golden beaches, exciting water sports, beautiful sunsets and vibrant nightlife.</p>
                <a href="Packages.aspx?place=Goa" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/kerala.jpg" alt="Kerala" />
            <div class="destination-info">
                <h2>Kerala</h2>
                <p>Experience peaceful backwaters, houseboats, green tea gardens and beautiful nature.</p>
                <a href="Packages.aspx?place=Kerala" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/kashmir.jpg" alt="Kashmir" />
            <div class="destination-info">
                <h2>Kashmir</h2>
                <p>Explore snow-covered mountains, Dal Lake, gardens and breathtaking valleys.</p>
                <a href="Packages.aspx?place=Kashmir" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/rajasthan.jpg" alt="Rajasthan" />
            <div class="destination-info">
                <h2>Rajasthan</h2>
                <p>Discover royal palaces, historic forts, colourful markets and desert adventures.</p>
                <a href="Packages.aspx?place=Rajasthan" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/punjab.jpg" alt="Punjab" />
            <div class="destination-info">
                <h2>Punjab</h2>
                <p>Visit the Golden Temple, enjoy Punjabi culture and taste delicious local food.</p>
                <a href="Packages.aspx?place=Punjab" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/manali.jpg" alt="Manali" />
            <div class="destination-info">
                <h2>Manali</h2>
                <p>Enjoy mountain views, adventure activities, snow and peaceful hill stations.</p>
                <a href="Packages.aspx?place=Manali" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/aasam.jpg" alt="Assam" />
            <div class="destination-info">
                <h2>Assam</h2>
                <p>Explore beautiful tea gardens, wildlife, river landscapes and rich traditions.</p>
                <a href="Packages.aspx?place=Assam" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/meghalaya.jpg" alt="Meghalaya" />
            <div class="destination-info">
                <h2>Meghalaya</h2>
                <p>Discover waterfalls, living root bridges, green hills and beautiful caves.</p>
                <a href="Packages.aspx?place=Meghalaya" class="btn">View Packages</a>
            </div>
        </div>

        <div class="destination-card">
            <img src="image/uttarpradesh.jpg" alt="Uttar Pradesh" />
            <div class="destination-info">
                <h2>Uttar Pradesh</h2>
                <p>Visit the Taj Mahal, explore historic monuments and experience rich heritage.</p>
                <a href="Packages.aspx?place=Uttar%20Pradesh" class="btn">View Packages</a>
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
