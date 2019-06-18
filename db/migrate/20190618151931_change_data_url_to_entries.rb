class ChangeDataUrlToEntries < ActiveRecord::Migration[5.1]
  def change
    change_column :entries, :title, :string, :limit=>500
    change_column :entries, :url, :string, :limit=>500
  end
end
