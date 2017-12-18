class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :host_id
      t.integer :guest_id
      t.string :title
      t.text :body
      t.string :location
      t.datetime :date

      t.timestamps
    end
    add_index :events, :host_id
    add_index :events, :guest_id
  end
end
