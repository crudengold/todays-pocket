class AddColumnsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :time_to_read, :integer
    add_column :articles, :url, :string
    add_column :articles, :image, :string
    add_column :articles, :excerpt, :string
    add_column :articles, :item_id, :integer
    add_column :articles, :date_added, :integer
    add_column :articles, :skips, :integer
  end
end
