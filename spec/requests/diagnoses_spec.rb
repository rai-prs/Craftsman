require 'rails_helper'

RSpec.describe "Diagnoses", type: :request do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it "newページのレスポンスが正常に動くこと" do
      get "/diagnoses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:diagnosis) { create(:diagnosis) }

    before do
      sign_in diagnosis.user
      get diagnosis_path(diagnosis)
    end

    it "showページのレスポンスが正常に動くこと" do
      expect(response).to have_http_status(:success)
    end

    describe "diagnosisのデータがレスポンスに正しく取得されることの検証" do
      it 'diagnosis.tidyが正しく取得されること' do
        expect(response.body).to include diagnosis.tidy
      end

      it 'diagnosis.communicationが正しく取得されること' do
        expect(response.body).to include diagnosis.communication
      end

      it 'diagnosis.planningが正しく取得されること' do
        expect(response.body).to include diagnosis.planning
      end

      it 'diagnosis.dexterousが正しく取得されること' do
        expect(response.body).to include diagnosis.dexterous
      end

      it 'diagnosis.physicallyが正しく取得されること' do
        expect(response.body).to include diagnosis.physically
      end

      it 'diagnosis.muscleが正しく取得されること' do
        expect(response.body).to include diagnosis.muscle
      end

      it 'diagnosis.intelligenceが正しく取得されること' do
        expect(response.body).to include diagnosis.intelligence
      end

      it 'diagnosis.carefulが正しく取得されること' do
        expect(response.body).to include diagnosis.careful
      end

      it 'diagnosis.prideが正しく取得されること' do
        expect(response.body).to include diagnosis.pride
      end

      it 'diagnosis.pickyが正しく取得されること' do
        expect(response.body).to include diagnosis.picky
      end

      it 'diagnosis.destructionが正しく取得されること' do
        expect(response.body).to include diagnosis.destruction
      end

      it 'diagnosis.narrowが正しく取得されること' do
        expect(response.body).to include diagnosis.narrow
      end

      it 'diagnosis.dirtが正しく取得されること' do
        expect(response.body).to include diagnosis.dirt
      end

      it 'diagnosis.highが正しく取得されること' do
        expect(response.body).to include diagnosis.high
      end
    end
  end
end
