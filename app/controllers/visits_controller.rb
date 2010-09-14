class VisitsController < ApplicationController
  
  before_filter :require_user
  
  def new
    @visit = Visit.new
  end

  def create
    
    if @member = Member.find_by_coloft_id(params[:coloft_id])
      @member.visits.create :coloft_id => params[:coloft_id]
      flash[:notice] = "#{@member.first_name} Checked In"
      redirect_back_or_default new_visit_url
    else
      flash[:notice] = "Colofter Not Found"
      redirect_back_or_default new_visit_url
    end
  end
  
  
end
