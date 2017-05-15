using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models;
using SecurityFramework.Areas.Access.Models.Entity;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class OrganizationRolesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        private IQueryable<ListViewModel> GetOrganizationRoles()
        {
            var organizations = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join rle in _db.Roles on org.Id equals rle.OrganizationId
                where rle.OrganizationId != null
                orderby dom.Name, org.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return organizations;
        }
        
        private IQueryable<ListViewModel> GetOrganizations()
        {
            var organizations = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                orderby dom.Name, org.Name, grp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name,
                    Id = org.Id,
                    Name = org.Name
                };
            return organizations;
        }

        // GET: Access/OrganizationRoles
        public ActionResult Index()
        {
            return View(GetOrganizationRoles().ToList());
        }

        // GET: Access/OrganizationRoles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
 var role = GetOrganizationRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/OrganizationRoles/Create
        public ActionResult Create()
        {
            //ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name");
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/OrganizationRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Sequence,Name,OrganizationId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", role.OrganizationId);
            //ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            return View(role);
        }

        // GET: Access/OrganizationRoles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", role.OrganizationId);
            //ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            return View(role);
        }

        // POST: Access/OrganizationRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Sequence,Name,OrganizationId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", role.OrganizationId);
            //ViewBag.OrganizationId = new SelectList(_db.Organizations, "Id", "Name", role.OrganizationId);
            return View(role);
        }

        // GET: Access/OrganizationRoles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = GetOrganizationRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/OrganizationRoles/Delete/5
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
        }
    }
}