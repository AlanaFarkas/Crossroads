
  var map;
  var activity;
  var distance;
  var duration;
  var radius;
  var midpoint;
  var transitType;
  var placesList = [];

  function populateListView(placesList) {
    var list = document.getElementById("list-view"); 
    for(var i = 0; i < placesList.length; i++) {
      eachPlace = '<p class="list-item">' + placesList[i] + '</p>' 
      $('#list-view').append(eachPlace);      
    }
  }
// Assigns an info window to every marker==========================================
  function handleSearchResults(results, status){
    for(var i = 0; i < results.length; i++) {
      var marker = new google.maps.Marker({
        position: results[i].geometry.location,
        map: map,
      });
      contentString = '<p><a href="#">' + results[i].name + '</a></p>' +
                      '<p>' + results[i].vicinity+ '</p>' +
                      '<p>' + results[i].rating + '</p>'
      placesList.push(contentString)
      addInfoWindowListener(marker, contentString);
    }
    populateListView(placesList);
  }

  function addInfoWindowListener(marker, contentString) {
    var infoWindow = new google.maps.InfoWindow({
      content: contentString
    });
    marker.addListener('click', function(){
      infoWindow.open(map, marker);
    });
  }
//Runs all this functions during on initialization=================================
  function initialize(location){
    var currentLocation = new google.maps.LatLng(location.coords.latitude, location.coords.longitude); //Geolocates the user using the latitude and longitude of the ip address or cell signal
    var mapOptions = {
      center: currentLocation, //Sets the center of the screen as the postion of the user
      zoom: 15, // The higher the number the closer the zoom
      mapTypeId: google.maps.MapTypeId.ROADMAP //Map type
    };
    map = new google.maps.Map(document.getElementById("map"), mapOptions);

//this is the current postion based off your ip address/gps location
    // var marker = new google.maps.Marker({
    //   position: currentLocation, //Drops a pin on where the user currently is
    //   map: map
    // });



//Directions And Route Creation====================================================
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var input = (document.getElementById("address1")); //Links the first text area to the input variable
    var input2 = (document.getElementById("address2")); //Links the second text area to the input variable

    var autoComplete1 = new google.maps.places.Autocomplete(input); //Add the autocomplete functionality to the text areas

    var autoComplete2 = new google.maps.places.Autocomplete(input2);

    directionsDisplay.setMap(map) //Renders the route on the map if there is two points

    function calculateAndDisplayRoute(directionsService, directionsDisplay){ //Calculates the distance on an actual route on the map
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
          var middleOfArray = path.length/2;
          var lat = path[middleOfArray].lat();
          var lng = path[middleOfArray].lng();
          midpoint = {lat: lat, lng: lng};

          var midpointMarker = new google.maps.Marker({
            position: midpoint,
            map: map,
          });

          var radialBounds = new google.maps.Circle({
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#66ff99',
            fillOpacity: 0.30,
            map: map,
            center: midpoint,
            radius: radius
          });
          // Searches for the specific name within the bounds of the screen==================

  function performSearch(){
    var request = {
      radius: radius / 2,
      location: midpoint,
      name: (document.getElementById("activity").value)
    }
    activity.nearbySearch(request, handleSearchResults);
  }
        //***this is for the search of activity. Uncomment to have search markers show on map***
    activity = new google.maps.places.PlacesService(map);
    google.maps.event.addListenerOnce(map, 'center_changed', performSearch)
        }
  });

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
  }

    var onChangeHandler = function() { //Handles the changes of the address1 and address2 fields
      calculateAndDisplayRoute(directionsService, directionsDisplay);
        };

    document.getElementById('address_submit').addEventListener('click', onChangeHandler); //Sets button to be able to fire the function
  }

// Locates current location on load================================================
  $(document).ready(function(){
    navigator.geolocation.getCurrentPosition(initialize); //Gets Current Position on the loading of the map
    $('#list-view').hide();
    $('.list').on('click', function(){
      $('#list-view').slideToggle(500);
    })

    $('.address-menu').hide();
    $('.search').on('click', function(event){
        $('.address-menu').slideToggle(500);
        $(this).css('background-color', '#12a643')
      })
    $('#address_submit').on('click', function(event){
      $('.address-menu').slideToggle(500);
      $(this).css('background-color', '#12a643')
    });

  });