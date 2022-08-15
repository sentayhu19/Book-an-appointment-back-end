class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
