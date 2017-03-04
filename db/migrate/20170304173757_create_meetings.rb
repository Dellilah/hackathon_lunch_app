class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :invitor_id
      t.integer :invited_id
      t.string :status
      t.datetime :when
      t.string :location
    end
  end
end
