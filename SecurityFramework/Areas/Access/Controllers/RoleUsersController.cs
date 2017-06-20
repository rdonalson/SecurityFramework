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
    /// ===============================================================================================
    /// <summary>
    ///     Roles & Users Controller
    /// </summary>
    /// ===============================================================================================
    [VerifyAccess]
    [Authorize]
    public class RoleUsersController : Controller
    {
        // Declarations
        private readonly AccessUtils _accessUtils;

        private readonly AccessEntities _db;
        private readonly bool _isSysAdmin;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Constructor
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        public RoleUsersController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
            _isSysAdmin = System.Web.HttpContext.Current.User.Identity.GetSysAdmin();
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleUsers
        /// </summary>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Index()
        {
            return View(_accessUtils.GetAreasAndRolesAndUsers());
        }

        #region Create

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleUsers/Create
        /// </summary>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Create()
        {
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name");
            ViewBag.UserId = new SelectList(_accessUtils.GetRolesAndUsers(), $"Id", $"Name");
            return View();
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST: Access/RoleUsers/Create
        ///     To protect from overposting attacks, please enable the specific properties you want to bind to, for
        ///     more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        /// </summary>
        /// <param name="roleUser">RoleUser</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = @"Id,RoleId,UserId")] RoleUser roleUser)
        {
            if (ModelState.IsValid)
            {
                roleUser.Id = Guid.NewGuid();
                _db.RoleUsers.Add(roleUser);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_accessUtils.GetRolesAndUsers(), $"Id", $"Name", roleUser.UserId);
            return View(roleUser);
        }

        #endregion Create

        #region Edit

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleUsers/Details/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _accessUtils.GetAreasAndRolesAndUsers().SingleOrDefault(item => item.Id == id);
            if (roleUser == null)
                return HttpNotFound();
            return View(roleUser);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleUsers/Edit/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _db.RoleUsers.Find(id);
            if (roleUser == null)
                return HttpNotFound();
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_accessUtils.GetRolesAndUsers(), $"Id", $"Name", roleUser.UserId);
            return View(roleUser);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST: Access/RoleUsers/Edit/5
        ///     To protect from overposting attacks, please enable the specific properties you want to bind to, for
        ///     more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        /// </summary>
        /// <param name="roleUser">RoleUser</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = @"Id,RoleId,UserId")] RoleUser roleUser)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(roleUser).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.RoleId = new SelectList(_accessUtils.GetAreasAndRoles(), $"Id", $"Name", roleUser.RoleId);
            ViewBag.UserId = new SelectList(_accessUtils.GetRolesAndUsers(), $"Id", $"Name", roleUser.UserId);
            return View(roleUser);
        }

        #endregion Edit

        #region Delete

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     GET: Access/RoleUsers/Delete/5
        /// </summary>
        /// <param name="id">Guid?</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var roleUser = _accessUtils.GetAreasAndRolesAndUsers().SingleOrDefault(item => item.Id == id);
            if (roleUser == null)
                return HttpNotFound();
            return View(roleUser);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     POST: Access/RoleUsers/Delete/5
        /// </summary>
        /// <param name="id">Guid</param>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
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

        #endregion Delete

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Cleanup
        /// </summary>
        /// <param name="disposing">bool</param>
        /// -----------------------------------------------------------------------------------------------
        public new void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
        }
    }
}


/* Archive
 
        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Archive: Listbox testing
        /// </summary>
        /// <returns>ActionResult</returns>
        /// -----------------------------------------------------------------------------------------------
        public ActionResult ListBox()
        {
            var areasAndRoles = _db.vwAreasAndRoles
                .OrderBy(item => item.AreaSeq)
                .ThenBy(item => item.Seq);
            ViewBag.RoleId = new SelectList(areasAndRoles, $"RoleId", $"AreaAndRole");
            return View();
        }
     
     */
