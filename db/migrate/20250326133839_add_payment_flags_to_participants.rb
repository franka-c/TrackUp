class AddPaymentFlagsToParticipants < ActiveRecord::Migration[8.0]
  def change
    add_column :participants, :paid_signup_fee, :boolean
    add_column :participants, :paid_entry_fee, :boolean
  end
end
