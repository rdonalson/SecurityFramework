using System.Web.Mvc;

namespace SecurityFramework.Areas.Louisville
{
    public class LouisvilleAreaRegistration : AreaRegistration 
    {
        public override string AreaName => $"Louisville";

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Louisville_default",
                "Louisville/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}