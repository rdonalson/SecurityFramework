using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class RoleRoutesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/RoleRoutes
        public ActionResult Index()
        {
            var roleroutes = _db.vwAreasAndRolesAndRoutes
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq)
                .ThenBy(item => item.RoutePath);
            return View(roleroutes.ToList());
        }

        // GET: Access/RoleRoutes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _db.vwAreasAndRolesAndRoutes.SingleOrDefault(item => item.Id == id);
            if (roleRoute == null)
                return HttpNotFound();
            return View(roleRoute);
        }

        // GET: Access/RoleRoutes/Create
        public ActionResult Create()
        {
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole");
            var routes = _db.Routes.OrderBy(item => item.RoutePath);
            ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath");
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

            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleRoute.RoleId);
            var routes = _db.Routes.OrderBy(item => item.RoutePath);
            ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
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
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleRoute.RoleId);
            var routes = _db.Routes.OrderBy(item => item.RoutePath);
            ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
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
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleRoute.RoleId);
            var routes = _db.Routes.OrderBy(item => item.RoutePath);
            ViewBag.RouteId = new SelectList(routes, "Id", "RoutePath", roleRoute.RouteId);
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