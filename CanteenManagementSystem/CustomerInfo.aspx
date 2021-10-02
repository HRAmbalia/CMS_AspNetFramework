<%@ Page Title="Fill Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="CanteenManagementSystem.CustomerInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="form-horizontal">
        <h4>Update account</h4>
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
                <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" Height="30px" Width="280px" ToolTip="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSurname" CssClass="text-danger" ErrorMessage="The Surname field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- EMAIL --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email : </asp:Label>
            <div class="col-md-5">
                <asp:Label id="txtEmail" CssClass="form-control" Height="30px" Width="280px" ReadOnly="true" runat="server" Text="Label" ToolTip="rgstr"></asp:Label>
                <br /><br />
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
        <%-- USERNAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="col-md-2 control-label">Username : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" CssClass="text-danger" ErrorMessage="The Name field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- FROM --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlFrom" CssClass="col-md-2 control-label">From : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlFrom" runat="server" CssClass="form-control" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="bTech">DDIT -  BTech</asp:ListItem>
                    <asp:ListItem Value="mTech">DDIT - MTech</asp:ListItem>
                    <asp:ListItem Value="diploma">DDIT - Diploma</asp:ListItem>
                    <asp:ListItem Value="mba">DDIT - MBA</asp:ListItem>
                    <asp:ListItem Value="bPharm">DDIT - B.Pharm</asp:ListItem>
                    <asp:ListItem Value="mPharm">DDIT - M.Pharm</asp:ListItem>
                    <asp:ListItem Value="dental">DDIT - Dental</asp:ListItem>
                    <asp:ListItem Value="none">None of Above</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn btn-default" OnClick="btnRegister_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default" Text="Reset" OnClick="btnReset_Click" />
            </div>
        </div>


    </div>
</asp:Content>
