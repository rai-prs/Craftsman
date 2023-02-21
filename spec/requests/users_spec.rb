require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_in" do
    it "ログインページのレスポンスが正常に動くこと" do
      get "/users/sign_in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/sign_up" do
    it "新規登録ページのレスポンスが正常に動くこと" do
      get "/users/sign_up"
      expect(response).to have_http_status(:success)
    end
  end
end
