require 'rails_helper'

RSpec.describe "Diagnoses", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/diagnoses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/diagnoses/show"
      expect(response).to have_http_status(:success)
    end
  end

end
