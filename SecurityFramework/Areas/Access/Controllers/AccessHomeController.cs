using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;
using SecurityFramework.Utilities.Common;
using Role = SecurityFramework.Areas.Access.Models.View.Role;
using Route = SecurityFramework.Areas.Access.Models.View.Route;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class AccessHomeController : Controller
    {
        // GET: Access/AccessHome
        public ActionResult Index()
        {
            ViewBag.ApplicationPath = AppCommon.AppPath == "/" ? "" : AppCommon.AppPath;
            return View();
        }
    }
}