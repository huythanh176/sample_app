class StaticPagesController < ApplicationController
  def home
    @feed_items = []
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = Micropost.by_author(current_user.id).paginate page: params[:page]
    end
  end

  def help; end

  def about; end

  def contact; end
end
