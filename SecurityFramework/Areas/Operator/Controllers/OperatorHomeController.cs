using System.Web.Mvc;

namespace SecurityFramework.Areas.Operator.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class OperatorHomeController : Controller
    {
        // GET: Operator/OperatorHome
        public ActionResult Index()
        {
            return View();
        }
    }
}