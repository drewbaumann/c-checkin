class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  before_filter :require_user#, :only => :not_allowed
  before_filter :require_admin, :only => [:index, :show, :new, :create, :edit, :create, :update, :destroy]
  
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @members }
    end
  end
  
  def visual
    @members = Member.all.sort! {|a,b| a.visits.today.recent[0].short_local_time<=> b.visits.today.recent[0].short_local_time}
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        add_plan_to_user_if_specified!
        
        format.html { redirect_to(@member, :notice => 'Member was successfully created.') }
        format.json  { render :json => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        
        add_plan_to_user_if_specified!
        format.html { redirect_to(@member, :notice => 'Member was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.json  { head :ok }
    end
  end
  


private

    def add_plan_to_user_if_specified!
      if params[:plan_id].present?
        @member.plans.delete_all
        @member.plans << Plan.find(params[:plan_id])
      end
    end
end
