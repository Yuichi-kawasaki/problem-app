require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
  describe do
      before do
        @label = FactoryBot.create(:label)
        @label2 = FactoryBot.create(:label2)
        @label3 = FactoryBot.create(:label3)
        @user = FactoryBot.create(:user)
        @admin_user = FactoryBot.create(:admin_user)
        @problem1 = FactoryBot.create(:problem, title: 'problem1', user_id: @user.id)
        @problem2 = FactoryBot.create(:second_problem, title: 'problem2', user_id: @admin_user.id)
        @labelling = FactoryBot.create(:labelling, problem: @problem1, label: @label)
        visit new_user_session_path
        fill_in 'user[email]',with: 'admin@admin.com'
        fill_in 'user[password]',with: '00000000'
        click_button 'ログイン'
      end

  context 'ラベルをつけた投稿をした場合'do
    it '選択したラベルを含む投稿が表示される'do
      visit new_problem_path
      fill_in 'problem[title]', with: 'problem1'
      check '新規'
      fill_in 'problem[content]',with: 'hello'
      click_button 'commit'
      visit problems_path
      # select '新規',from: 'serch[label_id]'
      # click_button 'Search'
      # expect(page).to have_content '新規'
      expect(page).to have_selector 'p', text:'新規'
    end
  end

  context 'ラベルを検索した場合'do
    it '入力値を含む投稿が表示され、かつ選択した投稿を含むタスクが表示される'do
      visit problems_path
      select '新規', from: 'search[label_id]'
      click_button 'Search'
      expect(page).to have_content 'problem1'
      # expect(page).to have_content 'p', text:'新規'
    end
  end
end
end
