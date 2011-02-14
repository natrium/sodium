class TimelineController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bubble = Bubble.new
    @bubbles = Bubble.
        where("project_id in (?) or user_id = ?",
          current_user.followed_project_ids, current_user.id).
        order("created_at DESC")
  end

end
