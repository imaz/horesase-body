class CreateHoresases < ActiveRecord::Migration
  def change
    create_table :horesases do |t|
      t.integer :id
      t.text :body

      t.timestamps
    end
  end
end
