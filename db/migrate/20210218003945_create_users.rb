class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :gender
      t.string :city
      t.string :prefecture
      t.string :profession
      t.string :occupation
      t.boolean :admin

      t.timestamps
    end
  end
end
