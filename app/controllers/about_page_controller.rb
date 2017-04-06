class AboutPageController < ApplicationController
  def index
    @about = AboutPage.first
  end
end
