using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Admin
{
    public partial class RegisterStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e) => resetValues();

        private void resetValues()
        {
            txtName.Text = txtSurname.Text = txtEmail.Text = txtPhone.Text = txtPassword.Text = txtConfPassword.Text = "";
            ddlGender.SelectedIndex = ddlRole.SelectedIndex = -1;
            staffImage = new FileUpload();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=Cms_AspForms;Integrated Security=True;Pooling=False"))
            {
                try
                {
                    string alertMsg;
                    con.Open();
                    SqlCommand cmdToChck = new SqlCommand("SELECT * FROM [staffInfo] WHERE staffEmail='" + txtEmail.Text + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmdToChck);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        alertMsg = "Email already registered!";
                        resetValues();
                        displayAlertBox(alertMsg);
                        // Response.Redirect("~/Admin/StaffStatus.aspx");
                    }
                    else
                    {
                        string cryptPassword = encryptString(txtPassword.Text);
                        string staffImageName = "STAFF_" + staffImage.PostedFile.FileName;
                        string staffImagePath = "Images/Staff/" + staffImage.FileName;
                        staffImage.PostedFile.SaveAs(Server.MapPath("~/Images/Staff/") + staffImageName);
                        SqlCommand cmd = new SqlCommand("INSERT INTO [staffInfo] VALUES ('" + txtName.Text + "','" + txtSurname.Text + "','" + txtEmail.Text + "','" + ddlGender.SelectedItem.Text + "','" + txtPhone.Text + "','" + staffImagePath + "','" + DateTime.Today + "','" + cryptPassword + "','" + ddlRole.SelectedItem.Text + "')", con);
                        int chck = cmd.ExecuteNonQuery();
                        if (chck != 0)
                        {
                            alertMsg = ddlRole.SelectedItem.Text + " by name " + txtName.Text + " " + txtSurname.Text + " is added to database Successfully";
                            con.Close();
                            resetValues();
                            displayAlertBox(alertMsg);
                            // Response.Redirect("~/Admin/StaffStatus.aspx");
                        }
                        else
                        {
                            alertMsg = "Something went Wrong! Please try again Later";
                            displayAlertBox(alertMsg);
                            // Response.Redirect("Default.aspx");
                        }
                    }
                }
                catch(System.IO.IOException exp)
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