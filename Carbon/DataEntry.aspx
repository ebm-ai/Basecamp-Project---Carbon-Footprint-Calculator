<%@ Page Title="DataEntry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataEntry.aspx.cs" Inherits="DataEntry" %>

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

    <main class="container">
        <section class="row">
            <div class="col-md-6">
                <h3>Transport Emissions</h3>
                <form id="transportForm">
                    <div class="mb-3">
                        <label for="vehicleType" class="form-label">Vehicle Type</label>
                        <select id="vehicleType" class="form-select">
                            <option value="car">Car</option>
                            <option value="truck">Truck</option>
                            <option value="bus">Bus</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="distanceTravelled" class="form-label">Distance Travelled (km)</label>
                        <input type="number" class="form-control" id="distanceTravelled" placeholder="Enter distance in km">
                    </div>
                    <div class="mb-3">
                        <label for="fuelType" class="form-label">Fuel Type</label>
                        <select id="fuelType" class="form-select">
                            <option value="gasoline">Gasoline</option>
                            <option value="diesel">Diesel</option>
                            <option value="petrol">Petrol</option>
                            <option value="electric">Electric</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="fuelEfficiency" class="form-label">Fuel Efficiency (gallons per trip)</label>
                        <input type="number" class="form-control" id="fuelEfficiency" placeholder="Enter gallons per trip">
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <h3>Electricity Consumption</h3>
                <form id="electricityForm">
                    <div class="mb-3">
                        <label for="energySource" class="form-label">Energy Source</label>
                        <select id="energySource" class="form-select">
                            <option value="grid">Grid</option>
                            <option value="solar">Solar</option>
                            <option value="wind">Wind</option>
                            <option value="others">Others</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="electricityUsage" class="form-label">Electricity Usage (Kilowatt-Hours)</label>
                        <input type="number" id="electricityUsage" class="form-control" placeholder="Enter electricity usage in kWh">
                    </div>
                </form>
            </div>
        </section>
        <button type="button" class="btn btn-green" onclick="submitForms()">Submit</button>
    </main>
    <script>
        // Function to calculate carbon footprint
        function calculateCarbonFootprint(formData) {
            // Constants for carbon emissions (in kg CO2 per unit)
            const emissionsPerKm = {
                car: 0.12,  // Example values, you should replace these with actual data
                truck: 0.2,
                bus: 0.1
            };

            const emissionsPerKwh = {
                grid: 0.5,
                solar: 0.2,
                wind: 0.1,
                others: 0.3
            };

            // Calculate transport emissions
            const transportEmissions = formData.transport.distanceTravelled * emissionsPerKm[formData.transport.vehicleType];

            // Calculate electricity emissions
            const electricityEmissions = formData.electricity.electricityUsage * emissionsPerKwh[formData.electricity.energySource];

            // Total carbon footprint
            const totalCarbonFootprint = transportEmissions + electricityEmissions;

            return totalCarbonFootprint;
        }

        // Function to submit both forms
        function submitForms() {
            var transportVehicleType = document.getElementById("vehicleType").value;
            var transportDistance = document.getElementById("distanceTravelled").value;
            var transportFuelType = document.getElementById("fuelType").value;
            var transportFuelEfficiency = document.getElementById("fuelEfficiency").value;

            var electricitySource = document.getElementById("energySource").value;
            var electricityUsage = document.getElementById("electricityUsage").value;

            var formData = {
                transport: {
                    vehicleType: transportVehicleType,
                    distanceTravelled: transportDistance,
                    fuelType: transportFuelType,
                    fuelEfficiency: transportFuelEfficiency
                },
                electricity: {
                    energySource: electricitySource,
                    electricityUsage: electricityUsage
                }
            };

            // Calculate carbon footprint
            var carbonFootprint = calculateCarbonFootprint(formData);

            // Display carbon footprint (you can modify this part to display it wherever you want)
            alert("Your carbon footprint is: " + carbonFootprint + " kg CO2");

            // Get existing JSON data from local storage or initialize empty object
            var dataHistory = JSON.parse(localStorage.getItem('dataHistory')) || { transport: [], electricity: [] };

            // Add submitted data to JSON
            dataHistory.transport.push(formData.transport);
            dataHistory.electricity.push(formData.electricity);

            // Store updated JSON back to local storage
            localStorage.setItem('dataHistory', JSON.stringify(dataHistory));

            // Redirect to DataHistory.aspx
            window.location.href = 'DataHistory.aspx';
        }
    </script>
</asp:Content>
