<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminProduct.aspx.cs" Inherits="Assignment.test" %>
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
    <h1 style="margin: 50px 100px 0 100px">Products Info</h1>
    <asp:Button ID="btnAdd" runat="server" Text="Insert" CssClass="add-button" OnClick="btnAdd_Click" Font-Bold="True"/>
    <div style="margin: 30px 100px 0 100px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="productID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Underline="False" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="productID" HeaderText="Product ID" ReadOnly="True" SortExpression="productID" />
                            <asp:BoundField DataField="categoryID" HeaderText="CategoryID" SortExpression="categoryID" />
                            <asp:BoundField DataField="productName" HeaderText="Name" SortExpression="productName" />
                            <asp:BoundField DataField="productDesc" HeaderText="Description" SortExpression="productDesc" />
                            <asp:BoundField DataField="productPrice" HeaderText="Price" SortExpression="productPrice" />
                            <asp:BoundField DataField="productPhoto" HeaderText="Image" SortExpression="productPhoto" />

                        </Columns>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="45px" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" Height="50px" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [productID] = @productID" InsertCommand="INSERT INTO [Product] ([productID], [categoryID], [productName], [productDesc], [productPrice], [productPhoto]) VALUES (@productID, @categoryID, @productName, @productDesc, @productPrice, @productPhoto)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [categoryID] = @categoryID, [productName] = @productName, [productDesc] = @productDesc, [productPrice] = @productPrice, [productPhoto] = @productPhoto WHERE [productID] = @productID">
                        <DeleteParameters>
                            <asp:Parameter Name="productID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="productID" Type="String" />
                            <asp:Parameter Name="categoryID" Type="String" />
                            <asp:Parameter Name="productName" Type="String" />
                            <asp:Parameter Name="productDesc" Type="String" />
                            <asp:Parameter Name="productPrice" Type="Double" />
                            <asp:Parameter Name="productPhoto" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="categoryID" Type="String" />
                            <asp:Parameter Name="productName" Type="String" />
                            <asp:Parameter Name="productDesc" Type="String" />
                            <asp:Parameter Name="productPrice" Type="Double" />
                            <asp:Parameter Name="productPhoto" Type="String" />
                            <asp:Parameter Name="productID" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

    </div>
</asp:Content>
