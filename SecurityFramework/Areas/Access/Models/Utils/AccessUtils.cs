using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;
using SecurityFramework.Models;
using SecurityFramework.Utilities.Common;

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
        private readonly bool _isSysAdmin;
        private readonly List<Guid> _roleGuids;
        private readonly string _systemAdminRouteFilter;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Constructor
        /// </summary>
        /// <param name="db">AccessEntities</param>
        /// -----------------------------------------------------------------------------------------------
        public AccessUtils(AccessEntities db)
        {
            _db = db;
            _appId = AppCommon.AppAttributeValue;
            _isSysAdmin = HttpContext.Current.User.Identity.GetSysAdmin();
            _accessRoutesFilter = "/Access/";
            _systemAdminRouteFilter = "/SystemAdmin/";

            var appid = AppCommon.AppAttributeValue;
            var userid = AppCommon.UserProfile.Id.ToString();
            _areaGuids = _db.spUserAreas(appid, userid).Select(l => l.Id).ToList();
            _roleGuids = _db.spUserRoles(appid, userid).Select(l => l.RoleId).ToList();
        }

        #region Users

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Users only if SysAdmin is logged in
        /// </summary>
        /// <returns>IQueryable[UserViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
        public List<UserViewModel> GetUsers()
        {
            IQueryable<UserViewModel> list;
            if (_isSysAdmin)
                list = from view in _db.AspNetUsers
                    select new UserViewModel
                    {
                        Id = view.Id,
                        FirstName = view.FirstName,
                        LastName = view.LastName,
                        DisplayName = view.LastName + ", " + view.FirstName,
                        Email = view.Email,
                        UserName = view.UserName,
                        PhoneNumber = view.PhoneNumber,
                        SysAdmin = view.SysAdmin
                    };
            else
                list = null;
            return list?.OrderBy(item => item.LastName).ThenBy(item => item.FirstName).ToList();
        }

        #endregion Users

        #region Areas, Roles & Users

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Aread, Roled & Users from the view, "vwAreasAndRolesAndUsers"
        ///     Switched by _isSysAdmin, then filtered by _appId & _roleGuids
        /// </summary>
        /// <returns>IQueryable[DropdownViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
        public List<DropdownViewModel> GetRolesAndUsers()
        {
            IQueryable<DropdownViewModel> list;
            if (_isSysAdmin)
                list = from view in _db.vwUsers
                    group view by new
                    {
                        view.Id,
                        view.DisplayName
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.Id,
                        Name = grouping.Key.DisplayName
                    };
            else
                list = from view in _db.vwAreasAndRolesAndUsers
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                    group view by new
                    {
                        view.UserId,
                        view.DisplayName
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.UserId,
                        Name = grouping.Key.DisplayName
                    };
            return list.OrderBy(item => item.Name).ToList();
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Aread, Roled & Users from the view, "vwAreasAndRolesAndUsers"
        ///     Switched by _isSysAdmin, then filtered by _appId & _roleGuids
        /// </summary>
        /// <returns>IQueryable[vwAreaAndRoleAndUser]</returns>
        /// -----------------------------------------------------------------------------------------------
        public IQueryable<vwAreaAndRoleAndUser> GetAreasAndRolesAndUsers()
        {
            IQueryable<vwAreaAndRoleAndUser> list;
            if (_isSysAdmin)
                list = from view in _db.vwAreasAndRolesAndUsers
                    where view.AppId == _appId
                    orderby view.AreaAndRole, view.DisplayName, view.BreadCrumb
                    select view;
            else
                list = from view in _db.vwAreasAndRolesAndUsers
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                    orderby view.AreaAndRole, view.DisplayName, view.BreadCrumb
                    select view;
            return list;
        }

        #endregion Areas, Roles & Users

        #region Areas, Roles & Routes

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Area, Role & Routes from the view, "vwAreasAndRolesAndRoutes"
        ///     Switched by _isSysAdmin, then filtered by _appId, _roleGuids & _accessRoutesFilter
        /// </summary>
        /// <returns>IQueryable[vwAreaAndRoleAndRoute]</returns>
        /// -----------------------------------------------------------------------------------------------
        public IQueryable<vwAreaAndRoleAndRoute> GetAreasAndRolesAndRoutes()
        {
            IQueryable<vwAreaAndRoleAndRoute> list;
            if (_isSysAdmin)
                list = from view in _db.vwAreasAndRolesAndRoutes
                    where view.AppId == _appId
                    orderby view.AreaAndRole, view.RoutePath, view.BreadCrumb
                    select view;
            else
                list = from view in _db.vwAreasAndRolesAndRoutes
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                          && !view.RoutePath.Contains(_accessRoutesFilter)
                    orderby view.AreaAndRole, view.RoutePath, view.BreadCrumb
                    select view;
            return list;
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Area & Routes from the view, "vwAreasAndRoles"
        ///     Switched by _isSysAdmin, then filtered by _appId, & _roleGuids
        /// </summary>
        /// <returns>IQueryable[DropdownViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
        public IQueryable<DropdownViewModel> GetAreasAndRoles()
        {
            IQueryable<DropdownViewModel> list;
            if (_isSysAdmin)
                list = from view in _db.vwAreasAndRoles
                    where view.AppId == _appId
                    group view by new
                    {
                        Id = view.RoleId,
                        Name = view.BreadCrumb + " : " + view.Roles
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.Id.ToString(),
                        Name = grouping.Key.Name
                    };
            else
                list = from view in _db.vwAreasAndRoles
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                    group view by new
                    {
                        Id = view.RoleId,
                        Name = view.BreadCrumb + " : " + view.Roles
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.Id.ToString(),
                        Name = grouping.Key.Name
                    };
            return list.OrderBy(item => item.Name);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Role & Routes from the view, "vwRoleRoutes"
        ///     Group by Id & Name
        ///     Filtered by _appId, _roleGuids & _accessRoutesFilter
        /// </summary>
        /// <returns>IQueryable[DropdownViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
        public IQueryable<DropdownViewModel> GetRolesAndRoutes()
        {
            IQueryable<DropdownViewModel> list;
            if (_isSysAdmin)
                list = from view in _db.vwRolesRoutes
                    where view.AppId == _appId
                          && !view.RoutePath.Contains(_systemAdminRouteFilter)
                    group view by new
                    {
                        view.RouteId,
                        view.RoutePath
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.RouteId.ToString(),
                        Name = grouping.Key.RoutePath
                    };
            else
                list = from view in _db.vwRolesRoutes
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                          && !view.RoutePath.Contains(_accessRoutesFilter)
                    group view by new
                    {
                        view.RouteId,
                        view.RoutePath
                    }
                    into grouping
                    select new DropdownViewModel
                    {
                        Id = grouping.Key.RouteId.ToString(),
                        Name = grouping.Key.RoutePath
                    };
            return list.OrderBy(item => item.Name);
        }

        #endregion Areas, Roles & Routes

        #region Areas & Sub-areas

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas from the table, "Domains"
        ///     Filtered by _appId & _areaGuids
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-areas from the tables, "Domains" & "Organizations"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-areas from the tables, "Domains", "Organizations" & "Groups"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-areas from the tables, "Domains", "Organizations", "Groups" & "Offices"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-areas from the tables, "Domains", "Organizations", "Groups", "Offices" & "Shops"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        #endregion Areas & Sub-areas

        #region Areas & Sub-area Roles

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-area Roles from the tables, "Domains" & "Roles"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-area Roles from the tables, "Domains", "Organizations" & "Roles"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-area Roles from the tables, "Domains", "Organizations", "Groups" & "Roles"
        ///     Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-area Roles from the tables, "Domains", "Organizations", "Groups", "Offices"
        ///     & "Roles".  Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Areas & Sub-area Roles from the tables, "Domains", "Organizations", "Groups", "Offices",
        ///     "Shops" & "Roles".  Filtered by _appId & _areaGuids
        ///     Create a "Bread Crumb Trail" for user reference
        /// </summary>
        /// <returns>IQueryable[ListViewModel]</returns>
        /// -----------------------------------------------------------------------------------------------
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

        #endregion Areas & Sub-area Roles
    }
}


/* Archive
 * 
        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Routes sorted by Name and filter out the System Admin folder items, since these
        ///     should never be selected because they can be accessed globally anyway.
        ///     They are also filtered on the AppId of the current application.
        /// </summary>
        /// <returns>IQueryable[Route]</returns>
        /// -----------------------------------------------------------------------------------------------
        //public IQueryable<Route> GetRoutes()
        //{
        //    var list = from view in _db.Routes
        //        where view.AppId == _appId
        //              && !view.RoutePath.Contains(_systemAdminRouteFilter)
        //        orderby view.RoutePath
        //        select view;
        //    return list;
        //}
        
     * * 
 *         /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get Area & Routes from the view, "vwAreasAndRoles"
        ///     Switched by _isSysAdmin, then filtered by _appId, _roleGuids & _accessRoutesFilter
        /// </summary>
        /// <returns>IQueryable[vwAreaAndRole]</returns>
        /// -----------------------------------------------------------------------------------------------
        public IQueryable<vwAreaAndRole> GetAreasAndRoles()
        {
            IQueryable<vwAreaAndRole> list;
            if (_isSysAdmin)
                list = from view in _db.vwAreasAndRoles
                    where view.AppId == _appId
                    orderby view.AreaSeq, view.AreaSeq, view.BreadCrumb
                    select view;
            else
                list = from view in _db.vwAreasAndRoles
                    where _roleGuids.Contains(view.RoleId)
                          && view.AppId == _appId
                    orderby view.AreaSeq, view.AreaSeq, view.BreadCrumb
                    select view;
            return list;
        }
 * 
        ///// -----------------------------------------------------------------------------------------------
        ///// <summary>
        /////     Get users sorted by last and then by first name
        /////     and the sysadmin is filtered out
        ///// </summary>
        ///// <returns>IQueryable[vwUser]</returns>
        ///// -----------------------------------------------------------------------------------------------
        //public IQueryable<vwUser> GetUsers()
        //{
        //    var list = from view in _db.vwUsers
        //        orderby view.LastName, view.FirstName
        //        select view;
        //    return list;
        //} * 
 * 
 */
