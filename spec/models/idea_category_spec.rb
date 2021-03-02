require 'rails_helper'

RSpec.describe IdeaCategory, type: :model do
  describe 'アイデア新規登録' do
    before do
      @idea_category = FactoryBot.build(:idea_category)
    end

    context 'アイデアが登録できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@idea_category).to be_valid
      end
    end

    context 'アイデアが登録できない時' do
      it 'nameが空では登録できない' do
        @idea_category.name = nil
        @idea_category.valid?
        expect(@idea_category.errors.full_messages).to include("Name can't be blank")
      end
      it 'bodyが空では登録できない' do
        @idea_category.body = nil
        @idea_category.valid?
        expect(@idea_category.errors.full_messages).to include("Body can't be blank")
      end
    end
  end
end
