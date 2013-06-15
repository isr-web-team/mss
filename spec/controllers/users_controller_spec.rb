require 'spec_helper'

describe UsersController do
  fixtures :users
  
  describe 'usersページのindex' do
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
      
      it '@users に詳細データが格納されている' do
        assigns[:users].should == User.all
      end
    end
  end
  
  describe 'usersページのshow' do
    context '存在するIDにアクセス' do
      before do
        get :show, :id => 1
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        expect(response).to be_success
      end
      
      it 'show のテンプレートが読まれる' do
        expect(response).to render_template('show')
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
  
  describe 'usersページのnew' do
    context 'アクセスに成功' do
      before do
        get :new
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        expect(response).to be_success
      end
      
      it 'show のテンプレートが読まれる' do
        expect(response).to render_template('new')
      end
      
      it 'インスタンスが生成される(中身は空)' do
        assigns[:users].should == nil
      end
    end
  end
  
  describe 'usersページのedit' do
    context 'アクセスに成功' do
      before do
        get :edit, :id => 1
      end
      
      it 'HTTPレスポンスが 200系を返す' do
        expect(response).to be_success
      end
      
      it 'edit のテンプレートが読まれる' do
        expect(response).to render_template('edit')
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
end
