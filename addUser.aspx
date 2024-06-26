<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="Assignment.addStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-view-container {
            margin: 50px 100px 0 100px;
            background-color: #f9f9f9;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        table td {
            padding: 10px 0;
        }

        table td:first-child {
            width: 400px;
        }

        table td:nth-child(2) {
            padding: 0 10px;
        }

        .form-view-container input[type="text"] {
            width: calc(100% - 20px); 
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .add-button {
            background-color: #1C5E55;
            color: white;
            border: 2px solid black;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .add-button:hover {
                background-color: #15524A;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin: 50px 100px 0 100px">Insert User Info</h1>
    <div class="form-view-container">
        <asp:FormView ID="fvStaff" runat="server" DefaultMode="Insert" InsertMethod="fvStaff_InsertItem" ItemType="Assignment.Models.User" DataKeyNames="custID" OnItemCommand="fvStaff_ItemCommand">
        <InsertItemTemplate>
        <table style="width:100%">
            <tr>
                <td>
                    <asp:Label ID="lblUserId" runat="server" Text="User ID:" CssClass="form-label" AssociatedControlID="txtUserId"></asp:Label></td>
                <td>:</td>
                <td style="width:60%">
                    <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" Text='<%# Bind("custID") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text="Name:" CssClass="form-label" AssociatedControlID="txtUserName"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" Text='<%# Bind("custName") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="form-label" AssociatedControlID="txtPassword"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Text='<%# Bind("custPassword") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblGender" runat="server" Text="Gender:" CssClass="form-label" AssociatedControlID="txtGender"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" Text='<%# Bind("custGender") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone No:" CssClass="form-label" AssociatedControlID="txtPhone"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Text='<%# Bind("custPhone") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label" AssociatedControlID="txtEmail"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text='<%# Bind("custEmail") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address:" CssClass="form-label" AssociatedControlID="txtAddress"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Text='<%# Bind("custAddress") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhoto" runat="server" Text="Photo:" CssClass="form-label" AssociatedControlID="txtPhoto"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtPhoto" runat="server" CssClass="form-control" Text='<%# Bind("custPhoto") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblJoinedDate" runat="server" Text="Joined Date:" CssClass="form-label" AssociatedControlID="txtJoinedDate"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtJoinedDate" runat="server" CssClass="form-control" Text='<%# Bind("custJoinedDate") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRole" runat="server" Text="Role:" CssClass="form-label" AssociatedControlID="txtRole"></asp:Label>
                </td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtRole" runat="server" CssClass="form-control" Text='<%# Bind("role") %>'></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCard" runat="server" Text="Card No:" CssClass="form-label" AssociatedControlID="txtCard"></asp:Label></td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtCard" runat="server" CssClass="form-control" Text='<%# Bind("cardNo") %>'></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="add-button" CommandName="Insert" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="add-button" CommandName="Cancel" />
    </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
