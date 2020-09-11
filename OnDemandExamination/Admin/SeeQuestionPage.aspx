<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="SeeQuestionPage.aspx.cs" Inherits="OnDemandExamination.Admin.SeeQuestionPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownProgram" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ProgramName" DataValueField="ProgramName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [ProgramName] FROM [programDetails]"></asp:SqlDataSource>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownCourse" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="CourseName" DataValueField="CourseName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [CourseName] FROM [CourseDeatils] WHERE ([ProgramName] = @ProgramName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownProgram" Name="ProgramName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="QuestionID" DataSourceID="SqlDataSource1" Height="50px" Width="608px">
                    <Fields>
                        <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                        <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                        <asp:BoundField DataField="OptionA" HeaderText="OptionA" SortExpression="OptionA" />
                        <asp:BoundField DataField="OptionB" HeaderText="OptionB" SortExpression="OptionB" />
                        <asp:BoundField DataField="OptionC" HeaderText="OptionC" SortExpression="OptionC" />
                        <asp:BoundField DataField="OptionD" HeaderText="OptionD" SortExpression="OptionD" />
                        <asp:BoundField DataField="CorrectOption" HeaderText="CorrectOption" SortExpression="CorrectOption" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connectionDb %>" DeleteCommand="DELETE FROM [QuestionDetails] WHERE [QuestionID] = @original_QuestionID AND (([Question] = @original_Question) OR ([Question] IS NULL AND @original_Question IS NULL)) AND (([OptionA] = @original_OptionA) OR ([OptionA] IS NULL AND @original_OptionA IS NULL)) AND (([OptionB] = @original_OptionB) OR ([OptionB] IS NULL AND @original_OptionB IS NULL)) AND (([OptionC] = @original_OptionC) OR ([OptionC] IS NULL AND @original_OptionC IS NULL)) AND (([OptionD] = @original_OptionD) OR ([OptionD] IS NULL AND @original_OptionD IS NULL)) AND (([CorrectOption] = @original_CorrectOption) OR ([CorrectOption] IS NULL AND @original_CorrectOption IS NULL))" InsertCommand="INSERT INTO [QuestionDetails] ([Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (@Question, @OptionA, @OptionB, @OptionC, @OptionD, @CorrectOption)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [QuestionID], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption] FROM [QuestionDetails] WHERE ([Course] = @Course)" UpdateCommand="UPDATE [QuestionDetails] SET [Question] = @Question, [OptionA] = @OptionA, [OptionB] = @OptionB, [OptionC] = @OptionC, [OptionD] = @OptionD, [CorrectOption] = @CorrectOption WHERE [QuestionID] = @original_QuestionID AND (([Question] = @original_Question) OR ([Question] IS NULL AND @original_Question IS NULL)) AND (([OptionA] = @original_OptionA) OR ([OptionA] IS NULL AND @original_OptionA IS NULL)) AND (([OptionB] = @original_OptionB) OR ([OptionB] IS NULL AND @original_OptionB IS NULL)) AND (([OptionC] = @original_OptionC) OR ([OptionC] IS NULL AND @original_OptionC IS NULL)) AND (([OptionD] = @original_OptionD) OR ([OptionD] IS NULL AND @original_OptionD IS NULL)) AND (([CorrectOption] = @original_CorrectOption) OR ([CorrectOption] IS NULL AND @original_CorrectOption IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_QuestionID" Type="Int64" />
                        <asp:Parameter Name="original_Question" Type="String" />
                        <asp:Parameter Name="original_OptionA" Type="String" />
                        <asp:Parameter Name="original_OptionB" Type="String" />
                        <asp:Parameter Name="original_OptionC" Type="String" />
                        <asp:Parameter Name="original_OptionD" Type="String" />
                        <asp:Parameter Name="original_CorrectOption" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Question" Type="String" />
                        <asp:Parameter Name="OptionA" Type="String" />
                        <asp:Parameter Name="OptionB" Type="String" />
                        <asp:Parameter Name="OptionC" Type="String" />
                        <asp:Parameter Name="OptionD" Type="String" />
                        <asp:Parameter Name="CorrectOption" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownCourse" Name="Course" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Question" Type="String" />
                        <asp:Parameter Name="OptionA" Type="String" />
                        <asp:Parameter Name="OptionB" Type="String" />
                        <asp:Parameter Name="OptionC" Type="String" />
                        <asp:Parameter Name="OptionD" Type="String" />
                        <asp:Parameter Name="CorrectOption" Type="String" />
                        <asp:Parameter Name="original_QuestionID" Type="Int64" />
                        <asp:Parameter Name="original_Question" Type="String" />
                        <asp:Parameter Name="original_OptionA" Type="String" />
                        <asp:Parameter Name="original_OptionB" Type="String" />
                        <asp:Parameter Name="original_OptionC" Type="String" />
                        <asp:Parameter Name="original_OptionD" Type="String" />
                        <asp:Parameter Name="original_CorrectOption" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
