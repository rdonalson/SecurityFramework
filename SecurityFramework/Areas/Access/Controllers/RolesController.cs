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
    public class RolesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/Roles
        public ActionResult Index()
        {
            var roles = _db.Roles.Include(r => r.Domain)
                .Include(r => r.Group)
                .Include(r => r.Office)
                .Include(r => r.Organization)
                .Include(r => r.Shop);
            return View(roles.ToList());
        }

        // GET: Access/Roles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/Roles/Create
        public ActionResult Create()
        {
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name");
            ViewBag.GroupId = new SelectList(_db.Groups, "Id", "Name");
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name");
            ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name");
            ViewBag.ShopId = new SelectList(_db.Shops, "Id", "Name");
            return View();
        }

        // POST: Access/Roles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            [Bind(Include = "Id,Sequence,Name,DomainId,OrganizationId,GroupId,OfficeId,ShopId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            ViewBag.GroupId = new SelectList(_db.Groups, "Id", "Name", role.GroupId);
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            ViewBag.ShopId = new SelectList(_db.Shops, "Id", "Name", role.ShopId);
            return View(role);
        }

        // GET: Access/Roles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            ViewBag.GroupId = new SelectList(_db.Groups, "Id", "Name", role.GroupId);
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            ViewBag.ShopId = new SelectList(_db.Shops, "Id", "Name", role.ShopId);
            return View(role);
        }

        // POST: Access/Roles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(
            [Bind(Include = "Id,Sequence,Name,DomainId,OrganizationId,GroupId,OfficeId,ShopId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", role.DomainId);
            ViewBag.GroupId = new SelectList(_db.Groups, "Id", "Name", role.GroupId);
            ViewBag.OfficeId = new SelectList(_db.Offices, "Id", "Name", role.OfficeId);
            ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            ViewBag.ShopId = new SelectList(_db.Shops, "Id", "Name", role.ShopId);
            return View(role);
        }

        // GET: Access/Roles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/Roles/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var role = _db.Roles.Find(id);
            if (role != null) _db.Roles.Remove(role);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
            _db.Dispose();
        }
    }
}