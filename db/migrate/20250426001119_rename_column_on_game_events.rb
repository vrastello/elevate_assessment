class RenameColumnOnGameEvents < ActiveRecord::Migration[8.0]
  def change
    rename_column :game_events, :type, :event_type
  end
end
