<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCoursePage.aspx.cs" Inherits="OnDemandExamination.Admin.ManageCoursePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Course</h1>
    <table style="width: 100%">
        <tr>
            <td style="width: 128px">Select Program</td>
            <td>
                <asp:DropDownList ID="DropDownListProgram" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProgramName" DataValueField="ProgramName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramName] FROM [programDetails]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 128px">Enter course</td>
            <td>
                <asp:TextBox ID="textBoxCourse" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
                <asp:Button ID="buttonAdd" runat="server" OnClick="Add_Click" Text="add" style="width: 35px" />
            </td>
            <td>
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" SortExpression="ProgramName" />
                        <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramName], [CourseName] FROM [CourseDeatils]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
