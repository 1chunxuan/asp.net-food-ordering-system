<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="Assignment.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="padding: 300px">
            <h2>Login</h2>
            <div>
 <label for="txtEmail">Email:</label>
                <input type="email" id="txtEmail" name="txtEmail" runat="server" />
            </div>
            <div>
                <label for="txtPassword">Password:</label>
                <input type="password" id="txtPassword" name="txtPassword" runat="server" /><br />
                 <label for="ddlUserType">User Type:</label>
    <asp:DropDownList ID="ddlUserType" runat="server">
        <asp:ListItem Value="Customer" Selected="True">User</asp:ListItem>
        <asp:ListItem Value="Staff">Admin</asp:ListItem>
         </asp:DropDownList>
            </div>
            <div>
                <input type="submit" id="btnLogin" runat="server" value="Login" />
                <a href="ForgetPassword.aspx">Forgot Password?</a>
            </div>
         <asp:Label ID="errorlbl" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
