require 'spec_helper'

describe UsersController do
  # fixtures :users
  
  describe 'index' do
    context '一覧ページにアクセスした場合' do
      before do
        get :index
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        response.should be_success
      end
      
      it 'index のテンプレートが読まれる' do
        response.should render_template('index')
      end
    end
  end
end
