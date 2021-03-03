require 'rails_helper'

RSpec.describe 'Problem管理機能', type: :system do
  describe do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
      @problem1 = FactoryBot.create(:problem, title: 'problem1', user_id: @admin_user.id)
      @problem2 = FactoryBot.create(:second_problem, title: 'problem2', user_id: @admin_user.id)
      visit new_user_session_path
      fill_in 'user[email]',with: 'admin@admin.com'
      fill_in 'user[password]',with: '00000000'
      click_button 'ログイン'
    end

    describe '新規作成機能' do
      context '新規作成した場合' do
        it '作成した困り事が表示される' do
          visit new_problem_path
          fill_in 'problem[title]',with: 'problem1'
          fill_in 'problem[content]',with: 'hello'
          click_button 'commit'
          visit problems_path
          expect(page).to have_content 'problem1'
          expect(page).to have_content 'hello'
        end
      end
   end

    describe '検索機能'do
      context 'タイトルをあいまい検索した場合'do
        it '入力値を含むタスクが表示される'do
        visit problems_path
        fill_in 'search[title]', with: 'problem1'
        click_button 'Search'
        # sleep 0.5
        expect(page).to have_content 'problem1'
        expect( Problem.count ).to eq 2
        end
      end
   end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの投稿一覧が表示される' do
        # task = FactoryBot.create(:task, name: 'task')
        visit problems_path

        expect(page).to have_content 'problem1'
      end
    end
 end
  describe '詳細表示機能' do
    context '任意の投稿詳細画面に遷移した場合' do
      it '該当の内容が表示される' do
        # @task = FactoryBot.create(:task, name: 'task1')

        visit problem_path(@problem1)

        expect(page).to have_content 'problem1'
      end
    end
  end
end
end
