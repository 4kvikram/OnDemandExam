<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageQuestion.aspx.cs" Inherits="OnDemandExamination.Admin.ManageQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Question</h1>
    <table style="width: 100%">
            <tr>
            <td>
                <asp:DropDownList ID="DropDownListProgram" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProgramName" DataValueField="ProgramName" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramName] FROM [programDetails]"></asp:SqlDataSource>
                </td>
            <td>
                <asp:DropDownList ID="DropDownListCourse" runat="server" DataSourceID="SqlDataSource2" DataTextField="CourseName" DataValueField="CourseName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [CourseName] FROM [CourseDeatils] WHERE ([ProgramName] = @ProgramName2)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListProgram" Name="ProgramName2" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
            <td colspan="2">
                <asp:TextBox ID="TextBoxQuestion" runat="server" placeholder="Enter Questin" Height="95px" Width="592px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxOptionA" placeholder="Option A" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBoxOptionB" placeholder="Option B" runat="server" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxOptionC" placeholder="Option C" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBoxOptionD" placeholder="Option D" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:DropDownList ID="DropDownListCorrectOption" runat="server">
                    <asp:ListItem Selected="True" Value="0">Correct Option</asp:ListItem>
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="buttonAdd" runat="server" OnClick="buttonAdd_Click" Text="Add" />
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="See Questions" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
