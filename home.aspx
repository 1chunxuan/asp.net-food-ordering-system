<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Assignment.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="style.css" />
    <script src="https://kit.fontawesome.com/4f80857e9d.js" crossorigin="anonymous"></script>


    <section id="Home" style="height:650px">

        <div class="main">
            <div class="main_text">
                <h1 class="auto-style5">Get Fresh<span>Food</span><br>in a Easy Way</h1>
            </div>
            <div class="main_image">
                <img src="images/main_img.png" class="auto-style3" />
            </div>
        </div>
        <div class="slogan">
            <p class="slogan-text">
                Every meal matters, as it's a chance to nourish your body and delight your taste buds. <br />
                Explore our website to discover a variety of delicious dishes waiting to become your new <br />
                favorite. From hearty breakfasts to savory dinners, there's something for everyone to enjoy.
            </p>
        </div>
    </section>

    <!--Categories-->
    <div class="category" id="Categories">
        <h1>Categories</h1>
        <div class="repeater-container">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="category-item" style="margin: 30px;">
                        <!-- Updated the LinkButton to call the redirectToProduct method -->
                        <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="redirectToProduct" CommandArgument='<%# Eval("categoryID") %>'>
                            <img src='<%# Eval("categoryImage") %>' width="200" height="200" />
                        </asp:LinkButton>
                        <p><%# Eval("categoryName") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </div>
    </div>
    
        <!--About-->

    <div class="about" id="About">
        <div class="about_main">

            <div class="image">
                <img src="images/Food-Plate.png">
            </div>

            <div class="about_text">
                <h1><span>About</span>Us</h1>
                <h3>Why Choose us?</h3>
                <p>
                    We pride ourselves on offering a diverse array of culinary experiences, ranging from the bold flavors of Chinese cuisine 
                    to the aromatic spices of Malay dishes. Dive into the rich tapestry of Indian cuisine, savor the delicate artistry of 
                    Japanese dishes, and indulge in the umami delights of Korean fare. Explore the hearty comfort of American classics, 
                    the fiery zest of Mexican dishes, and the exotic allure of Thai flavors. Lastly, immerse yourself in the timeless elegance 
                    of Italian cuisine, where every bite tells a story of tradition, passion, and culinary excellence. With our extensive selection, 
                    there's something to tantalize every palate and satisfy every craving.
                </p>
            </div>

        </div>


    </div>

</asp:Content>
