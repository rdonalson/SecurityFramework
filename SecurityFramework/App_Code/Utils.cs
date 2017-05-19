using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using SecurityFramework.Areas.Access.Models.Entity;
using SecurityFramework.Models;

namespace SecurityFramework
{
    /// ===============================================================================================
    /// <summary>
    ///     Global variables Initialized in Global.asax and Site.Master.cs
    /// </summary>
    /// ===============================================================================================
    public class ApplicationCommon
    {
        public static Guid AppAttributeValue { get; set; }
        public static string AppPath { get; set; }
        public static string RequestUrl { get; set; }
        public static Exception LastException { get; set; }

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
                if (!String.IsNullOrEmpty(userName))
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
            RequestUrl = String.Empty;
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Verifies User has access to route
        /// </summary>
        /// <param name="pathAndQuery">string</param>
        /// <returns>bool</returns>
        /// -----------------------------------------------------------------------------------------------
        public static bool IsInRole(string pathAndQuery)
        {
            if (UserProfile == null) return false;
            using (var entities = new AccessEntities())
            {
                pathAndQuery = pathAndQuery.Replace(AppPath, "");
                return Convert.ToBoolean(entities.spIsInRole(
                        AppAttributeValue,
                        UserProfile.Id.ToString(),
                        pathAndQuery)
                    .FirstOrDefault());
            }
        }

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        /// Storage for the UserProfile up
        /// </summary>
        /// ---------------------------------------------------------------------------------------------
        public static User UserProfile
        {
            get
            {
                User up = SessionUtil.GetFromSession<User>("UserProfile");
                if (up == null)
                {
                    SessionUtil.SetInSession<User>("UserProfile", null);
                }
                return up;
            }
            set { SessionUtil.SetInSession<User>("UserProfile", value); }
        }

        ///// ---------------------------------------------------------------------------------------------
        ///// <summary>
        ///// Storage for the UserProfile up
        ///// </summary>
        ///// ---------------------------------------------------------------------------------------------
        //public static Exception LastException
        //{
        //    get
        //    {
        //        Exception up = SessionUtil.GetFromSession<Exception>("LastException");
        //        if (up == null)
        //        {
        //            SessionUtil.SetInSession<Exception>("LastException", null);
        //        }
        //        return up;
        //    }
        //    set { SessionUtil.SetInSession<Exception>("LastException", value); }
        //}
    }

    /// ===============================================================================================
    /// <summary>
    ///     Interface for FindRoutes
    /// </summary>
    /// ===============================================================================================
    public interface IFindRoutes
    {
        void AddToTable(Guid appAttributeValue, List<Route> files);

        void GetAppFiles(Guid appAttributeValue, string[] searchArea, string root, string[] searchStrings,
            ref List<Route> files);
    }

