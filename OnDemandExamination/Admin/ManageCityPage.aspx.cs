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
    public partial class ManageCityPage : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (CheckProgram())
            {
                LabelErrorMessage.Text = ("already exit");
                return;
            }
            try
            {
                string _ProcName = "addCity";

                SqlParameter[] _parameter = {
                                new SqlParameter("@StateName",DropDownListState.SelectedValue.ToString()),
                                new SqlParameter("@CityName",textBoxCityName.Text),
                                 new SqlParameter("@PinCode",Convert.ToInt64(TextBoxPinCode.Text))
                                        };
                int index = db.ExecuteNonQueryByQueryProc(_parameter, _ProcName);
                if (index > 0)
                {
                    LabelErrorMessage.Text = "Insert successfull";
                }
                else
                {
                    LabelErrorMessage.Text = "Insert Failed";
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                LabelErrorMessage.Text = ex.Message;
            }
        }
        private bool CheckProgram()
        {
            bool flag = false;
            try
            {
                string _ProcName = "checkCity";
                SqlParameter[] _parameter = {

                           new SqlParameter("@CityName",textBoxCityName.Text)

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