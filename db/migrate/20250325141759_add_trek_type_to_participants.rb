class AddTrekTypeToParticipants < ActiveRecord::Migration[8.0]
  def change
    add_column :participants, :trek_type, :string
  end
end
