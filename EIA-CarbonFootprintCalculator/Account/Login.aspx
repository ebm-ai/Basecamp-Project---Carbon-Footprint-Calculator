<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="mt-4"> <!-- Add margin top to move all sections down -->
        <h2 class="text-center">Login to Your Account</h2> <!-- Add header -->

        <div class="row justify-content-center mt-4"> <!-- Add margin top to move all sections down -->
            <div class="col-md-6">
                <section id="loginForm">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Use a local account to log in.</h4>
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="mb-3 row">
                                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-3 col-form-label">User name</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                        CssClass="text-danger" ErrorMessage="The user name field is required." />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 col-form-label">Password</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-md-9 offset-md-3">
                                    <div class="form-check">
                                        <asp:CheckBox runat="server" ID="RememberMe" CssClass="form-check-input" />
                                        <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="form-check-label">Remember me?</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-md-9 offset-md-3">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="text-center">
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
                        if you don't have a local account.
                    </p>
                </section>
            </div>

            <div class="col-md-4">
                <section id="socialLoginForm">
                    <uc:openauthproviders runat="server" id="OpenAuthLogin" />
                </section>
            </div>
        </div>
    </div>
</asp:Content>

