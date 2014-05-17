require 'spec_helper'

describe EntriesController do

  let( :book  ){ FactoryGirl.create( :book  ) }
  let( :entry ){ FactoryGirl.create( :entry, book: book ) }

  context 'unautheticated admin' do

    describe 'new' do
      before( :each ) { get :new, book_id: book }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'create' do
      before( :each ){ post :create, book_id: book, entry: FactoryGirl.attributes_for( :entry ) }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'edit' do
      before( :each ){ get :edit, id: entry }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'update' do
      before( :each ){ post :update, id: entry, entry: FactoryGirl.attributes_for( :entry ) }
      it { response.should redirect_to new_admin_session_path }
    end

    describe 'destroy' do
      before( :each ){ post :destroy, id: entry }
      it { response.should redirect_to new_admin_session_path }
    end

  end

  context 'authenticated admin' do

    let( :admin ){ FactoryGirl.create( :admin )  }
    before( :each ){ sign_in admin }

    describe 'new' do
      before( :each ){ get :new, book_id: book }
      it { response.status.should equal 200 }
      it { response.should render_template :new }

      it 'builds a new entry' do
        assigns( :entry ).should be_true
      end
    end

    describe 'create' do

      before :each do
        @categories = FactoryGirl.create_list( :category, 3 )
        @entry_attr = FactoryGirl.attributes_for( :entry )
        @entry_attr[:category_ids] = Category.select( :id ).map{ |c| c.id }

        expect do
          post :create, book_id: book, entry: @entry_attr
        end.to change{ Entry.count }.by 1
      end

      it { response.should redirect_to entry_path( assigns( :entry ) ) }

      it 'assigns an entry with correct attributes' do

        assigns( :entry ).should be_true
        entry = assigns( :entry )

        expect( entry.title ).to    eql( @entry_attr[:title]   )
        expect( entry.contents ).to eql( @entry_attr[:contents] )
        expect( entry.year ).to     eql( @entry_attr[:year]    )
        expect( entry.month ).to    eql( @entry_attr[:month]   )
        expect( entry.day ).to      eql( @entry_attr[:day]     )

        expect( entry.categories.map{|c|c} ).to eql( @categories )
      end

    end

  end

end
