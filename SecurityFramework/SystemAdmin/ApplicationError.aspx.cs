using System;
using System.Web.UI;

namespace SecurityFramework.SystemAdmin
{
    public partial class ApplicationsError : Page
    {
        private Exception _ex;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Get the last error from the server
                _ex = ApplicationCommon.LastException;

                // Create a safe message
                var safeMsg = "A problem has occurred in the web site. ";

                // Show Inner Exception fields for local access
                if (_ex?.InnerException != null)
                {
                    innerTrace.Text = _ex.InnerException.StackTrace;
                    InnerErrorPanel.Visible = Request.IsLocal;
                    innerMessage.Text = _ex.InnerException.Message;
                }
                // Show Trace for local access
                if (Request.IsLocal)
                    exTrace.Visible = true;
                else
                    _ex = new Exception(safeMsg, _ex);

                // Fill the page fields
                if (_ex != null)
                {
                    exMessage.Text = _ex.Message;
                    exTrace.Text = _ex.StackTrace;
                }

                // Clear the error from the server
                Server.ClearError();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }
    }
}