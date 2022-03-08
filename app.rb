require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# Base index
get "/" do
  erb :index
end

# Other page
get "/about" do
  erb :about
end

get "/whoareyou" do
  @test_array = ["hello", "world"]
  erb :whoareyou
end

# Use params
get "/team/:username" do
  # puts params[:username] // Console
  "Welcome #{params[:fname]} #{params[:lname]}"
end
