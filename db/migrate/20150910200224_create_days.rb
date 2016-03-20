class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :description
      t.integer :number
      t.references :goal, index: true

      t.timestamps
    end
  end
end
