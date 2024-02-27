<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EIA_CarbonFootprintCalculator.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Team Ruby</h3>
        <address>
            Nedamco Africa Team<br />
            Addis Ababa, Ethiopia<br />
            <abbr title="Phone">Phone:</abbr>
            +251900000000
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Support@teamruby.com">Support@teamruby.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@teamruby.com">Marketing@teamruby.com</a>
        </address>
    </main>
</asp:Content>
