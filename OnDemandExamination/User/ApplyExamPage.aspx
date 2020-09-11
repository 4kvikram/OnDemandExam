<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="ApplyExamPage.aspx.cs" Inherits="OnDemandExamination.User.ApplyExamPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="center">Apply for Exam</h1>
    <table style="width: 100%">
        <tr>
            <td>Select Program</td>
            <td>
                <asp:DropDownList ID="DropDownListProgram" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProgramName" DataValueField="ProgramName">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramName] FROM [programDetails]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Select Course</td>
            <td>
                <asp:DropDownList ID="DropDownListCourse" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="CourseName">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [CourseName] FROM [CourseDeatils] WHERE ([ProgramName] = @ProgramName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListProgram" Name="ProgramName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="DropDownListCourse2" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="CourseName">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListCourse3" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="CourseName">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" />
            </td>
            <td>
                <asp:Label ID="LabelErrorMessage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
