//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SecurityFramework.Areas.Access.Models.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class vwRolesUser
    {
        public System.Guid RoleId { get; set; }
        public string UserId { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string DisplayName { get; set; }
        public bool SysAdmin { get; set; }
    }
}
