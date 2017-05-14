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
    public class ShopsController : Controller
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

        private IQueryable<ListViewModel> GetShops()
        {
            var shops = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                join shp in _db.Shops on off.Id equals shp.OfficeId
                orderby dom.Name, org.Name, grp.Name, off.Name, shp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name + " > " + off.Name + " > " + shp.Name,
                    Id = shp.Id,
                    Name = shp.Name
                };
            return shops;
        }

        // GET: Access/Shops
        public ActionResult Index()
        {
            return View(GetShops().ToList());
        }

        // GET: Access/Shops/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var shop = GetShops().SingleOrDefault(item => item.Id == id);
            if (shop == null)
                return HttpNotFound();
            return View(shop);
        }

        // GET: Access/Shops/Create
        public ActionResult Create()
        {
            ViewBag.OfficeId = new SelectList(GetOffices(), "Id", "Breadcrumb");
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
                shop.AppId = GlobalVariables.AppAttributeValue;
                _db.Shops.Add(shop);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.OfficeId = new SelectList(GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
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
            ViewBag.OfficeId = new SelectList(GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
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
            ViewBag.OfficeId = new SelectList(GetOffices(), "Id", "Breadcrumb", shop.OfficeId);
            return View(shop);
        }

        // GET: Access/Shops/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var shop = GetShops().SingleOrDefault(item => item.Id == id);
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
            _db.Dispose();
        }
    }
}