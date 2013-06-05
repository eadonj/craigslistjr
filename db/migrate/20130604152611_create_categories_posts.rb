class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :description
      t.decimal :price
      t.timestamps
    end
  end
end
