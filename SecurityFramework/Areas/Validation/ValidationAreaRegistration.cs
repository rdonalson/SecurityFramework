using System.Web.Mvc;

namespace SecurityFramework.Areas.Validation
{
    public class ValidationAreaRegistration : AreaRegistration
    {
        public override string AreaName => "Validation";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Validation_default",
                "Validation/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}