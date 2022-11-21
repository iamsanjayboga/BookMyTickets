using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                if(Session["email"] != null) //email
                {
                    navbarColor02.Visible = false;
                    welcomelbl.Visible = true;
                    profile.Visible = true;
                    logout.Visible = true;
                    Label1.InnerHtml = "Welcome " + Session["name"];
                    //Session["email"].ToString() == "iamsanjayboga@gmail.com" || Session["usertype"].ToString() == "Contributer" 

                    if (Session["email"].ToString() == "iamsanjayboga@gmail.com")
                    {
                        addmovies.Visible = true;
                    }
                }
                else
                {
                    navbarColor02.Visible = true;
                    
                    welcomelbl.Visible = false;
                    profile.Visible = false;
                    logout.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}