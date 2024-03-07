using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataHistory : Page
{
    protected Table transportTable;
    protected Table electricityTable;
    protected dynamic dataHistory; // Declare dataHistory at the class level

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Read data from JSON file
            string dataFilePath = Server.MapPath("~/App_Data/dataHistory.json");
            string jsonData = File.ReadAllText(dataFilePath);

            // Deserialize JSON data
            dataHistory = JsonConvert.DeserializeObject<List<dynamic>>(jsonData);

            // Set the value of the hidden field
            dataHistoryHiddenField.Value = JsonConvert.SerializeObject(dataHistory);

            // Populate data history
            PopulateDataHistory();

            // Redirect to login if user is not authenticated
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                // Get the username of the logged-in user
                string username = User.Identity.GetUserName();

                // Update the header to display the logged-in user's information
                WelcomeMessage.Text = "Welcome, " + username + "!";
                WelcomeMessage.Visible = true;
            }
        }
    }

    private void PopulateDataHistory()
    {
        if (dataHistory != null)
        {
            foreach (var entry in dataHistory)
            {
                dynamic transportEntry = entry.transport;
                dynamic electricityEntry = entry.electricity;

                if (transportEntry != null)
                {
                    TableRow transportRow = new TableRow();
                    transportRow.Cells.Add(new TableCell() { Text = transportEntry.vehicleType ?? string.Empty });
                    transportRow.Cells.Add(new TableCell() { Text = transportEntry.distanceTravelled ?? string.Empty });
                    transportRow.Cells.Add(new TableCell() { Text = transportEntry.fuelType ?? string.Empty });
                    transportRow.Cells.Add(new TableCell() { Text = transportEntry.fuelEfficiency ?? string.Empty });
                    transportRow.Cells.Add(new TableCell() { Text = transportEntry.entryDate ?? string.Empty });
                    if (transportTable != null)
                    {
                        transportTable.Rows.Add(transportRow);
                    }
                }

                if (electricityEntry != null)
                {
                    TableRow electricityRow = new TableRow();
                    electricityRow.Cells.Add(new TableCell() { Text = electricityEntry.energySource ?? string.Empty });
                    electricityRow.Cells.Add(new TableCell() { Text = electricityEntry.electricityUsage ?? string.Empty });
                    electricityRow.Cells.Add(new TableCell() { Text = electricityEntry.entryDate ?? string.Empty });
                    if (electricityTable != null)
                    {
                        electricityTable.Rows.Add(electricityRow);
                    }
                }
            }
        }
    }
}
