class VisitsController < ApplicationController
  
  def new
    @visit = Visit.new
  end

  def create
    
    if @member = Member.find_by_coloft_id(params[:coloft_id])
      @member.visits.create :coloft_id => params[:coloft_id]
      flash[:notice] = "Colofter Checked In"
      redirect_back_or_default new_visit_url
    else
      flash[:notice] = "Colofter Not Found"
      redirect_back_or_default new_visit_url
    end
  end
  
  
end
