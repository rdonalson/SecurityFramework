using System;
using System.Web.UI;

namespace SecurityFramework.MorrisRoad.Operations
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnASP_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MorrisRoad/Operations/Management?Param1=abc&ampParam2=34.23");
        }
    }
}