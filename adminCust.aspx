<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminCust.aspx.cs" Inherits="Assignment.adminCust" %>
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
    <h1 style="margin: 50px 100px 0 100px">Customers Info</h1>
    <div style="margin: 30px 100px 0 100px">
    <asp:GridView ID="gvCust" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="custID" DataSourceID="sqlCust" ForeColor="#333333" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Underline="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="custID" HeaderText="ID" ReadOnly="True" SortExpression="custID" />
            <asp:BoundField DataField="custName" HeaderText="Name" SortExpression="custName" />
            <asp:BoundField DataField="custPassword" HeaderText="Password" SortExpression="custPassword" />
            <asp:BoundField DataField="custGender" HeaderText="Gender" SortExpression="custGender" />
            <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
            <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
            <asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
            <asp:BoundField DataField="custPhoto" HeaderText="Photo" SortExpression="custPhoto" />
            <asp:BoundField DataField="custJoinedDate" HeaderText="Joined Date" SortExpression="custJoinedDate" />
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
    <asp:SqlDataSource ID="sqlCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [custID] = @custID" InsertCommand="INSERT INTO [User] ([custID], [custName], [custPassword], [custGender], [custPhone], [custEmail], [custAddress], [custPhoto], [custJoinedDate], [role], [cardNo]) VALUES (@custID, @custName, @custPassword, @custGender, @custPhone, @custEmail, @custAddress, @custPhoto, @custJoinedDate, @role, @cardNo)" SelectCommand="SELECT custID, custName, custPassword, custGender, custPhone, custEmail, custAddress, custPhoto, custJoinedDate  FROM [User] WHERE [role] = 'customer'
" UpdateCommand="UPDATE [User] SET [custName] = @custName, [custPassword] = @custPassword, [custGender] = @custGender, [custPhone] = @custPhone, [custEmail] = @custEmail, [custPhoto] = @custPhoto, [custJoinedDate] = @custJoinedDate WHERE [custID] = @custID">
        <DeleteParameters>
            <asp:Parameter Name="custID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="custID" Type="String" />
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="custPassword" Type="String" />
            <asp:Parameter Name="custGender" Type="String" />
            <asp:Parameter Name="custPhone" Type="Int32" />
            <asp:Parameter Name="custEmail" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custPhoto" Type="String" />
            <asp:Parameter DbType="Date" Name="custJoinedDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="custPassword" Type="String" />
            <asp:Parameter Name="custGender" Type="String" />
            <asp:Parameter Name="custPhone" Type="Int32" />
            <asp:Parameter Name="custEmail" Type="String" />
            <asp:Parameter Name="custAddress" Type="String" />
            <asp:Parameter Name="custPhoto" Type="String" />
            <asp:Parameter DbType="Date" Name="custJoinedDate" />
            <asp:Parameter Name="custID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
