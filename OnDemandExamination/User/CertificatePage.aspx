<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CertificatePage.aspx.cs" Inherits="OnDemandExamination.User.CertificatePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 395px;
        }
        .auto-style6 {
            width: 170px;
        }
        .auto-style9 {
            width: 170px;
            height: 23px;
        }
        .auto-style10 {
            height: 23px;
            width: 249px;
        }
        .auto-style11 {
            width: 249px;
        }
        .auto-style14 {
            width: 115px;
        }
        .auto-style15 {
            height: 23px;
            width: 115px;
        }
        .auto-style16 {
            width: 103px;
        }
        .auto-style17 {
            height: 23px;
            width: 103px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1"> CERTIFICATE</h1><br />

            <table class="auto-style2">
                <tr>
                    <td class="auto-style14">Student ID</td>
                    <td class="auto-style16">
                        <asp:Label ID="labelStudentID" runat="server"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">Name</td>
                    <td class="auto-style16">
                        <asp:Label ID="labelName" runat="server"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">DOB</td>
                    <td class="auto-style16">
                        <asp:Label ID="labelDOB" runat="server"></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">RESULT </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">Course</td>
                    <td class="auto-style16">Marks</td>
                    <td class="auto-style6">Obtain Marks</td>
                    <td class="auto-style11">Result</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="labelCourse" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style17">100</td>
                    <td class="auto-style9">
                        <asp:Label ID="labelmarksObtain" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:Label ID="labelResult" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        <asp:Image ID="Image1" runat="server" Height="58px" ImageUrl="~/User/img/signature.jpg" Width="201px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        Signature</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style10">
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
