class PagesController < ApplicationController
  def contact
  end

  def privacy
  end

  def about
  end

  def help
  end

  def tos
  end

  def index
    unless current_user.nil?
      redirect_to '/timeline/index'
      return
    end
  end
end
