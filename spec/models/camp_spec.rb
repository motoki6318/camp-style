require 'rails_helper'

RSpec.describe Camp, type: :model do
  describe 'キャンプ記録の登録' do
    before do
      @camp = FactoryBot.build(:camp)
    end
    context 'キャンプ記録を保存できる時' do
      it '値が全てあれば登録できる' do
        expect(@camp).to be_valid
      end
    end
    context 'キャンプ記録を保存できない時' do
      it 'ユーザーが紐づかないと登録できないこと' do
        @camp.user = nil
        @camp.valid?
        expect(@camp.errors.full_messages).to include("User must exist")
      end
      it 'タイトルが空では登録できないこと' do
        @camp.title = ''
        @camp.valid?
        expect(@camp.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
