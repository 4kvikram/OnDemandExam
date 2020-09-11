<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="OnDemandExamination.LogInPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table class="auto-style2">
        <tr>
            <td style="width: 112px; height: 63px;" class="center">User ID</td>
            <td style="width: 248px; height: 63px;">
                <asp:TextBox ID="TextBoxUserId" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 112px; height: 52px;" class="center">Password</td>
            <td style="width: 248px; height: 52px;">
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 112px; height: 53px;">
                <asp:Button ID="ButtonLogin0" runat="server" Text="Registration" OnClick="ButtonLogin0_Click" />
            </td>
            <td style="width: 248px; height: 53px;" class="center">
                <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
   
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
            width: 563px;
        }
    </style>
</asp:Content>

