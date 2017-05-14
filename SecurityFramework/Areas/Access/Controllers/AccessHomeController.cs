using System.Web.Mvc;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class AccessHomeController : Controller
    {
        // GET: Access/AccessHome
        public ActionResult Index()
        {
            return View();
        }
    }
}