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
    public class DomainsController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/Domains
        public ActionResult Index()
        {
            return View(_db.Domains.ToList());
        }

        // GET: Access/Domains/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var domain = _db.Domains.Find(id);
            if (domain == null)
                return HttpNotFound();
            return View(domain);
        }

        // GET: Access/Domains/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Access/Domains/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppId,Name")] Domain domain)
        {
            if (ModelState.IsValid)
            {
                domain.Id = Guid.NewGuid();
                domain.AppId = GlobalVariables.AppAttributeValue;
                _db.Domains.Add(domain);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            return View(domain);
        }

        // GET: Access/Domains/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var domain = _db.Domains.Find(id);
            if (domain == null)
                return HttpNotFound();
            return View(domain);
        }

        // POST: Access/Domains/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,AppId,Name")] Domain domain)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(domain).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            return View(domain);
        }

        // GET: Access/Domains/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var domain = _db.Domains.Find(id);
            if (domain == null)
                return HttpNotFound();
            return View(domain);
        }

        // POST: Access/Domains/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var domain = _db.Domains.Find(id);
            if (domain != null) _db.Domains.Remove(domain);
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