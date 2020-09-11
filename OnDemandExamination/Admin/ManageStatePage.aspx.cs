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
    public partial class ManageStatePage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonAdd_Click(object sender, EventArgs e)
        {
            if (checkState())
            {
                LabelErrorMessage.Text = ("already exit");
                return;
            }
            try
            {
                string _ProcName = "addState";
                SqlParameter[] _parameter = {
                                new SqlParameter("@StateName",textBoxStateName.Text)                              
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);
                if (index > 0)
                {
                    LabelErrorMessage.Text = "Insert successfull";
                    GridView1.DataBind();
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
        private bool checkState()
        {
            bool flag = false;
            try
            {
                string _ProcName = "checkState";
                SqlParameter[] _parameter = {

                           new SqlParameter("@StateName",textBoxStateName.Text)

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
    }
}