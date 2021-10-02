<%@ Page Title="Register Staff" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterStaff.aspx.cs" Inherits="CanteenManagementSystem.Admin.RegisterStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title %>.</h2>
    <p>Staff Registration will be done here (Registration Form)</p>
    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <%-- NAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" CssClass="text-danger" ErrorMessage="The Name field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- SURNAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSurname" CssClass="col-md-2 control-label">Surame : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" CssClass="text-danger" ErrorMessage="The Surname field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- EMAIL --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="The Email field is required." ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="Wrong Format input" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- GENDER --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlGender" CssClass="col-md-2 control-label">Gender : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Another</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGender" CssClass="text-danger" ErrorMessage="The Gender field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- PHONE NO --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPhone" CssClass="col-md-2 control-label">Phone No. : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone" CssClass="text-danger" ErrorMessage="The PhoneNo field is required." ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPhone" CssClass="text-danger" ErrorMessage="Wrong Format input." ValidationExpression="^[6-9][0-9]{9}$" ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- ROLE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlRole" CssClass="col-md-2 control-label">Role : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem>Staff</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlRole" CssClass="text-danger" ErrorMessage="Role field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="staffImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:FileUpload ID="staffImage" runat="server" CssClass="auto-style1" Width="280px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="staffImage" CssClass="text-danger" ErrorMessage="Image field is required." ValidationGroup="rgstr" />                                
                <asp:RegularExpressionValidator runat="server" ControlToValidate="staffImage" CssClass="text-danger" ErrorMessage="Only Image files are allowed"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$" ValidationGroup="rgstr" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            </div>
        </div>
        <%-- PASSWORD --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- CONFIRM PASSWORD --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtConfPassword" CssClass="col-md-2 control-label">Confirm password : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtConfPassword" TextMode="Password" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" CssClass="text-danger" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" />                
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn btn-default" OnClick="btnRegister_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default" Text="Reset" OnClick="btnReset_Click" />
                &nbsp;
                <asp:Label ID="registrationStatus" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div>
        </div>
    </div>
</asp:Content>
