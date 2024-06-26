<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style2.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container">
            <h2>Register</h2>
            <table class="form-table">
                <tr>
                    <td><label for="txtName">Name:</label></td>
                    <td><asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox></td>         
                </tr>
                <tr>
                    <td><label for="txtPassword">Password:</label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Gender:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><label for="txtContactNumber">Contact Number:</label></td>
                    <td><asp:TextBox ID="txtContactNumber" runat="server" placeholder="Enter your contact number"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="txtEmail">Email Address:</label></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email address"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label for="txtDeliveryAddress">Delivery Address:</label></td>
                    <td><asp:TextBox ID="txtDeliveryAddress" runat="server" placeholder="Enter your delivery address"></asp:TextBox></td>
                </tr>
                <!-- 
                <tr>
                    <td><label for="filePhoto">Photo:</label></td>
                    <td><asp:FileUpload ID="filePhoto" runat="server" /></td>
                </tr>
                 -->
                <tr>
                    <td><label for="txtJoinedDate">Joined Date:</label></td>
                    <td><asp:TextBox ID="txtJoinedDate" runat="server" placeholder="Enter your joined date" TextMode="Date"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="register-button" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

