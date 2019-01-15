module MapboxApi
  class Wrapper
    include HTTParty
    # Request gecode info for a city
    #
    # GET /geocoding/v5/{endpoint}/{search_text}.json
    #
    # curl "https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=your-access-token"
    #
    # from rails console:
    #   > JSON.parse(MapboxApi::Wrapper.find_city)

    def self.find_city
      # term = URI.encode(term)
      token = Rails.application.credentials.mapbox[:public_token]

      base_uri 'https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json' \
               "?access_token=#{token}"

      get('')
    end

    def self.directions_for

      # Request directions with no additional options
      #
      #   curl "https://api.mapbox.com/directions/v5/mapbox/cycling/START_LON,START_LAT,END_LON,END_LAT
      #         ?access_token=your-access-token"
      #
      #   curl "https://api.mapbox.com/directions/v5/mapbox/cycling/-122.42,37.78;-77.03,38.91
      #         ?access_token=your-access-token"

      token = Rails.application.credentials.mapbox[:public_token]
      base_uri 'https://api.mapbox.com/directions/v5/mapbox/driving/-122.42,37.78;-77.03,38.91' \
               "?access_token=#{token}"

      get('')
    end

    def self.latlon_to_xy(lat_deg, lon_deg, zoom)
      # radians = degrees * Math::PI / 180
      # degrees = radians * 180 / Math.PI
      lat_rad = (lat_deg * Math::PI) / 180
      n = 2.0 ** zoom
      xtile = ((lon_deg + 180.0) / 360.0 * n).to_i
      ytile = ((1.0 - Math.log(Math.tan(lat_rad) + (1 / Math.cos(lat_rad))) / Math::PI) / 2.0 * n).to_i
      [xtile, ytile]
    end
    # To get map image as png:
    #
    # curl "https://api.mapbox.com/v4/mapbox.mapbox-streets-v7/2/2/3.png32?access_token=pk.eyJ1IjoiY2FwdGFpbm1hcmtvcyIsImEiOiJjanBzamdvNDAwY2lrNDhzZHhjYXFwdGtzIn0.FVZ_hvyuRvkDvTT07Pi5iw" > test.png

=begin

curl "https://api.mapbox.com/v4/mapbox.mapbox-terrain-v2/1/0/0@2x.png?access_token=pk.eyJ1IjoiY2FwdGFpbm1hcmtvcyIsImEiOiJjanBzamdvNDAwY2lrNDhzZHhjYXFwdGtzIn0.FVZ_hvyuRvkDvTT07Pi5iw"

curl "https://api.mapbox.com/v4/mapbox.mapbox-streets-v7/3/1/3.png?style=mapbox://styles/mapbox/streets-v10&access_token=pk.eyJ1IjoiY2FwdGFpbm1hcmtvcyIsImEiOiJjanBzamdvNDAwY2lrNDhzZHhjYXFwdGtzIn0.FVZ_hvyuRvkDvTT07Pi5iw"

# 15 is the zoom in the below url:
https://api.mapbox.com/styles/v1/mapbox/streets-v10/static/-104.674598,34.9409072,15,0.00,0.00/1000x600@2x?access_token=pk.eyJ1IjoiY2FwdGFpbm1hcmtvcyIsImEiOiJjanBzamdvNDAwY2lrNDhzZHhjYXFwdGtzIn0.FVZ_hvyuRvkDvTT07Pi5iw

GET /v4/{map_id}/{zoom}/{x}/{y}{@2x}.{format}

Latitude & Longitude to x & y
n = 2 ^ zoom
xtile = n * ((lon_deg + 180) / 360)
ytile = n * (1 - (log(tan(lat_rad) + sec(lat_rad)) / π)) / 2


=end
  end
end
