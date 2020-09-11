using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnDemandExamination.App_Code;
namespace OnDemandExamination.Admin
{
    
    public partial class ManageQuestion : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }
        protected void clear()
        {
            TextBoxQuestion.Text = "";
            TextBoxOptionA.Text = "";
            TextBoxOptionB.Text = "";
            TextBoxOptionC.Text = "";
            TextBoxOptionD.Text = "";
        }
        protected void buttonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string _ProcName = "addQuestion";
                SqlParameter[] _parameter = {
                                new SqlParameter("@Program",DropDownListProgram.SelectedValue),
                                new SqlParameter("@Course",DropDownListCourse.SelectedValue),
                                new SqlParameter("@Question",TextBoxQuestion.Text),
                                new SqlParameter("@OptionA",TextBoxOptionA.Text),
                                new SqlParameter("@OptionB",TextBoxOptionB.Text),
                                new SqlParameter("@OptionC",TextBoxOptionC.Text),
                                new SqlParameter("@OptionD",TextBoxOptionD.Text),
                                new SqlParameter("@CorrectOption",DropDownListCorrectOption.SelectedValue)
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
            clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeeQuestionPage.aspx");
        }
    }
}