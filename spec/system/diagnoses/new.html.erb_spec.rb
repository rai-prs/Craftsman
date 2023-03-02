require 'rails_helper'

RSpec.describe "diagnoses/new.html.erb", type: :system do
  describe "GET /new" do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit "/diagnoses/new"
    end

    context "フォームの入力値が正常な場合" do
      it "診断が成功" do
        find('label[for=diagnosis_communication_1]').click
        find('label[for=diagnosis_planning_1]').click
        find('label[for=diagnosis_dexterous_1]').click
        find('label[for=diagnosis_tidy_1]').click
        find('label[for=diagnosis_physically_1]').click
        find('label[for=diagnosis_muscle_1]').click
        find('label[for=diagnosis_intelligence_1]').click
        find('label[for=diagnosis_careful_1]').click
        find('label[for=diagnosis_pride_1]').click
        find('label[for=diagnosis_picky_1]').click
        find('label[for=diagnosis_destruction_1]').click
        find('label[for=diagnosis_narrow_1]').click
        find('label[for=diagnosis_dirt_1]').click
        find('label[for=diagnosis_high_1]').click
        click_button '診断'
        expect(page).to have_content "診断が完了しました"
      end
    end
  end
end
