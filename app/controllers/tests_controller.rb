class TestsController < ApplicationController
  def new
    @city = City.new
    @continents = Continent.all
  end

  def create
    @city = City.new(test_params)
    @continents = Continent.all
    @city.valid?
    render :new
  end

  private

    def test_params
      params.require(:test).permit(:text_field, :text_area, :password_field)
    end
end
