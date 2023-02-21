require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :system do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context "フォームの入力値が正常の場合" do
      it "ログインが成功" do
        fill_in "user_email", with: user.email
        fill_in "user_password", with: user.password
        click_button "Log in"
        expect(current_path).to eq root_path
        expect(page).to have_content "ログインしました。"
      end
    end

    context "メールアドレスが未記入の場合" do
      it "Log inボタンを押すことが出来ない" do
        fill_in "user_email", with: nil
        fill_in "user_password", with: user.password
        expect(page).not_to have_button "Log in"
      end
    end

    context "パスワードが未記入の場合" do
      it "Log inボタンを押すことが出来ない" do
        fill_in "user_email", with: user.email
        fill_in "user_password", with: nil
        expect(page).not_to have_button "Log in"
      end
    end

    context "メールアドレスが登録している値と違う場合" do
      it "ログインが失敗" do
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: user.password
        click_button "Log in"
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content "Eメールまたはパスワードが違います。"
      end
    end

    context "パスワードが登録している値と違う場合" do
      it "ログインが失敗" do
        fill_in "user_email", with: user.email
        fill_in "user_password", with: "Pass-word"
        click_button "Log in"
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content "Eメールまたはパスワードが違います。"
      end
    end
  end
end
