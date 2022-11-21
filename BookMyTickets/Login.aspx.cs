using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets.WebPages
{
    public partial class Login : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["email"] = string.Empty;
            Session["name"] = string.Empty;

        }

        protected void LoginCourse(object sender, EventArgs e)
        {
            DataTable dt1 = new DataTable();
            dt1 = DB.GetDataFromTables("SELECT * FROM USER_TABLE where email = " + "'" + email.Text + "'");

            if(dt1.Rows.Count != 0)
            {
                string pass = dt1.Rows[0]["PASSWORD"].ToString();
                if(txt_pwd.Text != pass)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Password!! Retry again')", true);
                }
                else{
                    Session["email"] = dt1.Rows[0]["EMAIL"].ToString();
                    Session["name"] = dt1.Rows[0]["FIRSTNAME"].ToString();

                    if(Session["title"] == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("BookNow.aspx?Title="+Session["title"].ToString());
                    }

                    
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User didn't registered with us - Please Register')", true);
            }

        }

    }
}