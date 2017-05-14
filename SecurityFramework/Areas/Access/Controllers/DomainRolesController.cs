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
    public class DomainRolesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/DomainRoles
        public ActionResult Index()
        {
            var roles = _db.Roles.Where(item => item.DomainId != null).OrderBy(item => item.Sequence);
            return View(roles.ToList());
        }

        // GET: Access/DomainRoles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/DomainRoles/Create
        public ActionResult Create()
        {
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name");
            return View();
        }

        // POST: Access/DomainRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Sequence,Name,DomainId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            return View(role);
        }

        // GET: Access/DomainRoles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            return View(role);
        }

        // POST: Access/DomainRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Sequence,Name,DomainId,OrganizationId,GroupId,OfficeId,ShopId")] Role role)
        public ActionResult Edit([Bind(Include = "Id,Sequence,Name,DomainId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            return View(role);
        }

        // GET: Access/DomainRoles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/DomainRoles/Delete/5
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