using System;
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
    public class ShopRolesController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public ShopRolesController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }

        // GET: Access/ShopRoles
        public ActionResult Index()
        {
            return View(_accessUtils.GetShopRoles().ToList());
        }

        // GET: Access/ShopRoles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _accessUtils.GetShopRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/ShopRoles/Create
        public ActionResult Create()
        {
            ViewBag.ShopId = new SelectList(_accessUtils.GetShops(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/ShopRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Sequence,Name,ShopId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.ShopId = new SelectList(_accessUtils.GetShops(), "Id", "Breadcrumb", role.ShopId);
            return View(role);
        }

        // GET: Access/ShopRoles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.ShopId = new SelectList(_db.Shops, "Id", "Name", role.ShopId);
            return View(role);
        }

        // POST: Access/ShopRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Sequence,Name,ShopId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.ShopId = new SelectList(_accessUtils.GetShops(), "Id", "Breadcrumb", role.ShopId);
            return View(role);
        }

        // GET: Access/ShopRoles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _accessUtils.GetShopRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/ShopRoles/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var role = _db.Roles.Find(id);
            if (role != null) _db.Roles.Remove(role);
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