class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
