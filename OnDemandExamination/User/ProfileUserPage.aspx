<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="ProfileUserPage.aspx.cs" Inherits="OnDemandExamination.User.ProfileUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h1>Your Profile</h1>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionDb %>" ProviderName="<%$ ConnectionStrings:connectionDb.ProviderName %>" SelectCommand="SELECT [FirstName], [LastName], [LoginID], [Email], [Phone], [Gender], [DOB], [Program], [Address], [StateID], [cityID], [PinCoad] FROM [UserDetials] WHERE ([LoginID] = @LoginID)">
            <SelectParameters>
                <asp:SessionParameter Name="LoginID" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:LinkButton ID="LinkButtonEditProfile" runat="server" ForeColor="#0000CC" OnClick="LinkButtonEditProfile_Click">Edit Profile</asp:LinkButton>
    </p>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <h3 class="center">Your Profile</h3>
     <p  style="margin: 0 0 450px;" class="center">

        <asp:Image ID="Image1" runat="server" Height="378px" ImageUrl="~/User/img/exam5.jpg" Width="784px" />

 </p>
</asp:Content>
