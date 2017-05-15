using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class OrganizationsController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/Organizations
        public ActionResult Index()
        {
            var organizations = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                orderby dom.Name, org.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name,
                    Id = org.Id,
                    Name = org.Name
                };
            return View(organizations.ToList());
        }

        // GET: Access/Organizations/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _db.Organizations.Find(id);
            if (organization == null)
                return HttpNotFound();
            return View(organization);
        }

        // GET: Access/Organizations/Create
        public ActionResult Create()
        {
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name");
            return View();
        }

        // POST: Access/Organizations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppId,DomainId,Name")] Organization organization)
        {
            if (ModelState.IsValid)
            {
                organization.Id = Guid.NewGuid();
                organization.AppId = GlobalVariables.AppAttributeValue;
                _db.Organizations.Add(organization);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", organization.DomainId);
            return View(organization);
        }

        // GET: Access/Organizations/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _db.Organizations.Find(id);
            if (organization == null)
                return HttpNotFound();
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", organization.DomainId);
            return View(organization);
        }

        // POST: Access/Organizations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,AppId,DomainId,Name")] Organization organization)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(organization).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.DomainId = new SelectList(_db.Domains, "Id", "Name", organization.DomainId);
            return View(organization);
        }

        // GET: Access/Organizations/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _db.Organizations.Find(id);
            if (organization == null)
                return HttpNotFound();
            return View(organization);
        }

        // POST: Access/Organizations/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var organization = _db.Organizations.Find(id);
            if (organization != null) _db.Organizations.Remove(organization);
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