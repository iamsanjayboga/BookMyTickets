using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets
{
    public partial class AddMovies : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"].ToString() == "iamsanjayboga@gmail.com")
            {

                DataTable dt = new DataTable();
                dt = DB.GetDataFromTables("SELECT * FROM MOVIES");
                
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void publish(object sender, EventArgs e)
        {

            string stmt1 = "SELECT MOVIEID FROM MOVIES WHERE ROWNUM=1 ORDER BY MOVIEID DESC";
            DataTable dt1 = DB.GetDataFromTables(stmt1);
            int movieid = Convert.ToInt32(dt1.Rows[0][0].ToString());

            string stmt2 = "SELECT ACTORID FROM ACTORS  WHERE ROWNUM=1 ORDER BY ACTORID DESC";
            DataTable dt2 = DB.GetDataFromTables(stmt2);
            int actorid = Convert.ToInt32(dt2.Rows[0][0].ToString());

            string stmt3 = "SELECT RATINGID FROM RATING WHERE ROWNUM=1 ORDER BY RATINGID DESC";
            DataTable dt3 = DB.GetDataFromTables(stmt3);
            int ratingid = Convert.ToInt32(dt3.Rows[0][0].ToString());

            int PGENREID = Convert.ToInt32(genre.SelectedValue);
            string PTITLE = title.Text.ToString();
            string PDESCRIPTION = description.Text.ToString();
            string PLANGUAGE = language.Text.ToString();
            string PRELEASE_DATE = "01-JAN-22";
            string PDIRECTOR = director.Text.ToString();
            string PACTORF = firstname.Text.ToString();
            string PACTORL = lastname.Text.ToString();
            string PNATIONALITY = national.Text.ToString();
            string PDOB = "24-JAN-1985";
            int PSTARS = Convert.ToInt32(rating.SelectedValue);
            int PMOVIEID = movieid + 1;
            int PACTORID = actorid + 1;
            int PRATINGID = ratingid + 1;

            bool flag = DB.Publish(PGENREID, PTITLE, PDESCRIPTION, PLANGUAGE, PRELEASE_DATE, PDIRECTOR, PACTORF, PACTORL, PNATIONALITY, PDOB, PSTARS, PMOVIEID, PACTORID, PRATINGID);
            if (flag)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Movie Added!!!')", true);
                panel.Visible = false;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error please try again or contact admin')", true);

            }

        }
    }
}