using System;
using System.Web.UI;

namespace SecurityFramework.MorrisRoad.Operations
{
    public partial class Management : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblParam1.Text = "";
            lblParam2.Text = "";
            var param1 = Request.QueryString[@"Param1"];
            var param2 = Request.QueryString[@"Param2"];
            lblParam1.Text = param1;
            lblParam2.Text = param2;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MorrisRoad/Operations/Home");
        }
    }
}