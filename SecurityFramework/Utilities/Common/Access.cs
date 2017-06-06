using System;
using System.Web;
using System.Web.Mvc;

namespace SecurityFramework.Utilities.Common
{
    /// ===============================================================================================
    /// <summary>
    ///     Custom Annotation Attribute & Functions that control security to pages and routes.
    /// </summary>
    /// ===============================================================================================
    public sealed class VerifyAccessAttribute : AuthorizeAttribute
    {
        // Internal members
        private static string _route = string.Empty;

        private HttpContextBase _httpContext;
        private static string DefaultUrl => "~/SystemAdmin/AccessDenied.aspx?InternalPermissionsRedirect=~";
        private static string LoginUrl => "~/Account/Login";

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Provides the default Access Denied Url and the route that was denied
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        private string InternalPermissionsRedirect => DefaultUrl + _route;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Overridden version of Authorize Core that verifies a user's access to the requested url.
        ///     Uses the various components of the MVC RouteData properties to concatenate the Route
        ///     without parameters.
        ///     This Route can then be used to determine if the User has access
        /// </summary>
        /// <param name="httpContext">HttpContextBase</param>
        /// <returns>bool</returns>
        /// -----------------------------------------------------------------------------------------------
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            /* Insure the User is setup */
            AppCommon.SetupUser();

            /* Declarations & Initializations */
            _httpContext = httpContext;
            _route = String.Empty;
            var area = HttpContext.Current.Request.RequestContext.RouteData.DataTokens["area"].ToString();
            var controllerName = _httpContext.Request.RequestContext.RouteData.Values["Controller"].ToString();
            var actionName = _httpContext.Request.RequestContext.RouteData.Values["Action"].ToString();

            /* Concatenate all string */
            if (!string.IsNullOrEmpty(area))
                _route += "/" + area;
            if (!string.IsNullOrEmpty(controllerName))
                _route += "/" + controllerName;
            if (!string.IsNullOrEmpty(actionName) && actionName.ToLower() != "index")
                _route += "/" + actionName;

            /* Check for User Access to Route*/
            return AppCommon.IsInRole(_route);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Called if Authorize Core returns false.
        /// </summary>
        /// <param name="filterContext">AuthorizationContext</param>
        /// -----------------------------------------------------------------------------------------------
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            _httpContext.Response.Redirect(InternalPermissionsRedirect);
        }

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Uses the AbsolutePath property of the Url Property to get the WebForms Route URL 
        ///     without QueryString parameters.
        ///     This Route can then be used to determine if the User has access
        /// </summary>
        /// <param name="context">HttpContext</param>
        /// -----------------------------------------------------------------------------------------------
        public static void AuthorizePage(HttpContext context)
        {
            AppCommon.SetupUser();
            AppCommon.RequestUrl = context.Request.Path;
            if (HttpContext.Current.User != null &&
                HttpContext.Current.User.Identity.IsAuthenticated)
            {
                _route = context.Request.Url.AbsolutePath;
                _route = AppCommon.GetAppPath() == String.Empty ? _route : _route.Replace(AppCommon.GetAppPath(), String.Empty);
                if (!AppCommon.IsInRole(_route))
                    context.Response.Redirect(DefaultUrl + _route);
            }
            else
            {
                context.Response.Redirect(LoginUrl);
            }
        }
    }
}


/* Archive

        public static void AuthorizePage(HttpContext context)
        {
            AppCommon.SetupUser();
            AppCommon.RequestUrl = context.Request.Path;
            if (HttpContext.Current.User != null &&
                HttpContext.Current.User.Identity.IsAuthenticated)
            {
                _pathAndQuery = context.Request.Url.PathAndQuery;
                if (!AppCommon.IsInRole(_pathAndQuery))
                    context.Response.Redirect(DefaultUrl + _pathAndQuery);
            }
            else
            {
                context.Response.Redirect(LoginUrl);
            }
        }
     
        public static void AuthorizePage(HttpContext context)
        {
            AppCommon.SetupUser();
            AppCommon.RequestUrl = context.Request.Path;

            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                var query = context.Request.Url.Query;
                if (!query.IsNullOrWhiteSpace())
                {
                    var builder = new StringBuilder();
                    var delimiter = '/';
                    var segments = context.Request.Url.PathAndQuery.Split(delimiter);
                    foreach (var segment in segments)
                        if (!segment.Contains(query) && !string.IsNullOrEmpty(segment))
                            builder.Append(delimiter + segment);
                    _pathAndQuery = builder.ToString();
                }
                else
                {
                    _pathAndQuery = context.Request.Url.PathAndQuery;
                }
                if (!AppCommon.IsInRole(_pathAndQuery))
                    context.Response.Redirect(DefaultUrl + _pathAndQuery);
            }
            else
            {
                context.Response.Redirect(LoginUrl);
            }
        }


        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            AppCommon.SetupUser();
            _httpContext = httpContext;
            _pathAndQuery = string.Empty;
            if (_httpContext.Request.Url != null)
            {
                //if (_httpContext.Request.UrlReferrer != null)
                //{
                //    var builder = new StringBuilder();
                //    var segments = _httpContext.Request.UrlReferrer.Segments;
                //    foreach (var segment in segments)
                //            builder.Append(segment);
                //    _pathAndQuery = builder.ToString();
                //}
                var id = _httpContext.Request.RequestContext.RouteData.Values["id"];
                if (id != null)
                {
                    var builder = new StringBuilder();
                    var delimiter = '/';
                    var segments = _httpContext.Request.Url.PathAndQuery.Split(delimiter);
                    foreach (var segment in segments)
                        if (!segment.Contains(id.ToString()) && !string.IsNullOrEmpty(segment))
                            builder.Append(delimiter + segment);
                    _pathAndQuery = builder.ToString();
                }
                else
                {
                    _pathAndQuery = _httpContext.Request.Url.PathAndQuery;
                }
            }
            return AppCommon.IsInRole(_pathAndQuery);
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            AppCommon.SetupUser();
            _httpContext = httpContext;
            _route = string.Empty;
            if (_httpContext.Request.Url != null)
            {
                var id = _httpContext.Request.RequestContext.RouteData.Values["id"];
                var query = _httpContext.Request.Url.Query;
                if (id != null)
                {
                    var builder = new StringBuilder();
                    var delimiter = '/';
                    var segments = _httpContext.Request.Url.PathAndQuery.Split(delimiter);
                    foreach (var segment in segments)
                        if (!segment.Contains(id.ToString()) && !string.IsNullOrEmpty(segment))
                            builder.Append(delimiter + segment);
                    _route = builder.ToString();
                }
                else if (!query.IsNullOrWhiteSpace())
                {
                    _route = _httpContext.Request.Url.AbsolutePath;
                }
                else
                {
                    _route = _httpContext.Request.Url.AbsolutePath;
                }
            }
            return AppCommon.IsInRole(_route);
        }


*/