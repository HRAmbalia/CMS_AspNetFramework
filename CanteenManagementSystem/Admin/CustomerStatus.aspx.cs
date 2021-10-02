using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Admin
{
    public partial class CustomerStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/");
            }
        }
    }
}