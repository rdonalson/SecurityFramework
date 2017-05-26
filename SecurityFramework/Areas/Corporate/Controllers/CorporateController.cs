using System.Web.Mvc;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Corporate.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class CorporateController : Controller
    {
        // GET: Corporate/Corporate
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Executive()
        {
            return View();
        }

        public ActionResult HR()
        {
            return View();
        }
    }
}