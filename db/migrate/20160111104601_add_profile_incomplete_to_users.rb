class AddProfileIncompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_incomplete, :boolean
  end
end
