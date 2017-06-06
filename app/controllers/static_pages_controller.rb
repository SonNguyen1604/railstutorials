class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed
        .select(:id, :content, :picture, :user_id, :created_at).micropost_sort
        .paginate page: params[:page], per_page: Settings.micropost.post_per_page
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
