class AddDescriptionFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :good_at, :text
    add_column :users, :looking_for, :text
  end
end
