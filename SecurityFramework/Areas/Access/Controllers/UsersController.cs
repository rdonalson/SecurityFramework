using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.Utils;
using SecurityFramework.Areas.Access.Models.View;

namespace SecurityFramework.Areas.Access.Controllers
{
    public class UsersController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public UsersController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }
        // GET: Access/Users
        public ActionResult Index()
        {
            var aspNetUsers = _accessUtils.GetUsers();
            return View(aspNetUsers.ToList());
        }

        // GET: Access/Users/Details/5
        public ActionResult Details(string id)
        {
            UserViewModel user;
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var aspNetUser = _db.AspNetUsers.Find(id);
            if (aspNetUser != null)
            {
                user = new UserViewModel
                {
                    Id = aspNetUser.Id,
                    FirstName = aspNetUser.FirstName,
                    LastName = aspNetUser.LastName,
                    UserName = aspNetUser.UserName,
                    Email = aspNetUser.Email,
                    PhoneNumber = aspNetUser.PhoneNumber,
                    SysAdmin = aspNetUser.SysAdmin
                };
            }
            else
                return HttpNotFound();
            return View(user);

            //if (id == null)
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //var aspNetUser = _db.AspNetUsers.Find(id);
            //if (aspNetUser == null)
            //    return HttpNotFound();
            //return View(aspNetUser);
        }

        // GET: Access/Users/Edit/5
        public ActionResult Edit(string id)
        {
            UserViewModel user;
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var aspNetUser = _db.AspNetUsers.Find(id);
            if (aspNetUser != null)
            {
                user = new UserViewModel
                {
                    Id = aspNetUser.Id,
                    FirstName = aspNetUser.FirstName,
                    LastName = aspNetUser.LastName,
                    UserName = aspNetUser.UserName,
                    Email = aspNetUser.Email,
                    PhoneNumber = aspNetUser.PhoneNumber,
                    SysAdmin = aspNetUser.SysAdmin
                };
            }
            else
                return HttpNotFound();
            return View(user);
        }

        // POST: Access/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = @"Id,Email,PhoneNumber,UserName,SysAdmin,FirstName,LastName")]
            UserViewModel user)
        {
            if (ModelState.IsValid)
            {
                var aspNetUser = _db.AspNetUsers.Find(user.Id);
                if (aspNetUser != null)
                {
                    aspNetUser.FirstName = user.FirstName;
                    aspNetUser.LastName = user.LastName;
                    aspNetUser.UserName = user.UserName;
                    aspNetUser.Email = user.Email;
                    aspNetUser.PhoneNumber = user.PhoneNumber;
                    aspNetUser.SysAdmin = user.SysAdmin;
                    _db.Entry(aspNetUser).State = EntityState.Modified;
                _db.SaveChanges();
                }
                return RedirectToAction($"Index");
            }
            return View(user);
        }

        // GET: Access/Users/Delete/5
        public ActionResult Delete(string id)
        {
            UserViewModel user;
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var aspNetUser = _db.AspNetUsers.Find(id);
            if (aspNetUser != null)
            {
                user = new UserViewModel
                {
                    Id = aspNetUser.Id,
                    FirstName = aspNetUser.FirstName,
                    LastName = aspNetUser.LastName,
                    UserName = aspNetUser.UserName,
                    Email = aspNetUser.Email,
                    PhoneNumber = aspNetUser.PhoneNumber,
                    SysAdmin = aspNetUser.SysAdmin
                };
            }
            else
                return HttpNotFound();
            return View(user);

            //if (id == null)
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //var aspNetUser = _db.AspNetUsers.Find(id);
            //if (aspNetUser == null)
            //    return HttpNotFound();
            //return View(aspNetUser);
        }

        // POST: Access/Users/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            var aspNetUser = _db.AspNetUsers.Find(id);
            if (aspNetUser != null) _db.AspNetUsers.Remove(aspNetUser);
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