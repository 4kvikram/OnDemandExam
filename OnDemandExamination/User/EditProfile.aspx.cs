using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnDemandExamination.App_Code;
namespace OnDemandExamination.User
{
    public partial class EditProfile : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CustomerProfile();
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            
            try
            {
                
                string _ProcName = "updateUserDetails";

                SqlParameter[] _parameter = {
                                new SqlParameter("@FirstName",FirstName.Text),
                                new SqlParameter("@LastName",LastName.Text),
                                new SqlParameter("@LoginID",Session["user"].ToString()),
                                new SqlParameter("@Email",Email.Text),
                                new SqlParameter("@Phone",Convert.ToInt64(phone.Text)),
                                new SqlParameter("@Gender",RadioButtonListGender.SelectedValue),
                                new SqlParameter("@DOB",dob.Text),
                                new SqlParameter("@Program",DropDownListProgram.SelectedValue.ToString()),
                                new SqlParameter("@Address",address.Text),
                                new SqlParameter("@StateID",DropDownListState.SelectedValue.ToString()),
                                new SqlParameter("@cityID",DropDownListCity.SelectedValue.ToString()),
                                new SqlParameter("@PinCoad",Convert.ToInt64(PinCode.Text))
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);
                if (index > 0)
                {
                    LabelErrorMessage.Text = "successfull Updated";
                    Response.Redirect("EditProfile.aspx");
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
        }
        public void CustomerProfile()
        {
            try
            {
                string _ProcName = "getUserDeatils";
                SqlParameter[] _parameter = {

                           new SqlParameter("@LoginID",Session["user"].ToString())

                                        };
                DataTable dbtable = new DataTable();
                dbtable = db.GetDataTable(_ProcName, _parameter);
                if (dbtable.Rows.Count > 0)
                {
                    FirstName.Text = dbtable.Rows[0]["FirstName"].ToString();
                    LastName.Text = dbtable.Rows[0]["LastName"].ToString();
                    LoginId.Text = dbtable.Rows[0]["LoginID"].ToString();
                    Email.Text = dbtable.Rows[0]["Email"].ToString();
                    phone.Text = dbtable.Rows[0]["phone"].ToString();
                    RadioButtonListGender.SelectedValue = dbtable.Rows[0]["Gender"].ToString();
                    dob.Text = dbtable.Rows[0]["DOB"].ToString();
                    address.Text = dbtable.Rows[0]["address"].ToString();
                    PinCode.Text = dbtable.Rows[0]["PinCoad"].ToString();
                }

            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {

        }

        protected void LoginId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}