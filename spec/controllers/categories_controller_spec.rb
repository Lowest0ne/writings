require 'spec_helper'

describe CategoriesController do

  context 'unauthenticated users' do

    describe 'new' do
      before( :each ){ get :new }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'create' do
      before( :each ){ post :create, category: FactoryGirl.attributes_for( :category ) }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'edit' do
      before :each do
        category = FactoryGirl.create( :category )
        get :edit, id: category
      end

      it { response.should redirect_to new_admin_session_path }
    end

    describe 'update' do
      before :each do
        category = FactoryGirl.create( :category )
        post :update, id: category, category: FactoryGirl.attributes_for( :category )
      end

      it { response.should redirect_to new_admin_session_path }
    end

    describe 'destroy' do
      before :each do
        category = FactoryGirl.create( :category )
        post :destroy, id: category
      end

      it { response.should redirect_to new_admin_session_path }
    end

  end

end
