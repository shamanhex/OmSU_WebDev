using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp01.API
{
    /// <summary>
    /// Summary description for MonitoringData
    /// </summary>
    public class MonitoringData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            context.Response.Write("[ 10, 10, 10, 10, 90, 90, 90, 90, 90, 13 ]");
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