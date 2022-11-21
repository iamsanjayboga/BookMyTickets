using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets
{
    public partial class Profile : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();
        public List<BookedMovies> bookedmovies = new List<BookedMovies>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    DataTable dt = new DataTable();
                    string title = Request.QueryString["Title"];
                    dt = DB.GetDataFromTables("SELECT * FROM BOOKEDMOVIES WHERE NAME=" + "'" + Session["name"].ToString() + "'");
                   
                    LoadBooking(dt);
                }
            }
            catch(Exception ex)
            {

            }           
        }

        private void LoadBooking(DataTable dt)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                BookedMovies md = new BookedMovies();
                md.BOOKINGID = dt.Rows[i]["BOOKINGID"].ToString();               
                md.MOVIENAME = dt.Rows[i]["MOVIENAME"].ToString();
                md.NUMBER_OF_SEAT = dt.Rows[i]["NUMBER_OF_SEAT"].ToString();
                md.SEATS = dt.Rows[i]["SEATS"].ToString();

                bookedmovies.Add(md);
            }
        }
    }
}