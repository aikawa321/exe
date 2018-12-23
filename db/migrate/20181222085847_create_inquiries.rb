class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.text :content
      t.string :name
      t.string :telephone
      t.string :email
      t.string :postcode
      t.string :address
      t.integer :type_id
      t.timestamps
    end
  end
end
