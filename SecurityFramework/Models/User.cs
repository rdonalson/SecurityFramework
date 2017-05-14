using System;

namespace SecurityFramework.Models
{
    public class User
    {
        public User(string login, Guid id)
        {
            Login = login;
            Id = id;
        }

        public string Login { get; set; }

        public Guid Id { get; set; }
    }
}