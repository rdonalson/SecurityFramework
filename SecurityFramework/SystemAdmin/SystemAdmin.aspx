<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="SecurityFramework.SystemAdmin.SystemAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>System Admin </h2>
        <p class="lead">
            Click on the various Error Handling pages below to see how they work
        </p>
    </div>

    <div>
        <p>
            Click this button to create an InvalidOperationException.<br/>
            Page_Error will catch this and redirect to
            ApplicationError.aspx.<br/>
            <asp:Button ID="Submit1" runat="server"
                        CommandArgument="1" OnClick="Submit_Click"
                        Text="Button 1"/>
        </p>
        <p>
            Click this button to create an ArgumentOutOfRangeException.<br/>
            Page_Error will catch this and handle the error.<br/>
            <asp:Button ID="Submit2" runat="server"
                        CommandArgument="2" OnClick="Submit_Click"
                        Text="Button 2"/>
        </p>
        <p>
            Click this button to create a generic Exception.<br/>
            Application_Error will catch this and handle the error.<br/>
            <asp:Button ID="Submit3" runat="server"
                        CommandArgument="3" OnClick="Submit_Click"
                        Text="Button 3"/>
        </p>
        <p>
            Click this button to create an HTTP 404 (not found) error.<br/>
            Application_Error will catch this
            and redirect to PageNotFound.aspx.<br/>
            <asp:Button ID="Submit4" runat="server"
                        CommandArgument="4" OnClick="Submit_Click"
                        Text="Button 4"/>
        </p>
    </div>

</asp:Content>
