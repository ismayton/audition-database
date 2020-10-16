class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.belongs_to :instrument, foreign_key: true

      t.timestamps
    end
  end
end
