class CreateExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_table :excerpts do |t|
      t.string :movement, default: ''
      t.string :location, default: ''
      t.string :description, default: ''
      t.belongs_to :piece, foreign_key: true

      t.timestamps
    end
  end
end
