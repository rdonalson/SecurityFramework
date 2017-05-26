using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using SecurityFramework.Areas.Access.Models.Entity;

namespace SecurityFramework.Utilities.Common
{
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
                if (!appPath.Contains("/obj/") 
                    && !appPath.Contains("/bin/")
                    && !appPath.Contains("/SystemAdmin/")
                    && !appPath.Contains("/Account/"))
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
                        routePath += '/' + routeName;
                    else if (part.Contains(".") && part.Contains("Index"))
                    {
                        // do nothing
                    }
                    else
                        routePath += '/' + part;
        }
    }

}