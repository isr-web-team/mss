require 'spec_helper'

describe UsersController do
  fixtures :users
  
  describe 'index' do
    context 'indexにアクセスした場合' do
      before do
        get :index
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        response.should be_success
      end
      
      it 'index のテンプレートが読まれる' do
        response.should render_template('index')
      end
      
      it '@users に詳細データが格納されている' do
        assigns[:users].should == User.all
      end
    end
  end
  
  describe 'show' do
    context '存在するIDにアクセス' do
      before do
        get :show, :id => 1
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        response.should be_success
      end
      
      it 'show のテンプレートが読まれる' do
        response.should render_template('show')
      end
    end
    
    context '存在しないIDにアクセス' do
      before do
      end
      
      it 'RecordNotFound が返却される' do
        expect { User.find(99) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
  
  describe 'new' do
    context 'Userの新規作成' do
      before do
        get :new
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        response.should be_success
      end
      
      it 'show のテンプレートが読まれる' do
        response.should render_template('new')
      end
      
      it 'インスタンスが生成される(中身は空)' do
        assigns[:users].should == nil
      end
    end
  end
end
