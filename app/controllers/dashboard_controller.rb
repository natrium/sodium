class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bubbles = current_user.bubbles.reverse
    @bubble = Bubble.new
    @projects = current_user.projects.sort_by{|p| p.name}
  end

end
