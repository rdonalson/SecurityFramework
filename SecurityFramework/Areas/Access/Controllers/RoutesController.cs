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
    public class RoutesController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        // GET: Access/Routes 
        public ActionResult Index()
        {
            return View(_db.Routes.ToList()
                .Where(item => !item.RoutePath.Contains("/Access/")
                               && !item.RoutePath.Contains("/Account/")
                               && !item.RoutePath.Contains("/SystemAdmin/"))
                .OrderBy(item => item.RoutePath));
        }

        // GET: Access/Routes/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var route = _db.Routes.Find(id);
            if (route == null)
                return HttpNotFound();
            return View(route);
        }

        // GET: Access/Routes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Access/Routes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FilePath,FileName,AppPath,RoutePath")] Route route)
        {
            if (ModelState.IsValid)
            {
                route.Id = Guid.NewGuid();
                _db.Routes.Add(route);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            return View(route);
        }

        // GET: Access/Routes/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var route = _db.Routes.Find(id);
            if (route == null)
                return HttpNotFound();
            return View(route);
        }

        // POST: Access/Routes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FilePath,FileName,AppPath,RoutePath")] Route route)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(route).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            return View(route);
        }

        // GET: Access/Routes/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var route = _db.Routes.Find(id);
            if (route == null)
                return HttpNotFound();
            return View(route);
        }

        // POST: Access/Routes/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var route = _db.Routes.Find(id);
            if (route != null) _db.Routes.Remove(route);
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