using System.Web.Mvc;

namespace SecurityFramework.Areas.Booking.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class BookingHomeController : Controller
    {
        // GET: Booking/BookingHome

        public ActionResult Index()
        {
            return View();
        }
    }
}