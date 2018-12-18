class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.integer :review_id
      t.integer :point
      t.timestamps
    end
  end
end
