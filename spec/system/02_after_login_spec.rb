require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:member) { create(:member) }
  let!(:other_member) { create(:member) }

  before do
    visit new_member_session_path
    fill_in 'member[email]', with: member.email
    fill_in 'member[password]', with: member.password
    click_button 'ログイン'
  end
  
  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it 'マイページを押すと、自分のユーザ詳細画面に遷移する' do
        mypage_link = find_all('a')[1].native.inner_text
        mypage_link = mypage_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link mypage_link
        is_expected.to eq '/members/' + member.id.to_s
      end
      it '新規投稿を押すと、ユーザ一覧画面に遷移する' do
        new_link = find_all('a')[2].native.inner_text
        new_link = new_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link new_link
        is_expected.to eq '/posts/new'
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        books_link = find_all('a')[3].native.inner_text
        books_link = books_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link books_link
        is_expected.to eq '/posts'
      end
    end
  end
describe '投稿一覧画面のテスト' do
    before do
      visit new_post_path
    end

    context '投稿成功のテスト' do
      before do
        fill_in 'post[title]', with: Faker::Lorem.characters(number: 5)
        fill_in 'post[tags]', with: "#薬学"
        fill_in 'post[link]', with: Faker::Lorem.characters(number: 5)
        fill_in 'post[article]', with: Faker::Lorem.characters(number:30)
      end

      it '自分の新しい投稿が正しく保存される' do
        expect { click_button 'Create Post' }.to change(member.posts, :count).by(0)
      end
      
    end
  end
end