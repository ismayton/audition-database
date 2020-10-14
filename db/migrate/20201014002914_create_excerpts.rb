class CreateExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_table :excerpts do |t|
      t.string :title
      t.belongs_to :composer, foreign_key: true

      t.timestamps
    end
  end
end
