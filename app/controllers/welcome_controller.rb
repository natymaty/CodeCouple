class WelcomeController < ApplicationController
  def index
	  @entries = Entry.order(date: :desc)
  end
  
  def index2
  end
end
