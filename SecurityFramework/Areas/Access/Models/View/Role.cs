using System;

namespace SecurityFramework.Areas.Access.Models.View
{
    public class Role
    {
        public Guid ID { get; set; }
        public string Name { get; set; }
        public int Sequence { get; set; }
    }
}