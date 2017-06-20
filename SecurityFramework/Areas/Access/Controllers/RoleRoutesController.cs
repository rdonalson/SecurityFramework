using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.Utils;
using SecurityFramework.Models;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    /// ===============================================================================================
    /// <summary>
    ///     Roles & Routes Controller
    /// </summary>
    /// ===============================================================================================
    [VerifyAccess]
    [Authorize]
    public class RoleRoutesController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Constructor
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        public RoleRoutesController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleRoutes
        /// </summary>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Index()
        {
            return View(_accessUtils.GetAreasAndRolesAndRoutes());
        }

        #region Create

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleRoutes/Create
        /// </summary>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Create()
        {
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name");
            ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), $"Id", $"Name");

            return View();
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST: Access/RoleRoutes/Create
        ///     To protect from overposting attacks, please enable the specific properties you want to bind to, for
        ///     more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        /// </summary>
        /// <param name="roleRoute">RoleRoute</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = @"Id,RoleId,RouteId")] RoleRoute roleRoute)
        {
            if (ModelState.IsValid)
            {
                roleRoute.Id = Guid.NewGuid();
                _db.RoleRoutes.Add(roleRoute);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name", roleRoute.RoleId);
            ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), $"Id", $"Name", roleRoute.RouteId);

            return View(roleRoute);
        }

        #endregion Create

        #region Edit

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleRoutes/Details/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _accessUtils.GetAreasAndRolesAndRoutes().SingleOrDefault(item => item.Id == id);
            if (roleRoute == null)
                return HttpNotFound();

            return View(roleRoute);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleRoutes/Edit/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _db.RoleRoutes.Find(id);
            if (roleRoute == null)
                return HttpNotFound();
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name", roleRoute.RoleId);
            ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), $"Id", $"Name", roleRoute.RouteId);

            return View(roleRoute);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST:  Access/RoleRoutes/Edit/5
        ///     To protect from overposting attacks, please enable the specific properties you want to bind to, for
        ///     more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        /// </summary>
        /// <param name="roleRoute">RoleRoute</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = @"Id,RoleId,RouteId")] RoleRoute roleRoute)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(roleRoute).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name",roleRoute.RoleId);
            ViewBag.RouteId = new SelectList(_accessUtils.GetRolesAndRoutes(), $"Id", $"Name", roleRoute.RouteId);

            return View(roleRoute);
        }

        #endregion Edit

        #region Delete

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleRoutes/Delete/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleRoute = _db.vwAreasAndRolesAndRoutes.SingleOrDefault(item => item.Id == id);
            if (roleRoute == null)
                return HttpNotFound();
            return View(roleRoute);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST: Access/RoleRoutes/Delete/5
        /// </summary>
        /// <param name="id">Guid</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
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

        #endregion Delete

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Cleanup
        /// </summary>
        /// <param name="disposing">bool</param>
        /// -----------------------------------------------------------------------------------------------
        protected override void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
        }
    }
}