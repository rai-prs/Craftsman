require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User-model" do
    let(:user) { create(:user) }

    it "名前、メール、パスワードがある場合、有効である" do
      expect(user).to be_valid
    end

    it "名がない場合、無効である" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがない場合、無効である" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスの場合、無効である" do
      user1 = create(:user, email: "tommie@yahoo.com")
      user2 = build(:user, email: "tommie@yahoo.com")
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがない場合、無効である" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end
