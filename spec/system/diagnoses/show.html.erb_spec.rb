require 'rails_helper'

RSpec.describe "diagnoses/show.html.erb", type: :system do
  describe "GET /show" do
    let(:diagnosis_success) { create(:diagnosis_success) }

    before do
      sign_in diagnosis_success.user
      visit diagnosis_path(diagnosis_success)
      @craftsmanship = (diagnosis_success.communication.to_i + diagnosis_success.planning.to_i + diagnosis_success.dexterous.to_i + diagnosis_success.tidy.to_i + diagnosis_success.physically.to_i + diagnosis_success.muscle.to_i + diagnosis_success.intelligence.to_i + diagnosis_success.pride.to_i + diagnosis_success.picky.to_i) * 2.4 - diagnosis_success.destruction.to_i * 3 - diagnosis_success.narrow.to_i - diagnosis_success.dirt.to_i - diagnosis_success.high.to_i - diagnosis_success.careful.to_i * 2
    end

    it "診断結果のボタンをクリックした時レーダーチャートのみ表示されること" do
      find('label[for=result]').click
      expect(page).to have_selector '#radar-chart'
      expect(page).not_to have_selector '#appropriate-field'
      expect(page).not_to have_selector '#construction-container'
    end

    it "職人適正のボタンをクリックした時#appropriate-fieldの要素のみ表示されること" do
      find('label[for=appropriate]').click
      expect(page).to have_selector '#appropriate-field'
      expect(page).not_to have_selector '#radar-chart'
      expect(page).not_to have_selector '#construction-container'
    end

    it "適正現場のボタンをクリックした時#construction-containerの要素のみ表示されること" do
      find('label[for=construction-site]').click
      expect(page).to have_selector '#construction-container'
      expect(page).not_to have_selector '#radar-chart'
      expect(page).not_to have_selector '#appropriate-field'
    end

    it "職人適正が正しく表示されること" do
      expect(page).to have_content @craftsmanship.floor
    end

    context "データが条件に合っている時" do
      before do
        find('label[for=construction-site]').click
      end

      it "電気工事士が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "電気工事士"
      end

      it "土工事職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "土工事職人"
      end

      it "鳶職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "鳶職人"
      end

      it "鉄筋工が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "鉄筋工"
      end

      it "鍛治工が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "鍛治工"
      end

      it "型枠大工が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "型枠大工"
      end

      it "板金工が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "板金工"
      end

      it "左官職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "左官職人"
      end

      it "内装職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "内装職人"
      end

      it "塗装職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "塗装職人"
      end

      it "配管工が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "配管工"
      end

      it "外構職人が正しく表示されること" do
        expect(page).to have_selector '.occupation', text: "外構職人"
      end
    end

    context "destructionのデータが５の時かつ、@craftsmanship.floorが80以上の時" do
      let(:diagnosis_success) { create(:diagnosis_success, destruction: "5") }

      it "解体屋が正しく表示されること" do
        find('label[for=construction-site]').click
        expect(page).to have_selector '.occupation', text: "解体屋"
      end

      it "条件が一致している時に正しくテキストが表示されていること" do
        find('label[for=appropriate]').click
        expect(page).to have_content "物を壊すことに抵抗感なないあなたは少し注意する必要があります"
      end
    end

    context "@craftsmanship.floorが80以上の時" do
      before do
        find('label[for=appropriate]').click
      end

      it "一度挑戦してみてはいかがでしょうか。と言うテキストが正しく表示されていること" do
        expect(page).to have_content "一度挑戦してみてはいかがでしょうか。"
      end
    end

    context "@craftsmanship.floorが80以上の時かつ、diagnosis.physicallyが２以下の場合" do
      let(:diagnosis_success) { create(:diagnosis_success, physically: "2") }

      it "少し体力をつける必要があるでしょう。と言うテキストが正しく表示されていること" do
        find('label[for=appropriate]').click
        expect(page).to have_content "少し体力をつける必要があるでしょう。"
      end

      it "まずは体力をつけましょうと言うテキストが正しく表示されること" do
        find('label[for=construction-site]').click
        expect(page).to have_selector '.occupation', text: "まずは体力をつけましょう"
      end
    end

    context "@craftsmanship.floorが80以下60以上の時" do
      let(:diagnosis_craftsman72) { create(:diagnosis_craftsman72) }

      before do
        sign_in diagnosis_craftsman72.user
        visit diagnosis_path(diagnosis_craftsman72)
      end

      it "優秀な職人の卵が正しく表示されること" do
        find('label[for=appropriate]').click
        expect(page).to have_selector '.occupation', text: "優秀な職人の卵"
      end
    end

    context "@craftsmanship.floorが60以下40以上の時" do
      let(:diagnosis_exists) { create(:diagnosis_exists) }

      before do
        sign_in diagnosis_exists.user
        visit diagnosis_path(diagnosis_exists)
      end

      it "平凡な職人の卵が正しく表示されること" do
        find('label[for=appropriate]').click
        expect(page).to have_selector '.occupation', text: "平凡な職人の卵"
      end
    end

    context "@craftsmanship.floorが40以下の時かつ、physicallyが3以上の時" do
      let(:diagnosis_all1) { create(:diagnosis_all1) }

      before do
        sign_in diagnosis_all1.user
        visit diagnosis_path(diagnosis_all1)
      end

      it "劣等な職人の卵が正しく表示されること" do
        find('label[for=appropriate]').click
        expect(page).to have_selector '.occupation', text: "劣等な職人の卵"
      end

      it "あなたに向いている現場職が見つかりませんでした。と言うテキストが正しく表示されること" do
        find('label[for=construction-site]').click
        expect(page).to have_selector '.occupation', text: "あなたに向いている現場職が見つかりませんでした。"
      end
    end
  end
end
