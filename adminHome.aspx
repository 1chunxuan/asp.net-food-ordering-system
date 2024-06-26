<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="Assignment.adminHome" %>
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
    <h1 style="margin: 50px 100px 0 100px">Staff Info</h1>
    <div style="margin: 30px 100px 0 100px">
        <asp:GridView ID="gvStaff" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="custID" DataSourceID="sqlStaff" ForeColor="#333333" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Underline="False" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="custID" HeaderText="Staff ID" ReadOnly="True" SortExpression="custID" />
                <asp:BoundField DataField="custName" HeaderText="Name" SortExpression="custName" />
                <asp:BoundField DataField="custPassword" HeaderText="Password" SortExpression="custPassword" />
                <asp:BoundField DataField="custGender" HeaderText="Gender" SortExpression="custGender" />
                <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
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
        <asp:SqlDataSource ID="sqlStaff" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [custID] = @custID" InsertCommand="INSERT INTO [User] ([custID], [custName], [custPassword], [custGender], [custPhone], [custEmail], [custPhoto], [custJoinedDate], [role], [cardNo]) VALUES (@custID, @custName, @custPassword, @custGender, @custPhone, @custEmail, @custPhoto, @custJoinedDate, @role, @cardNo)" SelectCommand="SELECT custID, custName, custPassword, custGender, custPhone, custEmail, custPhoto, custJoinedDate FROM [User] where role = 'staff'" UpdateCommand="UPDATE [User] SET [custName] = @custName, [custPassword] = @custPassword, [custGender] = @custGender, [custPhone] = @custPhone, [custEmail] = @custEmail, [custPhoto] = @custPhoto, [custJoinedDate] = @custJoinedDate WHERE [custID] = @custID">
            <DeleteParameters>
                <asp:Parameter Name="staffID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="staffID" Type="String" />
                <asp:Parameter Name="staffName" Type="String" />
                <asp:Parameter Name="staffPassword" Type="String" />
                <asp:Parameter Name="staffGender" Type="String" />
                <asp:Parameter Name="staffPhone" Type="Int32" />
                <asp:Parameter Name="staffEmail" Type="String" />
                <asp:Parameter Name="staffPhoto" Type="String" />
                <asp:Parameter DbType="Date" Name="staffJoinedDate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="staffName" Type="String" />
                <asp:Parameter Name="staffPassword" Type="String" />
                <asp:Parameter Name="staffGender" Type="String" />
                <asp:Parameter Name="staffPhone" Type="Int32" />
                <asp:Parameter Name="staffEmail" Type="String" />
                <asp:Parameter Name="staffPhoto" Type="String" />
                <asp:Parameter DbType="Date" Name="staffJoinedDate" />
                <asp:Parameter Name="staffID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
