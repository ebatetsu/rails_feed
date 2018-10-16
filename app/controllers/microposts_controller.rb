class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @entry = Entry.find(params[:micropost][:entry_id])
    @microposts = @entry.microposts
    @micropost = current_user.microposts.build(micropost_params)
    respond_to do |format|
      @micropost.save
      format.html { redirect_to request.referer }
      format.js
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :entry_id)
    end
end
