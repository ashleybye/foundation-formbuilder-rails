class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :text_field
      t.text :text_area
      t.string :password_field

      t.timestamps
    end
  end
end
