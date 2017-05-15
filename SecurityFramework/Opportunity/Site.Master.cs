using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace SecurityFramework.Opportunity
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VerifyAccessAttribute.AuthorizePage(HttpContext.Current);
        }
        protected static bool IsInRole(string pathAndQuery)
        {
            return GlobalVariables.IsInRole(pathAndQuery);
        }
    }

}