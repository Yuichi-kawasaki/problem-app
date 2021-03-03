require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do

  def user_login
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: '11111111'
    click_button 'ログイン'
  end

  def admin_user_login
    visit new_user_session_path
    fill_in 'user[email]', with: 'admin@admin.com'
    fill_in 'user[password]', with: '00000000'
    click_button 'ログイン'
  end

  describe 'ユーザー登録機能' do
    context 'ユーザーのデータがなくログインしていない状態' do
      it 'ユーザー新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'テスト'
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: '11111111'
        fill_in 'user[password_confirmation]', with: '11111111'
        click_on "新規登録"

        visit problems_path
        click_on "profile"

        expect(page).to have_content 'テストのページ'
        expect(page).to have_content 'test@test.com'
      end
      it 'ログインしていない時はログイン画面に飛ぶ' do
        visit root_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end

    context '一般ユーザーでログインしている状態' do
      it '自分の詳細画面に飛べること' do
        visit problems_path
        click_on "profile"

        sleep 1
        expect(page).to have_content 'テストのページ'
      end

      it 'ログアウトできること' do
        visit destroy_user_session_path

        expect(current_path).to eq new_user_session_path
      end
    end
  end
end
