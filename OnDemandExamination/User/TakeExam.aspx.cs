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
    public partial class TakeExam : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        int flag1,flag2,flag3;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Visible =false;
            Button2.Visible = false;
            Button3.Visible = false;
            call();
            checkExam();

        }

        public void call()
        {
            try
            {
                string _ProcName = "getExamCourseDetails";
                SqlParameter[] _parameter = {

                           new SqlParameter("@LoginID",Session["user"].ToString())

                                        };
                DataTable dbtable = new DataTable();
                dbtable = db.GetDataTable(_ProcName, _parameter);
                if (dbtable.Rows.Count > 0)
                {
                    Label1.Text = dbtable.Rows[0]["CourseName1"].ToString();
                    Label2.Text = dbtable.Rows[0]["CourseName2"].ToString();
                    Label3.Text = dbtable.Rows[0]["CourseName3"].ToString();
                    flag1=Convert.ToInt16(dbtable.Rows[0]["flag1"]);
                    flag2=Convert.ToInt16(dbtable.Rows[0]["flag2"]);
                    flag3=Convert.ToInt16(dbtable.Rows[0]["flag3"]);

                }

            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
        }
        protected void checkExam()
        {
            if(flag1==1)
            {
                Button1.Visible = true;
            }
            if (flag2 == 1)
            {
                Button1.Visible = true;
            }
            if (flag3 == 1)
            {
                Button1.Visible = true;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session["course"] = Label1.Text;
            Response.Redirect("EXAM.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["course"] = Label2.Text;
            Response.Redirect("EXAM.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["course"] = Label3.Text;
            Response.Redirect("EXAM.aspx");
        }
    }
}