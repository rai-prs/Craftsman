require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  describe "Diagnosis-model" do
    let(:diagnosis) { create(:diagnosis) }

    it "質問全てに値がある場合、有効である" do
      expect(diagnosis).to be_valid
    end
  end
end
