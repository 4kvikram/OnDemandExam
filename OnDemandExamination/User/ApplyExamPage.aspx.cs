using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnDemandExamination.App_Code;
namespace OnDemandExamination.User
{
    public partial class ApplyExamPage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string _ProcName = "ApplyExam";
               
                SqlParameter[] _parameter = {
                                new SqlParameter("@UserName",Session["user"].ToString()),
                                new SqlParameter("@ProgramName",DropDownListProgram.SelectedItem.ToString()),
                                new SqlParameter("@CourseName1",DropDownListCourse.SelectedValue.ToString()),
                                 new SqlParameter("@CourseName2",DropDownListCourse2.SelectedValue.ToString()),
                                  new SqlParameter("@CourseName3",DropDownListCourse3.SelectedValue.ToString())
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);
                if (index > 0)
                {
                    LabelErrorMessage.Text = "successfull";
                    Response.Redirect("ExamRequestConfirmPage.aspx");
                }
                else
                {
                    LabelErrorMessage.Text = "Failed";
                }
            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
        }
    }
}