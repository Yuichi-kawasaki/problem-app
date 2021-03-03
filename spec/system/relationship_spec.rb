require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
describe 'フォロー機能' do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:admin_user)
    @problem1 = FactoryBot.create(:problem, title: 'problem1', user_id: @user.id)
    @problem2 = FactoryBot.create(:second_problem, title: 'problem2', user_id: @user.id)
    visit new_user_session_path
    fill_in 'user[email]',with: 'admin@admin.com'
    fill_in 'user[password]',with: '00000000'
    click_button 'ログイン'
  end

  context 'フォロー時' do
    it 'フォロワー一覧に名前がある' do
      visit @user_path
      click_button 'commit'
      visit @user_path
      expect(page).to have_content @user.name
    end
   end
  end
 end
