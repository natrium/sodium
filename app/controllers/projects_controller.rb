class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    if params[:slug]
      @project = Project.find_by_slug(params[:slug])
    else
      @project = Project.find(params[:id])
    end

    @bubble = Bubble.new
    @bubble.project = @project

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    membership = Membership.new
    membership.project = @project
    membership.role = Role.find_by_name('Manager')
    membership.user = current_user

    trans_successful = true

    Project.transaction do
        membership.save!
        @project.save!
    end

    begin

    rescue
      flash[:notice] = "There was an error creating your project."
      trans_successful = false
    end


    respond_to do |format|
      if trans_successful
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml { head :ok }
    end
  end

  def follow
    project = Project.find params[:id]
    role = Role.find_by_name 'User'
    user = current_user
    membership = Membership.new :project => project, :role => role, :user => user

    if membership.save
      flash[:notice] = t("projects.follow_success") + project.name
    else
      flash[:notice] = t("projects.follow_error") + project.name
    end
    redirect_to :back
  end

  def unfollow
    project = Project.find params[:id]
    user = current_user

    if user.follows_project? project
      user.followed_projects.delete project
      flash[:notice] = t("projects.unfollow_success") + project.name
    else
      flash[:notice] = t("projects.unfollow_error") + project.name
    end
    redirect_to :back
  end

  def edit_member
    project = Project.find params[:project_id]

    if authorized? 'membership.edit', project
      @membership = Membership.find_by_user_id_and_project_id params[:user_id], params[:project_id]
      @membership.role_id = params[:membership][:role_id]
      @membership.save
    else
      flash[:notice] = "You are not allowed to edit memberships!"
    end

    redirect_to :back
  end
end
