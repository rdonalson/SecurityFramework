<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="SecurityFramework.SystemAdmin.AccessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table-bordered table-striped table-condensed">
        <tr>
            <td >
                <h3>System Access</h3>
                <p>
                    <asp:literal id="InternalPermissionsError" runat="server"/>
                </p>
                <p>
                    <asp:literal id="ApplicationPermissionsError" runat="server"/>
                </p>
            </td>
        </tr>
    </table>
</asp:Content>