class CreateJoinTableGuestEvent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :events do |t|
       t.index [:user_id, :event_id]
      # t.index [:event_id, :guest_id]
    end
  end
end
