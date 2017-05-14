using System;
using System.Web.UI;

namespace SecurityFramework.SystemAdmin
{
    public partial class AccessDenied : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ApplicationAccessRedirect"]?.Length > 0)
                InternalPermissionsError.Text = "<div class=\"ErrorMessage\">You do not have access to the \""
                                                + Request.QueryString["ApplicationAccessRedirect"]
                                                + "\".<br />Please contact your manager if you require access.</div>";

            if (Request.QueryString["InternalPermissionsRedirect"]?.Length > 0)
                ApplicationPermissionsError.Text
                    = "<div class=\"ErrorMessage\">Your permissions level does not grant you access to this URL:  \""
                      + Request.QueryString["InternalPermissionsRedirect"]
                      + "\"<br />Please contact your manager if you require access.</div>";
        }
    }
}