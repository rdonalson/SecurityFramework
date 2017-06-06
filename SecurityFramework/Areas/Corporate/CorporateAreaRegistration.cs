using System.Web.Mvc;

namespace SecurityFramework.Areas.Corporate
{
    public class CorporateAreaRegistration : AreaRegistration
    {
        public override string AreaName => $"Corporate";

        public override void RegisterArea(AreaRegistrationContext context)
        {


            context.MapRoute(
                "Corporate_default",
                "Corporate/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );

            //context.MapRoute(
            //    "Corporate_HR1",
            //    "Corporate/{controller}/{action}",
            //    new
            //    {
            //        action = "HR",
            //        controller = nameof(Corporate)
            //    }
            //);

            //context.MapRoute(
            //    "Corporate_HR2",
            //    "Corporate/{controller}/{action}/{param1}/{param2}",
            //    new
            //    {
            //        action = "HR",
            //        controller = nameof(Corporate),
            //        param1 = UrlParameter.Optional,
            //        param2 = UrlParameter.Optional
            //    }
            //);
        }
    }
}