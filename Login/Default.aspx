<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Carbon Footprint Tracker Application</h1>
        <p>A carbon footprint is the total amount of greenhouse gases emitted into the atmosphere as a result of human activities. Tracking carbon emissions is essential for our organization to understand and reduce our environmental impact.</p>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
