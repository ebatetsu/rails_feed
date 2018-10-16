desc "This task is called by the Heroku scheduler add-on"
task :feeds => :environment do
  Feed.all.each do |feed|
    content = Feedjira::Feed.fetch_and_parse feed.url
    content.entries.each do |entry|
      local_entry = feed.entries.where(title: entry.title).first_or_initialize
      local_entry_image = MetaInspector.new(entry.url).images.best
      local_entry.update_attributes(
        content: entry.content,
        author: entry.author,
        url: entry.url,
        image: local_entry_image,
        published: entry.published
      )
      p "Synced Entry - #{entry.title}"
    end
    p "Synced Feed - #{feed.name}"
  end
end
