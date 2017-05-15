using System.Web.Mvc;

namespace SecurityFramework.Areas.Validation.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class ValidationHomeController : Controller
    {
        // GET: Validation/ValidationHome
        public ActionResult Index()
        {
            return View();
        }
    }
}