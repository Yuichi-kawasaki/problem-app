require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe 'モデル機能', type: :model do
    describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
      @problem1 = FactoryBot.create(:problem, title: 'problem1', user_id: @user.id)
      @problem2 = FactoryBot.create(:second_problem, title: 'problem2', user_id: @user.id)
      @problem3 = FactoryBot.create(:second_problem, title: 'problem3', user_id: @admin_user.id)
    end
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Problem.get_by_title('problem1')).to include(@problem1)
        expect(Problem.get_by_title('problem2')).not_to include(@tproblem2)
        expect(Problem.get_by_title('probem1').count).to eq 1
      end
    end

    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do

          problem = Problem.new(title: '', content:'')
          expect(problem).not_to be_valid
        end
      end
      end

    end
  end
end
