class TestsController < ApplicationController
  def new
    @country = Country.all
    @continent = Continent.new
  end

  def create
    @country = Country.all
    @continent = Continent.new(test_params)
    @continent.valid?
    render :new
  end

  private

    def test_params
      params.require(:test).permit(:text_field, :text_area, :password_field)
    end
end
