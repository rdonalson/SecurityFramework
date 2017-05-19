using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using Route = SecurityFramework.Areas.Access.Models.Entity.Route;

namespace SecurityFramework
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Get application id
            var assembly = Assembly.GetExecutingAssembly();
            var attribute = (GuidAttribute)assembly.GetCustomAttributes(typeof(GuidAttribute), true)[0];
            ApplicationCommon.AppAttributeValue = new Guid(attribute.Value);

            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Populate the AppObjects Table with Page & Route Names
            IFindRoutes findRoutes = new FindRoutes();
            var root = HttpContext.Current.Server.MapPath("~");
            var files = new List<Route>();
            findRoutes.GetAppFiles(ApplicationCommon.AppAttributeValue, new[] { root }, root, new[] { "*.cshtml", "*.aspx" }, ref files);
            findRoutes.AddToTable(ApplicationCommon.AppAttributeValue, files);

        }

        protected void Application_Error(object sender, EventArgs e)
        {
        }

        protected void Session_Start()
        {

        }

        protected void Session_End()
        {
            Session.RemoveAll();
        }
    }
}