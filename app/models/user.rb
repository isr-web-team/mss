class User < ActiveRecord::Base
  has_many :events_users
  has_many :events, :through => :users
  
  validates :login_id, :presence => { :message => 'ログインIDは必ず入力してください。'}
  # validates :name, :presence => { :message => '名前は必ず入力してください。'}
  # validates :email, :presence => { :message => 'メールアドレスは必ず入力してください。'}
  validates :password, :confirmation => { :message => 'パスワードと確認用パスワードが違います。'}
end
