class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :message
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
