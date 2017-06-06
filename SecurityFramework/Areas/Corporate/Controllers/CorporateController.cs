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

        [HttpGet]
        public ActionResult HR(string param1, int? param2)
        {
            ViewData[$"param1"] = param1;
            ViewData[$"param2"] = param2;
            return View();
        }

        [HttpPost]
        public ActionResult HR(FormCollection fc)
        {
            ViewData[$"param1"] = fc["Amount"];
            ViewData[$"param2"] = fc["Name"];
            return View();
        }
    }
}


/* Archive
 
        //[HttpGet]
        //[Route("Corporate/Corporate/HR")]
        //public ActionResult HR()
        //{
        //    return View();
        //}

        //[HttpGet]
        //[Route("Corporate/Corporate/HR/{param1?}/{param2?}")]
        //public ActionResult HR(string param1, int? param2)
        //{
        //    ViewData[$"param1"] = param1;
        //    ViewData[$"param2"] = param2;
        //    return View();
        //}
     
     
     
     */