using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Louisville.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class LouisvilleController : Controller
    {
        // GET: Louisville/Louisville
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Scheduling()
        {
            return View();
        }
        
        public ActionResult Freight()
        {
            return View();
        }

        public ActionResult Maintenance()
        {
            return View();
        }
    }
}