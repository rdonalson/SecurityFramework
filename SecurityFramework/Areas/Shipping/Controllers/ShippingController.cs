using System.Web.Mvc;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Shipping.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class ShippingController : Controller
    {
        // GET: Shipping/Shipping
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Air()
        {
            return View();
        }

        public ActionResult Ground()
        {
            return View();
        }
    }
}