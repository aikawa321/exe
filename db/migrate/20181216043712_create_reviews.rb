class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer  :star
      t.integer :user_id
      t.text :content
      t.string :name
      t.timestamps
    end
  end
end
