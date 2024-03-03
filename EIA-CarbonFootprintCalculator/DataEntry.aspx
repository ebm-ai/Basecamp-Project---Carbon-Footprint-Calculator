<%@ Page Title="DataEntry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataEntry.aspx.cs" Inherits="DataEntry" %>

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

    <main class="container">
        <section class="row">
            <div class="col-md-6">
                <h3>Transport Emissions</h3>
                <form>
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
                    <button type="submit" class="btn btn-primary">Submit</button>
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
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </section>
    </main>
</asp:Content>
