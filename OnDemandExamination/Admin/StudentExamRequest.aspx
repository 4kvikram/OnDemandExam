<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="StudentExamRequest.aspx.cs" Inherits="OnDemandExamination.Admin.StudentExamRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
       <h1 class="center">Student Exam Request</h1>

       <br />
       <table class="auto-style1">
           <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
           <tr>
               <td colspan="2">
                   <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="RequestID" DataSourceID="SqlDataSource1" GridLines="Vertical" Height="50px" Width="381px">
                       <AlternatingRowStyle BackColor="#DCDCDC" />
                       <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                       <Fields>
                           <asp:BoundField DataField="RequestID" HeaderText="RequestID" InsertVisible="False" ReadOnly="True" SortExpression="RequestID" />
                           <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                           <asp:BoundField DataField="CourseName1" HeaderText="CourseName1" SortExpression="CourseName1" />
                           <asp:BoundField DataField="CourseName2" HeaderText="CourseName2" SortExpression="CourseName2" />
                           <asp:BoundField DataField="CourseName3" HeaderText="CourseName3" SortExpression="CourseName3" />
                           <asp:BoundField DataField="flag1" HeaderText="Allow course 1" SortExpression="flag1" />
                           <asp:BoundField DataField="flag2" HeaderText="Allow course 2" SortExpression="flag2" />
                           <asp:BoundField DataField="flag3" HeaderText="Allow course 3" SortExpression="flag3" />
                           <asp:BoundField DataField="Ts_Created" HeaderText="Requested Date" SortExpression="Ts_Created" />
                           <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                       </Fields>
                       <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                       <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                       <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                   </asp:DetailsView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                       ConnectionString="<%$ ConnectionStrings:connectionDb %>" 
                       DeleteCommand="DELETE FROM [ExamRequestDetails] WHERE [RequestID] = @original_RequestID"
                       InsertCommand="INSERT INTO [ExamRequestDetails] ([UserName], [CourseName1], [CourseName2], [CourseName3], [flag1], [flag2], [flag3], [Ts_Created]) VALUES (@UserName, @CourseName1, @CourseName2, @CourseName3, @flag1, @flag2, @flag3, @Ts_Created)"
                       OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>"
                       SelectCommand="SELECT [RequestID], [UserName], [CourseName1], [CourseName2], [CourseName3], [flag1], [flag2], [flag3], [Ts_Created] FROM [ExamRequestDetails]"
                       UpdateCommand="UPDATE [ExamRequestDetails] SET [UserName] = @UserName, [CourseName1] = @CourseName1, [CourseName2] = @CourseName2, [CourseName3] = @CourseName3, [flag1] = @flag1, [flag2] = @flag2, [flag3] = @flag3, [Ts_Created] = @Ts_Created WHERE [RequestID] = @original_RequestID">
                       <DeleteParameters>
                           <asp:Parameter Name="original_RequestID" Type="Int64" />
                           <asp:Parameter Name="original_UserName" Type="String" />
                           <asp:Parameter Name="original_CourseName1" Type="String" />
                           <asp:Parameter Name="original_CourseName2" Type="String" />
                           <asp:Parameter Name="original_CourseName3" Type="String" />
                           <asp:Parameter Name="original_flag1" Type="Int32" />
                           <asp:Parameter Name="original_flag2" Type="Int32" />
                           <asp:Parameter Name="original_flag3" Type="Int32" />
                           <asp:Parameter Name="original_Ts_Created" Type="DateTime" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="UserName" Type="String" />
                           <asp:Parameter Name="CourseName1" Type="String" />
                           <asp:Parameter Name="CourseName2" Type="String" />
                           <asp:Parameter Name="CourseName3" Type="String" />
                           <asp:Parameter Name="flag1" Type="Int32" />
                           <asp:Parameter Name="flag2" Type="Int32" />
                           <asp:Parameter Name="flag3" Type="Int32" />
                           <asp:Parameter Name="Ts_Created" Type="DateTime" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="UserName" Type="String" />
                           <asp:Parameter Name="CourseName1" Type="String" />
                           <asp:Parameter Name="CourseName2" Type="String" />
                           <asp:Parameter Name="CourseName3" Type="String" />
                           <asp:Parameter Name="flag1" Type="Int32" />
                           <asp:Parameter Name="flag2" Type="Int32" />
                           <asp:Parameter Name="flag3" Type="Int32" />
                           <asp:Parameter Name="Ts_Created" Type="DateTime" />
                           <asp:Parameter Name="original_RequestID" Type="Int64" />
                           <asp:Parameter Name="original_UserName" Type="String" />
                           <asp:Parameter Name="original_CourseName1" Type="String" />
                           <asp:Parameter Name="original_CourseName2" Type="String" />
                           <asp:Parameter Name="original_CourseName3" Type="String" />
                           <asp:Parameter Name="original_flag1" Type="Int32" />
                           <asp:Parameter Name="original_flag2" Type="Int32" />
                           <asp:Parameter Name="original_flag3" Type="Int32" />
                           <asp:Parameter Name="original_Ts_Created" Type="DateTime" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
               </td>
           </tr>
           <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
       </table>

   </div>
</asp:Content>
