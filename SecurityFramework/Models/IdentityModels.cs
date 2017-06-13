using System;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace SecurityFramework.Models
{
    // You can add User data for the user by adding more properties to your User class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool SysAdmin { get; set; }

        public ClaimsIdentity GenerateUserIdentity(ApplicationUserManager manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);

            // Add custom user claims 
            userIdentity.AddClaim(new Claim(nameof(FirstName), FirstName));
            userIdentity.AddClaim(new Claim(nameof(LastName), LastName));
            userIdentity.AddClaim(new Claim(nameof(SysAdmin), SysAdmin.ToString()));

            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(ApplicationUserManager manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }

    public static class IdentityExtensions
    {
        public static string GetFirstName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity) identity).FindFirst("FirstName");
            // Test for null to avoid issues during local testing
            return claim != null ? claim.Value : string.Empty;
        }

        public static string GetLastName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity) identity).FindFirst("LastName");
            // Test for null to avoid issues during local testing
            return claim != null ? claim.Value : string.Empty;
        }

        public static string GetDisplayName(this IIdentity identity)
        {
            var first = ((ClaimsIdentity) identity).FindFirst("FirstName");
            var last = ((ClaimsIdentity) identity).FindFirst("LastName");
            // Tests for null to avoid issues during local testing
            var displayName =
                (first != null ? first.Value : string.Empty) + " " +
                (last != null ? last.Value : string.Empty);
            return displayName;
        }

        public static bool GetSysAdmin(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity) identity).FindFirst("SysAdmin");
            // Test for null to avoid issues during local testing
            return Convert.ToBoolean(claim?.Value);
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}

#region Helpers

namespace SecurityFramework
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public const string ProviderNameKey = "providerName";

        public const string CodeKey = "code";

        public const string UserIdKey = "userId";

        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request.QueryString[ProviderNameKey];
        }

        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }

        public static string GetUserIdFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
        }

        public static string GetResetPasswordRedirectUrl(string code, HttpRequest request)
        {
            var absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
            return new Uri(request.Url, absoluteUri).AbsoluteUri;
        }

        public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
        {
            var absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey +
                              "=" + HttpUtility.UrlEncode(userId);
            return new Uri(request.Url, absoluteUri).AbsoluteUri;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) &&
                   (url[0] == '/' && (url.Length == 1 || url[1] != '/' && url[1] != '\\') ||
                    url.Length > 1 && url[0] == '~' && url[1] == '/');
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!string.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
                response.Redirect(returnUrl);
            else
                response.Redirect("~/");
        }
    }
}

#endregion