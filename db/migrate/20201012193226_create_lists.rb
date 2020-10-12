class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
