class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :date
      t.belongs_to :position, foreign_key: true

      t.timestamps
    end
  end
end
