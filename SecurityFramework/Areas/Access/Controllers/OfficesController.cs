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
    public class OfficesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        private IQueryable<ListViewModel> GetOffices()
        {
            var offices = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                orderby dom.Name, org.Name, grp.Name, off.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name + " > " + off.Name,
                    Id = off.Id,
                    Name = off.Name
                };
            return offices;
        }

        private IQueryable<ListViewModel> GetGroups()
        {
            var groups = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                orderby dom.Name, org.Name, grp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name,
                    Id = grp.Id,
                    Name = grp.Name
                };
            return groups;
        }

        // GET: Access/Offices
        public ActionResult Index()
        {
            return View(GetOffices().ToList());
        }

        // GET: Access/Offices/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var office = GetOffices().SingleOrDefault(item => item.Id == id);
            if (office == null)
                return HttpNotFound();
            return View(office);
        }

        // GET: Access/Offices/Create
        public ActionResult Create()
        {
            ViewBag.GroupId = new SelectList(GetGroups(), "Id", "Breadcrumb");
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
                office.AppId = GlobalVariables.AppAttributeValue;
                _db.Offices.Add(office);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.GroupId = new SelectList(GetGroups(), "Id", "Breadcrumb", office.GroupId);
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
            ViewBag.GroupId = new SelectList(GetGroups(), "Id", "Breadcrumb", office.GroupId);
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
            ViewBag.GroupId = new SelectList(GetGroups(), "Id", "Breadcrumb", office.GroupId);
            return View(office);
        }

        // GET: Access/Offices/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var office = GetOffices().SingleOrDefault(item => item.Id == id);
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
        }
    }
}