    /// ===============================================================================================
    /// <summary>
    ///     Processes Specific Application Files and adds them to "AppObjects" security table
    /// </summary>
    /// ===============================================================================================
    public class FindRoutes : IFindRoutes
    {
        // Members
        private readonly AccessEntities _entities;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Constructor:  Initializes the Context object
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        public FindRoutes()
        {
            _entities = new AccessEntities();
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Determines if File exists in "AppObject" table for this application
        ///     and if not will add the new file
        /// </summary>
        /// <param name="appAttributeValue">Guid</param>
        /// <param name="files">List(AppObject)</param>
        /// -----------------------------------------------------------------------------------------------
        public void AddToTable(Guid appAttributeValue, List<Route> files)
        {
            foreach (var file in files)
            {
                var isThere = _entities.Routes.Any(f => f.RoutePath == file.RoutePath && f.AppId == appAttributeValue);
                if (!isThere)
                {
                    _entities.Routes.Add(file);
                    _entities.SaveChanges();
                }
            }
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Controller for the ProcessDirectory Function
        /// </summary>
        /// <param name="appAttributeValue">Guid</param>
        /// <param name="searchArea">string[]</param>
        /// <param name="root">string</param>
        /// <param name="searchStrings">string[]</param>
        /// <param name="files">ref List(AppObject)</param>
        /// -----------------------------------------------------------------------------------------------
        public void GetAppFiles(Guid appAttributeValue, string[] searchArea, string root, string[] searchStrings,
            ref List<Route> files)
        {
            foreach (var path in searchArea)
                if (Directory.Exists(path))
                    foreach (var crit in searchStrings)
                        ProcessDirectory(appAttributeValue, path, root, crit, ref files);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Finds the specific files within the application file directory and creates a list that can
        ///     be added to the "AppObjects" folder
        /// </summary>
        /// <param name="appAttributeValue">Guid</param>
        /// <param name="targetDirectory">string</param>
        /// <param name="root">string</param>
        /// <param name="crit">string</param>
        /// <param name="files">ref List(AppObject)</param>
        /// -----------------------------------------------------------------------------------------------
        private void ProcessDirectory(Guid appAttributeValue, string targetDirectory, string root, string crit,
            ref List<Route> files)
        {
            // Process the list of files found in the directory.
            var fileEntries = Directory.GetFiles(targetDirectory, crit);
            foreach (var filePath in fileEntries)
            {
                var appPath = filePath.Replace(root, @"~\");
                appPath = appPath.Replace(@"\", @"/");
                appPath = appPath.Replace(@"//", @"/");
                var fileName = Path.GetFileName(filePath);
                if (!appPath.Contains("/obj/") && !appPath.Contains("/bin/") && !appPath.Contains("/Account/"))
                {
                    var routeName = Path.GetFileNameWithoutExtension(filePath);
                    // Create the route and route directory
                    string routePath;
                    GenerateRouteAndRouteDirectory(appPath, routeName, out routePath);
                    if (routeName != "_Layout" && routeName != "_ViewStart")
                        files.Add(new Route
                        {
                            Id = Guid.NewGuid(),
                            AppId = appAttributeValue,
                            FilePath = filePath,
                            FileName = fileName,
                            AppPath = appPath,
                            RoutePath = routePath
                        });
                }
            }

            // Recurse into subdirectories of this directory.
            var subdirectoryEntries = Directory.GetDirectories(targetDirectory);
            foreach (var subdirectory in subdirectoryEntries)
                ProcessDirectory(appAttributeValue, subdirectory, root, crit, ref files);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Creates a the Route & Route Directory from the file path
        /// </summary>
        /// <param name="appPath">string</param>
        /// <param name="routeName">string</param>
        /// <param name="routePath">out string</param>
        /// -----------------------------------------------------------------------------------------------
        private static void GenerateRouteAndRouteDirectory(string appPath, string routeName, out string routePath)
        {
            routePath = string.Empty;
            var parts = appPath.Split('/');
            foreach (var part in parts)
                if (part != "~" && part != nameof(Areas) && part != "Views")
                    if (part.Contains(".") && !part.Contains("Index"))
                    {
                        routePath += '/' + routeName;
                    }
                    else if (part.Contains(".") && part.Contains("Index"))
                    {
                        // do nothing
                    }
                    else
                    {
                        routePath += '/' + part;
                    }
        }
    }

    /// =============================================================================================
    /// <summary>
    /// Session Wrapper Utilities Class
    /// </summary>
    /// =============================================================================================
    internal static class SessionUtil
    {
        #region Session
        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        /// Session
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <returns>generics</returns>
        /// ---------------------------------------------------------------------------------------------
        public static T GetFromSession<T>(string key)
        {
            object obj = HttpContext.Current.Session[key];
            if (obj == null)
            {
                return default(T);
            }
            return (T)obj;
        }
        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        /// Set in Session 
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <param name="value">T</param>
        /// ---------------------------------------------------------------------------------------------
        public static void SetInSession<T>(string key, T value)
        {
            if (value == null)
            {
                HttpContext.Current.Session.Remove(key);
            }
            else
            {
                HttpContext.Current.Session[key] = value;
            }
        }
        #endregion Session

        #region Application

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        /// Get from Application
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <returns>generics</returns>
        /// ---------------------------------------------------------------------------------------------
        public static T GetFromApplication<T>(string key)
        {
            return (T)HttpContext.Current.Application[key];
        }

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        /// Set from Application
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <param name="value">T</param>
        /// ---------------------------------------------------------------------------------------------
        public static void SetInApplication<T>(string key, T value)
        {
            if (value == null)
            {
                HttpContext.Current.Application.Remove(key);
            }
            else
            {
                HttpContext.Current.Application[key] = value;
            }
        }
        #endregion Application
    }


}