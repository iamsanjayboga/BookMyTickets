using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;
using Net.Codecrete.QrCodeGenerator;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using GroupDocs.Conversion;
using GroupDocs.Conversion.Options.Convert;
using GroupDocs.Conversion.FileTypes;

namespace BookMyTickets
{
    public partial class BookNow : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Username.Text = Session["name"].ToString();
            }
        }


        protected void booknow(object sender, EventArgs e)
        {
            try
            {           
                
                string movietitle = HttpContext.Current.Request.Url.ToString().Split('=')[1];
                movietitle = movietitle.Replace('+', ' ');
               
                Page.Title = movietitle;
                //int movieid = Convert.ToInt32(path);
                string stmt = "SELECT * FROM MOVIES WHERE TITLE = " + "'" + movietitle + "'";
                System.Data.DataTable dt = DB.GetDataFromTables(stmt);

                int mid = Convert.ToInt32(dt.Rows[0]["MOVIEID"].ToString());

                Random r = new Random();
                int newno = r.Next();

                string Name = hidden.Value;

                int noof = Convert.ToInt32(hidden2.Value);
                string seat = hidden3.Value;

                seat = seat.Replace(',', '|');


                string useridfetch = "SELECT USERID FROM USER_TABLE WHERE EMAIL=" + "'" + Session["email"].ToString() + "'";
                System.Data.DataTable dt1 = DB.GetDataFromTables(useridfetch);

                string bookeduserid = dt1.Rows[0]["USERID"].ToString();
                bool flag = DB.RunSP(newno, Name, mid, noof, seat, movietitle);
                if (flag)
                {
                    TriggerEmail(newno, Name, mid, noof, seat, movietitle);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Movie Booked!!!')", true);
                    Response.Redirect("Profile.aspx?Username=" + Name);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error please try again or contact admin')", true);

                }
            }
            catch(Exception ex)
            {

            }
        }


        private void TriggerEmail(int bookingid, string name, int movieid, int seat, string seatno, string moviename)
        {
            string to = Session["email"].ToString();//"iamsanjayboga@gmail.com"; //To address    
            string from = "booksmytickets@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string msg = "Movie Name: " + moviename + "<br/>" + "Booking ID: " + bookingid + "<br/>" + "Seat No: " + seatno;

            var qr = QrCode.EncodeText(msg, QrCode.Ecc.Medium);
            string svg = qr.ToSvgString(4);
            File.WriteAllText(AppDomain.CurrentDomain.BaseDirectory + @"uploads\" + bookingid + ".svg", svg, Encoding.UTF8);

            using (Converter converter = new Converter(AppDomain.CurrentDomain.BaseDirectory + @"uploads\" + bookingid + ".svg"))
            {
                ImageConvertOptions options = new ImageConvertOptions
                {
                    Format = ImageFileType.Jpg
                };
                converter.Convert(AppDomain.CurrentDomain.BaseDirectory + @"uploads\" + bookingid + ".jpg", options);
            }

            string mailbody = msg;
            message.Subject = "BookMyTickets - " + moviename + " - Booking Reference (" + bookingid + ")";
            message.Body = mailbody;
            Attachment data = new Attachment(AppDomain.CurrentDomain.BaseDirectory + @"uploads\" + bookingid + ".jpg");
            message.Attachments.Add(data);
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("booksmytickets@gmail.com", "frxvtfgdsfjwpqyv");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void generateqr(string msg, int id)
        {
            
        }
    }
}