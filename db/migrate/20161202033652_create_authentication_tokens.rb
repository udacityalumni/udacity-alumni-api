class CreateAuthenticationTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :authentication_tokens do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.datetime :last_used_at
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
