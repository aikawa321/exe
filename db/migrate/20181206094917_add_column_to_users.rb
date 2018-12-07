class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :telephone, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :image_id, :string
    add_column :users, :url, :string
    add_column :users, :introduction, :text
    add_column :users, :lank, :integer
    add_column :users, :kind_id, :integer
    add_column :users, :review_id, :integer
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
