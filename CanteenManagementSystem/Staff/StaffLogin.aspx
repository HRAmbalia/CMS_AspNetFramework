<%@ Page Title="Staff Login" Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="CanteenManagementSystem.Staff.StaffLogin" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %></title>

    <%--<asp:ContentPlaceHolder ID="head" runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:ContentPlaceHolder>--%>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
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
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Home</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/About">About</a></li>
                        <li><a runat="server" href="~/Contact">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <%-- If Staff is not logged in --%>
                            <li><a runat="server" href="~/Account/Login">LogIn User</a></li>
                        <%--  --%>
                        <%-- If staff is loggd in --%>
                            <%-- Here, Add fields which can only be accessed by Loggedin staff --%>
                            <%-- But how to varify if staff is loggedin or not --%>
                        <%--  --%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container body-content">
            <%--  --%>
            <h2><%: Title %>.</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-horizontal">
                            <hr />
                            <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="Literal1" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email :</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" ValidationGroup="lgn" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="The email field is required." ValidationGroup="lgn" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password :</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" ValidationGroup="lgn" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="lgn" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlLoginAs" CssClass="col-md-2 control-label">Login As :</asp:Label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="ddlLoginAs" runat="server" CssClass="auto-style1" Width="280px" ValidationGroup="lgn">
                                        <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlLoginAs" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="lgn" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <%--<asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />--%>
                                    <asp:Button runat="server" Text="Log in" CssClass="btn btn-default" ID="btnLogin" OnClick="btnLogin_Click" ValidationGroup="lgn" />
                                </div>
                            </div>
                            To register as Staff <asp:HyperLink ID="HlContact" runat="server" NavigateUrl="~/Contact.aspx">Contact</asp:HyperLink> Us. <br />
                            <asp:Label ID="loginStatus" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - Canteen Management System</p>
            </footer>
        </div>
    </form>
</body>
</html>
