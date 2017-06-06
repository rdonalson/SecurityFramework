using System.Web.Mvc;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class AccessHomeController : Controller
    {
        // GET: Access/AccessHome
        public ActionResult Index()
        {
            ViewBag.ApplicationPath = AppCommon.GetAppPath(); //AppCommon.AppPath == "/" ? "" : AppCommon.AppPath;
            return View();
        }
    }
}