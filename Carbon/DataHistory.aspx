<%@ Page Title="DataHistory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataHistory.aspx.cs" Inherits="DataHistory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-green {
            color: #fff;
            background-color: #006400; /* Darker shade of green */
            border-color: #006400; /* Darker shade of green */
            transition: background-color 0.3s ease-in-out, border-color 0.3s ease-in-out;
        }

        .btn-green:hover {
            background-color: #004d00; /* Darker shade of green on hover */
            border-color: #004d00; /* Darker shade of green on hover */
        }
        .nav-link {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
            font-weight: bold;
        }

        .nav-link:hover {
            color: #d3d3d3; /* Lighter shade of gray on hover */
        }
    </style>
    <header class="py-5 mb-4" style="background-image: url('https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); background-size: cover; background-position: center;">
        <div class="container d-flex justify-content-between align-items-center">
            <nav class="d-flex align-items-center">
                <a href="Default.aspx" class="nav-link px-3">Home</a>
                <a href="About.aspx" class="nav-link px-3">About</a>
                <a href="Contact.aspx" class="nav-link px-3">Contact</a>
            </nav>
            <div class="d-flex align-items-center">
                <%-- Display welcome message if user is authenticated --%>
                <asp:Label ID="WelcomeMessage" runat="server" CssClass="text-white" Visible="false"></asp:Label>
    
                <% if (!User.Identity.IsAuthenticated) { %>
                    <a href="Account/Login.aspx" class="btn btn-sm btn-outline-light me-2">Login</a>
                    <a href="Account/Register.aspx" class="btn btn-sm btn-green">Register</a>
                <% } %>
            </div>
        </div>
    </header>

    <div class="container">
        <h2 class="mb-4">Data History (Report) Page</h2>

        <!-- Transport Emissions Section -->
        <div class="mb-5">
            <h3>Transport Emissions</h3>
            <table id="transportTable" class="table table-striped table-hover">
                <!-- Table header -->
                <thead class="table-light">
                    <tr>
                        <th>Vehicle Type</th>
                        <th>Distance</th>
                        <th>Fuel Type</th>
                        <th>Fuel Efficiency (Gallons/Km/Mile)</th>
                        <th>Entry Date</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <!-- Table rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>

        <!-- Electricity Consumption Section -->
        <div>
            <h3>Electricity Consumption</h3>
            <table id="electricityTable" class="table table-striped table-hover">
                <!-- Table header -->
                <thead class="table-light">
                    <tr>
                        <th>Energy Source</th>
                        <th>Electricity Usage (Kilowatt-Hours)</th>
                        <th>Entry Date</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <!-- Table rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>
    </div>
    <script>
        // Function to populate data history
        function populateDataHistory() {
            // Get JSON data from local storage
            var dataHistory = JSON.parse(localStorage.getItem('dataHistory'));

            // Access data history tables
            var transportTable = document.getElementById("transportTable").getElementsByTagName('tbody')[0];
            var electricityTable = document.getElementById("electricityTable").getElementsByTagName('tbody')[0];

            // Populate transport emissions table
            dataHistory.transport.forEach(function(data) {
                var row = transportTable.insertRow();
                row.innerHTML = "<td>" + data.vehicleType + "</td><td>" + data.distanceTravelled + "</td><td>" + data.fuelType + "</td><td>" + data.fuelEfficiency + "</td><td>" + data.entryDate + "</td>";
            });

            // Populate electricity consumption table
            dataHistory.electricity.forEach(function(data) {
                var row = electricityTable.insertRow();
                row.innerHTML = "<td>" + data.energySource + "</td><td>" + data.electricityUsage + "</td><td>" + data.entryDate + "</td>";
            });
        }

        // Call populateDataHistory function when the page loads
        window.onload = function() {
            populateDataHistory();
        };
    </script>
</asp:Content>
