class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :title
      t.integer :year, default: nil
      t.string :version, default: nil
      t.belongs_to :composer, foreign_key: true

      t.timestamps
    end
  end
end
