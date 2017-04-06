class ContactPageController < ApplicationController
  def index
    @contact = ContactPage.first
  end
end
