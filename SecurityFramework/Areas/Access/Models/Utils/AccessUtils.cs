using System;
using System.Collections.Generic;
using System.Linq;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;
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
        private readonly AccessEntities _db;
        private readonly List<Guid> _guids;

        public AccessUtils(AccessEntities db)
        {
            _db = db;
            var appid = AppCommon.AppAttributeValue;
            var userid = AppCommon.UserProfile.Id.ToString();
            _guids = _db.spUserAreas(appid, userid).Select(l => l.Id).ToList();
        }

        #region Areas

        public IQueryable<ListViewModel> GetDomains()
        {
            var domains = from dom in _db.Domains
                where _guids.Contains(dom.Id)
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
                where _guids.Contains(org.Id)
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
                where _guids.Contains(grp.Id)
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
                where _guids.Contains(off.Id)
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
                where _guids.Contains(shp.Id)
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
                      && _guids.Contains(dom.Id)
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
                      && _guids.Contains(org.Id)
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
                      && _guids.Contains(grp.Id)
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
                      && _guids.Contains(off.Id)
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
                      && _guids.Contains(shp.Id)
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