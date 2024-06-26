<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style2.css" />
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container">
            <h2>Login</h2>
            <table class="form-table">
                <tr>
                    <td><label for="txtEmail">Email:</label></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="txtPassword">Password:</label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="ddlUserType">User Type:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlUserType" runat="server">
                            
                            <asp:ListItem Text="Admin/Staff" Value="Admin"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="chkRememberMe" runat="server" class="auto-style1" /><label for="chkRememberMe">Remember Me</label></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="register-button" /></td>
                </tr>
                <tr>
                    <td colspan="2"><a href="ForgotPassword.aspx" id="lnkForgotPassword" runat="server" onclick="lnkForgotPassword_Click">Forgot Password?</a></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                 </tr>
            </table>
        </div>
    </div>
</asp:Content>
