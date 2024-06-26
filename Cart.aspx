<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div style="padding:150px;">
        <h2>Cart</h2>
        <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
            <ItemTemplate>
                <div class="cart-item">
                    <asp:Image ID="imgProductPhoto" runat="server" Width="100" Height="100" ImageUrl='<%# Eval("ProductPhoto") %>' />
                    <h3><%# Eval("ProductName") %></h3>
                    <p>Price: $<%# Eval("ProductPrice") %></p>
                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    <asp:Button ID="btnIncrease" runat="server" Text="+" CommandName="Increase" CommandArgument='<%# Container.ItemIndex %>' />
                    <asp:Button ID="btnDecrease" runat="server" Text="-" CommandName="Decrease" CommandArgument='<%# Container.ItemIndex %>' />
                    <p>Subtotal: $<%# (decimal)Eval("ProductPrice") * (int)Eval("Quantity") %></p>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Container.ItemIndex %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
         The current Total Price is <asp:Label ID="lblTotalSubtotal" runat="server" Text=""></asp:Label>

    </div>
    <div>
        <asp:HyperLink ID="checkoutLink" runat="server" NavigateUrl="~/Payment.aspx" Text="Proceed to Checkout"></asp:HyperLink>
    </div>
</asp:Content>
