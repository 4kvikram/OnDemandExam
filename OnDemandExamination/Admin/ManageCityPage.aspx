<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCityPage.aspx.cs" Inherits="OnDemandExamination.Admin.ManageCityPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage City</h1>
    <table style="width: 100%">
        <tr>
            <td>Select State</td>
            <td>
                <asp:DropDownList ID="DropDownListState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [StateName], [StateID] FROM [StateDetails]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Enter City Name</td>
            <td>
                <asp:TextBox ID="textBoxCityName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Pin Code</td>
            <td>
                <asp:TextBox ID="TextBoxPinCode" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Add" runat="server" OnClick="Add_Click" Text="Add" />
            </td>
            <td>
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CityID" DataSourceID="SqlDataSource2" Width="591px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="CityID" HeaderText="CityID" InsertVisible="False" ReadOnly="True" SortExpression="CityID" />
                        <asp:BoundField DataField="StateID" HeaderText="StateID" SortExpression="StateID" />
                        <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connectionDb %>" DeleteCommand="DELETE FROM [CityDetails] WHERE [CityID] = @original_CityID AND (([StateID] = @original_StateID) OR ([StateID] IS NULL AND @original_StateID IS NULL)) AND (([CityName] = @original_CityName) OR ([CityName] IS NULL AND @original_CityName IS NULL)) AND (([PinCode] = @original_PinCode) OR ([PinCode] IS NULL AND @original_PinCode IS NULL))" InsertCommand="INSERT INTO [CityDetails] ([StateID], [CityName], [PinCode]) VALUES (@StateID, @CityName, @PinCode)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [CityID], [StateID], [CityName], [PinCode] FROM [CityDetails]" UpdateCommand="UPDATE [CityDetails] SET [StateID] = @StateID, [CityName] = @CityName, [PinCode] = @PinCode WHERE [CityID] = @original_CityID AND (([StateID] = @original_StateID) OR ([StateID] IS NULL AND @original_StateID IS NULL)) AND (([CityName] = @original_CityName) OR ([CityName] IS NULL AND @original_CityName IS NULL)) AND (([PinCode] = @original_PinCode) OR ([PinCode] IS NULL AND @original_PinCode IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CityID" Type="Int64" />
                        <asp:Parameter Name="original_StateID" Type="String" />
                        <asp:Parameter Name="original_CityName" Type="String" />
                        <asp:Parameter Name="original_PinCode" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StateID" Type="String" />
                        <asp:Parameter Name="CityName" Type="String" />
                        <asp:Parameter Name="PinCode" Type="Int64" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StateID" Type="String" />
                        <asp:Parameter Name="CityName" Type="String" />
                        <asp:Parameter Name="PinCode" Type="Int64" />
                        <asp:Parameter Name="original_CityID" Type="Int64" />
                        <asp:Parameter Name="original_StateID" Type="String" />
                        <asp:Parameter Name="original_CityName" Type="String" />
                        <asp:Parameter Name="original_PinCode" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
