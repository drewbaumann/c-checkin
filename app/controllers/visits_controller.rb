class VisitsController < ApplicationController
  
  def index
    @visits = Visit.all
  end
  
end
