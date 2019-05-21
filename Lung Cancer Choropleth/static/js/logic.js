// Creating map object
var cancerMap = L.map("map", {
  center: [44.58, -103.46],
  zoom: 4
});

const accessToken = "pk.eyJ1IjoiZGlzY29tYXgiLCJhIjoiY2p0bGtwdjdvMGN0ZzRhcGVoaHBrdGRvNiJ9.1FRcT1k-Vdo3ZLHVSp28Fg"

// Create variables for the base map layers.
L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 18,
  id: "mapbox.streets",
  accessToken: MAP_KEY
}).addTo(cancerMap);

// Link to GeoJSON
var dataFile = "Data/convert.json";

var geojson;

// Grab data with d3
d3.json(dataFile, function(data) {
  console.log(data);
  // Create a new choropleth layer
  geojson = L.choropleth(data, {

    // Define what  property in the features to use
    valueProperty: "MeasuresBirthAndDeathCSV_Lung_Cancer",

    // Set color scale
    scale: ['#f3e79b','#fac484','#f8a07e','#eb7f86','#ce6693','#a059a0','#5c53a5'],

    // Number of breaks in step range
    steps: 12,

    // q for quartile, e for equidistant, k for k-means
    mode: "q",
    style: {
      // Border color
      color: "#fff",
      weight: 1,
      fillOpacity: 0.8
    },

    // Binding a pop-up to each layer
    onEachFeature: function(feature, layer) {
      layer.bindPopup(feature.properties.County_NAME + " County, " + feature.properties.County_STATE_NAME + 
        "<br>Lung Cancer Deaths:<br>" + feature.properties.MeasuresBirthAndDeathCSV_Lung_Cancer);
    }
  }).addTo(cancerMap);

  // Set up the legend
  var legend = L.control({ position: "bottomright" });
  legend.onAdd = function() {
    var div = L.DomUtil.create("div", "info legend");
    var limits = geojson.options.limits;
    var colors = geojson.options.colors;
    var labels = [];
    console.log(colors);
    // Add min & max
    var legendInfo = "<h1>Lung Cancer Deaths</h1>" +
      "<div class=\"labels\">" +
        "<div class=\"min\">0</div>" +
        "<div class=\"max\">" + limits[limits.length - 1] + "</div>" +
      "</div>";

    div.innerHTML = legendInfo;

    limits.forEach(function(limit, index) {
      labels.push("<li style=\"background-color: " + colors[index] + "\"></li>");
    });

    div.innerHTML += "<ul>" + labels.join("") + "</ul>";
    return div;
  };

  // Adding legend to the map
  legend.addTo(cancerMap);

});
