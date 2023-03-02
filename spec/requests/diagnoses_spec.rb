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
    let(:diagnosis_exists) { create(:diagnosis_exists) }

    before do
      sign_in diagnosis_exists.user
      get diagnosis_path(diagnosis_exists)
    end

    it "showページのレスポンスが正常に動くこと" do
      expect(response).to have_http_status(:success)
    end

    describe "diagnosisのデータがレスポンスに正しく取得されることの検証" do
      it 'diagnosis.tidyが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.tidy
      end

      it 'diagnosis.communicationが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.communication
      end

      it 'diagnosis.planningが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.planning
      end

      it 'diagnosis.dexterousが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.dexterous
      end

      it 'diagnosis.physicallyが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.physically
      end

      it 'diagnosis.muscleが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.muscle
      end

      it 'diagnosis.intelligenceが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.intelligence
      end

      it 'diagnosis.carefulが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.careful
      end

      it 'diagnosis.prideが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.pride
      end

      it 'diagnosis.pickyが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.picky
      end

      it 'diagnosis.destructionが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.destruction
      end

      it 'diagnosis.narrowが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.narrow
      end

      it 'diagnosis.dirtが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.dirt
      end

      it 'diagnosis.highが正しく取得されること' do
        expect(response.body).to include diagnosis_exists.high
      end
    end
  end
end
