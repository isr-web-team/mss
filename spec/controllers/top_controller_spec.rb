require 'spec_helper'

describe TopController do
  describe 'TOPページのindex' do
    context 'アクセスに成功' do
      before do
        get :index
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        expect(response).to be_success
      end
      
      it 'index のテンプレートが読まれる' do
        expect(response).to render_template('index')
      end
    end
  end
end
