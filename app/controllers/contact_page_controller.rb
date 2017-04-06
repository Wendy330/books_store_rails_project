class ContactPageController < ApplicationController
  def index
    @contacts = ContactPage.all
  end
end
