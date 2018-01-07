class AddDatabaseAuthenticableToUser < ActiveRecord::Migration[5.1]

  change_table :users do |t|
    ## Devise Confirmable
    t.string   :confirmation_token
    t.datetime :confirmed_at
    t.datetime :confirmation_sent_at
    t.string   :unconfirmed_email # Only if using reconfirmable
  end
end