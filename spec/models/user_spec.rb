require 'rails_helper'

RSpec.describe User, type: :model do
  # 名、メール、パスワードがあれば有効な状態であること
 it "is valid with name, email, and password" do
   user = User.new(
    name: "kk",
    email: "newworld@gmail.com",
    password: "123456",
    )
    expect(user).to be_valid
 end
  # 名がなければ無効な状態であること
 it "is invalid without name" do
   user = User.new(name: nil)
   user.valid?
   expect(user.errors[:name]).to include(I18n.t("errors.messages.blank"))
 end
  # メールアドレスがなければ無効な状態であること
 it "is invalid without an email address" do
   user = User.new(email: nil)
   user.valid?
   expect(user.errors[:email]).to include(I18n.t("errors.messages.blank"))
 end
  # 重複したメールアドレスなら無効な状態であること
 it "is invalid with a duplicate email address" do
  User.create(
    name: "kota",
    email: "newworld@gmail.com",
    password: 123456
  )
  user = User.new(
    name: "kenny",
    email: "newworld@gmail.com",
    password: 123456
  )
  user.valid?
  expect(user.errors[:email]).to include(I18n.t("errors.messages.taken"))
 end
  # ユーザーのフルネームを文字列として返すこと
 it "returns a user's full name as a string"

end
