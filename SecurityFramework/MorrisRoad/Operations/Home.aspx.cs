using System;
using System.Web.UI;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.MorrisRoad.Operations
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnASP_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MorrisRoad/Operations/Management?Param1=abc&Param2=34.23");
        }

        protected string AppPath => AppCommon.GetAppPath(); 
    }
}