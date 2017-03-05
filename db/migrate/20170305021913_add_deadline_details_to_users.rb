class AddDeadlineDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :days, :string
    add_column :users, :from_hour, :string
    add_column :users, :to_hour, :string
  end
end
