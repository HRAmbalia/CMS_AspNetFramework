using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session["userID"] = null;
            Session["role"] = null;
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
}