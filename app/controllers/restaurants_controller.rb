class RestaurantsController < ApplicationController
  include Yelp::V1::Review::Request


  def index

  end

  def show
  end

  def new
     @restaurant_search = Restaurant.new
  end

  def create
    client = Yelp::Client.new
    request = Location.new(
             :address => params["restaurant"][:address],
             :city => params["restaurant"][:city],
             :state => params["restaurant"][:state],
             :radius =>params["restaurant"][:radius],
             :term => params["restaurant"][:term])
    @restaurants = client.search(request)
  render :index
  end
end
