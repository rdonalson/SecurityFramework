﻿using System;
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
    public class OrganizationRolesController : Controller
    {
        private readonly AccessUtils _accessUtils;
        private readonly AccessEntities _db;

        public OrganizationRolesController()
        {
            _db = new AccessEntities();
            _accessUtils = new AccessUtils(_db);
        }

        // GET: Access/OrganizationRoles
        public ActionResult Index()
        {
            return View(_accessUtils.GetOrganizationRoles().ToList());
        }

        // GET: Access/OrganizationRoles/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _accessUtils.GetOrganizationRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // GET: Access/OrganizationRoles/Create
        public ActionResult Create()
        {
            ViewBag.OrganizationId = new SelectList(_accessUtils.GetOrganizations(), "Id", "Breadcrumb");
            return View();
        }

        // POST: Access/OrganizationRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Sequence,Name,OrganizationId")] Role role)
        {
            if (ModelState.IsValid)
            {
                role.Id = Guid.NewGuid();
                _db.Roles.Add(role);
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }

            ViewBag.OrganizationId = new SelectList(_accessUtils.GetOrganizations(), "Id", "Breadcrumb",
                role.OrganizationId);
            return View(role);
        }

        // GET: Access/OrganizationRoles/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _db.Roles.Find(id);
            if (role == null)
                return HttpNotFound();
            ViewBag.OrganizationId = new SelectList(_accessUtils.GetOrganizations(), "Id", "Breadcrumb",
                role.OrganizationId);
            return View(role);
        }

        // POST: Access/OrganizationRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Sequence,Name,OrganizationId")] Role role)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(role).State = EntityState.Modified;
                _db.SaveChanges();
                return RedirectToAction($"Index");
            }
            ViewBag.OrganizationId = new SelectList(_accessUtils.GetOrganizations(), "Id", "Breadcrumb",
                role.OrganizationId);
            return View(role);
        }

        // GET: Access/OrganizationRoles/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var role = _accessUtils.GetOrganizationRoles().SingleOrDefault(item => item.Id == id);
            if (role == null)
                return HttpNotFound();
            return View(role);
        }

        // POST: Access/OrganizationRoles/Delete/5
        [HttpPost]
        [ActionName(nameof(Delete))]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            var role = _db.Roles.Find(id);
            if (role != null) _db.Roles.Remove(role);
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