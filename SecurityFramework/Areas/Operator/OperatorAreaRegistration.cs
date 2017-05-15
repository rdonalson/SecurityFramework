using System.Web.Mvc;

namespace SecurityFramework.Areas.Operator
{
    public class OperatorAreaRegistration : AreaRegistration
    {
        public override string AreaName => $"Operator";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Operator_default",
                "Operator/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}