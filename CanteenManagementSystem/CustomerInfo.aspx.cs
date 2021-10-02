using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem
{
    public partial class CustomerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Context.User.Identity.GetUserName();
            if ( !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e) => resetValues();

        private void resetValues()
        {
            txtName.Text = txtPhone.Text = txtUsername.Text = txtSurname.Text = "";
            ddlGender.SelectedIndex = ddlFrom.SelectedIndex = -1;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=Cms_AspForms;Integrated Security=True;Pooling=False"))
            {
                try
                {
                    string alertMsg;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO [customerInfo] VALUES ('" + txtName.Text + "','" + txtSurname.Text + "','" + txtEmail.Text + "','" + ddlGender.SelectedItem.Text + "','" + txtPhone.Text + "','" + txtUsername.Text + "','" + ddlFrom.SelectedValue.ToString() + "')", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alertMsg = "Data inserted Successfully!";
                        con.Close();
                        resetValues();
                        displayAlertBox(alertMsg);
                    }
                    else
                    {
                        alertMsg = "Something went Wrong! Please try again Later";
                        displayAlertBox(alertMsg);
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "Error occured while connecting Database, Try again later : " + exp;
                    displayAlertBox(alert);
                    // Response.Redirect("Default.aspx");
                }
            }
        }

        private void displayAlertBox(string message)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}