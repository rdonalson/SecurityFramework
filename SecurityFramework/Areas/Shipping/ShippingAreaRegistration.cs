using System.Web.Mvc;

namespace SecurityFramework.Areas.Shipping
{
    public class ShippingAreaRegistration : AreaRegistration
    {
        public override string AreaName => "Shipping";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Shipping_default",
                "Shipping/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}