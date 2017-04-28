class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :address
      t.float :price
      t.string :startdate
      t.string :enddate
      t.string :owner
      t.string :phone

      t.timestamps null: false
    end
  end
end
