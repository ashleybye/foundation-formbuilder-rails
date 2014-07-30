class TestsController < ApplicationController
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.valid?
    render :new
  end

  private

    def test_params
      params.require(:test).permit(:text_field, :text_area, :password_field)
    end
end
