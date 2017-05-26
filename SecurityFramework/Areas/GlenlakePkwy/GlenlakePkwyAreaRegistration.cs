using System.Web.Mvc;

namespace SecurityFramework.Areas.GlenlakePkwy
{
    public class GlenlakePkwyAreaRegistration : AreaRegistration
    {
        public override string AreaName => "GlenlakePkwy";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "GlenlakePkwy_default",
                "GlenlakePkwy/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}