<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="OnDemandExamination.User.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="LoginID" HeaderText="LoginID" SortExpression="LoginID" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="Program" HeaderText="Program" SortExpression="Program" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="StateID" HeaderText="StateID" SortExpression="StateID" />
            <asp:BoundField DataField="cityID" HeaderText="cityID" SortExpression="cityID" />
            <asp:BoundField DataField="PinCoad" HeaderText="PinCoad" SortExpression="PinCoad" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [FirstName], [LastName], [LoginID], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad] FROM [UserDetials] WHERE ([LoginID] = @LoginID)">
        <SelectParameters>
            <asp:SessionParameter Name="LoginID" SessionField="user" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Edit Your Profile</h1>
    <table id="RegstrationTable" style="border-width: thick; border-color: #000000; width:100%; padding: 3px; font-weight: bold;">
        <tr>
            <td style="width: 146px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 146px">First Name</td>
            <td>
                <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Last Name</td>
            <td style="height: 26px">
                <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastName" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Login ID</td>
            <td style="height: 26px">
                        <asp:TextBox ID="LoginId" runat="server" OnTextChanged="LoginId_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">E-mail   <td style="height: 26px">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Email should be in correct formate" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Phone No.</td>
            <td style="height: 26px">
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="phone" ErrorMessage="Please enter valid Phone No." ForeColor="#FF3399" SetFocusOnError="True" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">DOB</td>
            <td style="height: 26px">
                <asp:TextBox ID="dob" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dob" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Program</td>
            <td style="height: 26px">
                <asp:DropDownList ID="DropDownListProgram" runat="server" DataSourceID="SqlDataSource3" DataTextField="Program" DataValueField="Program">
                    <asp:ListItem>select</asp:ListItem>
                    <asp:ListItem>MCA</asp:ListItem>
                    <asp:ListItem>MBA</asp:ListItem>
                    <asp:ListItem>BA</asp:ListItem>
                    <asp:ListItem Value="BCA">BCA</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [Program] FROM [UserDetials] WHERE ([LoginID] = @LoginID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="LoginID" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Address</td>
            <td style="height: 26px">
                <asp:TextBox ID="address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="address" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 24px;">Gender</td>
            <td style="height: 24px">
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 24px;">State</td>
            <td style="height: 24px">
                <asp:DropDownList ID="DropDownListState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateID" DataValueField="StateID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>"
                    ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>"
                    SelectCommand="SELECT [StateID] FROM [UserDetials] WHERE ([LoginID] = @LoginID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="LoginID" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 146px">City</td>
            <td>
                <asp:DropDownList ID="DropDownListCity" runat="server" DataSourceID="SqlDataSource2" DataTextField="CityID" DataValueField="CityID">
                    <asp:ListItem Value="0">Select City</asp:ListItem>
                    <asp:ListItem Value="1">Laxmi Nagar</asp:ListItem>
                    <asp:ListItem Value="2">Nirman Vihar</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [cityID] FROM [UserDetials] WHERE ([LoginID] = @LoginID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="LoginID" SessionField="user" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 146px">Pin Code</td>
            <td>
                <asp:TextBox ID="PinCode" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PinCode" ErrorMessage="please enter valid pin code" ForeColor="#FF3399" SetFocusOnError="True" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px">
                <asp:Button ID="ButtonReset" runat="server" Height="28px" OnClick="ButtonReset_Click" Text="Reset" />
            </td>
            <td>
                <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Update" />
                &nbsp;
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
