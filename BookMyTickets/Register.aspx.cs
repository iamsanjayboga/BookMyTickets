using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookMyTickets.WebPages
{
    public partial class Register : System.Web.UI.Page
    {
        DataBaseConnection DB = new DataBaseConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterCourse(object sender, EventArgs e)
        {
            try
            {

                DataTable dt = new DataTable();
                dt = DB.GetDataFromTables("SELECT * FROM USER_TABLE WHERE ROWNUM=1 ORDER BY USERID DESC");
                int userid = Convert.ToInt32(dt.Rows[0]["USERID"].ToString())+1;

                DataTable dt1 = new DataTable();
                dt1 = DB.GetDataFromTables("SELECT * FROM USER_TABLE where email = " + "'" + email.Text + "'");

                if (dt1.Rows.Count == 0)
                {
                    string name = username.Text;
                    string Ema = email.Text;
                    string pass = txt_pwd.Text;
                    string last = string.Empty;

                    string Statement = "INSERT INTO USER_TABLE VALUES(" + userid + "," + "'" + name + "'" + "," + "'" + last + "'" + "," + "'" + Ema + "'" + "," + "sysdate" + "," + "'" + pass + "'" + ")";

                    Boolean datastatus = DB.UpdateData(Statement);
                    if (datastatus == true)
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Registered')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error please try again or contact admin')", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User already Registered with this Email - Please Login')", true);
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}