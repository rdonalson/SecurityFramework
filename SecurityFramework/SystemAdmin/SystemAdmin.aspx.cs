using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.SystemAdmin
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            var arg = ((Button)sender).CommandArgument;

            switch (arg)
            {
                case "1":
                {
                    // Exception handled on the Generic Error Page
                    throw new InvalidOperationException("Button 1 was clicked");
                }
                case "2":
                {
                    // Exception handled on the current page
                    throw new ArgumentOutOfRangeException("sender");
                }
                case "3":
                {
                    // Exception handled by Application_Error
                    throw new Exception("Button 3 was clicked");
                }
                case "4":
                {
                    // Exception handled on the Http 404 Error Page
                    Response.Redirect("PageNotFound.aspx");
                    break;
                }

            }
        }

        private void Page_Error(object sender, EventArgs e)
        {
            AppCommon.LastException = Server.GetLastError();
            // Pass the error on to the Generic Error page
            Response.Redirect("~/SystemAdmin/ApplicationError.aspx", true);
        }
    }
}