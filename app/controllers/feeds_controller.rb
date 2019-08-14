class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
    @entries = Entry.order(published: :desc).limit(12)
    @microposts = Micropost.order(created_at: :desc).limit(100)
  end

  def show
    @entries = @feed.entries.order(published: :desc).paginate(page: params[:page], :per_page => 15)
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def feeds_update
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry_image = MetaInspector.new(entry.url).images.best
        local_entry.update_attributes(
          content: entry.content || entry.summary,
          author: entry.author,
          url: entry.url,
          image: local_entry_image,
          published: entry.published
        )
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.name}"
    end
    redirect_to request.referer
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'フィードが削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:name, :url, :description)
    end
end
