using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets
{
    public partial class _Default : Page
    {
        DataBaseConnection DB = new DataBaseConnection();

        public List<MovieData> Sites = new List<MovieData>();

        public List<MovieData> NonPop = new List<MovieData>();

        public List<MovieData> filter = new List<MovieData>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if(Session["email"] == null)
                //{
                //    Response.Redirect("Login.aspx");
                //}
                LoadMovies();
            }
            catch(Exception ex)
            {

            }
        }
        protected void filterClick(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            if(DropDownList1.SelectedValue != "Pick one" || DropDownList2.SelectedValue != "Pick one")
            {
                if(DropDownList1.SelectedValue != "Pick one" && DropDownList2.SelectedValue != "Pick one")
                {
                    dt = DB.GetDataFromTables("SELECT * FROM FETCH_MOVIE_RECORDS WHERE GENRENAME = " + "'" + DropDownList1.SelectedValue + "'" + "and LANGUAGE = " + "'" + DropDownList2.SelectedValue + "'");
                }
                else
                {
                    dt = DB.GetDataFromTables("SELECT * FROM FETCH_MOVIE_RECORDS WHERE GENRENAME = " + "'" + DropDownList1.SelectedValue + "'" + "or LANGUAGE = " + "'" + DropDownList2.SelectedValue + "'");
                }
                

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    MovieData md = new MovieData();
                    md.Title = dt.Rows[i]["TITLE"].ToString();

                    string tion = dt.Rows[i]["DESCRIPTION"].ToString();
                    if (tion.Length > 100)
                    {
                        md.Description = tion.Substring(0, 100);
                    }
                    else
                    {
                        md.Description = tion;
                    }
                    md.Language = dt.Rows[i]["LANGUAGE"].ToString();
                    md.Genre = dt.Rows[i]["GENRENAME"].ToString();
                    md.Rating = dt.Rows[i]["STARS"].ToString();

                    filter.Add(md);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Select Genre or Language to filter')", true);
            }

        }


        private void LoadMovies()
        {
            DataTable dt = new DataTable();
            dt = DB.GetDataFromTables("SELECT * FROM FETCH_MOVIE_RECORDS WHERE STARS>6");

            for(int i = 0; i < dt.Rows.Count; i++)
            {
                MovieData md = new MovieData();
                md.Title = dt.Rows[i]["TITLE"].ToString();
                
                string tion = dt.Rows[i]["DESCRIPTION"].ToString();
                if (tion.Length > 100)
                {
                    md.Description = tion.Substring(0, 100);
                }
                else
                {
                    md.Description = tion;
                }
                md.Language = dt.Rows[i]["LANGUAGE"].ToString();
                md.Genre = dt.Rows[i]["GENRENAME"].ToString();
                md.Rating = dt.Rows[i]["STARS"].ToString();

                Sites.Add(md);
            }

            DataTable dt1 = new DataTable();
            dt1 = DB.GetDataFromTables("SELECT * FROM FETCH_MOVIE_RECORDS WHERE STARS<7");

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                MovieData md = new MovieData();
                md.Title = dt1.Rows[i]["TITLE"].ToString();

                string tion = dt1.Rows[i]["DESCRIPTION"].ToString();
                if (tion.Length > 100)
                {
                    md.Description = tion.Substring(0, 100);
                }
                else
                {
                    md.Description = tion;
                }
                md.Language = dt1.Rows[i]["LANGUAGE"].ToString();
                md.Genre = dt1.Rows[i]["GENRENAME"].ToString();
                md.Rating = dt1.Rows[i]["STARS"].ToString();

                NonPop.Add(md);
            }
        }
    }
}