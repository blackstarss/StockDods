require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:member) { create!(:member) }
    let!(:post) { build(:post) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        post.title = Faker::Lorem.characters(number: 200)
        is_expected.to eq false
      end
    end
    context 'articleカラム' do
      it '空欄でないこと' do
        post.article = ''
        is_expected.to eq false
      end
    end
    context 'tagsカラム' do
      it '空欄でないこと' do
        post.tags = ''
        is_expected.to eq false
      end
      it '15文字以下であること: 15文字は〇' do
        post.tags = Faker::Lorem.characters(number: 15)
        is_expected.to eq false
      end
    end
  end

   end
