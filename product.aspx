<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Assignment.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="style.css" />
    <div style="padding: 150px; background-image: url(images/adminBackground.jpg);">
        <asp:HiddenField ID="hfCategoryID" runat="server" Value='<%# Eval("categoryID") %>' />
        <h1><asp:Label ID="lblMeal" runat="server" Text="Label"></asp:Label></h1>
        <div class="repeater-container">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="category-item" style="margin: 30px">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="redirectToProductDetails" CommandArgument='<%# Eval("productID") %>'>
                            <img src='<%# Eval("productPhoto") %>' width="200" height="200" />
                        </asp:LinkButton>
                        <h3 style="text-align: center; background-color:white"><%# Eval("productName") %></h3>
                        <p>RM<%# String.Format("{0:0.00}", Eval("productPrice")) %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Product.productID, Product.productName, Product.productPrice, Product.productPhoto FROM Product INNER JOIN Category ON Product.categoryID = Category.categoryID WHERE (Product.categoryID = @categoryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="categoryID" QueryStringField="categoryID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
