using System;

namespace SecurityFramework.Models
{
    public class User
    {
        public User(string login, Guid id, bool isSysAdmin, string firstName, string lastName)
        {
            Login = login;
            Id = id;
            this.IsSysAdmin = isSysAdmin;
            this.FirstName = firstName;
            this.LastName = lastName;
        }

        public string Login { get; set; }
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsSysAdmin { get; set; }
    }
}