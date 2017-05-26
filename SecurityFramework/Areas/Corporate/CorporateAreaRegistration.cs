using System.Web.Mvc;

namespace SecurityFramework.Areas.Corporate
{
    public class CorporateAreaRegistration : AreaRegistration
    {
        public override string AreaName => "Corporate";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Corporate_default",
                "Corporate/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}