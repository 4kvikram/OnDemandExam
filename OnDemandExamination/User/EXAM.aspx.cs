using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnDemandExamination.App_Code;

namespace OnDemandExamination.User
{
    public partial class EXAM : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();

        int TotQus = 0;
        static int count = 0;
        static int viewradio = 0;

        static float marks = 0.0f, correct = 0.0f;
        int totalSeconds = 0, seconds = 60, minutes = 60;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionDb"].ConnectionString);
        string selected, subject_name, Result = null, UserName = null;
        static String CrtAns = null;
        string con_str = @"Data Source=VIKRAM;Initial Catalog=OnDemandExam;Integrated Security=True";
        DataTable dt;
        DataSet ds;
        SqlDataAdapter ad;
        static int rowindex = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            subject_name = Session["course"].ToString();

            UserName = Session["user"].ToString();


            string noofqns = "SELECT [NoOfQuestion] FROM [ExamSetting]";
            SqlCommand cmd = new SqlCommand(noofqns, con);
            con.Open();
            TotQus = (int)cmd.ExecuteScalar();




            String cmd11 = "SELECT TOP " + TotQus + " [QuestionID], [Course], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption] FROM [QuestionDetails] where [Course]='" + subject_name + "'order by newid()";

            //QuestionID, Program, Course, Question, OptionA, OptionB, OptionC, OptionD, CorrectOption, Ts_Created, Ts_update
            ds = new DataSet();

            ad = new SqlDataAdapter(cmd11, con);
            ad.Fill(ds, "QuestionDetails");
            dt = ds.Tables["QuestionDetails"];
            con.Close();


            if (viewradio == 0)
            {
                RadioInvisible();
            }

            else
            {
                RadioVisible();
            }
            viewradio += 1;

            CheckBoxInvisible();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Session["time"] = Convert.ToInt16(Session["time"]) - 1;
            if (Convert.ToInt16(Session["time"]) <= 0)
            {
                clock.Text = "TimeOut!";
                ButtonNext.Visible = false;
                RadioInvisible();


                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('TakeExam.aspx?marks=" + marks + "');", true);
                //string strscript = "<script language=javascript>window.opener='';window.top.close();</script>";

                //Page.RegisterStartupScript("clientScript", strscript);

            }

            else
            {
                totalSeconds = Convert.ToInt16(Session["time"]);
                seconds = totalSeconds % 60;
                minutes = totalSeconds / 60;
                clock.Text = minutes + ":" + seconds;
            }
        }



        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            call();
        }



        protected void call()
        {

            rowindex = rowindex + 1;

            selected = SelectedAnswer();
            if (CrtAns == selected)
            {
                correct = correct + 1;

            }

            RadioUncheck();
            CheckBoxUnchek();
            DisplayQuestion();
        }

        protected void DisplayQuestion()
        {
            try
            {
                if (rowindex < TotQus)
                {
                    count += 1;

                    lblnoofquestions.Text = count.ToString() + "  of  " + TotQus;
                    lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();
                    Option1.Text = dt.Rows[rowindex]["OptionA"].ToString();
                    Option2.Text = dt.Rows[rowindex]["OptionB"].ToString();
                    Option3.Text = dt.Rows[rowindex]["OptionC"].ToString();
                    Option4.Text = dt.Rows[rowindex]["OptionD"].ToString();
                    CrtAns = dt.Rows[rowindex]["CorrectOption"].ToString();


                    RadioVisible();
                    CheckBoxInvisible();

                }
                else
                {

                    ButtonNext.Visible = false;
                    RadioInvisible();
                    CheckBoxInvisible();
                    marks = (float)(((float)(correct) / (float)(TotQus)) * 100);
                    if (marks >= 50)
                    {
                        Result = "pass";
                    }
                    else
                    {
                        Result = "fail";
                    }
                    Report();
                    Response.Redirect("ExamFinishMessagePage.aspx");
                    //ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('Score.aspx?marks=" + marks + "');", true);
                    //string strscript = "<script language=javascript>window.opener='';window.top.close();</script>";
                    //Page.RegisterStartupScript("clientScript", strscript);
                }
            }
            catch (IndexOutOfRangeException)
            {
                Response.Write("Questions Over");
            }
        }
        protected void ButtonStart_Click(object sender, EventArgs e)
        {
            string query = "SELECT [TimeLimit] FROM [ExamSetting]";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int timeget = (int)cmd.ExecuteScalar();
            totalSeconds = timeget * 60;
            Timer1.Enabled = true;
            Session["time"] = totalSeconds;
            rowindex = rowindex + 1;
            DisplayQuestion();

            ButtonStart.Visible = false;
            ButtonNext.Visible = true;
            con.Close();
        }
        protected void Report()
        {
            try
            {

                string _ProcName = "ResultSet";

                SqlParameter[] _parameter = {
                                new SqlParameter("@UserName",UserName),
                                new SqlParameter("@CourseName", subject_name),
                                new SqlParameter("@NoOfQ",TotQus),
                                new SqlParameter("@Marks",marks),
                                new SqlParameter("@Status",Result)
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);

            }
            catch (Exception ex)
            {
                throw;
                Response.Write("Try Again");
            }
        }
        public string SelectedAnswer()
        {
            if (RadioButton1.Checked)
            {
                return "A";
            }
            else if (RadioButton2.Checked)
            {
                return "B";
            }
            else if (RadioButton3.Checked)
            {
                return "C";
            }

            else if (RadioButton4.Checked)
            {
                return "D";
            }
            else
            {
                return "nothing";
            }
        }

        protected string ChoosedAnswer()
        {
            string choose = null;

            if (CheckBox1.Checked)
            {
                choose = "A,";

            }
            if (CheckBox2.Checked)
            {
                choose += "B,";
            }
            if (CheckBox3.Checked)
            {
                choose += "C,";
            }

            if (CheckBox4.Checked)
            {
                choose += "D,";
            }
            return choose;
        }


        protected void RadioUncheck()
        {
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;
        }

        protected void CheckBoxUnchek()
        {
            CheckBox1.Checked = false;
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;
            CheckBox4.Checked = false;
        }

        protected void RadioInvisible()
        {
            RadioButton1.Visible = false;
            RadioButton2.Visible = false;
            RadioButton3.Visible = false;
            RadioButton4.Visible = false;

        }


        protected void RadioVisible()
        {
            RadioButton1.Visible = true;
            RadioButton2.Visible = true;
            RadioButton3.Visible = true;
            RadioButton4.Visible = true;

        }


        protected void CheckBoxInvisible()
        {
            CheckBox1.Visible = false;
            CheckBox2.Visible = false;
            CheckBox3.Visible = false;
            CheckBox4.Visible = false;
        }

        protected void CheckBoxVisible()
        {
            CheckBox1.Visible = true;
            CheckBox2.Visible = true;
            CheckBox3.Visible = true;
            CheckBox4.Visible = true;

        }

    }
}