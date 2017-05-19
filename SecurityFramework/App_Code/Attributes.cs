using System.Web;
using System.Web.Mvc;

namespace SecurityFramework
{
    /// ===============================================================================================
    /// <summary>
    ///     Custom Annotation Attribute & Functions that control security to pages and routes.
    /// </summary>
    /// ===============================================================================================
    public sealed class VerifyAccessAttribute : AuthorizeAttribute
    {
        // Internal members
        private static string _pathAndQuery = string.Empty;

        private HttpContextBase _httpContext;
        private static string DefaultUrl => "~/SystemAdmin/AccessDenied.aspx?InternalPermissionsRedirect=~";
        private static string LoginUrl => "~/Account/Login";

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Provides the default Access Denied Url and the route that was denied
        /// </summary>
        /// -----------------------------------------------------------------------------------------------
        private string InternalPermissionsRedirect => DefaultUrl + _pathAndQuery;

        /// -----------------------------------------------------------------------------------------------
        /// <summary>
        ///     Overridden version of Authorize Core that verifies a user's access to the requested url
        /// </summary>
        /// <param name="httpContext">HttpContextBase</param>
        /// <returns>bool</returns>
        /// -----------------------------------------------------------------------------------------------
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            ApplicationCommon.SetupUser();
            _httpContext = httpContext;
            if (_httpContext.Request.Url != null) _pathAndQuery = _httpContext.Request.Url.PathAndQuery;
            return ApplicationCommon.IsInRole(_pathAndQuery);
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
        ///     Authorizes a user's access to the requested page
        /// </summary>
        /// <param name="context">HttpContext</param>
        /// -----------------------------------------------------------------------------------------------
        public static void AuthorizePage(HttpContext context)
        {
            ApplicationCommon.SetupUser();
            ApplicationCommon.RequestUrl = context.Request.Path;
            if (HttpContext.Current.User != null &&
                HttpContext.Current.User.Identity.IsAuthenticated)
            {
                _pathAndQuery = context.Request.Url.PathAndQuery;
                if (!ApplicationCommon.IsInRole(_pathAndQuery))
                    context.Response.Redirect(DefaultUrl + _pathAndQuery);
            }
            else
            {
                context.Response.Redirect(LoginUrl);
            }
        }
    }
}