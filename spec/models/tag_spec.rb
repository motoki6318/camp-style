require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'タグの生成' do
    before do
      @tag = FactoryBot.build(:tag)
    end
    context 'タグの作成ができる' do
      it 'キャンプスタイルが入力されていれば生成できる' do
        expect(@tag).to be_valid
      end
    end
    context 'タグの生成ができない' do
      it 'キャンプスタイルが空では生成できない' do
        @tag.style = ''
        @tag.valid?
        expect(@tag.errors.full_messages).to include("Style can't be blank")
      end
    end
  end
end
