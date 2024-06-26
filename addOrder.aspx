<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addOrder.aspx.cs" Inherits="Assignment.addOrder" %>
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
            width: calc(100% - 20px); /* Adjust width for input fields */
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin: 50px 100px 0 100px">Insert Order Info</h1>
    <div class="form-view-container">
        <asp:Button ID="btnBackOrder" runat="server" Text="Back" Font-Bold="true" CssClass="add-button" OnClick="btnBackOrder_Click" />
        <asp:FormView ID="fvOrder" runat="server" DefaultMode="Insert" InsertMethod="fvOrder_InsertItem" ItemType="Assignment.Models.Order" DataKeyNames="orderID" OnItemCommand="fvOrder_ItemCommand">
            <InsertItemTemplate>
                <table style="width:100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblOrderId" runat="server" Text="Order ID:" CssClass="form-label" AssociatedControlID="txtOrderId"></asp:Label></td>
                        <td>:</td>
                        <td style="width:60%">
                            <asp:TextBox ID="txtOrderId" runat="server" CssClass="form-control" Text='<%# Bind("orderID") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCartId" runat="server" Text="Cart ID:" CssClass="form-label" AssociatedControlID="txtCartId"></asp:Label></td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtCartId" runat="server" CssClass="form-control" Text='<%# Bind("cartID") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOrderAddress" runat="server" Text="Order Address:" CssClass="form-label" AssociatedControlID="txtOrderAddress"></asp:Label></td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtOrderAddress" runat="server" CssClass="form-control" Text='<%# Bind("orderAddress") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDeliveryFee" runat="server" Text="Delivery Fee:" CssClass="form-label" AssociatedControlID="txtDeliveryFee"></asp:Label></td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtDeliveryFee" runat="server" CssClass="form-control" Text='<%# Bind("deliveryFee") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOrderDate" runat="server" Text="Order Date:" CssClass="form-label" AssociatedControlID="txtOrderDate"></asp:Label></td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtOrderDate" runat="server" CssClass="form-control" Text='<%# Bind("orderDate") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOrderStatus" runat="server" Text="Order Status:" CssClass="form-label" AssociatedControlID="txtOrderStatus"></asp:Label></td>
                        <td>:</td>
                        <td>
                            <asp:TextBox ID="txtOrderStatus" runat="server" CssClass="form-control" Text='<%# Bind("orderStatus") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="add-button" CommandName="Insert" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="add-button" CommandName="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
        
    </div>
</asp:Content>
