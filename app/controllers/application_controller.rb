class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def set_search
      @search = Entry.ransack(params[:q])
      @result = @search.result(distinct: true).order(published: :desc).paginate(page: params[:page], :per_page => 15)
    end
end
