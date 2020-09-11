<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageProgramPage.aspx.cs" Inherits="OnDemandExamination.Admin.ManageProgramPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Program</h1>
    <table style="width: 23%; height: 59px;">
    <tr>
        <td style="width: 229px">Program Name</td>
        <td style="width: 313px">
            <asp:TextBox ID="textBoxProgramName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 229px">Duration</td>
        <td style="width: 313px">
            <asp:TextBox ID="textBoxDuration" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 229px">
            <asp:Button ID="buttonAdd" runat="server" OnClick="buttonAdd_Click" Text="Add" />
        </td>
        <td style="width: 313px">
            <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProgramID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" InsertVisible="False" ReadOnly="True" SortExpression="ProgramID" />
        <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" SortExpression="ProgramName" />
        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramID], [ProgramName], [Duration] FROM [programDetails]"></asp:SqlDataSource>
</asp:Content>
