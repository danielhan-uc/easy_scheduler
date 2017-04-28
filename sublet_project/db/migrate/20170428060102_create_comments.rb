class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, null: false
      t.string :description
      t.string :author

      t.timestamps null: false
    end
  end
end
