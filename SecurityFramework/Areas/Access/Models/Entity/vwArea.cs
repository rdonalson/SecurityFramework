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
    
    public partial class vwArea
    {
        public string BreadcrubTrail { get; set; }
        public System.Guid DomId { get; set; }
        public string Domain { get; set; }
        public Nullable<System.Guid> OrgId { get; set; }
        public string Organization { get; set; }
        public Nullable<System.Guid> GrpId { get; set; }
        public string Group { get; set; }
        public Nullable<System.Guid> OffId { get; set; }
        public string Office { get; set; }
        public Nullable<System.Guid> ShpId { get; set; }
        public string Shop { get; set; }
    }
}