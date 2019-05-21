
const MAP_KEY = "pk.eyJ1IjoiZGlzY29tYXgiLCJhIjoiY2p0bGtwdjdvMGN0ZzRhcGVoaHBrdGRvNiJ9.1FRcT1k-Vdo3ZLHVSp28Fg";
var FILE = "hosp_geo.json";


d3.json(FILE, function(data) {
   // Once we get a response, send the data.features object to the createFeatures function
   console.log(data)
   createFeatures(data);
});
 
function createFeatures(hospData) {
 
   // Define a function we want to run once for each feature in the features array
   // Give each feature a popup describing the place and time of the earthquake
   function onEachFeature(feature, layer) {
      layer.bindPopup("<h3>" + feature.properties.NAME +
         "</h3><hr><p>" + feature.properties.ADDRESS + "<br>" + feature.properties.CITY + "," + 
            feature.properties.STATE + feature.properties.ZIP + 
               "<br><a href='" + feature.properties.WEBSITE + "'>Website</a></p>");
   }
 
   // Create a GeoJSON layer containing the features array on the earthquakeData object
   // Run the onEachFeature function once for each piece of data in the array
   var hospitals = L.geoJSON(hospData, {
     onEachFeature: onEachFeature
   });
 
   // Sending our earthquakes layer to the createMap function
   createMap(hospitals);
}

function createMap(hospitals) {

   // Define streetmap and darkmap layers
   var streetmap = L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
     attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
     maxZoom: 18,
     id: "mapbox.streets",
     accessToken: MAP_KEY
   });
 
   var darkmap = L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
     attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
     maxZoom: 18,
     id: "mapbox.dark",
     accessToken: MAP_KEY
   });
 
   // Define a baseMaps object to hold our base layers
   var baseMaps = {
     "Street Map": streetmap,
     "Dark Map": darkmap
   };
 
   // Create overlay object to hold our overlay layer
   var overlayMaps = {
     Hospitals: hospitals
   };
 
   // Create our map, giving it the streetmap and earthquakes layers to display on load
   var hospitalMap = L.map("map", {
     center: [
       39.8283, -98.5795
     ],
     zoom: 4,
     layers: [streetmap, hospitals]
   });
 
   // Create a layer control
   // Pass in our baseMaps and overlayMaps
   // Add the layer control to the map
   L.control.layers(baseMaps, overlayMaps, {
     collapsed: false
   }).addTo(hospitalMap);

   // insert map title at top of layer control
   $('<h3 id="mapTitle">Top 50 Cancer Hospitals</h3>').insertBefore('div.leaflet-control-layers-base'); 
}
   

