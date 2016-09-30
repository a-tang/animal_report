module SightingsHelper
  def sightings_json(sightings)
    Gmaps4rails.build_markers(sightings) do |sightings, marker|
      marker.lat sighting.latitude
      marker.lng sighting.longitude
      marker.infowindow sighting.name
    end
  end
end
