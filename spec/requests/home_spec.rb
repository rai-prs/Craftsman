require 'rails_helper'

RSpec.describe "Diagnoses", type: :request do
  describe "GET /index" do
    it "indexページのレスポンスが正常に動くこと" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end
end
