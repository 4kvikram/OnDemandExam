<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ExamSettingPage.aspx.cs" Inherits="OnDemandExamination.Admin.ExamSettingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="center">Exam Setting</h1>

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ExamId" HeaderText="ExamId" SortExpression="ExamId" />
            <asp:BoundField DataField="TimeLimit" HeaderText="TimeLimit" SortExpression="TimeLimit" />
            <asp:BoundField DataField="NoOfQuestion" HeaderText="NoOfQuestion" SortExpression="NoOfQuestion" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ExamId], [TimeLimit], [NoOfQuestion] FROM [ExamSetting]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ExamSetting] WHERE [ExamId] = @original_ExamId AND (([TimeLimit] = @original_TimeLimit) OR ([TimeLimit] IS NULL AND @original_TimeLimit IS NULL)) AND (([NoOfQuestion] = @original_NoOfQuestion) OR ([NoOfQuestion] IS NULL AND @original_NoOfQuestion IS NULL))" InsertCommand="INSERT INTO [ExamSetting] ([TimeLimit], [NoOfQuestion]) VALUES (@TimeLimit, @NoOfQuestion)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ExamSetting] SET [TimeLimit] = @TimeLimit, [NoOfQuestion] = @NoOfQuestion WHERE [ExamId] = @original_ExamId AND (([TimeLimit] = @original_TimeLimit) OR ([TimeLimit] IS NULL AND @original_TimeLimit IS NULL)) AND (([NoOfQuestion] = @original_NoOfQuestion) OR ([NoOfQuestion] IS NULL AND @original_NoOfQuestion IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ExamId" Type="Int32" />
            <asp:Parameter Name="original_TimeLimit" Type="Int32" />
            <asp:Parameter Name="original_NoOfQuestion" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TimeLimit" Type="Int32" />
            <asp:Parameter Name="NoOfQuestion" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TimeLimit" Type="Int32" />
            <asp:Parameter Name="NoOfQuestion" Type="Int32" />
            <asp:Parameter Name="original_ExamId" Type="Int32" />
            <asp:Parameter Name="original_TimeLimit" Type="Int32" />
            <asp:Parameter Name="original_NoOfQuestion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
