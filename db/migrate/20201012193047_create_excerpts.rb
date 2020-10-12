class CreateExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_table :excerpts do |t|
      t.string :title

      t.timestamps
    end
  end
end
