
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace WebApplication20
{
    public partial class Booking : System.Web.UI.Page
    {
        private static readonly Dictionary<string, int> Prices =
            new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase)
            {
                { "Goa", 15000 },
                { "Kerala", 20000 },
                { "Kashmir", 25000 },
                { "Rajasthan", 18000 },
                { "Punjab", 12000 },
                { "Manali", 22000 },
                { "Assam", 16000 },
                { "Meghalaya", 19000 },
                { "Uttar Pradesh", 14000 }
            };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string place = Request.QueryString["place"];

                if (!string.IsNullOrEmpty(place) && Prices.ContainsKey(place))
                {
                    ddlDestination.SelectedValue = place;
                }
            }

            UpdatePackageDetails();
        }

        private void UpdatePackageDetails()
        {
            string place = ddlDestination.SelectedValue;

            if (Prices.ContainsKey(place))
            {
                lblPlace.Text = place;
                lblPackagePrice.Text = Prices[place].ToString();
                CalculateTotal();
            }
            else
            {
                lblPlace.Text = "Please select a destination";
                lblPackagePrice.Text = "0";
                lblTotal.Text = "0";
            }
        }

        private void CalculateTotal()
        {
            string place = ddlDestination.SelectedValue;

            if (!Prices.ContainsKey(place))
            {
                lblTotal.Text = "0";
                return;
            }

            int price = Prices[place];
            int adults = int.Parse(ddlAdults.SelectedValue);
            int children = int.Parse(ddlChildren.SelectedValue);

            int total = price * (adults + children);

            lblTotal.Text = total.ToString();
        }

        protected void ddlDestination_SelectedIndexChanged(
            object sender, EventArgs e)
        {
            UpdatePackageDetails();
            lblMessage.Visible = false;
            pnlPayment.Visible = false;
        }

        protected void ddlPeople_SelectedIndexChanged(
            object sender, EventArgs e)
        {
            CalculateTotal();
            lblMessage.Visible = false;
            pnlPayment.Visible = false;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Page.Validate("Booking");

            lblMessage.Visible = false;
            pnlPayment.Visible = false;

            if (!Page.IsValid)
            {
                return;
            }

            string place = ddlDestination.SelectedValue;

            if (!Prices.ContainsKey(place))
            {
                lblMessage.Text = "Please select a valid destination.";
                lblMessage.Visible = true;
                return;
            }

            DateTime travelDate;

            bool validDate = DateTime.TryParseExact(
                txtDate.Text,
                "yyyy-MM-dd",
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out travelDate);

            if (!validDate || travelDate.Date < DateTime.Today)
            {
                lblMessage.Text =
                    "Please select a valid travel date (today or later).";
                lblMessage.Visible = true;
                return;
            }

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (!Regex.IsMatch(name, @"^[a-zA-Z ]{2,50}$"))
            {
                lblMessage.Text = "Please enter a valid name.";
                lblMessage.Visible = true;
                return;
            }

            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblMessage.Text = "Please enter a valid email.";
                lblMessage.Visible = true;
                return;
            }

            if (!Regex.IsMatch(phone, @"^[6-9][0-9]{9}$"))
            {
                lblMessage.Text = "Please enter a valid mobile number.";
                lblMessage.Visible = true;
                return;
            }

            int adults = int.Parse(ddlAdults.SelectedValue);
            int children = int.Parse(ddlChildren.SelectedValue);

            int total = Prices[place] * (adults + children);

            string bookingId =
                "EW" + Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();

            string safeName = Server.HtmlEncode(name);
            string safeEmail = Server.HtmlEncode(email);
            string safePlace = Server.HtmlEncode(place);
            string safePhone = Server.HtmlEncode(phone);
            string safeMessage = Server.HtmlEncode(txtMessage.Text.Trim());

            string bookingDetails =
                "<b>Booking ID:</b> " + bookingId + "<br/>" +
                "<b>Destination:</b> " + safePlace + "<br/>" +
                "<b>Name:</b> " + safeName + "<br/>" +
                "<b>Email:</b> " + safeEmail + "<br/>" +
                "<b>Mobile:</b> " + safePhone + "<br/>" +
                "<b>Travel Date:</b> " + travelDate.ToString("dd-MM-yyyy") + "<br/>" +
                "<b>Adults:</b> " + adults + "<br/>" +
                "<b>Children:</b> " + children + "<br/>" +
                "<b>Total Amount:</b> Rs. " + total + "<br/>" +
                "<b>Special Requests:</b> " + safeMessage + "<br/>" +
                "<b>Payment Status:</b> Pending Payment";

            // Email to customer
            string customerSubject = "ExploreWorld Tours - Booking Confirmation";

            string customerBody =
                "<h2>Booking Confirmed Successfully!</h2>" +
                "<p>Dear " + safeName + ",</p>" +
                "<p>Thank you for choosing ExploreWorld Tours. " +
                "Your booking details are given below:</p>" +
                bookingDetails +
                "<br/><p>Your payment is currently pending. " +
                "You may make the payment later.</p>" +
                "<p>Thank you,<br/>ExploreWorld Tours</p>";

            // Email to website owner
            string adminSubject = "New Booking Received - " + bookingId;

            string adminBody =
                "<h2>New Booking Received!</h2>" +
                "<p>A customer has submitted a new booking.</p>" +
                bookingDetails +
                "<br/><p>ExploreWorld Tours Website</p>";

            bool customerEmailSent = SendBookingEmail(
                email, customerSubject, customerBody);

            string adminEmail = ConfigurationManager.AppSettings["AdminEmail"];

            bool adminEmailSent = false;

            if (!string.IsNullOrEmpty(adminEmail))
            {
                adminEmailSent = SendBookingEmail(
                    adminEmail, adminSubject, adminBody);
            }

            // Show booking confirmation
            lblMessage.Text =
                "<b>Booking Confirmed Successfully!</b><br/><br/>" +
                bookingDetails +
                "<br/><br/>Thank you for booking with ExploreWorld Tours!";

            lblMessage.Visible = true;

            // Display QR code and payment option
            pnlPayment.Visible = true;

            lblTotal.Text = total.ToString();

            // Show email sending result
            if (customerEmailSent && adminEmailSent)
            {
                lblMessage.Text +=
                    "<br/><br/><b>Email Status:</b> " +
                    "Confirmation sent to customer and website owner.";
            }
            else
            {
                lblMessage.Text +=
                    "<br/><br/><b>Email Status:</b> " +
                    "Booking is confirmed, but one or more emails could not be sent. " +
                    "Please check the email configuration.";
            }
        }

        private bool SendBookingEmail(
            string recipient, string subject, string body)
        {
            try
            {
                string senderEmail =
                    ConfigurationManager.AppSettings["SenderEmail"];

                string appPassword =
                    ConfigurationManager.AppSettings["SenderAppPassword"];

                if (string.IsNullOrEmpty(senderEmail) ||
                    string.IsNullOrEmpty(appPassword) ||
                    appPassword == "YOUR_GMAIL_APP_PASSWORD")
                {
                    return false;
                }

                ServicePointManager.SecurityProtocol =
                    SecurityProtocolType.Tls12;

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(senderEmail);
                    mail.To.Add(recipient);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient(
                        "smtp.gmail.com", 587))
                    {
                        smtp.Credentials =
                            new NetworkCredential(senderEmail, appPassword);

                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
