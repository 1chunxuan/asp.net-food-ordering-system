<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Profile</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="style2.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Profile Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/review_1.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Name:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblName" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Password:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblPassword" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Gender:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblGender" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Contact Number:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblContactNumber" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Email Address:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblEmail" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Delivery Address:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblDeliveryAddress" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Photo:</label>
                                <div class="form-group">
                                    <asp:FileUpload ID="filePhoto" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Joined Date:</label>
                                <div class="form-group">
                                    <asp:Label CssClass="form-control" ID="lblJoinedDate" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                               We are deeply sorry! The current profile edit function is in maintenance. Please bear with us .Thank you!
                               
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
    <div class="col">
        <a href="Logout.aspx">Logout</a>
    </div>
</div>
                <a href="home.aspx">&lt;&lt; Back to Home</a>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Profile</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
