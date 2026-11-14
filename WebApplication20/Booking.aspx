
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WebApplication20.Booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExploreWorld Tours - Booking</title>
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
            padding: 40px 15px 20px;
        }

        .heading h1 {
            font-size: 36px;
            margin-bottom: 12px;
        }

        .heading p {
            color: #666;
        }

        .booking-container {
            max-width: 750px;
            background: white;
            margin: 20px auto 60px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,.10);
        }

        .booking-container h2 {
            margin-bottom: 25px;
            color: #17202a;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 90px;
        }

        .details-box {
            background: #eefaf7;
            border-left: 5px solid #72e8c9;
            padding: 18px;
            margin-bottom: 25px;
            border-radius: 7px;
            line-height: 2;
        }

        .price-box {
            background: #17202a;
            color: white;
            padding: 18px;
            border-radius: 7px;
            margin: 25px 0;
            font-size: 20px;
            font-weight: bold;
        }

        .book-btn {
            width: 100%;
            padding: 14px;
            background: #72e8c9;
            color: #111;
            border: none;
            border-radius: 7px;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .book-btn:hover {
            background: #17202a;
            color: white;
        }

        .error {
            color: #d93025;
            font-size: 13px;
            display: block;
            margin-top: 5px;
        }

        .message {
            display: block;
            margin-top: 22px;
            padding: 15px;
            background: #eefaf7;
            border-radius: 7px;
            color: #087e65;
            line-height: 1.8;
            font-weight: bold;
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

            .booking-container {
                margin: 15px;
                padding: 22px;
            }

            .heading h1 {
                font-size: 29px;
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
        <h1>Book Your Trip</h1>
        <p>Fill in your details and get ready for your next adventure!</p>
    </section>

    <div class="booking-container">

        <h2>Booking Details</h2>

        <div class="details-box">
            <strong>ExploreWorld Tours</strong><br />

            Selected Destination:
            <asp:Label ID="lblPlace" runat="server"
                Text="Please select a destination"></asp:Label>
            <br />

            Price Per Person: ₹
            <asp:Label ID="lblPackagePrice" runat="server"
                Text="0"></asp:Label>
        </div>

        <div class="form-group">
            <label>Select Destination</label>

            <asp:DropDownList ID="ddlDestination" runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlDestination_SelectedIndexChanged">

                <asp:ListItem Text="-- Select Destination --" Value=""></asp:ListItem>
                <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                <asp:ListItem Text="Kashmir" Value="Kashmir"></asp:ListItem>
                <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                <asp:ListItem Text="Manali" Value="Manali"></asp:ListItem>
                <asp:ListItem Text="Assam" Value="Assam"></asp:ListItem>
                <asp:ListItem Text="Meghalaya" Value="Meghalaya"></asp:ListItem>
                <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>

            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Full Name</label>

            <asp:TextBox ID="txtName" runat="server"
                placeholder="Enter your full name"></asp:TextBox>

            <asp:RequiredFieldValidator ID="valName" runat="server"
                ControlToValidate="txtName"
                ErrorMessage="Please enter your name."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="valNameFormat" runat="server"
                ControlToValidate="txtName"
                ValidationExpression="^[a-zA-Z ]{2,50}$"
                ErrorMessage="Enter a valid name using letters only."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <label>Email Address</label>

            <asp:TextBox ID="txtEmail" runat="server"
                TextMode="Email"
                placeholder="Enter your email"></asp:TextBox>

            <asp:RequiredFieldValidator ID="valEmail" runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Please enter your email."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="valEmailFormat" runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Please enter a valid email address."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <label>Mobile Number</label>

            <asp:TextBox ID="txtPhone" runat="server"
                TextMode="Phone"
                MaxLength="10"
                placeholder="Enter 10-digit mobile number"></asp:TextBox>

            <asp:RequiredFieldValidator ID="valPhone" runat="server"
                ControlToValidate="txtPhone"
                ErrorMessage="Please enter your mobile number."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="valPhoneFormat" runat="server"
                ControlToValidate="txtPhone"
                ValidationExpression="^[6-9][0-9]{9}$"
                ErrorMessage="Enter a valid 10-digit Indian mobile number."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <label>Travel Date</label>

            <asp:TextBox ID="txtDate" runat="server"
                TextMode="Date"></asp:TextBox>

            <asp:RequiredFieldValidator ID="valDate" runat="server"
                ControlToValidate="txtDate"
                ErrorMessage="Please select your travel date."
                CssClass="error"
                ValidationGroup="Booking">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Number of Adults</label>

            <asp:DropDownList ID="ddlAdults" runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlPeople_SelectedIndexChanged">

                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                <asp:ListItem Text="6" Value="6"></asp:ListItem>

            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Number of Children</label>

            <asp:DropDownList ID="ddlChildren" runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlPeople_SelectedIndexChanged">

                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>

            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Special Requests</label>

            <asp:TextBox ID="txtMessage" runat="server"
                TextMode="MultiLine"
                placeholder="Any special requests?"></asp:TextBox>
        </div>

        <div class="price-box">
            Total Amount: ₹
            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            ValidationGroup="Booking"
            CssClass="error"
            HeaderText="Please correct the following errors:" />

        <asp:Button ID="btnConfirm" runat="server"
            Text="Confirm Booking"
            CssClass="book-btn"
            OnClick="btnConfirm_Click"
            ValidationGroup="Booking" />

        <asp:Label ID="lblMessage" runat="server"
            CssClass="message"
            Visible="false">
        </asp:Label>
        <!-- PAYMENT SECTION -->
<asp:Panel ID="pnlPayment" runat="server" Visible="false">

    <div class="details-box" style="text-align:center; margin-top:25px;">

        <h2>Payment Options</h2>

        <p>You can scan the QR code to make your payment.</p>

        <br />

        <asp:Image ID="imgUPIQR" runat="server"
            ImageUrl="~/image/upi-qr.png"
            Width="220px"
            Height="220px"
            AlternateText="Demo UPI QR Code" />

        <br /><br />

        <strong>UPI ID: exploreworld@upi</strong>

        <br /><br />

        <p>You can also choose to pay later.</p>

        <h3 style="color:#087e65;">
            Payment Status: Pending Payment
        </h3>

    </div>

</asp:Panel>

    </div>

    <footer>
        <h2>ExploreWorld Tours</h2>
        <p>Your journey, our responsibility.</p>
        <p>© 2026 ExploreWorld Tours. All Rights Reserved.</p>
    </footer>

</form>
</body>
</html>
