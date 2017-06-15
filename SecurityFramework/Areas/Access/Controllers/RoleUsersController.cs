using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.Utils;
using SecurityFramework.Models;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.Areas.Access.Controllers
{
    [VerifyAccess]
    [Authorize]
    public class RoleUsersController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;
        private readonly bool _isSysAdmin;

        public RoleUsersController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
            _isSysAdmin = System.Web.HttpContext.Current.User.Identity.GetSysAdmin();
        }

        // GET: Access/RoleUsers
        public ActionResult Index()
        {
            return View(_accessUtils.GetAreasAndRolesAndUsers());
        }

        // GET: Access/RoleUsers/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _accessUtils.GetAreasAndRolesAndUsers().SingleOrDefault(item => item.Id == id);
            if (roleUser == null)
                return HttpNotFound();

            return View(roleUser);
        }

        // GET: Access/RoleUsers/Create
        public ActionResult Create()
        {
            ViewBag.RoleId = new SelectList(
                _accessUtils.GetAreasAndRoles(),
                $"RoleId", $"AreaAndRole");
            ViewBag.UserId = new SelectList(
                _accessUtils.GetAreasAndRolesAndUsers(),
                $"UserId", $"DisplayName");

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

            ViewBag.RoleId = new SelectList(
                _accessUtils.GetAreasAndRoles(),
                $"RoleId", $"AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(
                _accessUtils.GetAreasAndRolesAndUsers(),
                $"UserId", $"DisplayName", roleUser.UserId);

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

            ViewBag.RoleId = new SelectList(
                _accessUtils.GetAreasAndRoles(),
                $"RoleId", $"AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(
                _accessUtils.GetAreasAndRolesAndUsers(),
                $"UserId", $"DisplayName", roleUser.UserId);

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

            ViewBag.RoleId = new SelectList(
                _accessUtils.GetAreasAndRoles()
                , $"RoleId", $"AreaAndRole", roleUser.RoleId);
            ViewBag.UserId = new SelectList(
                _accessUtils.GetAreasAndRolesAndUsers(),
                $"UserId", $"DisplayName", roleUser.UserId);

            return View(roleUser);
        }

        // GET: Access/RoleUsers/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _accessUtils.GetAreasAndRolesAndUsers().SingleOrDefault(item => item.Id == id);
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

        public new void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
        }

        public ActionResult ListBox()
        {
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, "RoleId", "AreaAndRole");
            return View();
        }
    }
}