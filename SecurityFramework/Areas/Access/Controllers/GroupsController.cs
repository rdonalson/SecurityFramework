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
    public class GroupsController : Controller
    {
        private readonly AccessEntities _db;
        private readonly Utilities _utilities;

        public GroupsController()
        {
            _db = new AccessEntities();
            _utilities = new Utilities(_db);
        }

        // GET: Access/Groups
        public ActionResult Index()
        {
            return View(_utilities.GetGroups().ToList());
        }

        // GET: Access/Groups/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var group = _utilities.GetGroups().SingleOrDefault(item => item.Id == id);
            if (group == null)
                return HttpNotFound();
            return View(group);
        }

        // GET: Access/Groups/Create
        public ActionResult Create()
        {
            ViewBag.OrganizationId = new SelectList(_utilities.GetOrganizations(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/Groups/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppId,OrganizationId,Name")] Group group)
        {
            if (ModelState.IsValid)
            {
                group.Id = Guid.NewGuid();
                group.AppId = ApplicationCommon.AppAttributeValue;
                _db.Groups.Add(group);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OrganizationId = new SelectList(_utilities.GetOrganizations(), "Id", "Breadcrumb",
                group.OrganizationId);

            return View(group);
        }

        // GET: Access/Groups/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var group = _db.Groups.Find(id);
            if (group == null)
                return HttpNotFound();
            ViewBag.OrganizationId = new SelectList(_utilities.GetOrganizations(), "Id", "Breadcrumb",
                group.OrganizationId);
            return View(group);
        }

        // POST: Access/Groups/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,AppId,OrganizationId,Name")] Group group)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(group).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OrganizationId = new SelectList(_utilities.GetOrganizations(), "Id", "Breadcrumb",
                group.OrganizationId);
            return View(group);
        }

        // GET: Access/Groups/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var group = _utilities.GetGroups().SingleOrDefault(item => item.Id == id);
            if (group == null)
                return HttpNotFound();
            return View(group);
        }

        // POST: Access/Groups/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var group = _db.Groups.Find(id);
            if (group != null) _db.Groups.Remove(group);
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