require 'spec_helper'

describe BooksController do

  context 'unauthenticated users' do

    describe 'new' do
      before( :each ){ get :new }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'create' do
      before( :each ){ post :create, book: FactoryGirl.attributes_for( :book ) }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'edit' do
      before :each do
        book = FactoryGirl.create( :book )
        get :edit, id: book
      end

      it { response.should redirect_to new_admin_session_path }
    end

    describe 'update' do
      before :each do
        book = FactoryGirl.create( :book )
        post :update, id: book, book: FactoryGirl.attributes_for( :book )
      end

      it { response.should redirect_to new_admin_session_path }
    end

    describe 'destroy' do
      before :each do
        book = FactoryGirl.create( :book )
        post :destroy, id: book
      end

      it { response.should redirect_to new_admin_session_path }
    end

  end

end
