using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Common;
using SecurityFramework.Areas.Access.Models.Entity;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class OrganizationsController : Controller
    {
        private readonly AccessEntities _db;
        private readonly Utilities _utilities;

        public OrganizationsController()
        {
            _db = new AccessEntities();
            _utilities = new Utilities(_db);
        }

        // GET: Access/Organizations
        public ActionResult Index()
        {
            return View(_utilities.GetOrganizations().ToList());
        }

        // GET: Access/Organizations/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _utilities.GetOrganizations().SingleOrDefault(item => item.Id == id);
            if (organization == null)
                return HttpNotFound();
            return View(organization);
        }

        // GET: Access/Organizations/Create
        public ActionResult Create()
        {
            ViewBag.DomainId = new SelectList(_utilities.GetDomains(), "Id", "Breadcrumb");
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
                organization.AppId = ApplicationCommon.AppAttributeValue;
                _db.Organizations.Add(organization);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.DomainId = new SelectList(_utilities.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
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
            ViewBag.DomainId = new SelectList(_utilities.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
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
            ViewBag.DomainId = new SelectList(_utilities.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
            return View(organization);
        }

        // GET: Access/Organizations/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _utilities.GetOrganizations().SingleOrDefault(item => item.Id == id);
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