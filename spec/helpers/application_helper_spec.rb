require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    context "引数が渡されている場合" do
      it "文字列-CraftsManが表示されること" do
        expect(full_title("CraftsMan")).to eq("CraftsMan-CraftsMan")
      end
    end

    context "引数が空白の場合" do
      it "CraftsManが表示されること" do
        expect(full_title('')).to eq('CraftsMan')
      end
    end

    context "引数がnilの場合" do
      it "CraftsManが表示されること" do
        expect(full_title(nil)).to eq('CraftsMan')
      end
    end
  end
end
