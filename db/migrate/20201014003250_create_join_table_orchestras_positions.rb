class CreateJoinTableOrchestrasPositions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :orchestras, :positions do |t|
      # t.index [:orchestra_id, :position_id]
      # t.index [:position_id, :orchestra_id]
    end
  end
end
