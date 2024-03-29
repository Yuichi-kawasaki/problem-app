class CreateSocialProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :social_profiles do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :name
      t.string :nickname
      t.string :email
      t.string :url
      t.string :image_url
      t.string :description
      t.string :access_token
      t.string :access_secret
      t.string :set_values
      t.text :others
      t.text :credentials
      t.text :raw_info

      t.timestamps
    end
    add_index :social_profiles, [:provider, :uid], unique: true
  end
end
