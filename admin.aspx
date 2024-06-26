<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Assignment.admin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .add-button {
            margin: 30px 100px 0 100px;
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
    <h1 style="margin: 50px 100px 0 100px">Order Info</h1>
    <div style="margin: 30px 100px 0 100px">
        <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="orderID" DataSourceID="sqlOrder" ForeColor="#333333" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Underline="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="orderID" HeaderText="Order ID" ReadOnly="True" SortExpression="orderID" />
                <asp:BoundField DataField="cartID" HeaderText="Cart ID" SortExpression="cartID" />
                <asp:BoundField DataField="orderAddress" HeaderText="Order Address" SortExpression="orderAddress" />
                <asp:BoundField DataField="deliveryFee" HeaderText="Delivery Fee" SortExpression="deliveryFee" />
                <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" />
                <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqlOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Order] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [Order] ([orderID], [cartID], [orderAddress], [deliveryFee], [orderDate], [orderStatus]) VALUES (@orderID, @cartID, @orderAddress, @deliveryFee, @orderDate, @orderStatus)" SelectCommand="SELECT * FROM [Order]" UpdateCommand="UPDATE [Order] SET [cartID] = @cartID, [orderAddress] = @orderAddress, [deliveryFee] = @deliveryFee, [orderDate] = @orderDate, [orderStatus] = @orderStatus WHERE [orderID] = @orderID">
            <DeleteParameters>
                <asp:Parameter Name="orderID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="orderID" Type="String" />
                <asp:Parameter Name="cartID" Type="String" />
                <asp:Parameter Name="orderAddress" Type="String" />
                <asp:Parameter Name="deliveryFee" Type="Double" />
                <asp:Parameter DbType="Date" Name="orderDate" />
                <asp:Parameter Name="orderStatus" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cartID" Type="String" />
                <asp:Parameter Name="orderAddress" Type="String" />
                <asp:Parameter Name="deliveryFee" Type="Double" />
                <asp:Parameter DbType="Date" Name="orderDate" />
                <asp:Parameter Name="orderStatus" Type="String" />
                <asp:Parameter Name="orderID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
