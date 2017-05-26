using System.Web.Mvc;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.GlenlakePkwy.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class GlenlakeController : Controller
    {
        // GET: GlenlakePkwy/Glenlake
        public ActionResult Index()
        {
            return View();
        }
    }
}