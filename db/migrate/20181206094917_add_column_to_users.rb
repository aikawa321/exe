class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :telephone, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :image_id, :string
    add_column :users, :url, :string
    add_column :users, :introduction, :text
    add_column :users, :kind_id, :integer
    add_column :users, :area_id, :integer
    add_column :users, :admin, :boolean, default: false
  end
end
