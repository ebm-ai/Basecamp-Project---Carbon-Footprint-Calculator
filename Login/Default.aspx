<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1>Welcome to Eco Impact Africa's Carbon Footprint Calculator!</h1>
        <p>We are delighted to welcome you to our user-friendly and intuitive Carbon Footprint Calculator. As a company committed to environmental sustainability, we believe that understanding and reducing our carbon footprints is a crucial step towards creating a greener future.
            With our calculator, you can easily measure and track your carbon emissions, empowering you to make informed decisions and take meaningful actions to reduce your environmental impact.
            
            Thank you for choosing Eco Impact Africa's Carbon Footprint Calculator to embark on your sustainability journey. Together, let's make a positive impact and create a more sustainable, low-carbon future for generations to come.
            
            Start calculating your carbon footprint now by logging in to our app and be part of the change!</p>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
