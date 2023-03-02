require 'rails_helper'

RSpec.describe "registrations/new.html.erb", type: :system do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      visit new_user_registration_path
    end

    context "フォームの入力値が正常の場合" do
      it "ユーザーの新規登録が成功" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: "Pass-word"
        click_button "SIGN UP"
        expect(current_path).to eq root_path
        expect(page).to have_content "アカウント登録を受け付けました。確認のメールをお送りします。"
      end
    end

    context "名前未記入の場合" do
      it "SIGN UPのボタンを押すことができない" do
        fill_in "user_name", with: nil
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: "Pass-word"
        expect(page).to have_content "必須項目です"
        expect(page).not_to have_button "SIGN UP"
      end
    end

    context "メールアドレス未記入の場合" do
      it "SIGN UPのボタンを押すことができない" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: nil
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: "Pass-word"
        expect(page).to have_content "必須項目です"
        expect(page).not_to have_button "SIGN UP"
      end
    end

    context "登録済みメールアドレスの場合" do
      it "ユーザーの新規登録が失敗" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: user.email
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: "Pass-word"
        click_button "SIGN UP"
        expect(current_path).to eq user_registration_path
        expect(page).to have_content "はすでに存在します"
      end
    end

    context "パスワード未記入の場合" do
      it "SIGN UPのボタンを押すことができない" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: nil
        fill_in "user_password_confirmation", with: "Pass-word"
        expect(page).to have_content "必須項目です"
        expect(page).not_to have_button "SIGN UP"
      end
    end

    context "確認用パスワード未記入の場合" do
      it "SIGN UPのボタンを押すことができない" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: nil
        expect(page).not_to have_button "SIGN UP"
      end
    end

    context "パスワードと確認用パスワードの値が違う場合" do
      it "SIGN UPのボタンを押すことができない" do
        fill_in "user_name", with: "rairai"
        fill_in "user_email", with: "test@example.com"
        fill_in "user_password", with: "Pass-word"
        fill_in "user_password_confirmation", with: "Pass-word10"
        expect(page).to have_content "パスワードと値が異なります"
        expect(page).not_to have_button "SIGN UP"
      end
    end
  end
end
