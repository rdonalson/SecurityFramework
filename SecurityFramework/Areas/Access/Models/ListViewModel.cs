using System;

namespace SecurityFramework.Areas.Access.Models
{
    public class ListViewModel
    {
        public string Breadcrumb { get; set; }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Sequence { get; set; }
    }
}