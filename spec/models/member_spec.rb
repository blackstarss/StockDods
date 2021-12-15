require 'rails_helper'

RSpec.describe 'Memberモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { member.valid? }

    let(:member) { build(:member) }

    context 'nameカラム' do
      it '空欄でないこと' do
        member.name = ''
        is_expected.to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        member.email = ''
        is_expected.to eq false
      end
    end
  end

 
  end
