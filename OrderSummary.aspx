<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="Assignment.OrderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');

        body {
            align-items: center;
            justify-content: center;
            background-color: #ADFF2F;
            font-family: inter, sans-serif;
        }

        .container2 {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding-left: 50px;
            padding-right: 50px;
            padding-top: 30px;
            padding-bottom: 30px;
            margin-top: 50px;
            margin-bottom: 80px;
            position: relative;
            width: 100%;
            border-radius: 16px;
            background-color: white;
            border: 2px solid #1B1B1B;
            box-sizing: border-box;
            box-shadow: 6px 6px 0px #1B1B1B;
            border-radius: 8px;
        }

            /* Apply border-radius to the table */
            .container2 table {
                border-radius: 8px;
            }

                /* Center align table cells */
                .container2 table th,
                .container2 table td {
                    text-align: center;
                }
    </style>
    <div style="padding: 150px;">
        <div class="container2">
            <div>
        <h2>Order Summary</h2>

        <asp:GridView ID="gvCartItems" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="ProductPrice" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:TemplateField HeaderText="Subtotal">
                    <ItemTemplate>
                        <%# (decimal)Eval("ProductPrice") * (int)Eval("Quantity") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <p>Order Total Price: RM<asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label></p><br />
           <asp:Label ID="lblWaitTime" runat="server" Text=""></asp:Label>
                 <p>Delivery Fee:RM <asp:Label ID="lblDeliveryFee" runat="server" Text=""></asp:Label></p>
        <p>Order Address: <asp:Label ID="lblOrderAddress" runat="server" Text=""></asp:Label></p>
        <p>Order Status: <asp:Label ID="lblOrderStatus" runat="server" Text=""></asp:Label>. </p>
        <p>Order Date: <asp:Label ID="lblOrderDate" runat="server" Text=""></asp:Label></p>
                <p>Total Price with delivery fee: <asp:Label ID="realTotalPricelbl" runat="server" Text=""></asp:Label></p>
    </div>
        </div>
    </div>



</asp:Content>
