<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addProduct.aspx.cs" Inherits="Assignment.addProduct" %>


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
            padding: 8px;
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

        .error {
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin: 50px 100px 0 100px">Insert Product Info</h1>
    <div class="form-view-container">
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="add-button" Font-Bold="true" OnClick="btnBack_Click" />
        <asp:FormView ID="fvPrpduct" runat="server" DefaultMode="Insert" InsertMethod="fvProduct_InsertItem" ItemType="Assignment.Models.Product" DataKeyNames="productID" OnItemCommand="fvPrpduct_ItemCommand">
            <InsertItemTemplate>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
                <table style="width:100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblProductId" runat="server" Text="Product ID:" CssClass="form-label" AssociatedControlID="txtProductId"></asp:Label>
                        </td>
                        <td>:</td>
                        <td style="width:60%">
                            <asp:TextBox ID="txtProductId" runat="server" CssClass="form-control" Text='<%# Bind("productID") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product ID is required" ControlToValidate="txtProductId" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCategoryId" runat="server" Text="Category ID:" CssClass="form-label" AssociatedControlID="txtCategoryId"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtCategoryId" runat="server" CssClass="form-control" Text='<%# Bind("categoryID") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category ID is required" ControlToValidate="txtCategoryId" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductName" runat="server" Text="Name:" CssClass="form-label" AssociatedControlID="txtProductName"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Text='<%# Bind("productName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Product Name is required" ControlToValidate="txtProductName" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductDesc" runat="server" Text="Description:" CssClass="form-label" AssociatedControlID="txtProductDesc"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtProductDesc" runat="server" CssClass="form-control" Text='<%# Bind("productDesc") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Product Description is required" ControlToValidate="txtProductDesc" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductPrice" runat="server" Text="Price:" CssClass="form-label" AssociatedControlID="txtProductPrice"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control" Text='<%# Bind("productPrice") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Product Price is required" ControlToValidate="txtProductPrice" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductPhoto" runat="server" Text="Image:" CssClass="form-label" AssociatedControlID="txtProductPhoto"></asp:Label>
                        </td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtProductPhoto" runat="server" CssClass="form-control" Text='<%# Bind("productPhoto") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Product Photo is required" ControlToValidate="txtProductPhoto" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="add-button" CommandName="Insert" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="add-button" CommandName="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

