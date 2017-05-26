using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SecurityFramework.Utilities.Common;

namespace SecurityFramework.MorrisRoad
{
    public partial class MorrisRoad : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VerifyAccessAttribute.AuthorizePage(HttpContext.Current);
        }
    }
}