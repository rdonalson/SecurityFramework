using System;
using System.Collections.Generic;
using System.Linq;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;
using SecurityFramework.Utilities.Common;
using User = SecurityFramework.Models.User;

namespace SecurityFramework.Areas.Access.Models.Utils
{
    /// ===============================================================================================
    /// <summary>
    ///     Utilities used in the Access Controllers.
    /// </summary>
    /// ===============================================================================================
    public class AccessUtils
    {
        private readonly string _accessRoutesFilter;
        private readonly Guid _appId;
        private readonly List<Guid> _areaGuids;
        private readonly AccessEntities _db;
        private readonly List<Guid> _roleGuids;
        private readonly User _user;

        public AccessUtils(AccessEntities db)
        {
            _db = db;
            _appId = AppCommon.AppAttributeValue;
            _user = AppCommon.UserProfile;
            _accessRoutesFilter = "/Access/";
            var appid = AppCommon.AppAttributeValue;
            var userid = AppCommon.UserProfile.Id.ToString();
            _areaGuids = _db.spUserAreas(appid, userid).Select(l => l.Id).ToList();
            _roleGuids = _db.spUserRoles(appid, userid).Select(l => l.RoleId).ToList();
        }

        public IQueryable<vwAreaAndRoleAndRoute> GetAreaAndRoleAndRoutes()
        {
            IQueryable<vwAreaAndRoleAndRoute> list;
            if (_user.IsSysAdmin)
                list = from view in _db.vwAreasAndRolesAndRoutes
                    where view.AppId == _appId
                    orderby view.AreaSeq, view.Seq, view.RoutePath
                    select view;
            else
                list = from view in _db.vwAreasAndRolesAndRoutes
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                          && !view.RoutePath.Contains(_accessRoutesFilter)
                    orderby view.AreaSeq, view.Seq, view.RoutePath
                    select view;
            return list;
        }


        public IQueryable<vwAreaAndRole> GetAreasAndRoles()
        {
            IQueryable<vwAreaAndRole> list;
            if (_user.IsSysAdmin)
                list = from view in _db.vwAreasAndRoles
                    where view.AppId == _appId
                    orderby view.BreadCrumb
                    select view;
            else
                list = from view in _db.vwAreasAndRoles
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                    orderby view.BreadCrumb
                    select view;
            return list;
        }

        public IQueryable<vwRoleRoute> GetRolesAndRoutes()
        {
            var list = from view in _db.vwRoleRoutes
                where _roleGuids.Contains(view.RoleId)
                      && view.AppId == _appId
                      && !view.RoutePath.Contains(_accessRoutesFilter)
                orderby view.RoutePath
                select view;
            return list;
        }

        #region Areas

        public IQueryable<ListViewModel> GetDomains()
        {
            var domains = from dom in _db.Domains
                where _areaGuids.Contains(dom.Id)
                      && dom.AppId == _appId
                orderby dom.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name,
                    Id = dom.Id,
                    Name = dom.Name
                };
            return domains;
        }

        public IQueryable<ListViewModel> GetOrganizations()
        {
            var organizations = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                where _areaGuids.Contains(org.Id)
                      && org.AppId == _appId
                orderby dom.Name, org.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name,
                    Id = org.Id,
                    Name = org.Name
                };
            return organizations;
        }

        public IQueryable<ListViewModel> GetGroups()
        {
            var groups = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                where _areaGuids.Contains(grp.Id)
                      && grp.AppId == _appId
                orderby dom.Name, org.Name, grp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name,
                    Id = grp.Id,
                    Name = grp.Name
                };
            return groups;
        }

        public IQueryable<ListViewModel> GetOffices()
        {
            var offices = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                where _areaGuids.Contains(off.Id)
                      && off.AppId == _appId
                orderby dom.Name, org.Name, grp.Name, off.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name + " > "
                                 + grp.Name + " > "
                                 + off.Name,
                    Id = off.Id,
                    Name = off.Name
                };
            return offices;
        }

        public IQueryable<ListViewModel> GetShops()
        {
            var shops = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                join shp in _db.Shops on off.Id equals shp.OfficeId
                where _areaGuids.Contains(shp.Id)
                      && shp.AppId == _appId
                orderby dom.Name, org.Name, grp.Name, off.Name, shp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name + " > "
                                 + grp.Name + " > "
                                 + off.Name + " > "
                                 + shp.Name,
                    Id = shp.Id,
                    Name = shp.Name
                };
            return shops;
        }

        #endregion Areas

        #region Roles

        public IQueryable<ListViewModel> GetDomainRoles()
        {
            var domainRoles = from dom in _db.Domains
                join rle in _db.Roles on dom.Id equals rle.DomainId
                where rle.DomainId != null
                      && _areaGuids.Contains(dom.Id)
                      && dom.AppId == _appId
                orderby dom.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return domainRoles;
        }

        public IQueryable<ListViewModel> GetOrganizationRoles()
        {
            var organizationRoles = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join rle in _db.Roles on org.Id equals rle.OrganizationId
                where rle.OrganizationId != null
                      && _areaGuids.Contains(org.Id)
                      && org.AppId == _appId
                orderby dom.Name, org.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return organizationRoles;
        }

        public IQueryable<ListViewModel> GetGroupRoles()
        {
            var groupRoles = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join rle in _db.Roles on grp.Id equals rle.GroupId
                where rle.GroupId != null
                      && _areaGuids.Contains(grp.Id)
                      && grp.AppId == _appId
                orderby dom.Name, org.Name, grp.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name + " > "
                                 + grp.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return groupRoles;
        }

        public IQueryable<ListViewModel> GetOfficeRoles()
        {
            var officeRoles = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                join rle in _db.Roles on off.Id equals rle.OfficeId
                where rle.OfficeId != null
                      && _areaGuids.Contains(off.Id)
                orderby dom.Name, org.Name, grp.Name, off.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name + " > "
                                 + grp.Name + " > "
                                 + off.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return officeRoles;
        }

        public IQueryable<ListViewModel> GetShopRoles()
        {
            var shopRoles = from dom in _db.Domains
                join org in _db.Organizations on dom.Id equals org.DomainId
                join grp in _db.Groups on org.Id equals grp.OrganizationId
                join off in _db.Offices on grp.Id equals off.GroupId
                join shp in _db.Shops on off.Id equals shp.OfficeId
                join rle in _db.Roles on shp.Id equals rle.ShopId
                where rle.ShopId != null
                      && _areaGuids.Contains(shp.Id)
                      && shp.AppId == _appId
                orderby dom.Name, org.Name, grp.Name, off.Name, shp.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > "
                                 + org.Name + " > "
                                 + grp.Name + " > "
                                 + off.Name + " > "
                                 + shp.Name,
                    Id = rle.Id,
                    Name = rle.Name,
                    Sequence = rle.Sequence
                };
            return shopRoles;
        }

        #endregion Roles
    }
}