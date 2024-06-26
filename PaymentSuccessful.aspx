<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentSuccessful.aspx.cs" Inherits="Assignment.PaymentSuccessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');


        body {
            align-items: center;
            justify-content: center;
            background-color: #ADFF2F;
            font-family: inter, sans-serif;
        }

        .thank-you-container {
            background-color:#028A0F;
            border: 2px solid #1B1B1B;
            box-sizing: border-box;
            box-shadow: 6px 6px 0px #1B1B1B;
            border-radius: 8px;
            text-align: center;
            margin: 50px auto;
            max-width: 600px;
        }

            .thank-you-container h2 {
                font-size: 2em;
                margin-bottom: 20px;
            }

            .thank-you-container p {
                font-size: 1.2em;
                margin-bottom: 30px;
            }

        .btn {
            background-color: #3DED97;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>

    <div style="padding: 80px;"></div>

    <div class="thank-you-container" style="padding: 120px;">
        <h2 style="color:white;">Thank You for Your Payment!</h2>
        <p style="color:white;">Your payment has been processed successfully.</p>
        <a href="OrderSummary.aspx" class="btn">Track Your Order</a>
    </div>

</asp:Content>
