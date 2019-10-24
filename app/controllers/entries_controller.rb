class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    @micropost = current_user.microposts.build if logged_in?
    @microposts = @entry.microposts.order(created_at: :desc)
  end
end
