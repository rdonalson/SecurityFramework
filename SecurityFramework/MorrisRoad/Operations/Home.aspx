<%@ Page Title="Morris Road|Operations|Home" Language="C#" MasterPageFile="~/MorrisRoad/MorrisRoad.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SecurityFramework.MorrisRoad.Operations.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function navigateToManangement() {
            location.href = "<%=AppPath%>/MorrisRoad/Operations/Management?Param1=abc&Param2=34.23";
        }
    </script>
    <h2>Morris Road | Operations | Home</h2>
    <input id="btnHTML"  class="btn btn-primary" type="button" runat="server" value="HTML" onclick="navigateToManangement()" />
    <br/>
    <br/>
    <asp:HyperLink ID="lnkHyperLink"  CssClass="btn btn-link" runat="server" NavigateUrl="~/MorrisRoad/Operations/Management?Param1=abc&Param2=34.23">HyperLink</asp:HyperLink>
    <br/>
    <br/>
    <asp:Button ID="btnASP" CssClass="btn btn-primary" runat="server" Text="ASP" OnClick="btnASP_Click" />

</asp:Content>
