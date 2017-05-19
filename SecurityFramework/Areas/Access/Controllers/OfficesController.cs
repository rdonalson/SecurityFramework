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
    public class OfficesController : Controller
    {
        private readonly AccessEntities _db;
        private readonly Utilities _utilities;

        public OfficesController()
        {
            _db = new AccessEntities();
            _utilities = new Utilities(_db);
        }

        // GET: Access/Offices
        public ActionResult Index()
        {
            return View(_utilities.GetOffices().ToList());
        }

        // GET: Access/Offices/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var office = _utilities.GetOffices().SingleOrDefault(item => item.Id == id);
            if (office == null)
                return HttpNotFound();
            return View(office);
        }

        // GET: Access/Offices/Create
        public ActionResult Create()
        {
            ViewBag.GroupId = new SelectList(_utilities.GetGroups(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/Offices/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppId,GroupId,Name")] Office office)
        {
            if (ModelState.IsValid)
            {
                office.Id = Guid.NewGuid();
                office.AppId = ApplicationCommon.AppAttributeValue;
                _db.Offices.Add(office);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.GroupId = new SelectList(_utilities.GetGroups(), "Id", "Breadcrumb", office.GroupId);
            return View(office);
        }

        // GET: Access/Offices/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var office = _db.Offices.Find(id);
            if (office == null)
                return HttpNotFound();
            ViewBag.GroupId = new SelectList(_utilities.GetGroups(), "Id", "Breadcrumb", office.GroupId);
            return View(office);
        }

        // POST: Access/Offices/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,AppId,GroupId,Name")] Office office)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(office).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.GroupId = new SelectList(_utilities.GetGroups(), "Id", "Breadcrumb", office.GroupId);
            return View(office);
        }

        // GET: Access/Offices/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var office = _utilities.GetOffices().SingleOrDefault(item => item.Id == id);
            if (office == null)
                return HttpNotFound();
            return View(office);
        }

        // POST: Access/Offices/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var office = _db.Offices.Find(id);
            if (office != null) _db.Offices.Remove(office);
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