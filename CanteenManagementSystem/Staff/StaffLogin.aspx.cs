using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace CanteenManagementSystem.Staff
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if ( Session["email"]!=null && String.Equals( Session["role"],"Admin") )
            {
                Response.Redirect("~/Admin/Default.aspx");
            }
            else if (Session["email"] != null && String.Equals(Session["role"], "Staff"))
            {
                Response.Redirect("~/Staff/Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // check if from given input user is available,
            // if available sent it to their respective home page
            // else show error message on 'StaffLogin.apx' that incorrect input

            using (SqlConnection con = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; Initial Catalog = Cms_AspForms; Integrated Security = True; Pooling = False")) 
            {
                string cryptPassword = encryptString(txtPassword.Text);
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [staffInfo] WHERE staffEmail='" + txtEmail.Text + "' AND staffPassword = '" + cryptPassword + "' AND Role = '" + ddlLoginAs.SelectedValue.ToString() + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        if ( String.Equals(ddlLoginAs.SelectedValue.ToString(), "Admin") )
                        {
                            DataRow dr = dt.Rows[0];
                            Session["email"] = txtEmail.Text;
                            Session["userID"] = Convert.ToString(dr[0]);
                            Session["role"] = Convert.ToString(dr[9]);
                            // string alertMsg = "Your logged in as ADMIN.";
                            // displayAlertBox(alertMsg);
                            Response.Redirect("~/Admin/Default.aspx");
                        }
                        else if (ddlLoginAs.SelectedItem.Text == "Staff")
                        {
                            DataRow dr = dt.Rows[0];
                            Session["email"] = txtEmail.Text;
                            Session["userID"] = Convert.ToString(dr[0]);
                            Session["role"] = Convert.ToString(dr[9]);
                            // string alertMsg = "Your logged in as STAFF.";
                            // displayAlertBox(alertMsg);
                            Response.Redirect("~/Staff/Default.aspx");
                        }
                        resetValues();
                        // use that alert or directly sent user to there respective page
                        // seperate adimn and staff here, sent them to their respective homepage while creating session
                        // and check their is user or admin is authorised or not
                    }
                    else
                    {
                        string alertMsg = "Email or Password or Role went wrong!";
                        displayAlertBox(alertMsg);
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "System internal Error occured : " + exp;
                    displayAlertBox(alert);
                    // Response.Redirect("Default.aspx");
                }
            }
        }

        private void resetValues()
        {
            txtEmail.Text = txtPassword.Text = "";
            ddlLoginAs.SelectedIndex = -1;
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

        private string encryptString(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
    }
}