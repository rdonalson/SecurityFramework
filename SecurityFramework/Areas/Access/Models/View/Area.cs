using System;
using System.Collections.Generic;

namespace SecurityFramework.Areas.Access.Models.View
{
    public class Area
    {
        public virtual List<Area> children { get; set; }
        public Guid id { get; set; }
        public string text { get; set; }
    }
}