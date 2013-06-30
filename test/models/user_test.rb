require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # テストデータの準備
  fixtures :users
  
  # 空のUserの場合エラーになるか検証
  test "空のUserの場合、エラー" do
    user = User.new
    assert user.invalid?
    assert user.errors[:login_id].any?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end
end
