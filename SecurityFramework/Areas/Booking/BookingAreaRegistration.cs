using System.Web.Mvc;

namespace SecurityFramework.Areas.Booking
{
    public class BookingAreaRegistration : AreaRegistration
    {
        public override string AreaName => $"Booking";

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Booking_default",
                "Booking/{controller}/{action}/{id}",
                new {action = "Index", id = UrlParameter.Optional}
            );
        }
    }
}