<%@ Page Title="DataHistory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataHistory.aspx.cs" Inherits="DataHistory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header class="py-5 mb-4" style="background-image: url('https://images.unsplash.com/photo-1580234033313-184d6414b800?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); background-size: cover; background-position: center;">
        <div class="container d-flex justify-content-between align-items-center">
            <nav class="d-flex align-items-center">
                <a href="#" class="nav-link px-3 text-white">Home</a>
                <a href="#" class="nav-link px-3 text-white">About</a>
                <a href="#" class="nav-link px-3 text-white">Contact</a>
            </nav>
            <div class="d-flex align-items-center">
                <a href="#" class="btn btn-sm btn-outline-light me-2">Login</a>
                <a href="#" class="btn btn-sm btn-primary">Register</a>
            </div>
        </div>
    </header>

    <div class="container">
        <h2 class="mb-4">Data History (Report) Page</h2>

        <!-- Transport Emissions Section -->
        <div class="mb-5">
            <h3>Transport Emissions</h3>
            <table class="table table-striped table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Vehicle Type</th>
                        <th>Distance</th>
                        <th>Fuel Type</th>
                        <th>Fuel Efficiency (Gallons/Km/Mile)</th>
                        <th>Entry Date</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Car</td>
                        <td>100 miles</td>
                        <td>Gasoline</td>
                        <td>20 gallons</td>
                        <td>2024-02-26</td>
                    </tr>
                    <!-- More rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>

        <!-- Electricity Consumption Section -->
        <div>
            <h3>Electricity Consumption</h3>
            <table class="table table-striped table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Energy Source</th>
                        <th>Electricity Usage (Kilowatt-Hours)</th>
                        <th>Entry Date</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Grid</td>
                        <td>500 kWh</td>
                        <td>2024-02-25</td>
                    </tr>
                    <!-- More rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
