using System.Web.Mvc;

namespace SecurityFramework.Areas.Access
{
    public class AccessAreaRegistration : AreaRegistration
    {
        public override string AreaName => $"Access";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Access_default",
                "Access/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}