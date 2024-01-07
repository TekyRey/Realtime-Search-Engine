class CreateUserSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_sessions do |t|
      t.string :session_id
      t.datetime :last_search_time

      t.timestamps
    end
  end
end
