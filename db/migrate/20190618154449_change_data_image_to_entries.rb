class ChangeDataImageToEntries < ActiveRecord::Migration[5.1]
  def change
    change_column :entries, :image, :string, :limit=>500
  end
end
