class HomeController < ApplicationController
  def index
    render json: { message: :nangadef }
  end
end
