using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using OnDemandExamination.App_Code;

namespace OnDemandExamination
{
    public partial class LogInPage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

            try
            {
                string _ProcName = "loginCheck";
                SqlParameter[] _parameter = {
                           new SqlParameter("@LoginID",TextBoxUserId.Text),
                           new SqlParameter("@Password",TextBoxPassword.Text)
                };
                SqlDataReader dr = db.GetDataReaderByProc(_ProcName, _parameter);
                dr.Read();
                if (dr.HasRows)
                {
                    if (dr["role"].ToString().Equals("1"))
                    {
                        Session["admin"] = TextBoxUserId.Text;
                        Response.Redirect("~\\Admin\\AdminHomePage.aspx");
                    }
                    else if (dr["role"].ToString().Equals("0"))
                    {
                        Session["user"] = TextBoxUserId.Text;
                        Response.Redirect("~\\User\\UserHomePage.aspx");
                    }


                }

            }
            catch (Exception ex)
            {
                LabelMessage.Text = ex.Message;
            }

        }

        protected void ButtonLogin0_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registrationpage.aspx");
        }
    }
}