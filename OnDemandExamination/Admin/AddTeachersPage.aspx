<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddTeachersPage.aspx.cs" Inherits="OnDemandExamination.Admin.AddTeachersPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="center">Add Teachers</h1>
    <table style="border-width: thick; border-color: #000000; width:100%; padding: 3px; font-weight: bold;" id="RegstrationTable">
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
              <asp:ScriptManager runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                     <asp:TextBox ID="LoginId" runat="server" OnTextChanged="LoginId_TextChanged" AutoPostBack="True" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="LoginId" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                        </asp:UpdatePanel>
                
                    <asp:Label ID="lblUserAvailabel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Password</td>
            <td style="height: 26px">
                <asp:TextBox ID="Password" runat="server" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Password" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">Confirm Password</td>
            <td style="height: 26px">
                <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FirstName" ErrorMessage="this field can not be empty" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword" ErrorMessage="password does not match" ForeColor="#CC0066" SetFocusOnError="True"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 26px;">E-mail</td>
            <td style="height: 26px">
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
                <asp:DropDownList ID="DropDownListProgram" runat="server" DataSourceID="SqlDataSource3" DataTextField="ProgramName" DataValueField="ProgramName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT DISTINCT [ProgramName] FROM [programDetails]"></asp:SqlDataSource>
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
                <asp:DropDownList ID="DropDownListState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateName" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [StateName] FROM [StateDetails]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 146px">City</td>
            <td>
                <asp:DropDownList ID="DropDownListCity" runat="server" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityName">
                    <asp:ListItem Value="0">Select City</asp:ListItem>
                    <asp:ListItem Value="1">Laxmi Nagar</asp:ListItem>
                    <asp:ListItem Value="2">Nirman Vihar</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [CityName] FROM [CityDetails] WHERE ([StateID] = @StateID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListState" Name="StateID" PropertyName="SelectedValue" Type="String" />
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
                <asp:Button ID="ButtonReset" runat="server" Text="Reset" Height="28px" OnClick="ButtonReset_Click" />
            </td>
            <td>
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
            &nbsp;
                <asp:Label ID="LabelErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
