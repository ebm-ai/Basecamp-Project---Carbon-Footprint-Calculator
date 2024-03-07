using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

public partial class DataEntry : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        if (User.Identity.IsAuthenticated)
        {
            // Get the username of the logged-in user
            string username = User.Identity.GetUserName();

            // Update the header to display the logged-in user's information
            WelcomeMessage.Text = "Welcome, " + username + "!";
            WelcomeMessage.Visible = true;
        }
        else
        {
            // Hide the welcome message if the user is not logged in
            WelcomeMessage.Visible = false;
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Get form data
        string vehicleType = vehicleTypeDropDown.SelectedValue;
        double distanceTravelled = double.Parse(distanceTravelledTextBox.Text);
        string fuelType = fuelTypeDropDown.SelectedValue;
        double fuelEfficiency = double.Parse(fuelEfficiencyTextBox.Text);
        string energySource = energySourceDropDown.SelectedValue;
        double electricityUsage = 100000; // Placeholder value for electricity usage

        // Parse electricity usage if provided
        if (!string.IsNullOrEmpty(electricityUsageTextBox.Text))
        {
            double.TryParse(electricityUsageTextBox.Text, out electricityUsage);
        }

        // Calculate carbon emissions
        double carbonEmissions = 0.0;
        if (energySource == "grid")
        {
            carbonEmissions = CalculateElectricityEmissions(electricityUsage);
        }
        else if (energySource == "oil")
        {
            carbonEmissions = CalculateOilEmissions(fuelType, distanceTravelled);
        }

        // Store data in JSON format
        StoreFormDataInJson(vehicleType, distanceTravelled, fuelType, fuelEfficiency, energySource, electricityUsage, carbonEmissions);

        // Redirect to DataHistory.aspx
        Response.Redirect("DataHistory.aspx");
    }

    private void StoreFormDataInJson(string vehicleType, double distanceTravelled, string fuelType, double fuelEfficiency, string energySource, double electricityUsage, double carbonEmissions)
    {
        // Check if the data file exists
        string dataFilePath = Server.MapPath("~/App_Data/dataHistory.json");
        List<object> formDataList;

        // Read existing data from file or initialize formDataList to an empty list
        if (File.Exists(dataFilePath))
        {
            // Read existing data from file
            string existingData = File.ReadAllText(dataFilePath);
            formDataList = JsonConvert.DeserializeObject<List<object>>(existingData);
        }
        else
        {
            formDataList = new List<object>();
        }

        // Create new data object
        var formData = new
        {
            entryDate = DateTime.Now,
            transport = new
            {
                vehicleType,
                distanceTravelled,
                fuelType,
                fuelEfficiency
            },
            electricity = new
            {
                energySource,
                electricityUsage
            },
            carbonEmissions
        };

        // Add new data to the list
        if (formDataList == null) // Ensure formDataList is not null before adding data
        {
            formDataList = new List<object>();
        }
        formDataList.Add(formData);

        // Convert the list to JSON
        string formDataJson = JsonConvert.SerializeObject(formDataList);

        // Write JSON to file
        File.WriteAllText(dataFilePath, formDataJson);
    }
    private double CalculateElectricityEmissions(double electricityUsage)
    {
        // Emissions factor for the electricity grid (kg CO2e/kWh)
        double emissionsFactor = 0.5;

        // Calculate electricity emissions
        return electricityUsage * emissionsFactor;
    }

    private double CalculateOilEmissions(string fuelType, double distanceTravelled)
    {
        // Placeholder logic to get emissions factor for different fuel types (kg CO2 per liter)
        double emissionsFactor = 0.0;

        if (fuelType == "gasoline")
        {
            // Assuming emissions factor for gasoline is approximately 2.4 kg CO2 per liter
            emissionsFactor = 2.4;
        }
        else if (fuelType == "diesel")
        {
            // Assuming emissions factor for diesel is approximately 2.65 kg CO2 per liter
            emissionsFactor = 2.65;
        }
        // Calculate emissions
        return emissionsFactor * distanceTravelled; // Assuming distance is in km
    }
}
