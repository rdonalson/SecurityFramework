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
    public class OrganizationsController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public OrganizationsController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }

        // GET: Access/Organizations
        public ActionResult Index()
        {
            return View(_accessUtils.GetOrganizations().ToList());
        }

        // GET: Access/Organizations/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _accessUtils.GetOrganizations().SingleOrDefault(item => item.Id == id);
            if (organization == null)
                return HttpNotFound();
            return View(organization);
        }

        // GET: Access/Organizations/Create
        public ActionResult Create()
        {
            ViewBag.DomainId = new SelectList(_accessUtils.GetDomains(), "Id", "Breadcrumb");
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
                organization.AppId = AppCommon.AppAttributeValue;
                _db.Organizations.Add(organization);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.DomainId = new SelectList(_accessUtils.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
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
            ViewBag.DomainId = new SelectList(_accessUtils.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
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
            ViewBag.DomainId = new SelectList(_accessUtils.GetDomains(), "Id", "Breadcrumb", organization.DomainId);
            return View(organization);
        }

        // GET: Access/Organizations/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var organization = _accessUtils.GetOrganizations().SingleOrDefault(item => item.Id == id);
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