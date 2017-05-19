<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplicationError.aspx.cs" Inherits="SecurityFramework.SystemAdmin.ApplicationsError" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>Application Error</h3>
        <asp:Panel ID="InnerErrorPanel" runat="server" Visible="false">
            <pre>
            <p>
                Inner Error Message:<br/>
                <asp:Label ID="innerMessage" runat="server" Font-Bold="true"
                           Font-Size="Large"/><br/>
            </p>
            <pre>
            <asp:Label ID="innerTrace" runat="server" />
          </pre>
        </asp:Panel>
        <p>
            Error Message:<br/>
            <asp:Label ID="exMessage" runat="server" Font-Bold="true"
                       Font-Size="Large"/>
        </p>
        <pre>
          <asp:Label ID="exTrace" runat="server" Visible="false" />
        </pre>
        <br/>
        Return to <a runat="server" href="~/">Home</a>
    </div>
</asp:Content>