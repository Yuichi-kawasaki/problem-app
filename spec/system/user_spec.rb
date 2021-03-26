require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do
    describe do
        before do
          @label = FactoryBot.create(:label)
          @label2 = FactoryBot.create(:label2)
          @label3 = FactoryBot.create(:label3)
          @user = FactoryBot.create(:user)
          @second_user = FactoryBot.create(:second_user)
          @problem1 = FactoryBot.create(:problem, title: 'problem1', user_id: @user.id)
          @problem2 = FactoryBot.create(:second_problem, title: 'problem2', user_id: @second_user.id)
          @labelling = FactoryBot.create(:labelling, problem: @problem1, label: @label)
        end
      end

  def user_login
    visit new_user_session_path
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: '11111111'
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
        click_button "新規登録"

        visit problems_path
        click_on "Profile"

        expect(page).to have_content 'テストのページ'
        expect(page).to have_content 'test@test.com'
      end
    end

    describe 'ユーザー登録機能' do
      context 'ユーザーのデータがなくログインしていない状態' do
      it 'ログインしていない時はログイン画面に飛ぶ' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'テスト'
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: '11111111'
        fill_in 'user[password_confirmation]', with: '11111111'
        click_button "新規登録"

        visit new_problem_path
        fill_in 'problem[title]',with: 'problem1'
        fill_in 'problem[content]',with: 'hello'
        click_button 'commit'

        click_link "Logout"
        
        visit root_path
        click_on "困り事詳細を確認する"
        expect(current_path).to eq new_user_session_path
      end
    end
  end
end
end
