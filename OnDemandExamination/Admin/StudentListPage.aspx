<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="StudentListPage.aspx.cs" Inherits="OnDemandExamination.Admin.StudentListPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="LoginID" HeaderText="LoginID" SortExpression="LoginID" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Program" HeaderText="Program" SortExpression="Program" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connectionDb %>" DeleteCommand="DELETE FROM [UserDetials] WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([LoginID] = @original_LoginID) OR ([LoginID] IS NULL AND @original_LoginID IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Program] = @original_Program) OR ([Program] IS NULL AND @original_Program IS NULL))" InsertCommand="INSERT INTO [UserDetials] ([FirstName], [LastName], [LoginID], [Email], [Phone], [Program]) VALUES (@FirstName, @LastName, @LoginID, @Email, @Phone, @Program)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [UserID], [FirstName], [LastName], [LoginID], [Email], [Phone], [Program] FROM [UserDetials]" UpdateCommand="UPDATE [UserDetials] SET [FirstName] = @FirstName, [LastName] = @LastName, [LoginID] = @LoginID, [Email] = @Email, [Phone] = @Phone, [Program] = @Program WHERE [UserID] = @original_UserID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([LoginID] = @original_LoginID) OR ([LoginID] IS NULL AND @original_LoginID IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Program] = @original_Program) OR ([Program] IS NULL AND @original_Program IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int64" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_LoginID" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="Int64" />
                <asp:Parameter Name="original_Program" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="LoginID" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="Int64" />
                <asp:Parameter Name="Program" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="LoginID" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="Int64" />
                <asp:Parameter Name="Program" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int64" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_LoginID" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="Int64" />
                <asp:Parameter Name="original_Program" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
