class CreateJoinTableListsExcerpts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lists, :excerpts do |t|
      # t.index [:list_id, :excerpt_id]
      # t.index [:excerpt_id, :list_id]
    end
  end
end
