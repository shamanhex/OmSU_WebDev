using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;

namespace WebApp01.API
{
    /// <summary>
    /// Summary description for MonitoringData
    /// </summary>
    public class MonitoringData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string varName = context.Request.Params["varname"];
            string sql = string.Format("SELECT VALUENUM, VALUETEXT FROM monitoringdata WHERE VARNAME=@varname ORDER BY DATETIME");

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MainDB"].ConnectionString;
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            {
                connection.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(sql, connection))
                {
                    cmd.Parameters.AddWithValue("@varname", varName);

                    NpgsqlDataReader reader = cmd.ExecuteReader();

                    List<double> values = new List<double>();
                    while (reader.Read())
                    {
                        values.Add(Convert.ToDouble(reader["VALUENUM"]));
                    }

                    context.Response.ContentType = "application/json";
                    context.Response.Write("[ " + string.Join(", ", values) + " ]");
                }
                connection.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}