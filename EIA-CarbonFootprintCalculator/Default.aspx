<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EIA_CarbonFootprintCalculator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main style="margin-left: auto; margin-right: auto; text-align: center;">
        <section class="row" aria-labelledby="aspnetTitle">
            <div>
                 <h1 id="aspnetTitle">Welcome to Eco Impact Africa's Carbon Footprint Calculator!</h1>
                    <p class="lead">We are delighted to welcome you to our user-friendly and intuitive Carbon Footprint Calculator.</p>
            </div>
            <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p> --%>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Who Are We</h2>
                <p>
                    Lawyers, natural scientists, environmental assessment practitioners, auditors, 
                    environmental control officers and data base administrators.
                </p>
                <p>
                   <%-- <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a> --%>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 id="librariesTitle">Services</h2>
                <p>
                     <li>Environmental, Health and Safety, Energy and Food Safety Legislation Registers</li>
                     <li>Environmental, Health and Safety, Energy Management Systems</li>
                     <li>Environmental, Health and Safety Compliance Auditing</li>
                     <li>Sustainability Auditing</li>
                     <li>Environmental Impact Assessments</li>
                     <li>Environmental Control Officers</li>
                     <li>On-Site Environmental, Health and Safety Management</li>
                     <li>Training Workshops Incorporating Our Services</li>
                </p>
                <p>
                    <%-- <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a> --%>
                </p>
            </section>            
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 id="hostingTitle">What's Next</h2>
                <p>
                    Thank you for choosing Eco Impact Africa's Carbon Footprint Calculator to embark on your sustainability journey. 
                    Together, let's make a positive impact and create a more sustainable, low-carbon future for generations to come.
                </p>
                <p>
                   <%-- <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a> --%>
                </p>
            </section>

            <section>
                <h4 class="foot">Start calculating your carbon footprint now by logging in to our app and be part of the change!</h4>
            </section>
        </div>
    </main>

</asp:Content>
