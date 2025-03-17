class CreateParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :surname
      t.string :phone

      t.timestamps
    end
  end
end
