<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="SecurityFramework.SystemAdmin.AccessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <div class="jumbotron">
        <h2>System Access</h2>
        <br/>
        <br/>
        <p>
            <asp:literal id="InternalPermissionsRedirect" runat="server"/>
        </p>
        <br/>
        <br/>
        Return to <a runat="server" href="~/">Home</a>
    </div>

</asp:Content>