class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  # ZOOM contant
  ZOOM_API_KEY = "hK6x9GGqQoqb07k0CJY3gw"
  ZOOM_API_SECRET = "qv6NnyFfACjpziVCuXP61ETZX5OfSxeGxl1B"
  ZOOM_USER_ID = "zZIC4Ln0TZ2lRdIpwp8szA"
  JWT = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6ImhLNng5R0dxUW9xYjA3azBDSlkzZ3ciLCJleHAiOjE2MDEwMjU2MTAsImlhdCI6MTYwMDQyMDgxM30.j8RrdYOdJpbkR-8GNvikOFWsSYqF2S3zF3eyFWCXPD0"
  MEETING_URL = "https://api.zoom.us/v2/users/#{ZOOM_USER_ID}/meetings"
end
