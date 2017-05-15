using System.Linq;
using System.Web.Security;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Areas.Access.Models.View;

namespace SecurityFramework.Areas.Access.Models.Common
{
    public class Utilities
    {
        private readonly AccessEntities _db;

        public Utilities(AccessEntities db)
        {
            _db = db;
        }
        
        public IQueryable<ListViewModel> GetDomainRoles()
        {
            var domainRoles = from dom in _db.Domains
                join rle in _db.Roles on dom.Id equals rle.DomainId
                where rle.DomainId != null
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
                orderby dom.Name, org.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name,
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
                orderby dom.Name, org.Name, grp.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name,
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
                orderby dom.Name, org.Name, grp.Name, off.Name, rle.Sequence
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name + " > " + off.Name,
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


        public IQueryable<ListViewModel> GetDomains()
        {
            var domains = from dom in _db.Domains
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
                orderby dom.Name, org.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name,
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
                orderby dom.Name, org.Name, grp.Name, off.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name + " > " + off.Name,
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
                orderby dom.Name, org.Name, grp.Name, off.Name, shp.Name
                select new ListViewModel
                {
                    Breadcrumb = dom.Name + " > " + org.Name + " > " + grp.Name + " > " + off.Name + " > " + shp.Name,
                    Id = shp.Id,
                    Name = shp.Name
                 };
            return shops;
        }
    }
}