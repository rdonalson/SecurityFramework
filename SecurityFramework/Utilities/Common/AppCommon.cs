using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Models;

namespace SecurityFramework.Utilities.Common
{
    /// ===============================================================================================
    /// <summary>
    ///     Global variables Initialized in Global.asax and Site.Master.cs
    /// </summary>
    /// ===============================================================================================
    public static class AppCommon
    {
        public static Guid AppAttributeValue { get; set; }
        public static string AppPath { get; set; }
        public static string RequestUrl { get; set; }
        public static Exception LastException { get; set; }

        public static string GetAppPath()
        {
            return AppPath == "/" ? "" : AppPath;
        }

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        ///     Storage for the UserProfile up
        /// </summary>
        /// ---------------------------------------------------------------------------------------------
        public static User UserProfile
        {
            get
            {
                var userProfile = SessionUtil.GetFromSession<User>($"UserProfile");
                if (userProfile == null)
                    SessionUtil.SetInSession<User>($"UserProfile", null);
                return userProfile;
            }
            set => SessionUtil.SetInSession($"UserProfile", value);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Sets up the Current User's Profile
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        public static void SetupUser()
        {
            if (UserProfile == null)
            {
                var userName = HttpContext.Current.User.Identity.GetUserName();
                var userId = HttpContext.Current.User.Identity.GetUserId();
                if (!string.IsNullOrEmpty(userName))
                {
                    var user = new User(
                        userName,
                        new Guid(userId)
                    );
                    UserProfile = user;
                }
            }
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Deletes the Current User's Profile
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        public static void KillUser()
        {
            UserProfile = null;
            RequestUrl = string.Empty;
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Verifies User has access to route
        /// </summary>
        /// <param name="route">string</param>
        /// <returns>bool</returns>
        /// -----------------------------------------------------------------------------------------------
        public static bool IsInRole(string route)
        {
            if (UserProfile == null) return false;
            using (var entities = new AccessEntities())
            {
                return Convert.ToBoolean(entities.spIsInRole(
                        AppAttributeValue,
                        UserProfile.Id.ToString(),
                        route)
                    .FirstOrDefault());
            }
        }
    }


}