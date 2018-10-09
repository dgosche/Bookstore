class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.date :released_on
      t.string :book_image_name
      t.integer :stars

      t.timestamps
    end
  end
end
