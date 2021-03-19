require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'item情報の登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context '正常にitemを登録できる時' do
      it '全ての情報が正しく入力されていれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context 'itemの登録ができない時' do
      it '紐づくユーザーがいないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'アイテムの種類を未選択では登録できないこと' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre Select")
      end
      it 'アイテムの名前が空だと登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'アイテムの特徴や説明を入力しないと登録できないこと' do
        @item.feature = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Feature can't be blank")
      end
      it 'アイテムの値段を入力しないと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'アイテムの値段に全角数字を入力すると登録できないこと' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'アイテムの値段に数字以外の文字が入ると登録できないこと' do
        @item.price = 'item'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end
