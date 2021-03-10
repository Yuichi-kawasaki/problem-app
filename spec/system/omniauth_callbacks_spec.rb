require "rails_helper"

describe "Auth認証" do

  describe "facebook連携でサインアップする" do
    before do
          OmniAuth.config.mock_auth[:facebook] = nil
          Rails.application.env_config['omniauth.auth'] = facebook_mock
          visit new_user_session_path
          click_on "ログイン"
        end

        it "サインアップするとユーザーが増える" do
          expect{
            click_link "Sign in with Facebook"
          }.to change(User, :count).by(1)
        end

        it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
          click_link "Sign in with Facebook"
          click_link "Logout"
          click_on "ログイン"
          expect{
            click_link "Sign in with Facebook"
          }.not_to change(User, :count)
        end

      end
    end
