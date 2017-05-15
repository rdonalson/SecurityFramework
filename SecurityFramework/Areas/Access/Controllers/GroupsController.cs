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
    public class GroupsController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

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

        // GET: Access/Groups
        public ActionResult Index()
        {
            return View(GetGroups().ToList());
        }

        // GET: Access/Groups/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var group = GetGroups().SingleOrDefault(item => item.Id == id);
            if (group == null)
                return HttpNotFound();
            return View(group);
        }

        // GET: Access/Groups/Create
        public ActionResult Create()
        {
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb");
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
                group.AppId = GlobalVariables.AppAttributeValue;
                _db.Groups.Add(group);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", group.OrganizationId);

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
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", group.OrganizationId);
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
            ViewBag.OrganizationId = new SelectList(GetOrganizations(), "Id", "Breadcrumb", group.OrganizationId);
            return View(group);
        }

        // GET: Access/Groups/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var group = GetGroups().SingleOrDefault(item => item.Id == id);
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
            _db.Dispose();
        }
    }
}