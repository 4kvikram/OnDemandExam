<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="StudentResultPage.aspx.cs" Inherits="OnDemandExamination.Admin.StudentResultPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 382px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Student Results</h1>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" DataKeyNames="ResultID">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ResultID" HeaderText="ResultID" SortExpression="ResultID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                            <asp:BoundField DataField="ExamDate" HeaderText="ExamDate" SortExpression="ExamDate" />
                            <asp:BoundField DataField="Marks" HeaderText="Marks" SortExpression="Marks" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:BoundField DataField="flag" HeaderText="Allow Result" SortExpression="flag" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" 
                        SelectCommand="SELECT [ResultID], [UserName], [CourseName], [ExamDate], [Marks], [Status], [flag] FROM [ResultDetails] ORDER BY [ExamDate]" 
                        ConflictDetection="CompareAllValues" 
                        DeleteCommand="DELETE FROM [ResultDetails] WHERE [ResultID] = @original_ResultID" 
                        InsertCommand="INSERT INTO [ResultDetails] ([UserName], [CourseName], [ExamDate], [Marks], [Status], [flag]) VALUES (@UserName, @CourseName, @ExamDate, @Marks, @Status, @flag)" 
                        OldValuesParameterFormatString="original_{0}" 
                        UpdateCommand="UPDATE [ResultDetails] SET [UserName] = @UserName, [CourseName] = @CourseName, [ExamDate] = @ExamDate, [Marks] = @Marks, [Status] = @Status, [flag] = @flag WHERE [ResultID] = @original_ResultID">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ResultID" Type="Int32" />
                            <asp:Parameter Name="original_UserName" Type="String" />
                            <asp:Parameter Name="original_CourseName" Type="String" />
                            <asp:Parameter Name="original_ExamDate" Type="DateTime" />
                            <asp:Parameter Name="original_Marks" Type="Int32" />
                            <asp:Parameter Name="original_Status" Type="String" />
                            <asp:Parameter Name="original_flag" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="CourseName" Type="String" />
                            <asp:Parameter Name="ExamDate" Type="DateTime" />
                            <asp:Parameter Name="Marks" Type="Int32" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="flag" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="CourseName" Type="String" />
                            <asp:Parameter Name="ExamDate" Type="DateTime" />
                            <asp:Parameter Name="Marks" Type="Int32" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="flag" Type="Int32" />
                            <asp:Parameter Name="original_ResultID" Type="Int32" />
                            <asp:Parameter Name="original_UserName" Type="String" />
                            <asp:Parameter Name="original_CourseName" Type="String" />
                            <asp:Parameter Name="original_ExamDate" Type="DateTime" />
                            <asp:Parameter Name="original_Marks" Type="Int32" />
                            <asp:Parameter Name="original_Status" Type="String" />
                            <asp:Parameter Name="original_flag" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
