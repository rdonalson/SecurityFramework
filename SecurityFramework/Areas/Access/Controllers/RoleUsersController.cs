using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class RoleUsersController : Controller
    {
        private readonly AccessEntities _db = new AccessEntities();

        public ActionResult ListBox()
        {
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole");
            return View();
        }

        // GET: Access/RoleUsers
        public ActionResult Index()
        {
            var roleUsers = _db.vwAreasAndRolesAndUsers
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq)
                .ThenBy(item => item.UserId);
            return View(roleUsers.ToList());
        }

        // GET: Access/RoleUsers/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _db.vwAreasAndRolesAndUsers.SingleOrDefault(item => item.Id == id);
            if (roleUser == null)
                return HttpNotFound();
            return View(roleUser);
        }

        // GET: Access/RoleUsers/Create
        public ActionResult Create()
        {
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole");
            ViewBag.UserId = new SelectList(_db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Access/RoleUsers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,RoleId,UserId")] RoleUser roleUser)
        {
            if (ModelState.IsValid)
            {
                roleUser.Id = Guid.NewGuid();
                _db.RoleUsers.Add(roleUser);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_db.AspNetUsers, "Id", "Email", roleUser.UserId);
            return View(roleUser);
        }

        // GET: Access/RoleUsers/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _db.RoleUsers.Find(id);
            if (roleUser == null)
                return HttpNotFound();
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_db.AspNetUsers, "Id", "Email", roleUser.UserId);
            return View(roleUser);
        }

        // POST: Access/RoleUsers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,RoleId,UserId")] RoleUser roleUser)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(roleUser).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_db.AspNetUsers, "Id", "Email", roleUser.UserId);
            return View(roleUser);
        }

        // GET: Access/RoleUsers/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //RoleUser roleUser = _db.RoleUsers.Find(id);
            var roleUser = _db.vwAreasAndRolesAndUsers.SingleOrDefault(item => item.Id == id);
            if (roleUser == null)
                return HttpNotFound();
            return View(roleUser);
        }

        // POST: Access/RoleUsers/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var roleUser = _db.RoleUsers.Find(id);
            if (roleUser != null) _db.RoleUsers.Remove(roleUser);
            _db.SaveChanges();
            return RedirectToAction($"Index");
        }

        public new void Dispose()
        {
            _db.Dispose();
        }
    }
}