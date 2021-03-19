require 'rails_helper'

RSpec.describe CampTags, type: :model do
  describe 'キャンプ記録の作成' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @camp = FactoryBot.build(:camp_tags)
      @camp.user_id = @user.id
      @camp.item_ids = @item.id
    end
    context 'キャンプ記録を作成できる' do
      it '全ての値が入力されていれば保存できる' do
        expect(@camp).to be_valid
      end
    end
    context 'キャンプ記録を作成できない' do
      it '紐づくユーザーがいないと登録できないこと' do
        @camp.user_id = ''
        @camp.valid?
        expect(@camp.errors.full_messages).to include("User can't be blank")
      end
      it 'キャンプタイトルを入力していないと登録できないこと' do
        @camp.title = ''
        @camp.valid?
        expect(@camp.errors.full_messages).to include("Title can't be blank")
      end
      it '使用アイテムを未選択では登録できないこと' do
        @camp.item_ids = ''
        @camp.valid?
        expect(@camp.errors.full_messages).to include("Item ids can't be blank")
      end
      it 'キャンプスタイルが空では登録できないこと' do
        @camp.style = ''
        @camp.valid?
        expect(@camp.errors.full_messages).to include("Style can't be blank")
      end
    end
  end
end
