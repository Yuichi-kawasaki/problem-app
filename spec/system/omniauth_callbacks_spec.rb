require "rails_helper"

describe "Auth認証" do

  describe "facebook連携でサインアップする" do
    before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # Deviseを使っている人はこれもやる
      # Facebookのモックをomniauth.authに設定
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "ログインができる" do
      visit new_user_session_path
      click_on "Sign in with Facebook"
      expect(page).to have_content 'ログインしました'
    end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      visit new_user_session_path
      click_on "Sign in with Facebook"
      click_link "Logout"
      click_button "ログイン"

      expect(current_path).to eq new_user_session_path
    end

  end
end
