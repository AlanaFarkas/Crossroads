var map;
var activity;
var distance;
var duration;
var radius;
var midpoint;
var transitType;
var placesList = [];
var selectedInfoWindow;
var contentString;

// Appends every place listed on the map and its information on the list
function populateListView(placesList) {
  for(var i = 0; i < placesList.length; i++) {
    eachPlace = '<p class="list-item">' + placesList[i] + '</p>'
    $('#list-view').append(eachPlace);
  }
}

// Assigns an info window to every marker
function handleSearchResults(results, status){
  var hours;
  var grade;
  for(var i = 0; i < results.length; i++) {
// Gives the rating for the place if it has any
    results[i].rating ? grade = 'Rating: ' + results[i].rating +'/5' : grade = 'No Rating'
// States whether the place is open, closed, or no hours provided
    results[i].opening_hours == null ? hours = 'No hours provided' : results[i].opening_hours.open_now ? hours = 'Currently Open' : hours = 'Currently Closed'
// Places a new marker on the map for the place
    var marker = new google.maps.Marker({
      position: results[i].geometry.location,
      map: map,
    });
// Assigns information about the marker into a variable for future use
    contentString = '<div class="info-text"><a class="place-link" href="www.google.com">' + results[i].name + '<br/>'  + '</a>' + results[i].vicinity + '<br/>' + grade + '<br/>' + hours + '</div>'
// Pushes the content of the marker into the list feature and assigns an infowindow to it
    placesList.push(contentString)
    addInfoWindowListener(marker, contentString);
  }
// Uses the list feature to populate the list
  populateListView(placesList);
}

// Assigns each info window an individual listener
function addInfoWindowListener(marker, contentString) {
// Assigns an info window the content
  var infoWindow = new google.maps.InfoWindow({
    content: contentString
  });
// Closes the info window when another one is opened
  marker.addListener('click', function(){
    if(selectedInfoWindow != null && selectedInfoWindow.getMap != null) {
      selectedInfoWindow.close();
      if (selectedInfoWindow == infoWindow) {
        selectedInfoWindow = null
        return;
      }
    }
    selectedInfoWindow = infoWindow;
    selectedInfoWindow.open(map, marker);
  });
}

// Runs all this functions during on initialization
function initialize(location){
// Geolocates the user using the latitude and longitude of the ip address or cell signal
  var currentLocation = new google.maps.LatLng(location.coords.latitude, location.coords.longitude);
  var mapOptions = {
    center: currentLocation, //Sets the center of the screen as the postion of the user
    zoom: 15, // The higher the number the closer the zoom
    mapTypeId: google.maps.MapTypeId.ROADMAP //Map type
  };
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
// Directions And Route Creation
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var input = (document.getElementById("address1")); //Links the first text area to the input variable
  var input2 = (document.getElementById("address2")); //Links the second text area to the input variable
  var autoComplete1 = new google.maps.places.Autocomplete(input); //Add the autocomplete functionality to the text areas
  var autoComplete2 = new google.maps.places.Autocomplete(input2);
  directionsDisplay.setMap(map) //Renders the route on the map if there is two points

  function calculateAndDisplayRoute(directionsService, directionsDisplay){ //Calculates the distance on an actual route on the map and finds the midpoint
    var selectedMode = document.getElementById('mode').value;
    directionsService.route({
      origin: input.value, //Address 1 point
      destination: input2.value, // Address 2 Point
      travelMode: google.maps.TravelMode[selectedMode]
    }, function(response, status){
      if (status === google.maps.DirectionsStatus.OK) { //If there is an actual route
        var bounds = new google.maps.LatLngBounds();
        directionsDisplay.setDirections(response); // Render the directions and route
        var route = response.routes[0];
        radius = parseInt(document.getElementById("radius").value)
        var path = response.routes[0].overview_path;
        var middleOfArray = Math.floor(path.length/2);
        var lat = path[middleOfArray].lat();
        var lng = path[middleOfArray].lng();
        midpoint = {lat: lat, lng: lng};

        var image = {url: "/imgs/midpoint-marker.png",
                     scaledSize: new google.maps.Size(38, 60)
                    }
//Drops custom marker on the midpoint
        var midpointMarker = new google.maps.Marker({
          position: midpoint,
          map: map,
          icon: image
        });
//Creates a circle on the map for a visual radius limit
        var radialBounds = new google.maps.Circle({
          strokeColor: '#12a643',
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: '#66ff99',
          fillOpacity: 0.35,
          map: map,
          center: midpoint,
          radius: radius
        });
// Searches for the specific name within the specified radius
      function performSearch(){
        var request = {
          radius: radius / 1.5,
          location: midpoint,
          name: (document.getElementById("activity").value)
        }
        activity.nearbySearch(request, handleSearchResults);
        $('input').val(''); //Resets the address fields after submission to the map
      }
//Searches for the specified activity through Google Places within the radius
      activity = new google.maps.places.PlacesService(map);
      google.maps.event.addListenerOnce(map, 'center_changed', performSearch)
      }
    });
  }
  var onChangeHandler = function() { //Handles the changes of the address1 and address2 fields
    calculateAndDisplayRoute(directionsService, directionsDisplay);
      };
  document.getElementById('address_submit').addEventListener('click', onChangeHandler); //Sets button to be able to fire the function
}

$(document).ready(function(){
// Locates current position upon load
  navigator.geolocation.getCurrentPosition(initialize);
  $('.address-menu').hide();
  $('#list-view').hide();
//Brings up the list of all places within the radius
  $('.list').on('click', function(){
    $('#go').hide();
    $('#list-view').slideToggle(500);
    $('#map').slideToggle(500);
  })
//Upon click of the search button, close the address menu
  $('.search').on('click', function(event){
      $('.address-menu').slideToggle(500);
  })
//Upon submission of the parameters, close the address menu
  $('#address_submit').on('click', function(event){
    $('.address-menu').slideToggle(500);
  });
//Any button which is clicked turns blue
  $('.button').on('click', function(event){
    $(this).css('background-color', '#12a643')
  });
});


////////==========Possible future implementations==========////////

//calc distance within route
    // var service = new google.maps.DistanceMatrixService();
    // service.getDistanceMatrix(
    //   {
    //    origins: [document.getElementById("address1").value],
    //     destinations: [document.getElementById("address2").value],
    //     travelMode: google.maps.TravelMode.DRIVING
    //   }, callback); //Calculates the distance on a drivable route

    // function callback(response, status) { //Parses the data recieved
    //   if (status == google.maps.DistanceMatrixStatus.OK) {
    //     var origins = response.originAddresses;
    //     var destinations = response.destinationAddresses;

    //     for (var i = 0; i < origins.length; i++) {
    //       var results = response.rows[i].elements;
    //       for (var j = 0; j < results.length; j++) {
    //         var element = results[j];
    //         distance = element.distance.text; //distance between address1 and address2
    //         duration = element.duration.text; //duration of time between address1 and address2
    //         var from = origins[i]; //In case of multiple points on the map
    //         var to = destinations[j]; //In case of multiple points on the map
    //       }
    //     }
    //   }
    // }