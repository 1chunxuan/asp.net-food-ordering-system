<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="Assignment.productDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="product.css" />
    <style>
        /* Add your custom CSS styles here */
        body{
            background-image:url(images/adminBackground.jpg);
        }
        .product-image{
            margin-left:12%;
        }
        .product-info {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-info .element-header {
            margin-bottom: 20px;
        }
        .product-image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-price strong {
            color: #1C5E55;
            font-size: 1.5rem;
        }
        .product-info label {
            font-size: 20px;
            color: #333;
        }
        .stock-button {
            margin-top: 20px;
        }
        .button {
            background-color: #1C5E55;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #15524A;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-product" class="my-lg">
        <div class="container-lg">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product-image">
                        <asp:Image ID="productImage" runat="server" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product-info">
                        <div class="element-header">
                            <h1><asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h1>
                            <em>
                                <asp:Label ID="lblCategoryName" runat="server" Text=""></asp:Label>
                            </em>
                        </div>
                        <div class="product-price">
                            <strong><asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <p>
                            <asp:Label ID="lblDesc" runat="server" Text=""></asp:Label>
                        </p>
                        <div class="stock-button">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" CssClass="button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
