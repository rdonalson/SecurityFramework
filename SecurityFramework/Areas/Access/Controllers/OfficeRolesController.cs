using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class OfficeRolesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/OfficeRoles
        public ActionResult Index()
        {
            var roles = _db.Roles.Where(item => item.OfficeId != null).OrderBy(item => item.Sequence);
            return View(roles.ToList());
        }

        // GET: Access/OfficeRoles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/OfficeRoles/Create
        public ActionResult Create()
        {
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name");
            return View();
        }

        // POST: Access/OfficeRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Sequence,Name,OfficeId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            return View(role);
        }

        // GET: Access/OfficeRoles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            return View(role);
        }

        // POST: Access/OfficeRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Sequence,Name,OfficeId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            return View(role);
        }

        // GET: Access/OfficeRoles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/OfficeRoles/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var role = _db.Roles.Find(id);
            _db.Roles.Remove(role);
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