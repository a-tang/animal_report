jQuery ->
  markersArray = []
  lat_field = $('#place_latitude')
  lng_field = $('#place_longitude')

  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: 49.2756451, lng: -123.1304437 }
        zoom: 12
      }

      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng
        $('#sighting_latitude').attr("value",e.latLng.lat())
        $('#sighting_longitude').attr("value",e.latLng.lng())


      $('#find-on-map').click (e) ->
        e.preventDefault()
        placeMarkerAndPanTo {
          lat: parseInt lat_field.val(), 10
          lng: parseInt lng_field.val(), 10
        }, map

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map

    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()
