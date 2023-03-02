require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :system do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      visit home_index_path
    end

    it "CragtsManのリンクをクリックした時root_pathに遷移できること" do
      click_on "CraftsMan"
      expect(current_path).to eq root_path
    end

    context "ログインしていない場合" do
      it "ログインボタンを押したときにログインページに遷移できること" do
        click_button "ログイン"
        expect(current_path).to eq new_user_session_path
      end

      it "新規登録ボタンを押したときに新規登録ページに遷移できること" do
        click_button "新規登録"
        expect(current_path).to eq new_user_registration_path
      end

      it "Guest Loginボタンを押したときにログインできること" do
        click_button "Guest Login"
        expect(current_path).to eq root_path
        expect(page).to have_content "ゲストユーザーとしてログインしました。"
      end
    end

    context "ログインしている場合" do
      before do
        click_button "Guest Login"
      end

      it "ログアウトボタンを押したときにログアウトできること" do
        click_button "ログアウト"
        expect(current_path).to eq root_path
        expect(page).to have_content "ログアウトしました。"
      end

      it "診断ボタンを押したときに診断ページに遷移できること" do
        click_button "診断"
        expect(current_path).to eq new_diagnosis_path
      end
    end
  end
end
