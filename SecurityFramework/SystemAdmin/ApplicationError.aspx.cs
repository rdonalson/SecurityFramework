using System;
using System.Web.UI;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.SystemAdmin
{
    public partial class ApplicationsError : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Get the last error from the server
                Exception ex = AppCommon.LastException;

                // Create a safe message
                var safeMsg = "A problem has occurred in the web site. ";

                // Show Inner Exception fields for local access
                if (ex?.InnerException != null)
                {
                    innerTrace.Text = ex.InnerException.StackTrace;
                    InnerErrorPanel.Visible = Request.IsLocal;
                    innerMessage.Text = ex.InnerException.Message;
                }
                // Show Trace for local access
                if (Request.IsLocal)
                    exTrace.Visible = true;
                else
                    ex = new Exception(safeMsg, ex);

                // Fill the page fields
                if (ex != null)
                {
                    exMessage.Text = ex.Message;
                    exTrace.Text = ex.StackTrace;
                }

                // Clear the error from the server
                Server.ClearError();
                AppCommon.LastException = null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
    }
}