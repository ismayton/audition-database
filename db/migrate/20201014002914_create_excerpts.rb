class CreateExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_table :excerpts do |t|
      t.string :description
      t.belongs_to :piece, foreign_key: true

      t.timestamps
    end
  end
end
