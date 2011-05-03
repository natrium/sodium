class BubblesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /bubbles
  # GET /bubbles.xml
  def index
    @bubbles = Bubble.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bubbles }
    end
  end

  # GET /bubbles/1
  # GET /bubbles/1.xml
  def show
    @bubble = Bubble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bubble }
    end
  end

  # GET /bubbles/new
  # GET /bubbles/new.xml
  def new
    @bubble = Bubble.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bubble }
    end
  end

  # GET /bubbles/1/edit
  def edit
    @bubble = Bubble.find(params[:id])
  end

  # POST /bubbles
  # POST /bubbles.xml
  def create
    @bubble = Bubble.new(params[:bubble])
    @bubble.user = current_user

    unless (@bubble.project.nil?)
      unless authorized? 'bubbles.create', @bubble.project
        redirect_to :back, :notice => 'You have no right to do this!'
        return
      end
    end

    respond_to do |format|
      if @bubble.save
        format.html { redirect_to :back }
        format.xml  { render :xml => @bubble, :status => :created, :location => @bubble }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bubble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bubbles/1
  # PUT /bubbles/1.xml
  def update
    @bubble = Bubble.find(params[:id])

    respond_to do |format|
      if @bubble.update_attributes(params[:bubble])
        format.html { redirect_to(@bubble, :notice => 'Bubble was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bubble.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bubbles/1
  # DELETE /bubbles/1.xml
  def destroy
    @bubble = Bubble.find(params[:id])
    @bubble.destroy

    respond_to do |format|
      format.html { redirect_to(bubbles_url) }
      format.xml  { head :ok }
    end
  end
end
