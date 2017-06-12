using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.Utils;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class RoleRoutesController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public RoleRoutesController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }
        // GET: Access/RoleRoutes
        public ActionResult Index()
        {
            return View(_accessUtils.GetAreaAndRoleAndRoutes());
        }

        // GET: Access/RoleRoutes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _accessUtils.GetAreaAndRoleAndRoutes().SingleOrDefault(item => item.Id == id);
            if (roleRoute == null)
                return HttpNotFound();
            return View(roleRoute);
        }

        // GET: Access/RoleRoutes/Create
        public ActionResult Create()
        {
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), "RoleId", "AreaAndRole");
            if (AppCommon.UserProfile.IsSysAdmin)
            {
                var routes = _db.Routes.OrderBy(item => item.RoutePath);
                ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath");
            }
            else
                ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), "RouteId", "RoutePath");
            return View();
        }

        // POST: Access/RoleRoutes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,RoleId,RouteId")] RoleRoute roleRoute)
        {
            if (ModelState.IsValid)
            {
                roleRoute.Id = Guid.NewGuid();
                _db.RoleRoutes.Add(roleRoute);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), "RoleId", "AreaAndRole", roleRoute.RoleId);
            if (AppCommon.UserProfile.IsSysAdmin)
            {
                var routes = _db.Routes.OrderBy(item => item.RoutePath);
                ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
            }
            else
                ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), "RouteId", "RoutePath", roleRoute.RouteId);
            return View(roleRoute);
        }

        // GET: Access/RoleRoutes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _db.RoleRoutes.Find(id);
            if (roleRoute == null)
                return HttpNotFound();
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), "RoleId", "AreaAndRole", roleRoute.RoleId);
            if (AppCommon.UserProfile.IsSysAdmin)
            {
                var routes = _db.Routes.OrderBy(item => item.RoutePath);
                ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
            }
            else
                ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), "RouteId", "RoutePath", roleRoute.RouteId);
            return View(roleRoute);
        }

        // POST: Access/RoleRoutes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,RoleId,RouteId")] RoleRoute roleRoute)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(roleRoute).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), "RoleId", "AreaAndRole", roleRoute.RoleId);
            if (AppCommon.UserProfile.IsSysAdmin)
            {
                var routes = _db.Routes.OrderBy(item => item.RoutePath);
                ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
            }
            else
                ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), "RouteId", "RoutePath", roleRoute.RouteId);
            return View(roleRoute);
        }

        // GET: Access/RoleRoutes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _db.vwAreasAndRolesAndRoutes.SingleOrDefault(item => item.Id == id);
            if (roleRoute == null)
                return HttpNotFound();
            return View(roleRoute);
        }

        // POST: Access/RoleRoutes/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var roleRoute = _db.RoleRoutes.Find(id);
            if (roleRoute != null) _db.RoleRoutes.Remove(roleRoute);
            _db.SaveChanges();
            return RedirectToAction($"Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
        }
    }
}