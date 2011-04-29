class UsersController < ApplicationController
  before_filter :authenticate_user!

  def change_avatar
    @user = current_user
  end

  def update_avatar
    @user = current_user
    @params = params
    debugger

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(:action => 'change_avatar', :notice => 'Avatar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => 'change_avatar' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
