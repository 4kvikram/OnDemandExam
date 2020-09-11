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
    public partial class CertificatePage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            getDetails();
        }
        protected void getDetails()
        {
            try
            {
                string _ProcName = "getResultDetails";

                SqlParameter[] _parameter = {

                           new SqlParameter("@LoginID",Session["user"].ToString())

                                        };
                DataTable dbtable = new DataTable();
                dbtable = db.GetDataTable(_ProcName, _parameter);
                if (dbtable.Rows.Count > 0)
                {
                    labelCourse.Text = dbtable.Rows[0]["CourseName"].ToString();
                    labelmarksObtain.Text = dbtable.Rows[0]["Marks"].ToString();
                    labelResult.Text = dbtable.Rows[0]["Status"].ToString();
                    labelStudentID.Text = dbtable.Rows[0]["UserName"].ToString();
                    labelName.Text = (dbtable.Rows[0]["FirstName"].ToString())+" "+( dbtable.Rows[0]["LastName"].ToString());
                    labelDOB.Text = dbtable.Rows[0]["DOB"].ToString();


                }

            }
            catch (Exception)
            {
                
            }
        }
    }
}