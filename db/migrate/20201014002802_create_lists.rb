class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.date :date
      t.belongs_to :position, foreign_key: true
      t.belongs_to :orchestra, foreign_key: true
      t.timestamps
    end
  end
end
