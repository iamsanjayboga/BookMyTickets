using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets
{
    public partial class Movies : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                string title = Request.QueryString["Title"];
                dt = DB.GetDataFromTables("SELECT * FROM FETCH_MOVIE_RECORDS WHERE TITLE = " + "'" + title + "'");
                LoadMovies(dt);
            }
            catch (Exception ex)
            {

            }
        }


        private void LoadMovies(DataTable dt)
        {
            try
            {
                Page.Title = dt.Rows[0]["TITLE"].ToString();
                title.Text = dt.Rows[0]["TITLE"].ToString();
                description.Text = dt.Rows[0]["DESCRIPTION"].ToString();
                rating.Text = "IMDB: " + dt.Rows[0]["STARS"].ToString();
                Lang.Text = "Language: " + dt.Rows[0]["LANGUAGE"].ToString();

                genre.Text = dt.Rows[0]["GENRENAME"].ToString();
                release.Text = "Release Date: " + dt.Rows[0]["RELEASE_DATE"].ToString().Substring(0,9);

                actor.Text = "Actor: " + dt.Rows[0]["FULL_NAME"].ToString();
                director.Text = "Director: " + dt.Rows[0]["DIRECTOR"].ToString();

                 
            }
            catch(Exception ex)
            {

            }
        }

        protected void ProceedToSeat(object sender, EventArgs e)
        {
            Session["title"] = title.Text;
            if(Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("BookNow.aspx?Title=" + title.Text);
            }
            
        }

    }
}