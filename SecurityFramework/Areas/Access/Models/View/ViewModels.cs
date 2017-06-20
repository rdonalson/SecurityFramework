using System;
using System.ComponentModel;

namespace SecurityFramework.Areas.Access.Models.View
{
    /// ===============================================================================================
    /// <summary>
    ///     Utility View Models 
    /// </summary>
    /// ===============================================================================================
    public class ListViewModel
    {
        public string Breadcrumb { get; set; }
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Sequence { get; set; }
    }

    public class DropdownViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    public class UserViewModel
    {
        public string Id { get; set; }
        [DisplayName("First")]
        public string FirstName { get; set; }
        [DisplayName("Last")]
        public string LastName { get; set; }
        [DisplayName("Username")]
        public string UserName { get; set; }
        [DisplayName("Display Name")]
        public string DisplayName { get; set; }
        [DisplayName("Email")]
        public string Email { get; set; }
        [DisplayName("Phone #")]
        public string PhoneNumber { get; set; }
        [DisplayName("Is System Admin?")]
        public bool SysAdmin { get; set; }

    }

}