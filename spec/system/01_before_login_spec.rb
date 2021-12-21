require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit about_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end


  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'StockDotsリンクが表示される: 左上から1番目のリンクが「StockDots」である' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to match(/StockDots/)
      end
      it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match(/About/)
      end
      it '投稿一覧リンクが表示される: 左上から3番目のリンクが「投稿一覧」である' do
        index_link = find_all('a')[2].native.inner_text
        expect(index_link).to match(/投稿一覧/)
      end
      it 'Sign upリンクが表示される: 左上から3番目のリンクが「新規登録」である' do
        signup_link = find_all('a')[3].native.inner_text
        expect(signup_link).to match(/新規登録/)
      end
      it 'Log inリンクが表示される: 左上から4番目のリンクが「ログイン」である' do
        login_link = find_all('a')[4].native.inner_text
        expect(login_link).to match(/ログイン/)
      end
    end

 context 'リンクの内容を確認' do
      subject { current_path }

      it 'StockDotsを押すと、トップ画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.delete(' ')
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        about_link = find_all('a')[1].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/about'
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        index_link = find_all('a')[2].native.inner_text
        index_link = index_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link index_link
        is_expected.to eq '/posts'
      end
      it '新規登録を押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link, match: :first
        is_expected.to eq '/member/sign_up'
      end
      it 'ログインを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link, match: :first
        is_expected.to eq '/member/sign_in'
      end
    end
  end
  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_member_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/member/sign_up'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'member[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'member[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'member[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'member[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end
      context '新規登録成功のテスト' do
      before do
        fill_in 'member[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'member[email]', with: Faker::Internet.email
        fill_in 'member[password]', with: 'password'
        fill_in 'member[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Member.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/members/' + Member.last.id.to_s
      end
    end
    
end
end
