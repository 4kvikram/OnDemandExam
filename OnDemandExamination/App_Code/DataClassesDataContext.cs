using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace OnDemandExamination.App_Code
{
    public class DataClassesDataContext
    {
        private SqlConnection _connection;
        private SqlCommand _command;
        private SqlDataAdapter _adapter;
        private SqlDataReader _reader;
        private DataSet ds;
        SqlParameter _sqlParameter = new SqlParameter();
        private void OpenConnection()
        {
            if (_connection == null)
            {
                _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionDB"].ConnectionString);
            }
            if (_connection.State == ConnectionState.Closed)
            {
                _connection.Open();
            }
            _command = new SqlCommand();
            _command.Connection = _connection;
        }
        private void CloseConnection()
        {
            SqlConnection.ClearPool(_connection);
            SqlConnection.ClearAllPools();

            if (_connection.State == ConnectionState.Open)
                _connection.Close();
        }
        public void Dispose()
        {
            if (_connection != null)
                _connection.Dispose();
            _connection = null;
        }
        public DataTable GetDataTable(string _procedureName, SqlParameter[] _Parameters)
        {
            this.OpenConnection();
            DataTable _objTable = new DataTable();
            _adapter = new SqlDataAdapter();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            _adapter.SelectCommand = _command;
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            _adapter.Fill(_objTable);
            this.CloseConnection();

            return _objTable;
        }
        public DataTable GetDataTableByQuery(string _procedureName)
        {
            this.OpenConnection();
            DataTable _objTable = new DataTable();
            _adapter = new SqlDataAdapter();
            _command.CommandType = CommandType.Text;
            _command.CommandText = _procedureName;
            _adapter.SelectCommand = _command;
            _adapter.Fill(_objTable);
            this.OpenConnection();
            return _objTable;

        }
        public SqlDataReader GetDataReaderByQuery(string _procedureName)
        {
            this.OpenConnection();

            _command.CommandText = _procedureName;

            _reader = _command.ExecuteReader(CommandBehavior.CloseConnection);
            return _reader;

        }
        public SqlDataReader GetDataReaderByProc(string _procedureName, SqlParameter[] _Parameters)
        {
            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            _reader = _command.ExecuteReader(CommandBehavior.CloseConnection);
            return _reader;

        }
        public int ExecuteNonQueryByQuery(string _query)
        {
            this.OpenConnection();
            _command.CommandText = _query;
            int i = _command.ExecuteNonQuery();
            CloseConnection();
            return i;
        }
        public int ExecuteNonQueryByProc(string _procedureName, SqlParameter[] _Parameters)
        {
            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            int i = _command.ExecuteNonQuery();
            CloseConnection();
            return i;
        }
        public int InsertUpdateByQuery(string strQry)
        {
            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.Text;
            _command.CommandText = strQry;
            int i = _command.ExecuteNonQuery();
            CloseConnection();
            return i;
        }
        public bool IsExist(string _procedureName, SqlParameter[] _Parameters)
        {
            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            int IsExistCheck = Convert.ToInt32(_command.ExecuteScalar());
            if (IsExistCheck > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public int Return_Parameter_NonExecuteQuery(string _procedureName, SqlParameter[] _Parameters, SqlParameter[] _Outputparameter)
        {
            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            SqlParameter _sqlOutputParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            foreach (SqlParameter LoopVar_Param in _Outputparameter)
            {
                _sqlOutputParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlOutputParameter);
                _command.Parameters[_sqlOutputParameter.ParameterName].Direction = ParameterDirection.Output;
            }
            _command.ExecuteNonQuery();
            int returnresult = Convert.ToInt32(_command.Parameters[_sqlOutputParameter.ParameterName].Value);
            return returnresult;
        }
        public DataSet Get_DataSet(string strQry)
        {
            _adapter = new SqlDataAdapter(strQry, _connection);
            ds = new DataSet();
            _adapter.Fill(ds);
            return ds;
        }
        public void sbNotBackToLogin(int n, string lcPage)
        {
            if (n == 1)
            {
                string nextpage = lcPage;
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=javascript>");
                HttpContext.Current.Response.Write("{");
                HttpContext.Current.Response.Write(" var Backlen=history.length;");
                HttpContext.Current.Response.Write(" history.go(+Backlen);");
                HttpContext.Current.Response.Write(" window.location.href='" + nextpage + "';");
                HttpContext.Current.Response.Write("}");
                HttpContext.Current.Response.Write("</SCRIPT>");
            }
        }
        public void sbLogout(int n, string lcPage)
        {
            if (n == 1)
            {
                string nextpage = lcPage;
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=javascript>");
                HttpContext.Current.Response.Write("{");
                HttpContext.Current.Response.Write(" var Backlen=history.length;");
                HttpContext.Current.Response.Write(" history.go(+Backlen);");
                HttpContext.Current.Response.Write(" window.location.href='" + nextpage + "';");
                HttpContext.Current.Response.Write("}");
                HttpContext.Current.Response.Write("</SCRIPT>");
            }
        }
        public string ExecuteScalerByQuery(string _query)
        {
            try
            {
                this.OpenConnection();
                _command.CommandText = _query;
                string i = _command.ExecuteScalar().ToString();
                CloseConnection();
                return i;
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public int ExecuteNonQueryByQueryProc(SqlParameter[] _Parameters, string _procedureName)
        {

            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = _procedureName;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            int i = _command.ExecuteNonQuery();
            CloseConnection();
            return i;
        }
        public int ExecuteNonQueryByQuery(SqlParameter[] _Parameters, string _query)
        {

            this.OpenConnection();
            SqlParameter _sqlParameter = new SqlParameter();
            _command.CommandText = _query;
            if (_command.Parameters.Count > 0)
                _command.Parameters.Clear();
            foreach (SqlParameter LoopVar_Param in _Parameters)
            {
                _sqlParameter = LoopVar_Param;
                _command.Parameters.Add(_sqlParameter);
            }
            int i = _command.ExecuteNonQuery();
            CloseConnection();
            return i;
        }
    }
}