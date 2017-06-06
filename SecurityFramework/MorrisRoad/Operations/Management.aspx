<%@ Page Title="Morris Road|Operations|Management" Language="C#" MasterPageFile="~/MorrisRoad/MorrisRoad.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="SecurityFramework.MorrisRoad.Operations.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Morris Road | Operations | Management</h2>
    <table class="table table-striped">
        <tbody>
        <tr>
            <td class="control-label col-md-2">Param1:</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblParam1" CssClass="form-control" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="control-label col-md-2">Param2:</td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblParam2" CssClass="form-control" runat="server" ></asp:Label>
            </td>    
        </tr>
        </tbody>
    </table>

    <div>
        <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>
</asp:Content>
