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
    
    public partial class Route
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Route()
        {
            this.RoleRoutes = new HashSet<RoleRoute>();
        }
    
        public System.Guid Id { get; set; }
        public Nullable<System.Guid> AppId { get; set; }
        public string FilePath { get; set; }
        public string FileName { get; set; }
        public string AppPath { get; set; }
        public string RoutePath { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoleRoute> RoleRoutes { get; set; }
    }
}