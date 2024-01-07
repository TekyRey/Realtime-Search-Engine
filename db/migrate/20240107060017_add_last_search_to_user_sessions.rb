class AddLastSearchToUserSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :user_sessions, :last_search, :string
  end
end
