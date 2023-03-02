require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  describe "Diagnosis-model" do
    let(:diagnosis_exists) { create(:diagnosis_exists) }

    it "質問全てに値がある場合、有効である" do
      expect(diagnosis_exists).to be_valid
    end
  end
end
