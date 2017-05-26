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
    public class ShopsController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public ShopsController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }

        // GET: Access/Shops
        public ActionResult Index()
        {
            return View(_accessUtils.GetShops().ToList());
        }

        // GET: Access/Shops/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var shop = _accessUtils.GetShops().SingleOrDefault(item => item.Id == id);
            if (shop == null)
                return HttpNotFound();
            return View(shop);
        }

        // GET: Access/Shops/Create
        public ActionResult Create()
        {
            ViewBag.OfficeId = new SelectList(_accessUtils.GetOffices(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/Shops/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,AppId,OfficeId,Name")] Shop shop)
        {
            if (ModelState.IsValid)
            {
                shop.Id = Guid.NewGuid();
                shop.AppId = AppCommon.AppAttributeValue;
                _db.Shops.Add(shop);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.OfficeId = new SelectList(_accessUtils.GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
            return View(shop);
        }

        // GET: Access/Shops/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var shop = _db.Shops.Find(id);
            if (shop == null)
                return HttpNotFound();
            ViewBag.OfficeId = new SelectList(_accessUtils.GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
            return View(shop);
        }

        // POST: Access/Shops/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,AppId,OfficeId,Name")] Shop shop)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(shop).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OfficeId = new SelectList(_accessUtils.GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
            return View(shop);
        }

        // GET: Access/Shops/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var shop = _accessUtils.GetShops().SingleOrDefault(item => item.Id == id);
            if (shop == null)
                return HttpNotFound();
            return View(shop);
        }

        // POST: Access/Shops/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var shop = _db.Shops.Find(id);
            if (shop != null) _db.Shops.Remove(shop);
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