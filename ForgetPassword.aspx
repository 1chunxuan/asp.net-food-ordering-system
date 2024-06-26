<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Assignment.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 300px">
            <h2>Forget Password</h2>
            <div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            </div>
            <div>
                <asp:TextBox ID="txtCustPhone" runat="server" placeholder="Enter Phone" />
                <asp:RequiredFieldValidator ID="rfvCustPhone" runat="server" ControlToValidate="txtCustPhone" ErrorMessage="Phone is required" />
            </div>
            <div>
                <asp:TextBox ID="txtCustAddress" runat="server" placeholder="Enter Address" />
                <asp:RequiredFieldValidator ID="rfvCustAddress" runat="server" ControlToValidate="txtCustAddress" ErrorMessage="Address is required" />
            </div>
            <div>
                <asp:TextBox ID="txtCustName" runat="server" placeholder="Enter Name" />
                <asp:RequiredFieldValidator ID="rfvCustName" runat="server" ControlToValidate="txtCustName" ErrorMessage="Name is required" />
            </div>
            <div>
                <asp:TextBox ID="txtCustEmail" runat="server" placeholder="Enter Email" />
                <asp:RequiredFieldValidator ID="rfvCustEmail" runat="server" ControlToValidate="txtCustEmail" ErrorMessage="Email is required" />
                <asp:RegularExpressionValidator ID="revCustEmail" runat="server" ControlToValidate="txtCustEmail" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </div>
            <div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
                <asp:Label ID="lblPassword" runat="server" Visible="false" /><br />
<asp:HyperLink ID="lnkLogin" runat="server" Text="Login" NavigateUrl="Login1.aspx" Visible="false" />
            </div>
        
        </div>
</asp:Content>
