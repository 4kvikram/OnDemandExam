using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnDemandExamination.App_Code;


namespace OnDemandExamination
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
        Response.Redirect("RegistrationPage.aspx");
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (CheckUserName())
            {
                return;
            }
            try
            {
                DateTime now = DateTime.Now;
                string date = now.ToString();
                string _ProcName = "registration";

                SqlParameter[] _parameter = {
                                new SqlParameter("@FirstName",FirstName.Text),
                                new SqlParameter("@LastName",LastName.Text),
                                new SqlParameter("@LoginID", LoginId.Text),
                                new SqlParameter("@Password",Password.Text),
                                new SqlParameter("@Email",Email.Text),
                                new SqlParameter("@Phone",Convert.ToInt64(phone.Text)),
                                new SqlParameter("@Gender",RadioButtonListGender.SelectedValue),
                                new SqlParameter("@DOB",dob.Text),
                                new SqlParameter("@Program",DropDownListProgram.SelectedValue.ToString()),
                                new SqlParameter("@Address",address.Text),
                                new SqlParameter("@StateID",DropDownListState.SelectedValue.ToString()),
                                new SqlParameter("@cityID",DropDownListCity.SelectedValue.ToString()),
                                new SqlParameter("@PinCoad",Convert.ToInt64(PinCode.Text))/*,
                                new SqlParameter("@Ts_Created",date),
                                new SqlParameter("@ts_update",date),
                                new SqlParameter("@role","0")*/
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);
                if (index > 0)
                {
                    LabelErrorMessage.Text = "Insert successfull";
                }
                else
                {
                    LabelErrorMessage.Text = "Insert Failed";
                }
            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
            Response.Redirect("RegistrationConfirmPage.aspx");
        }


        private bool CheckUserName()
        {
            bool flag = false;
            try
            {
                string _ProcName = "CheckUsername";
                SqlParameter[] _parameter = {

                           new SqlParameter("@LoginId",LoginId.Text)

                                        };
                SqlDataReader dr = db.GetDataReaderByProc(_ProcName, _parameter);
                dr.Read();
                if (dr.HasRows)
                {
                    return flag = true;
                }
                dr.Close();

            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
            return flag;
        }

        protected void LoginId_TextChanged(object sender, EventArgs e)
        {
            if (CheckUserName())
            {
                lblUserAvailabel.ForeColor = System.Drawing.Color.Red;
                lblUserAvailabel.Text = "Username already exist";
            }
            else
            {
                lblUserAvailabel.ForeColor = System.Drawing.Color.Green;
                lblUserAvailabel.Text = "Username Availabel";
            }

        }
    }


}