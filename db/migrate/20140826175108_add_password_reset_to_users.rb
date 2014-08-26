class AddPasswordResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :code, :string
    add_column :users, :expires_at, :datetime
  end
end
