using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;
using SecurityFramework.Utilities.Common;
using Role = SecurityFramework.Areas.Access.Models.Entity.Role;
using Route = SecurityFramework.Areas.Access.Models.Entity.Route;

namespace SecurityFramework.Areas.Access.Controllers.api
{
    [Authorize]
    public class AccessHomeDataController : Controller
    {

        // GET: Access/AccessHomeData
        private readonly AccessEntities _db;

        public AccessHomeDataController()
        {
            _db = new AccessEntities();
        }
        
        public JsonResult GetAreas()
        {
            var areas = _db.spUserAreas(AppCommon.AppAttributeValue, AppCommon.UserProfile.Id.ToString()).ToList();

            var records = areas.Where(l => l.ParentId == null)
                .OrderBy(l => l.Area)
                .Select(l => new Area
                {
                    id = l.Id,
                    text = l.Area,
                    children = GetChildren(areas, l.Id)
                })
                .ToList();

            return Json(records, JsonRequestBehavior.AllowGet);
        }


        private List<Area> GetChildren(List<spUserAreas_Result> areas, Guid parentId)
        {
            return areas.Where(l => l.ParentId == parentId)
                .OrderBy(l => l.Area)
                .Select(l => new Area
                {
                    id = l.Id,
                    text = l.Area,
                    children = GetChildren(areas, l.Id)
                })
                .ToList();
        }


        public JsonResult GetRoles(Guid guid)
        {
            var roles = _db.vwRoles.ToList();

            var records = roles.Where(l => l.AreaId == guid)
                .OrderBy(l => l.Sequence)
                .Select(l => new Models.View.Role
                {
                    ID = l.Id,
                    Name = l.Name,
                    Sequence = l.Sequence
                })
                .ToList();

            return Json(new { records }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUsers(Guid guid)
        {
            var list = _db.vwRolesUsers.ToList();

            var records = list.Where(l => l.RoleId == guid)
                .OrderBy(l => l.UserName)
                .Select(l => new User
                {
                    ID = l.UserId,
                    UserName = l.UserName
                })
                .ToList();

            return Json(new { records }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetRoutes(Guid guid)
        {
            var list = _db.vwRolesRoutes.ToList();

            var records = list.Where(l => l.RoleId == guid)
                .OrderBy(l => l.RoutePath)
                .Select(l => new Models.View.Route
                {
                    ID = l.RoleId,
                    RouteName = l.RoutePath
                })
                .ToList();

            return Json(new { records }, JsonRequestBehavior.AllowGet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
                _db.Dispose();
            base.Dispose(disposing);
        }
    }
}